Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FE35AE645
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 13:12:51 +0200 (CEST)
Received: from localhost ([::1]:49582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVWVe-0002AQ-K4
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 07:12:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVeZ-0003K6-2b
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:17:59 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:40523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVeX-0005Cx-7w
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:17:58 -0400
Received: by mail-wr1-x431.google.com with SMTP id b16so14691331wru.7
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=l53fuZSqZ64troLpcyrB8sNDjaLJEzEZPxt99U3wokI=;
 b=EeCV5cflzzv8hLEeYXMgMB4UhDE0WjAOjzDBBkQ4GKCu5R0hwle5dfttoZx08tmsaA
 cMjetI66jr4BFahkH9iCF3SBvJZdEftaY78eTYKtk9FLKiJy/Ova3JtVhpN9D2Rx+5+i
 rG1mraupl3AgCvBx03zyMZCi1cdUXgqhDDwax3G4XYYBwJEbMlt3+bDs6EFxNiudxC2x
 nF81lVs0xGwHYm7A/weZsCVLuB8tppJnlh3ztgWWSpuHD77KIvVrdIJDhI2s5PygAIlv
 Ls7dkWoQUlMHfDs6cA0LXNYsP1BJ1jbFD9a1TiVx/aKd3xrUbk/oAjg/hhOwOj+XLl+E
 J/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=l53fuZSqZ64troLpcyrB8sNDjaLJEzEZPxt99U3wokI=;
 b=yPe2ogZNebSxw/LxZ0ggOVyzICErcNVpCkUQHGi6csy8euxpsHCoGmIguyuJaX5J1A
 M3woV9NYOqZ+8GwlDtwPsDZlgv+GRQ/LbkJ6j5C3ESK9c1OdQQbm+KrXknZovWoIVjAi
 2AquplEv6Go9NIS2QnMBQk/vK9GfZcQS1doM3JF6dtl36bdOVZC0filC4eWMnVB+j6P/
 zqpKU7RfD58DUxt2atnTSuyw/GMBtfEud8H/oYjaDMjuFtUnU5yxVQmKNnL3uFWOAYqs
 2WJIu5tqE/4ZGQ5B4F6Mh7W2jUmmh2IhWF5mThLF/5A4oe5qtSzTLSU/T4o3hEClbTmU
 aArg==
X-Gm-Message-State: ACgBeo1qPBhfIPyBzzyjvJtaEN0vXMPYM74qY09r2E3KRW+Zc2WnxUtB
 X0LZRWLvDunpi7WfxXx4IlqbK20LFxaLBdsQ
X-Google-Smtp-Source: AA6agR4D1Vg1HZbevEreIq+NIzxuX2B6XTeGaKKuJWdtASc+PMVgR2KQQobo8rLMzemQXpEaOGWTTw==
X-Received: by 2002:a05:6000:144e:b0:225:36c6:50a5 with SMTP id
 v14-20020a056000144e00b0022536c650a5mr25402228wrx.543.1662459475744; 
 Tue, 06 Sep 2022 03:17:55 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a05600c365000b003a62bc1735asm14094361wmq.9.2022.09.06.03.17.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:17:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH v1 07/26] target/s390x: Remove pc argument to pc_to_link_into
Date: Tue,  6 Sep 2022 11:17:28 +0100
Message-Id: <20220906101747.344559-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906101747.344559-1-richard.henderson@linaro.org>
References: <20220906101747.344559-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x431.google.com
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

All callers pass s->pc_tmp.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 47a9d87416..7c98a72ddd 100644
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


