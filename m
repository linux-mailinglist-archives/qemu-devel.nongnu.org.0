Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFD93AE183
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 03:44:43 +0200 (CEST)
Received: from localhost ([::1]:35312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv8zS-000673-Lq
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 21:44:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8q5-0003tm-Gs
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:35:03 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:41617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8pq-0005B2-TV
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:34:59 -0400
Received: by mail-pf1-x429.google.com with SMTP id x73so12390110pfc.8
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 18:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rxkDq96k3ZTvlscbiDlbIOM0PupnkbICBsbxK69yAjc=;
 b=kDLZmVfWV4wsFpjzZJ1pENqklXd1jt0r9hUjELIfbjAwyeYjcAclqz1gTLDWIm8elc
 O58M0MW4+5khnk2t0P2/tcA5R2ZsBQ03l3T4oQy8FtgHSNKYqgJJwWlQYLvKNEGHGOi8
 Vx/AYgTs789FSN6kwig2nshEaIxhDh9PQ8/GJxSh2FUPhfZJ/ve2WaDi7NQBf8U0h783
 DR08/GV5n7mwjVmOusXzZk/7S2g9Rbl37PEqVR0RyxiElyE2OIVKy9/W/Rz4DUOWg8R8
 Ch562A/I6fgbDTOReG9Qu3pf+5qfDxdRtQQXfB8Yq3XVcqqE/K155S8p5WAbA2rl7Gqc
 xPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rxkDq96k3ZTvlscbiDlbIOM0PupnkbICBsbxK69yAjc=;
 b=DkgFleD6zu0GL9K5T2kuYnDNk6TuSkqK2/E04cZii3IFYEWFVj6A1LeoF+VkXFt7KW
 3SJyk/nvuwZezx2R5SAsqkktqMIZGOzjESBlX9wOZZ8q7PPutV7pM6XzYF5cV3MyY6pU
 mtT4Hi9r2v7AiwUsXqytVT+zUNNXJzVvChSvQivqUmY/G0fuRVzQj2zsRj6EzxcVA+UU
 cuHYykrlPGl087jLOklO37h5xIztzgPgpuR88DSwLw88tNYBDXPPxbrzKoE+uhcOoba3
 PQNquhuw4jQvUcwrrTAhfdwiODKZ8++NcjpEXqEzRql3fM3DcR9h1MmiIjSHKbgvZLBi
 7Ilw==
X-Gm-Message-State: AOAM53122lNSuHnGMncwHDkyYuZAD4wCyIjiOs8L6PoAnj+AgI+iop9L
 PZfRk9R7QPsRHXe9DlzA1bguKeDyo0ahcw==
X-Google-Smtp-Source: ABdhPJxOP93WhVqSN7tCnTvhlWVR9AkHioK19yqG/129O+smaezhG1GCmNIAnxq/39YjQEEYgRLFUw==
X-Received: by 2002:aa7:8702:0:b029:303:6c92:dc8e with SMTP id
 b2-20020aa787020000b02903036c92dc8emr2663686pfo.63.1624239285642; 
 Sun, 20 Jun 2021 18:34:45 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id s27sm1495628pfg.169.2021.06.20.18.34.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 18:34:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/26] target/cris: Use translator_use_goto_tb
Date: Sun, 20 Jun 2021 18:34:21 -0700
Message-Id: <20210621013439.1791385-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621013439.1791385-1-richard.henderson@linaro.org>
References: <20210621013439.1791385-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The test for singlestepping is done in translator_use_goto_tb,
so we may elide it from cris_tr_tb_stop.

Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index 3200819f32..33ad76c0a8 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -517,7 +517,7 @@ static void t_gen_swapr(TCGv d, TCGv s)
 
 static bool use_goto_tb(DisasContext *dc, target_ulong dest)
 {
-    return ((dest ^ dc->base.pc_first) & TARGET_PAGE_MASK) == 0;
+    return translator_use_goto_tb(&dc->base, dest);
 }
 
 static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
@@ -3275,8 +3275,7 @@ static void cris_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
              * Use a conditional branch if either taken or not-taken path
              * can use goto_tb.  If neither can, then treat it as indirect.
              */
-            if (likely(!dc->base.singlestep_enabled)
-                && (use_goto_tb(dc, dc->jmp_pc) || use_goto_tb(dc, npc))) {
+            if (use_goto_tb(dc, dc->jmp_pc) || use_goto_tb(dc, npc)) {
                 TCGLabel *not_taken = gen_new_label();
 
                 tcg_gen_brcondi_tl(TCG_COND_EQ, env_btaken, 0, not_taken);
-- 
2.25.1


