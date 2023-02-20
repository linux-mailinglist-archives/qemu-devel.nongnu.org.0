Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DBD69D31F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 19:48:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUB86-0005UB-H8; Mon, 20 Feb 2023 13:43:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6X-0004Xu-34
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:40 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6L-00046G-Cv
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:32 -0500
Received: by mail-pj1-x1035.google.com with SMTP id 99so2302524pjz.4
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 10:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FVcoN5if0V8Us809c/xVyI5a/NDqYw35Cn85wK50aSY=;
 b=Zv9ZHg0Eo5+8mAeI7KLlyGbW5acH+U4uy4af/FZYiYoXq4kPDoad+fpFbbD6kHjRC3
 L/2bKVfOBE3+ymupUMIgNwKXmqNdsSRHT0V8uh1e+0ZsVrVER2f+VjbA7X+W/KuVCbPZ
 gqKfu1sK62JEcbeVnqwxBD1UtoGw42r+xoeETxwnE4ScRMmP1GbB0iuMgeMhb+jF/Hwy
 zV7AADwgsD9b+Sll/4SPeOtUsQOyyqFkppYt2NknxCW8mAmz4mcOg8x4LWYx9LWiGiLy
 E/R3N8bAuNk4pPF+HnBC7rBp0fHomo05gaEGxj/fPszC0AB5xl9t+Qb728aSRSTcof3r
 sT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FVcoN5if0V8Us809c/xVyI5a/NDqYw35Cn85wK50aSY=;
 b=4XGFtToxrJGd6gFmjqDCGpmn/5DNhtynf/E+LH0bkcLQNUqzolrXCJVrTTb9LEqrmZ
 Q8MlKW7KL5TKFk97AA3m2hep3u9NPoOXI5frEMCj5TcST3/PP91Ad947+5quK1EumXbp
 d2tRVwG8oGVC77biyZdjgQ71a+OIlb6UArTI+zCDSx4d17NrlZhN4mb3J0smEqvMKqQM
 YaYnrGkCQgXrkd9GVAmdgMywXBGgD/2fLvzGF2Lf5s1BDb0y96Ey7HJAd2Q+9EqvjfzX
 xzmTDq72DcwoyaTvp+nKuaJ+zpUfjtAVKThCktR8zi33A4gY3jL2bCPWNZu/ROBD3HhJ
 I7dg==
X-Gm-Message-State: AO0yUKWEF6O3nmgNuaZIMzV7xNwf2KYabTN0ay+CNUtePueCxpk0R7IB
 oEz12/qKxB2Cc3Ykvm/DnVx1DpsDI0O9eLrjKOs=
X-Google-Smtp-Source: AK7set+HW6OVpnCyTrYsTAB4raYBRkajAR+xWZxtBPbCXorXG/AYgPW3wZhbD9uOe8tC2PdRtLYoeQ==
X-Received: by 2002:a17:903:1ca:b0:199:41a5:1085 with SMTP id
 e10-20020a17090301ca00b0019941a51085mr4213559plh.33.1676918469944; 
 Mon, 20 Feb 2023 10:41:09 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jk20-20020a170903331400b0019258bcf3ffsm1911676plb.56.2023.02.20.10.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 10:41:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 07/27] target/s390x: Change help_goto_direct to work on
 displacements
Date: Mon, 20 Feb 2023 08:40:32 -1000
Message-Id: <20230220184052.163465-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220184052.163465-1-richard.henderson@linaro.org>
References: <20230220184052.163465-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index faa6f737ba..bd7f644f83 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -1161,8 +1161,10 @@ struct DisasInsn {
 /* ====================================================================== */
 /* Miscellaneous helpers, used by several operations.  */
 
-static DisasJumpType help_goto_direct(DisasContext *s, uint64_t dest)
+static DisasJumpType help_goto_direct(DisasContext *s, int64_t disp)
 {
+    uint64_t dest = s->base.pc_next + disp;
+
     if (dest == s->pc_tmp) {
         per_branch(s, true);
         return DISAS_NEXT;
@@ -1185,7 +1187,8 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
                                  bool is_imm, int imm, TCGv_i64 cdest)
 {
     DisasJumpType ret;
-    uint64_t dest = s->base.pc_next + (int64_t)imm * 2;
+    int64_t disp = (int64_t)imm * 2;
+    uint64_t dest = s->base.pc_next + disp;
     TCGLabel *lab;
 
     /* Take care of the special cases first.  */
@@ -1201,7 +1204,7 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
             goto egress;
         }
         if (c->cond == TCG_COND_ALWAYS) {
-            ret = help_goto_direct(s, dest);
+            ret = help_goto_direct(s, disp);
             goto egress;
         }
     } else {
@@ -1573,7 +1576,7 @@ static DisasJumpType op_bal(DisasContext *s, DisasOps *o)
 static DisasJumpType op_basi(DisasContext *s, DisasOps *o)
 {
     pc_to_link_info(o->out, s, s->pc_tmp);
-    return help_goto_direct(s, s->base.pc_next + (int64_t)get_field(s, i2) * 2);
+    return help_goto_direct(s, (int64_t)get_field(s, i2) * 2);
 }
 
 static DisasJumpType op_bc(DisasContext *s, DisasOps *o)
-- 
2.34.1


