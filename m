Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F53663133
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 21:16:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEyRm-00034G-Qv; Mon, 09 Jan 2023 15:08:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRi-0002zY-Pb
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:38 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRb-0007S7-Nd
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:38 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 v13-20020a17090a6b0d00b00219c3be9830so10942847pjj.4
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 12:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0zBrdaSUeRUDXCt0EzlV8qE/5LvkgTmGDIbtmZQgP5w=;
 b=bjHG9r+PJjcuB9oEPNyuuFDzSVg7c7AlNw0o11pnztnuxCwOT6VI/PuhbfIu84+lGt
 /mjlStYCHW4U8znrO6tZRPqH5c95x+LhEJFgV+2VBhnF1utmlhVG6ou5VJ+frphFhL60
 zTxu16PYhotBC4SWWKeSApydvqvDbyhsYirzCl/K/R4nrWqxdcfW1wf8BeZG8Gb5duD6
 u4MsAVk14W4VWO14bq3meSwEO4YXafGFGBunY+fyxLEcQbeHBo2Ka1M+3p4ZgeKZPEeT
 i9aS3cqoKoKjHNKzJqtE4iG3RShhG0/JApc0z465fLGXv2bZk9VQA58m9C9Ycg4woqTf
 jRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0zBrdaSUeRUDXCt0EzlV8qE/5LvkgTmGDIbtmZQgP5w=;
 b=V46MgBKOQllXSZVRrDl8YAXmx3w80yBCgeXPLp+7hWSGwK/BYUs11rZZE9ghq9g37Z
 pdPhlEqPY44VU88GsGZew5/ubatua4lUGWGRkpRZoVZ2oYc2rL2YpUY2d3S6JE625lbc
 iR9+hIBAUkkBo+JpGNrX9uYl+C4/+yKbXrbagfM70k0wm6FEugs9RvZ6UBihM3uGRj5w
 yOfu/5aZL3cc3L0thlpgafGp8sGuLc68HPp01t7z02KVCp7UgnkslKtDRaAl/KeYE3id
 C3oKSWQ3qOUsDs8zxLwCmJv8gY+lVex3PYjKOBCwuMU2gmEmjyg6oh+KGmt2917Fjooh
 Epbg==
X-Gm-Message-State: AFqh2krCRp4rLHEkNo9qrBB4ihNZq26g6p759K1wlZIsfNIBDDna93qQ
 /2WZfOsLESOPK8mNxbwTQ9+KmEED/MCDWvpf
X-Google-Smtp-Source: AMrXdXuO0pityJ7jBu/cRPl0hGYI7zQLovYwOhEchPFiMPsFgfrcisJG8Y3zkWCvNOJFI9izvjanlA==
X-Received: by 2002:a17:90a:db8a:b0:226:632c:abbd with SMTP id
 h10-20020a17090adb8a00b00226632cabbdmr29585822pjv.47.1673294910246; 
 Mon, 09 Jan 2023 12:08:30 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:158e:facf:7a46:ba9f])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a17090a384200b0022727d4af8dsm577574pjf.48.2023.01.09.12.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 12:08:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 07/27] target/s390x: Change help_goto_direct to work on
 displacements
Date: Mon,  9 Jan 2023 12:07:59 -0800
Message-Id: <20230109200819.3916395-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109200819.3916395-1-richard.henderson@linaro.org>
References: <20230109200819.3916395-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 83805085a9..f13ea43ce9 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -1145,8 +1145,10 @@ struct DisasInsn {
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
@@ -1169,7 +1171,8 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
                                  bool is_imm, int imm, TCGv_i64 cdest)
 {
     DisasJumpType ret;
-    uint64_t dest = s->base.pc_next + (int64_t)imm * 2;
+    int64_t disp = (int64_t)imm * 2;
+    uint64_t dest = s->base.pc_next + disp;
     TCGLabel *lab;
 
     /* Take care of the special cases first.  */
@@ -1185,7 +1188,7 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
             goto egress;
         }
         if (c->cond == TCG_COND_ALWAYS) {
-            ret = help_goto_direct(s, dest);
+            ret = help_goto_direct(s, disp);
             goto egress;
         }
     } else {
@@ -1558,7 +1561,7 @@ static DisasJumpType op_bal(DisasContext *s, DisasOps *o)
 static DisasJumpType op_basi(DisasContext *s, DisasOps *o)
 {
     pc_to_link_info(o->out, s, s->pc_tmp);
-    return help_goto_direct(s, s->base.pc_next + (int64_t)get_field(s, i2) * 2);
+    return help_goto_direct(s, (int64_t)get_field(s, i2) * 2);
 }
 
 static DisasJumpType op_bc(DisasContext *s, DisasOps *o)
-- 
2.34.1


