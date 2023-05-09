Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1D76FCB58
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 18:34:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwQHW-0004jY-B4; Tue, 09 May 2023 12:33:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwQHQ-0004i2-PP
 for qemu-devel@nongnu.org; Tue, 09 May 2023 12:33:37 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwQHM-0007WS-Jg
 for qemu-devel@nongnu.org; Tue, 09 May 2023 12:33:36 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3078aa0b152so2371252f8f.3
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 09:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683650011; x=1686242011;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W+SaM45fJjjrZx4VerTDH0Q2oMsolSB5YGX0v3CeRBk=;
 b=amXXTvRuif87bzxC31rxpUdOTiBC3MsinQ2kkCs4txGKXwF93f80p4OipKCy/pi85h
 ZMVaKmiAVHb612PoBbdNRwJk7g5AVrjqNx/d87sJuIR8HPy3CLjioNI38ytm8fhHCcrG
 bp6BJtiamYuSDH97ozxAa5h7U5C1Lvy3aHDWFfzmH1WUlSrkUwKWj6qYH2usqVW7/vas
 kxgqgaFy1byYR2X0+4EZal3KFWLvHGyZzyXZJcqV5pf1qsZ25lqbOyVkISLjIAfuUig/
 /I1XLV8oweUlY+sj5O3/H6ZWYDC0Gd4487vWL6N8fiLu/E9XsLPw95KJGDQYSdrKfNgD
 3I5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683650011; x=1686242011;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W+SaM45fJjjrZx4VerTDH0Q2oMsolSB5YGX0v3CeRBk=;
 b=VCHVhc6iie0GIXluB9/OUrCezWaoVvjfQzPlvzk8QMwk1AevD1hEWkEtnVpD6AhSFf
 h6FAeV6PUaWOgWDwsXJCnGOe+snfFF+riBDMFloI66Ec+6PgbM3mSrue9zMGpWumuR4N
 S8fyDK1VwkPIvYuSwIp1oJGkx0ju6S6DVFmNcIr4sLby7jsIWCSzi2pcgMRExVWsBHg0
 ACvFpAb+ZJeOWKnGByNo0gLRQQKQM+/YkiVp4I+902QwPGIiDfYmFFDl/JYfV4WFbPfd
 nqCY7mcKWwd/3RKK1QqnNeGkK5lvVp11XELpyubU1ZzwfrADyK8Oq1kxgCK5RmyyFnrw
 u3mg==
X-Gm-Message-State: AC+VfDyb9xZ+/TbnbmEPcRp1b+AZBW2HtkxMF1An+BMZ0+Nq9+0peWti
 IvK4uH6ceBzf9/3Y5+LDUZeqIw3SCWDohLBsxPM/pQ==
X-Google-Smtp-Source: ACHHUZ4xZtfMs7YDmORYKGBy7DGgpajRG9EQV1eU3UNrIhwsrAqFAxJvP1pKktp+W3FQ9ry2IP3wKA==
X-Received: by 2002:adf:e787:0:b0:2f0:6192:92db with SMTP id
 n7-20020adfe787000000b002f0619292dbmr9131320wrm.46.1683650011084; 
 Tue, 09 May 2023 09:33:31 -0700 (PDT)
Received: from stoup.. ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 e1-20020adfdbc1000000b0030795249ffasm7393298wrj.92.2023.05.09.09.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 09:33:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: anjo@rev.ng,
	philmd@linaro.org,
	thuth@redhat.com
Subject: [PATCH v2 5/5] disas: Move disas.c into the target-independent source
 set
Date: Tue,  9 May 2023 17:33:26 +0100
Message-Id: <20230509163326.121090-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230509163326.121090-1-richard.henderson@linaro.org>
References: <20230509163326.121090-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Thomas Huth <thuth@redhat.com>

By using target_words_bigendian() instead of an ifdef,
we can build this code once.

Signed-off-by: Thomas Huth <thuth@redhat.com>
[rth: Type change done in a separate patch]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/disas.c     | 10 +++++-----
 disas/meson.build |  3 ++-
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/disas/disas.c b/disas/disas.c
index 5e7401bb6f..954b385a82 100644
--- a/disas/disas.c
+++ b/disas/disas.c
@@ -122,11 +122,11 @@ void disas_initialize_debug_target(CPUDebug *s, CPUState *cpu)
     s->cpu = cpu;
     s->info.read_memory_func = target_read_memory;
     s->info.print_address_func = print_address;
-#if TARGET_BIG_ENDIAN
-    s->info.endian = BFD_ENDIAN_BIG;
-#else
-    s->info.endian = BFD_ENDIAN_LITTLE;
-#endif
+    if (target_words_bigendian()) {
+        s->info.endian = BFD_ENDIAN_BIG;
+    } else {
+        s->info.endian =  BFD_ENDIAN_LITTLE;
+    }
 
     CPUClass *cc = CPU_GET_CLASS(cpu);
     if (cc->disas_set_info) {
diff --git a/disas/meson.build b/disas/meson.build
index f40230c58f..2ae44691fa 100644
--- a/disas/meson.build
+++ b/disas/meson.build
@@ -13,4 +13,5 @@ common_ss.add(when: 'CONFIG_XTENSA_DIS', if_true: files('xtensa.c'))
 common_ss.add(when: capstone, if_true: [files('capstone.c'), capstone])
 
 softmmu_ss.add(files('disas-mon.c'))
-specific_ss.add(files('disas.c'), capstone)
+common_ss.add(files('disas.c'), capstone)
+specific_ss.add(capstone)
-- 
2.34.1


