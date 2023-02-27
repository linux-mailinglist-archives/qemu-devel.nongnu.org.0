Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9496A3CF2
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 09:28:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWI5-0002xW-Bo; Mon, 27 Feb 2023 00:43:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWI1-0002qj-Im
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:43:10 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWHx-0004rO-51
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:43:09 -0500
Received: by mail-pl1-x62e.google.com with SMTP id bh1so5529596plb.11
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0+GeilfFKKsm5WnLXBFyBAbE/3JXPiOJcMvh7tD7SqM=;
 b=JlLJq81aoJ9CD+Zkbg5co07+b8fAknE/f6ncCgivhmkFSxUjQnUvtOwD9lqcz8IuOl
 UjBHcAoYAyQYWXStHCAmdq32rZAsclOWVSRkgghz5N/u18Vf6UlXEyBD2sYq2DV62YvF
 5JKHbo/VDUfWkWCfsCqJt2iygTUBhA6Ru9bWu7OmknGxAuT+J5K7lM19QJ9v4u+op4wT
 kC6XV9EAzvinaTE0y9tuEoBvSYMiZiUuH1enZtfS4fwhZ1isAtcgl912HcArXhXNzTO/
 0CtJA1UR2RhtpolyJzxKq6DFB7gPkXIGjZQ2QwB0g3NAYZJLAAo9/iDqqJipnpSHKEDo
 mnIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0+GeilfFKKsm5WnLXBFyBAbE/3JXPiOJcMvh7tD7SqM=;
 b=KhvAOAT4AiGKASZpWYGiejGDdoAr0FmEh8V86ADhb3JLutGr3Yiuahk/br+HeFFuMq
 0Jz/Pz+8t7ErhUdDiqxmDt3EnAHML9iCLiDIqdDr/Yr/OtXCaUblvlCILAD2BOQZTeGh
 ixWRDMAoLTzmtOfP226SmPUC68kAo2IRxwMZIDcN2ZLo1+0eh7whWMdLT0mp7ZG27Vy9
 +Sq9MYSlf7ndQmKK+dhIJXHnN2WG/4r2Ns51IvBMdQyd4OaJL2i3rgFGZ1XH8pQllfkP
 YLqgHvo6pv+MtmcHA1ZLQ5VIfTFuGNuspKUWW/fBsD/RJUwVQ3b6BJTQq7I6IfJRnVXk
 hcfQ==
X-Gm-Message-State: AO0yUKXJARrUtn2Fj5gfOOa1NMktQnwuvrifMg00ePpbm1GEaXrB/w+r
 Yplox6PcRgr73ElPJmkkuD0Lw9CJz5QdbziYTUU=
X-Google-Smtp-Source: AK7set96lmgC7XS3WpfSNGgV5dC90ItFcU87xN96QruyvTDoc8HuWDc5NOH75q3cs9TrliBzbY6b9w==
X-Received: by 2002:a05:6a20:1443:b0:c3:cc65:165c with SMTP id
 a3-20020a056a20144300b000c3cc65165cmr18810060pzi.61.1677476579990; 
 Sun, 26 Feb 2023 21:42:59 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:42:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 06/70] target/arm: Improve trans_BFCI
Date: Sun, 26 Feb 2023 19:41:29 -1000
Message-Id: <20230227054233.390271-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

Reorg temporary usage so that we can use tcg_constant_i32.
tcg_gen_deposit_i32 already has a width == 32 special case,
so remove the check here.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 645bcf8d0a..644a3257a2 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7261,8 +7261,8 @@ static bool trans_UBFX(DisasContext *s, arg_UBFX *a)
 
 static bool trans_BFCI(DisasContext *s, arg_BFCI *a)
 {
-    TCGv_i32 tmp;
     int msb = a->msb, lsb = a->lsb;
+    TCGv_i32 t_in, t_rd;
     int width;
 
     if (!ENABLE_ARCH_6T2) {
@@ -7277,16 +7277,13 @@ static bool trans_BFCI(DisasContext *s, arg_BFCI *a)
     width = msb + 1 - lsb;
     if (a->rn == 15) {
         /* BFC */
-        tmp = tcg_const_i32(0);
+        t_in = tcg_constant_i32(0);
     } else {
         /* BFI */
-        tmp = load_reg(s, a->rn);
+        t_in = load_reg(s, a->rn);
     }
-    if (width != 32) {
-        TCGv_i32 tmp2 = load_reg(s, a->rd);
-        tcg_gen_deposit_i32(tmp, tmp2, tmp, lsb, width);
-    }
-    store_reg(s, a->rd, tmp);
+    t_rd = load_reg(s, a->rd);
+    tcg_gen_deposit_i32(t_rd, t_rd, t_in, lsb, width);
     return true;
 }
 
-- 
2.34.1


