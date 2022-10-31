Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E722614044
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 22:59:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opcna-0001aS-Q6; Mon, 31 Oct 2022 17:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opcnY-0001XZ-6r
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 17:58:24 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opcnW-0007zU-Iu
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 17:58:24 -0400
Received: by mail-io1-xd2e.google.com with SMTP id p184so10909008iof.11
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 14:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V5GW3l5INqIw3HeICtxu/cnW6RS3jltSQpTsFZS1YLw=;
 b=UkyZMgd5Ayl80CVu9dcDHWR6XbX4hNTtlVyQNG5sgg/3hhQ6ZMHeHPUqNQkLCnoLm7
 jZaEGpHga5vnrm/xuYYNOGgnwAPBP5Kf0UzoQO9VZCgXK/SgmStiQAo9HD1SIG+CnyJR
 5WwhKrUwwTyEG3r+n1g+0zaQpahvWIMqLXRPfi/hm0e92eAtrW8R62E6RrVrbSSiRfJ0
 8FjzgRl4kA/49s2dbGnlN9Hx970edXp0tj0H2PpzTAI1J/eqe3DAdoC/pxJA/Vn3jmzX
 NrhPPfpSvqOYoev3guBV8BmhwqPW5KEJUNZXLX79jlG4sqMX0oc5FTbo2YuXwPcJtBY8
 V0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V5GW3l5INqIw3HeICtxu/cnW6RS3jltSQpTsFZS1YLw=;
 b=ZPfpg1xiX2Y+QKxxf+J6YaOPLKlnC01tXuSJOWlXjHOaj5zLdbsfKuxCfad2v3CX+d
 yz9i0pd5BnbPju4PtqwYvCs3FhP8yB1r5O+wzfUOjyUonrU8LI2Ho3xiNKCbswX0UB6i
 1zYut9lzbytcQLKaiQHClSK95sa2rsiXDfvp23BctFE0Dhx10nzPN0B14G4DEEZoZAgB
 T7DEXnJMoa2Kus6M3PMxVLjL3ws4yPNpTn/awX0WbVWIUeMQRux1YvnUT5Djs5GdekHB
 irpMYKNOic+s8KloN9NmNXaJd3p4wML998SfpzHg5unP/to4dqN5OBPgz5/wF/++c7tk
 +1fA==
X-Gm-Message-State: ACrzQf3cWM8SgZLdLNkQQExtkzOejyNUlGNaUbdGUfLebXJRNyN/PLzO
 aJXqMKN63431dQXFQIbQ7lr77uQeuC6PUw==
X-Google-Smtp-Source: AMsMyM7aw8l5CHcPM9kAd81rZr2nDtW283o4Wi05YfcHZFxPlQLMZDCqt7qh5GOL/adK8U8Tanaf/Q==
X-Received: by 2002:a05:6602:3c7:b0:6a4:334d:3344 with SMTP id
 g7-20020a05660203c700b006a4334d3344mr8255532iov.21.1667253501334; 
 Mon, 31 Oct 2022 14:58:21 -0700 (PDT)
Received: from stoup.. ([172.58.142.195]) by smtp.gmail.com with ESMTPSA id
 i12-20020a056e02054c00b002f4e385252asm2920913ils.39.2022.10.31.14.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 14:58:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@gmail.com, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 02/13] tcg/sparc64: Rename from tcg/sparc
Date: Tue,  1 Nov 2022 08:57:12 +1100
Message-Id: <20221031215723.414467-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031215723.414467-1-richard.henderson@linaro.org>
References: <20221031215723.414467-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

Emphasize that we only support full 64-bit code generation.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build                                 | 4 +---
 tcg/{sparc => sparc64}/tcg-target-con-set.h | 0
 tcg/{sparc => sparc64}/tcg-target-con-str.h | 0
 tcg/{sparc => sparc64}/tcg-target.h         | 0
 tcg/{sparc => sparc64}/tcg-target.c.inc     | 0
 MAINTAINERS                                 | 2 +-
 6 files changed, 2 insertions(+), 4 deletions(-)
 rename tcg/{sparc => sparc64}/tcg-target-con-set.h (100%)
 rename tcg/{sparc => sparc64}/tcg-target-con-str.h (100%)
 rename tcg/{sparc => sparc64}/tcg-target.h (100%)
 rename tcg/{sparc => sparc64}/tcg-target.c.inc (100%)

diff --git a/meson.build b/meson.build
index 1c1afcc9b8..d809d51791 100644
--- a/meson.build
+++ b/meson.build
@@ -49,7 +49,7 @@ qapi_trace_events = []
 bsd_oses = ['gnu/kfreebsd', 'freebsd', 'netbsd', 'openbsd', 'dragonfly', 'darwin']
 supported_oses = ['windows', 'freebsd', 'netbsd', 'openbsd', 'darwin', 'sunos', 'linux']
 supported_cpus = ['ppc', 'ppc64', 's390x', 'riscv', 'x86', 'x86_64',
-  'arm', 'aarch64', 'loongarch64', 'mips', 'mips64', 'sparc', 'sparc64']
+  'arm', 'aarch64', 'loongarch64', 'mips', 'mips64', 'sparc64']
 
 cpu = host_machine.cpu_family()
 
@@ -469,8 +469,6 @@ if get_option('tcg').allowed()
   endif
   if get_option('tcg_interpreter')
     tcg_arch = 'tci'
-  elif host_arch == 'sparc64'
-    tcg_arch = 'sparc'
   elif host_arch == 'x86_64'
     tcg_arch = 'i386'
   elif host_arch == 'ppc64'
diff --git a/tcg/sparc/tcg-target-con-set.h b/tcg/sparc64/tcg-target-con-set.h
similarity index 100%
rename from tcg/sparc/tcg-target-con-set.h
rename to tcg/sparc64/tcg-target-con-set.h
diff --git a/tcg/sparc/tcg-target-con-str.h b/tcg/sparc64/tcg-target-con-str.h
similarity index 100%
rename from tcg/sparc/tcg-target-con-str.h
rename to tcg/sparc64/tcg-target-con-str.h
diff --git a/tcg/sparc/tcg-target.h b/tcg/sparc64/tcg-target.h
similarity index 100%
rename from tcg/sparc/tcg-target.h
rename to tcg/sparc64/tcg-target.h
diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
similarity index 100%
rename from tcg/sparc/tcg-target.c.inc
rename to tcg/sparc64/tcg-target.c.inc
diff --git a/MAINTAINERS b/MAINTAINERS
index c41d8d65e2..62bbbba214 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3370,7 +3370,7 @@ L: qemu-s390x@nongnu.org
 
 SPARC TCG target
 S: Odd Fixes
-F: tcg/sparc/
+F: tcg/sparc64/
 F: disas/sparc.c
 
 TCI TCG target
-- 
2.34.1


