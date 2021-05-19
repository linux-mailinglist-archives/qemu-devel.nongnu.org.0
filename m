Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C90B38958D
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:36:06 +0200 (CEST)
Received: from localhost ([::1]:45578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljR36-0003eR-UQ
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:36:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyE-0003Oj-PX
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:02 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:34735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyA-0005Y2-QV
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:02 -0400
Received: by mail-oi1-x22f.google.com with SMTP id u11so14004068oiv.1
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NjWJ8kBHVuAatpMu3NeT86JZz0YPmJ7lsGR0prh67KA=;
 b=gguHWSEWPLvMsxPzchXoJvvFZeYcHUHDqtX9QMtPDdhZpnCFxsd7MzcUyswvmzmtet
 1LvrwewOT6fKYG3iFOSY6AjKa2SzcJZLk51pz3d+H1U4ZogH7LPQ9iWc5RnJbrkc4A3Z
 2RPt16hCKbBrZ3xLvk0xVDZqEgkJiMNoeX/Of6epNDc8tKJctZyuBSlyzJY8HKbVH8j5
 WRig4TI1Z5r4GE4vfjn6uxsLWARivDyG8uAvfofK2/i5RwR16mGZy1GusO+4jEx69fPR
 enO4MVZ1Zkqxic189S9+k2/Q6bba+fIXz23mHk+3EgnqkR8Yo0qWzNxmlGg+E8fAb2FV
 /woQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NjWJ8kBHVuAatpMu3NeT86JZz0YPmJ7lsGR0prh67KA=;
 b=rZgN4hImHyxuj8u5M7XXKih7D6OIBsJhOvmoHCYzzkeWV5uZnlu46EbHqDFR/2YMYB
 EQRRxTS2EQt6OeeCcNFrQBAIn3rj1VkoA2FSZGvy6SB81DC7BRwt1K5X4LHhrbTeTlo5
 uZx91vNb0Hp+5JaG4tm5Scm6bAbRWAb3bH8tB4kd5SdFydety0njFQjx73bF2h+tXm/+
 zqiqMwa2NqdIZxkSZZ4mHmBC2cPEo4T7FiC8FTa3Jz7opqip2InnxzOtcZj7i8hufxSD
 e4I0UTNtPvV1LnNDiW0Yq20f7N+3P5WHVvxwmUNlq9MXKPDPuH0KDKyJl+61IBx8QOTK
 6rpw==
X-Gm-Message-State: AOAM530CnA/oBpoMBXg8GbXLfSGkwk3RsFWcLT4j8cS4sbb0AXl4cqbj
 TFjeZYiOMcfq8r/ZQK9aURrBIIMMAyWUmrDd
X-Google-Smtp-Source: ABdhPJx2d1B3k99V0aQePhrbb/i4Y0HkTuFSsLJq2NhRILX5yqR7UYgZKr+CS9qLnyiVyPo1qFRh3Q==
X-Received: by 2002:aca:280a:: with SMTP id 10mr529541oix.13.1621449057779;
 Wed, 19 May 2021 11:30:57 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id l9sm28428oou.43.2021.05.19.11.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:30:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/50] target/i386: Split out check_iopl
Date: Wed, 19 May 2021 13:30:05 -0500
Message-Id: <20210519183050.875453-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210514151342.384376-6-richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 74f6024f82..873ed00975 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -1302,6 +1302,16 @@ static bool check_vm86_iopl(DisasContext *s)
     return false;
 }
 
+/* Check for iopl allowing access; if not, raise #GP and return false. */
+static bool check_iopl(DisasContext *s)
+{
+    if (s->vm86 ? s->iopl == 3 : s->cpl <= s->iopl) {
+        return true;
+    }
+    gen_exception_gpf(s);
+    return false;
+}
+
 /* if d == OR_TMP0, it means memory operand (address in A0) */
 static void gen_op(DisasContext *s1, int op, MemOp ot, int d)
 {
@@ -7095,28 +7105,16 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         break;
 #endif
     case 0xfa: /* cli */
-        if (!s->vm86) {
-            if (s->cpl <= s->iopl) {
-                gen_helper_cli(cpu_env);
-            } else {
-                gen_exception_gpf(s);
-            }
-        } else {
-            if (s->iopl == 3) {
-                gen_helper_cli(cpu_env);
-            } else {
-                gen_exception_gpf(s);
-            }
+        if (check_iopl(s)) {
+            gen_helper_cli(cpu_env);
         }
         break;
     case 0xfb: /* sti */
-        if (s->vm86 ? s->iopl == 3 : s->cpl <= s->iopl) {
+        if (check_iopl(s)) {
             gen_helper_sti(cpu_env);
             /* interruptions are enabled only the first insn after sti */
             gen_jmp_im(s, s->pc - s->cs_base);
             gen_eob_inhibit_irq(s, true);
-        } else {
-            gen_exception_gpf(s);
         }
         break;
     case 0x62: /* bound */
-- 
2.25.1


