Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1E46006CA
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 08:45:03 +0200 (CEST)
Received: from localhost ([::1]:54968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okJry-0001JI-E5
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 02:45:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1okJZ1-0006yu-1o
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 02:25:29 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:50977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1okJYy-0000fa-QR
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 02:25:26 -0400
Received: by mail-pj1-x1031.google.com with SMTP id h12so10129510pjk.0
 for <qemu-devel@nongnu.org>; Sun, 16 Oct 2022 23:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7HSQ9KSMDsgqTGDgB7EtRlclQEZOAZPYXFohtu+p0a8=;
 b=f3mhfw0x8Ow96uT7CfpYNE4LCbsT5TOTv4HuKIxVuCQ1cZdArTgMZywR1KFoeEaIX4
 aD6wr7aqXwDo0Cb6wD2no9CD1HoP1Vfg0qKOy0uFj2Byrfwf1ASU5CVfG6FRUmhX4f19
 HG7ifS0CalpdL5evlJT3lgxM51eTLyAomRqNjDeeQtuC0LbVubox5f2FaCe2T96tlAXP
 ZwjFaFinFSQ1+zFbDvaaSiCg4lhUeEhHAIVxJEPt6WK8wlmZo8Akl6srFAWO0lzl0fE4
 MSdFubuFJnu68hy8vbiAwXJE167/hp/U6+nRZUavcNSnzHcR4OZEkq2I6OJdAew0PwJp
 x6Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7HSQ9KSMDsgqTGDgB7EtRlclQEZOAZPYXFohtu+p0a8=;
 b=dpSrUNMtZRSsR2ESZ1eDkT0rbrIEHzJbPKNivjYOWQysYvmHdoFLGIWzqr8R6z3b1o
 zP22zTkd8VURW45ExSkvAGBTNL5jS6+R2dheddzFeiW+RwHUkJnXx4jBktg3HzSQjuMd
 cOGLmxLdjoer4Pzwkkk+4ADynd8H9MYRK86FNp0EVyelwodOp+uQLxatvp7KQ5YvdmfB
 zfPKqo8p25/HQ0zJ6QWFAn1epPvlGKTiDys68yumcnH805RTv67q/PNdqZgpY3e4Zoux
 7k+ByyBgFZ9n3Ywb5rjFZxwMoqsclIb54g2gHFl2yrk4QVJCEk64eAYg5T7H+wnvH4s2
 SfAw==
X-Gm-Message-State: ACrzQf0srHGg3la2SPG9SLST3kpIILzs9yyv9hNlUofhT8sbTox/5ODK
 ZaapUOgFeQLdJlQQqrYgpyTfRA0/tOqrHHN2
X-Google-Smtp-Source: AMsMyM4JymtF/SZK4fpLRAAVzWR+/Fd6TH6m0ukkXNnVYFnUxAYET9sUHSK/prNafGpR0kdKReIfmg==
X-Received: by 2002:a17:90b:4a4a:b0:20a:f75c:de5 with SMTP id
 lb10-20020a17090b4a4a00b0020af75c0de5mr12252312pjb.152.1665987922520; 
 Sun, 16 Oct 2022 23:25:22 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 o1-20020a170902d4c100b00177f32b1a32sm362632plg.271.2022.10.16.23.25.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 23:25:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] tcg/sparc64: Rename from tcg/sparc
Date: Mon, 17 Oct 2022 16:24:44 +1000
Message-Id: <20221017062445.563431-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017062445.563431-1-richard.henderson@linaro.org>
References: <20221017062445.563431-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Emphasize that we only support full 64-bit code generation.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build                                 | 4 +---
 tcg/{sparc => sparc64}/tcg-target-con-set.h | 0
 tcg/{sparc => sparc64}/tcg-target-con-str.h | 0
 tcg/{sparc => sparc64}/tcg-target.h         | 0
 tcg/{sparc => sparc64}/tcg-target.c.inc     | 0
 5 files changed, 1 insertion(+), 3 deletions(-)
 rename tcg/{sparc => sparc64}/tcg-target-con-set.h (100%)
 rename tcg/{sparc => sparc64}/tcg-target-con-str.h (100%)
 rename tcg/{sparc => sparc64}/tcg-target.h (100%)
 rename tcg/{sparc => sparc64}/tcg-target.c.inc (100%)

diff --git a/meson.build b/meson.build
index b686dfef75..1ec3f72edc 100644
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
-- 
2.34.1


