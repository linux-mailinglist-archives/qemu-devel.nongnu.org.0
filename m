Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C705C5F5FF7
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 06:14:51 +0200 (CEST)
Received: from localhost ([::1]:37736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogIHa-0006EZ-SM
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 00:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHoS-0004Kk-QR
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:46 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:50933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHoO-0003rF-3P
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:43 -0400
Received: by mail-pj1-x102d.google.com with SMTP id lx7so727387pjb.0
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=B458Afawec85XoXWpbjPbqxmo9p/Fje9hPN8wU9nu7E=;
 b=j8UnLD2aVRlrEkxlkaMaU211PTf5s3ds+jS7j8X389F0FyZzqGsoKWWxIaBQ/4WIsp
 bbj8xkGX1VESzx1PO6nU1jjgoTDEAvydnpHRjowoq+YMxRsDZdRvUgXqWKdBRejb2hD2
 hdTJvu1Ho5MEuMgA/vqSJgkn6oZWtg5Kg3OFcsDRUzqFUktQ/qHieMUD/wkrIT4vTSyw
 W1Slu3AbQ+QyZPZise6fJRDkw+TnUfxxeOAIpNKBisX8rPsCksqSfSauCFa++gyIjJjt
 Smy9Qx7qrCerC+8A8ej2vIl3CmWxc1s1Sj+9NexKfOv5nKme2B9ZwsoBXw2OHyiQRrrE
 dJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=B458Afawec85XoXWpbjPbqxmo9p/Fje9hPN8wU9nu7E=;
 b=NOOaajNTJYXa6DtWPYeK+6jxZRkzv54d5Vm3VEZGZfiqthzMS2T6+gHRAZMQNtsJYH
 HHvty5FXkO/puiy4OEWt1K6HASTf0gEIS3O9iJN7bM8njk8rjilZTQ1emkaQ1Yhhj8rQ
 E5enBrOnqLEV3r35RFRb4WGh7kPBFCNuiw6W/reEd/W2dBDBgJBjUQXOnT/XLv0S6W1D
 GUkyYsHBURVqZdKJxsIAYZ5Q/y679p27p3jwH2lFM9xqvOV4DcfSb2vkXEYvtQhd6JY2
 SKR8ksHtgefwM/PDGqCUm76wfZdW6MbduCLtiTDK0N+GZXidjQluL1pKFZ1MGKcwt84E
 dHHw==
X-Gm-Message-State: ACrzQf2cE5l0t7zdr/39HOb4JSytZ8E3m37QNUnhCcOkbnUPKnk7SjDa
 xjUAG/NvrvqeelQ/E8jFDaP8S6HRIEIl9w==
X-Google-Smtp-Source: AMsMyM50Ud4PIWupP6JdFiIRmgttK2HTuTlGB+s0u32rnic4KsN8OcBZe8PhbwMT40Ormstoi5nsZw==
X-Received: by 2002:a17:90b:3846:b0:20a:e735:f84c with SMTP id
 nl6-20020a17090b384600b0020ae735f84cmr2977514pjb.183.1665027879393; 
 Wed, 05 Oct 2022 20:44:39 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a17090ad0c600b00205f4f7a3b3sm1905086pjw.21.2022.10.05.20.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:44:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH 17/26] target/s390x: Introduce help_goto_indirect
Date: Wed,  5 Oct 2022 20:44:12 -0700
Message-Id: <20221006034421.1179141-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006034421.1179141-1-richard.henderson@linaro.org>
References: <20221006034421.1179141-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

Add a small helper to handle unconditional indirect jumps.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index fc6b04e23e..712f6d5795 100644
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


