Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C156494D4
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 16:29:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4OG2-0006VM-0y; Sun, 11 Dec 2022 10:28:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OFp-0006SY-B0
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:37 -0500
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OFg-0007pK-GY
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:37 -0500
Received: by mail-ot1-x333.google.com with SMTP id
 l8-20020a056830054800b006705fd35eceso5835913otb.12
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 07:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ougmtZxo3v3SsRwj4T+NvGRyt5F/WZFuGGwZrMTtC10=;
 b=ltZtH+n3dsvT9WWPPrMWDe8ErUY9UldG+8nLlXhMnMXIxv61IPLV6pWOIMMz+pB4m2
 YADLq2SCfBrR6jeVTv1NiFXN7AtAst4lLuRZmHk21dCZl2bD0hVxFheWet2Td40m80/o
 LBBk/HpRF7b3JWSPBtYcHWan+Lg2xL9r1f6K1PjAkOdLSS8ZKNNshq90o3QTFM9fCu5N
 C3tu+D8w6gzQ17hAthx1bVWites+OcQKIvk+Go+EuhrIgcG5xLN+8HD3Q/S+k4a9ubK/
 JNkLSUptt375QgzC2bUrM2KOpJ1Wpxizv4HZhws5CqKV4CGYQIGvzFh6qq7ubbkDhkyg
 PvZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ougmtZxo3v3SsRwj4T+NvGRyt5F/WZFuGGwZrMTtC10=;
 b=rNReLxtMazaL0l9R6J+J31RUl0mDjcW8jPrZpA0S6aNViNiWXmorlKm1J0KAF+6giy
 waqYzI4CI7m20/pSuEROSojj8d0mDIWByBQcjwPsQ3akyTNEC3EAVdhL0CRcEDtkLIec
 p58FFXOpOeTH9pr5jHZUFBZmUBS4dXZsb4AkPLuiAMmucMQ4HL9NgauWnI98dpWEFJTB
 kj1rkx3854d6yoeEjHBjU/12azsmX8GzyTmDvPiCRpeEdHlIRZmCO8apihaKSPFxMOwm
 G2sJ58S8lJAdZux69963xUYHp1i6BLpHQhfMQTcWd2lknljKU8bUzHlu7vFZHHuqnFhS
 IoZw==
X-Gm-Message-State: ANoB5pkcrKIHrZgj0VK7m/9T/zRihMm8VVAPWnMcOGmkSkDw7AF+XZOj
 dSXlfSgCrENzV7YxtVraxUPCKOfkUApRS7ufeeA=
X-Google-Smtp-Source: AA0mqf7oxD25is7EaNYXWbXdq8XI3luU0I12hEaqFqPrYwIZYzuPcv++9efF9131AuXKoh2pHR6Piw==
X-Received: by 2002:a05:6830:6201:b0:66c:4634:ab1 with SMTP id
 cd1-20020a056830620100b0066c46340ab1mr8477300otb.38.1670772507079; 
 Sun, 11 Dec 2022 07:28:27 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:7b4f:f28b:eca6:b583])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a056830233800b006708d2cd8bcsm938140otg.65.2022.12.11.07.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Dec 2022 07:28:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH v2 19/27] target/s390x: Introduce help_goto_indirect
Date: Sun, 11 Dec 2022 09:27:54 -0600
Message-Id: <20221211152802.923900-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221211152802.923900-1-richard.henderson@linaro.org>
References: <20221211152802.923900-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Add a small helper to handle unconditional indirect jumps.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 9e84f706d5..7506eff4b0 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -1189,6 +1189,13 @@ static DisasJumpType help_goto_direct(DisasContext *s, int64_t disp)
     }
 }
 
+static DisasJumpType help_goto_indirect(DisasContext *s, TCGv_i64 dest)
+{
+    tcg_gen_mov_i64(psw_addr, dest);
+    per_branch(s, false);
+    return DISAS_PC_UPDATED;
+}
+
 static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
                                  bool is_imm, int imm, TCGv_i64 cdest)
 {
@@ -1219,9 +1226,7 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
             goto egress;
         }
         if (c->cond == TCG_COND_ALWAYS) {
-            tcg_gen_mov_i64(psw_addr, cdest);
-            per_branch(s, false);
-            ret = DISAS_PC_UPDATED;
+            ret = help_goto_indirect(s, cdest);
             goto egress;
         }
     }
@@ -1545,9 +1550,7 @@ static DisasJumpType op_bas(DisasContext *s, DisasOps *o)
 {
     pc_to_link_info(o->out, s);
     if (o->in2) {
-        tcg_gen_mov_i64(psw_addr, o->in2);
-        per_branch(s, false);
-        return DISAS_PC_UPDATED;
+        return help_goto_indirect(s, o->in2);
     } else {
         return DISAS_NEXT;
     }
@@ -1580,9 +1583,7 @@ static DisasJumpType op_bal(DisasContext *s, DisasOps *o)
 {
     save_link_info(s, o);
     if (o->in2) {
-        tcg_gen_mov_i64(psw_addr, o->in2);
-        per_branch(s, false);
-        return DISAS_PC_UPDATED;
+        return help_goto_indirect(s, o->in2);
     } else {
         return DISAS_NEXT;
     }
-- 
2.34.1


