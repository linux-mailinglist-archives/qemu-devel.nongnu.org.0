Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 386CF6003EC
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 00:27:47 +0200 (CEST)
Received: from localhost ([::1]:55052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okC6k-0001ND-BF
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 18:27:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1okC30-0005yZ-6j
 for qemu-devel@nongnu.org; Sun, 16 Oct 2022 18:23:54 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:45869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1okC2y-0000u3-H4
 for qemu-devel@nongnu.org; Sun, 16 Oct 2022 18:23:53 -0400
Received: by mail-oi1-x232.google.com with SMTP id o64so10413652oib.12
 for <qemu-devel@nongnu.org>; Sun, 16 Oct 2022 15:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GPEmDd48yJEOUJxwh+z52WM36oU/vXLILAexTJFvUyA=;
 b=ymRjJynswDnFlY7rKUu9Q4DnXzLpIUZ3gQArlPjHHFcar0dPuamj4b8+4vYjUZctcL
 IYj3pXD6fqkSgbAQulaQRn6lfoW7Bg1wY8qfj4RSmTVByNMjcpVPetTQsd9B4twfoKef
 Cak/UbUDh4OJf76c8IZSaIEy+X47gK67/63ZX8cJrJdXlDOO0b3qU5A8rBZBs0rPH/tM
 nbJLDmGQ0cYsxfFbaF7n3Fu1i8ds/PPD2wzMZoo7ZgkU2lwQzznLUsTD/ZdlWwDhNXb1
 MP97/LZtLZMA7Vpoe511JnyRL1mjDjCKXc6HLLFHEFbDKj8O34Cj8LfeLXhnBFLl32B/
 +ecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GPEmDd48yJEOUJxwh+z52WM36oU/vXLILAexTJFvUyA=;
 b=zZk84XB+FMw1cMX7pOHLP+vSHrrKtQbzS+uaEoZAtWKC+E+iacEsDh6pVDotsR07Y9
 wfshrR67wbCkzVEXHdsOtma/OFGZXLBS0cb3+qd6jVeHbY9q67miYhQMIBoPHx2FYovz
 AJyhNVLQm851w6O2K5THPjdr/34EGQDxxQEu2Hlr8jOSYUzoU5VT4B0DdG0YxyMoK2lw
 TAW+XlctDuF1hIPy8VF9GsoSSkNvwLvnRa+Jkv/wPx4yaSh/NMCaWfLd4Zx8ETJlPGf9
 1T0ye03meNqnPEbrNuWGO5C80CaaQBI/6Hhii6ZByosbNvL38Pd281wvnlAmFlnE/6Lk
 x/IA==
X-Gm-Message-State: ACrzQf1AZLtT+GDNvbZbUtAluYZz8YxHLBezO1I8bsZMGoMMkaLZhwfb
 Aa4QbQ7xt80gUXFgE3A+5Qc6X+XGkgx/AH8u
X-Google-Smtp-Source: AMsMyM6SEC1kM5ju0Y1CgXSzLEQ1hzn2dxiAbOpyRepmsWoRDvV90Pu46CV2muZ21YDw9pOvqtFC6g==
X-Received: by 2002:a17:90a:b903:b0:20d:a36b:6791 with SMTP id
 p3-20020a17090ab90300b0020da36b6791mr22549358pjr.26.1665959015943; 
 Sun, 16 Oct 2022 15:23:35 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 ik20-20020a170902ab1400b001730a1af0fbsm5213027plb.23.2022.10.16.15.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 15:23:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] target/i386: Save and restore pc_save before
 tcg_remove_ops_after
Date: Mon, 17 Oct 2022 08:23:03 +1000
Message-Id: <20221016222303.288551-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x232.google.com
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

Restore pc_save while undoing any state change that may have
happened while decoding the instruction.  Leave a TODO about
removing all of that when the table-based decoder is complete.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 279a3ae999..75ca99084e 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -4817,6 +4817,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     int modrm, reg, rm, mod, op, opreg, val;
     bool orig_cc_op_dirty = s->cc_op_dirty;
     CCOp orig_cc_op = s->cc_op;
+    target_ulong orig_pc_save = s->pc_save;
 
     s->pc = s->base.pc_next;
     s->override = -1;
@@ -4838,8 +4839,15 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     case 2:
         /* Restore state that may affect the next instruction. */
         s->pc = s->base.pc_next;
+        /*
+         * TODO: These save/restore can be removed after the table-based
+         * decoder is complete; we will be decoding the insn completely
+         * before any code generation that might affect these variables.
+         */
         s->cc_op_dirty = orig_cc_op_dirty;
         s->cc_op = orig_cc_op;
+        s->pc_save = orig_pc_save;
+        /* END TODO */
         s->base.num_insns--;
         tcg_remove_ops_after(s->prev_insn_end);
         s->base.is_jmp = DISAS_TOO_MANY;
-- 
2.34.1


