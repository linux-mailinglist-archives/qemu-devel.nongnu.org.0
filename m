Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 972A85AE6E5
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 13:52:37 +0200 (CEST)
Received: from localhost ([::1]:59072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVX88-0002Sw-JO
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 07:52:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVee-0003MO-Oh
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:18:05 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:45637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVea-0005Bk-Gt
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:18:02 -0400
Received: by mail-wr1-x42d.google.com with SMTP id bj14so1422142wrb.12
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=HK7ix9AO/8mxB8DbXZV83BhAtiM36n+x9LjSZXjhklE=;
 b=OdLwK4VQHjrlEgn+iLBxsVtPBz07y5/U1P377tDstEJ6XyzVgVyu3BOn61TqXTfE/0
 CipMQd89+V38gaHdp6lG3mcMiuHyaffWu7JLOoX06CJtpj7Hya8dlJN4hatHUz12pSKv
 A1i3eLOoxUXPQ4f2AjWVd/PCq9RTIoSPm7/W35eprEDkrfdd8bbmrCJmJEPPNDdcz9Lu
 dmYhHuguhbl+ov9i4Q2mtDD6H3b4oc3P1VPSlzwKJneThBl1MCYNScxT2uZQlUMNWu/q
 dXDJuhYQDtN2uspnSMB4se/nPKbcYcti9k4SHdHqf4Yzmx/zXj7Il4qoqmd4wHj/04O7
 czFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=HK7ix9AO/8mxB8DbXZV83BhAtiM36n+x9LjSZXjhklE=;
 b=uB122cOreNVOVDWY/NpcGkbVHj7CNyfB1q9vk2VfFxHeRxuXJumwW/tKnxXI8cD5+Q
 xURIHbXVV3kiBM5gYhmG14pe+YiwmzgPEtqGqxCvDfX90BjJJA+TRHO0oPJxyjT2jCTj
 vyHVWOCY2WuNxrrCZXNNWNG93gcTlcvLDV4vsbpqcy2tkCeEc92A/5KFR63dWdJoj4CE
 3Fl5+B/cRAXDDa8uW5w6E5cbID+s3bbmEtKpV1bTsE2/5A3MKOSG2dFMOIY8adWC6Ksx
 GzIad0Bhc55fCfrtACueNyUEAFK1x/Ry2/HfHYmANBQN8RjPF6gAuuifMRrRImrhfeW3
 gUow==
X-Gm-Message-State: ACgBeo0HU6VG+Egcr7CERLJrS2pkZ//Junew7u5WUiURClwae3G182G8
 n+bRIsmZ/A0UhiHnQCA9TDS2GYFnttwXzrvF
X-Google-Smtp-Source: AA6agR4d4b382YgnCVFXRipyAYgf2pzIEv6/KxpM5Z1yDdgGQNIZDMwXO+7achsTP818sRvDxtLwlw==
X-Received: by 2002:a5d:5407:0:b0:228:a79b:4432 with SMTP id
 g7-20020a5d5407000000b00228a79b4432mr4227500wrv.96.1662459479708; 
 Tue, 06 Sep 2022 03:17:59 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a05600c365000b003a62bc1735asm14094361wmq.9.2022.09.06.03.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:17:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH v1 11/26] target/s390x: Use ilen instead in branches
Date: Tue,  6 Sep 2022 11:17:32 +0100
Message-Id: <20220906101747.344559-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906101747.344559-1-richard.henderson@linaro.org>
References: <20220906101747.344559-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove the remaining uses of pc_tmp, and remove the variable.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 2ea3feb803..67c86996e9 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -141,12 +141,6 @@ struct DisasContext {
     TCGOp *insn_start;
     DisasFields fields;
     uint64_t ex_value;
-    /*
-     * During translate_one(), pc_tmp is used to determine the instruction
-     * to be executed after base.pc_next - e.g. next sequential instruction
-     * or a branch target.
-     */
-    uint64_t pc_tmp;
     uint32_t ilen;
     enum cc_op cc_op;
     bool exit_to_mainloop;
@@ -1198,7 +1192,7 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
         goto egress;
     }
     if (is_imm) {
-        if (dest == s->pc_tmp) {
+        if (disp == s->ilen) {
             /* Branch to next.  */
             per_branch(s, true);
             ret = DISAS_NEXT;
@@ -1222,7 +1216,7 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
         }
     }
 
-    if (use_goto_tb(s, s->pc_tmp)) {
+    if (use_goto_tb(s, s->base.pc_next + s->ilen)) {
         if (is_imm && use_goto_tb(s, dest)) {
             /* Both exits can use goto_tb.  */
             update_cc_op(s);
@@ -6247,7 +6241,6 @@ static const DisasInsn *extract_insn(CPUS390XState *env, DisasContext *s)
             g_assert_not_reached();
         }
     }
-    s->pc_tmp = s->base.pc_next + ilen;
     s->ilen = ilen;
 
     /* We can't actually determine the insn format until we've looked up
@@ -6484,7 +6477,7 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
 
 out:
     /* Advance to the next instruction.  */
-    s->base.pc_next = s->pc_tmp;
+    s->base.pc_next += s->ilen;
     return ret;
 }
 
-- 
2.34.1


