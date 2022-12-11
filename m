Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BC46494E7
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 16:36:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4OG8-0006ah-Qe; Sun, 11 Dec 2022 10:28:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OFo-0006Ri-HQ
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:36 -0500
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OFg-0007Xi-02
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:36 -0500
Received: by mail-ot1-x32c.google.com with SMTP id
 p10-20020a9d76ca000000b0066d6c6bce58so5833661otl.7
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 07:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DdKeHpnzihti8XnJXyZXdF/AKnoqunJKbe/ljjhBogQ=;
 b=xrpyu6g8d5eSIV51kux/WzbiQQnhR2OlU0VLemyXJFBjuhAS+OIwQVm0fA89jUM/R9
 1okPKdy6MVCfiEP2vAYBQbv1pj6ngUfwKQhPwPttquFzB6CY9br21A3NrNz4+A6/R+8I
 gJHkbZmNGEN81szAa+KKekHiHuAimerb3SX/bQv7N5VBwJsOK7Prm57wmXg29sn4VzDr
 CyZvEBkcUOTM4DReV0bGvlXuGREEWYUhtz65TUi4MxCQNQfmL+M4O7FlFhTHKwU15sZZ
 w+w7vabXk2ujjZ0/zPg+hb5bxigwWTwoj3ZyVUDp4OEx6SjTN9z8Cb25xfGgsyMmi7YZ
 8NaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DdKeHpnzihti8XnJXyZXdF/AKnoqunJKbe/ljjhBogQ=;
 b=7GjJz8P+ovvRwtAPMZR9ZCjBSYHM+NWjGesn81poKwCScU0dyB5b61kd+Jei+Bj6ll
 aaIzkcMfgLk2b0Kls7HE9EWl2usLZqHOwKr3CHiSRaTvpU4/YnVWuYBEthcPE2HiIiSn
 UuI1RFL6G05mSRiGFfM3ONEj0TeX2qdGIa1sc/kvNHbxL4gWnuoe3jhKkVVT6CVoU7TX
 G5zytml08puw5j2PnbvJtz7Geq8SXUA1Us5ftwx7d+1smlSpAti3J+JjUV3kN/1TlCz4
 t3iauFUzVjPy5XyGFTgjTfESD5NWF19vHeWdumh2DyMXUtQYbYKt8CgLZy2wNoS+o9Hx
 DenQ==
X-Gm-Message-State: ANoB5pk+ruKMhsxUzmeoFgM5lld7dAy6XE1UIxD6kV57re+eSNVV3Y8h
 p9V0hn1OEFCC6WTbGxE/izEWbVh6SvoZmlqqe98=
X-Google-Smtp-Source: AA0mqf4Gx8PPtPGugSor3xJAx2glHwaQiOceZHMr0512dokawYvgewVdT6puLzxTKr/FvbDpxvVnng==
X-Received: by 2002:a05:6830:6b0a:b0:66c:71af:3330 with SMTP id
 db10-20020a0568306b0a00b0066c71af3330mr7260075otb.4.1670772495582; 
 Sun, 11 Dec 2022 07:28:15 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:7b4f:f28b:eca6:b583])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a056830233800b006708d2cd8bcsm938140otg.65.2022.12.11.07.28.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Dec 2022 07:28:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 09/27] target/s390x: Remove pc argument to pc_to_link_into
Date: Sun, 11 Dec 2022 09:27:44 -0600
Message-Id: <20221211152802.923900-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221211152802.923900-1-richard.henderson@linaro.org>
References: <20221211152802.923900-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
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

All callers pass s->pc_tmp.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index a6a6dfd7fe..4e23ae8361 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -174,8 +174,10 @@ static void gen_psw_addr_disp(DisasContext *s, TCGv_i64 dest, int64_t disp)
     tcg_gen_movi_i64(dest, s->base.pc_next + disp);
 }
 
-static void pc_to_link_info(TCGv_i64 out, DisasContext *s, uint64_t pc)
+static void pc_to_link_info(TCGv_i64 out, DisasContext *s)
 {
+    uint64_t pc = s->pc_tmp;
+
     if (s->base.tb->flags & FLAG_MASK_32) {
         if (s->base.tb->flags & FLAG_MASK_64) {
             tcg_gen_movi_i64(out, pc);
@@ -1534,7 +1536,7 @@ static DisasJumpType op_ni(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_bas(DisasContext *s, DisasOps *o)
 {
-    pc_to_link_info(o->out, s, s->pc_tmp);
+    pc_to_link_info(o->out, s);
     if (o->in2) {
         tcg_gen_mov_i64(psw_addr, o->in2);
         per_branch(s, false);
@@ -1549,7 +1551,7 @@ static void save_link_info(DisasContext *s, DisasOps *o)
     TCGv_i64 t;
 
     if (s->base.tb->flags & (FLAG_MASK_32 | FLAG_MASK_64)) {
-        pc_to_link_info(o->out, s, s->pc_tmp);
+        pc_to_link_info(o->out, s);
         return;
     }
     gen_op_calc_cc(s);
@@ -1579,7 +1581,7 @@ static DisasJumpType op_bal(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_basi(DisasContext *s, DisasOps *o)
 {
-    pc_to_link_info(o->out, s, s->pc_tmp);
+    pc_to_link_info(o->out, s);
     return help_goto_direct(s, (int64_t)get_field(s, i2) * 2);
 }
 
-- 
2.34.1


