Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B963612FD7
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 06:41:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opNWy-0001aF-9Q; Mon, 31 Oct 2022 01:40:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opNWv-0001a1-NQ
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 01:40:13 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opNWu-0003k5-5J
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 01:40:13 -0400
Received: by mail-oi1-x22e.google.com with SMTP id r83so11895754oih.2
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 22:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wcxwX8W92JQ/vOBmXH0SG17huQWKX+Sq0YwofD1p00Q=;
 b=ckTLVQzxbmOfb10Or51EvC6t6gyZXj+6PXzbukiT3K5+RpRew0xbTxhz8kY/hvPovU
 1T7hUr4QeVSuwaFLhirR8hYwCf+pvdjWe8qMbcspTI6NN3+iPbnwmU7m5OcTO1RbEcNQ
 KSBEIN6lR+Qg4e4XvQCppRP6QTLtPuPvAmxTzu5abhGbciK7mAwaWmUd3rxMqCqO75tJ
 Q01lBsND8oqlY4GUdsxw6riRXh7yO/ZAiGrwGe9sahzfcuz1cCBKgd6wcqT1Qc0Ijhu+
 g2zFFdqsJP80EC/gMc0gMNqWSZJ2B/H9aLGGXAJrAt63WAT5vM7Qcf11eLarUECjk/rb
 XYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wcxwX8W92JQ/vOBmXH0SG17huQWKX+Sq0YwofD1p00Q=;
 b=ps9xcEqzIcfE+eWO9kqfAWeyLHiNKy8GO6XqLm+3qkCW5osRK2RJFPusrVDob0qqbr
 LXYo3S0FkqQBTQKOhSrodQ/ydLuGNwFNlloD5ERru/Pe4t7UUj1vG2SZuG+XjQizTr+V
 siq9n9HzcfjMhkIiWMvADvJ1HMCot8z80BHIFEgUTK/6pBnX6qnCk/g3TSIV4+09qwAc
 ShAhrDe8VkW3JOC44pCoBxWFlYjVePJzAOqfDNqv9cRAAMXhCVGpMaNRgh4tublmN3R9
 3wHe9YWtCII33dpew+lmf90l52oUz8qc5hk1JQLMBMtADJOjGcnD7LMe745jVInTqsE7
 9S5g==
X-Gm-Message-State: ACrzQf01b/KEe/jW+E9Vuau4ZSCuwf+4VRhFi96pnIL5xDDTrrrkhLti
 fj6IKS5MOvWZ396cTur2+3Oew6ovtDIF6g==
X-Google-Smtp-Source: AMsMyM5/Rdro3rUchIAXAULDcYn07KMvia36xiJe6J3yVocBXL5KtejsIV+6mY04BQ0MrGFEQ2vxCg==
X-Received: by 2002:a05:6808:1b12:b0:354:e2c8:5e70 with SMTP id
 bx18-20020a0568081b1200b00354e2c85e70mr13729903oib.146.1667194810865; 
 Sun, 30 Oct 2022 22:40:10 -0700 (PDT)
Received: from stoup.. ([172.58.176.235]) by smtp.gmail.com with ESMTPSA id
 u8-20020a9d4d88000000b006618586b850sm2473857otk.46.2022.10.30.22.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 22:40:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 02/11] tcg/sparc64: Rename from tcg/sparc
Date: Mon, 31 Oct 2022 16:39:39 +1100
Message-Id: <20221031053948.3408-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031053948.3408-1-richard.henderson@linaro.org>
References: <20221031053948.3408-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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
index 37737913df..e9853ad21a 100644
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
index 64893e36bc..1ab6962b0a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3379,7 +3379,7 @@ L: qemu-s390x@nongnu.org
 
 SPARC TCG target
 S: Odd Fixes
-F: tcg/sparc/
+F: tcg/sparc64/
 F: disas/sparc.c
 
 TCI TCG target
-- 
2.34.1


