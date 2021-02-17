Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1585231E13B
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 22:21:12 +0100 (CET)
Received: from localhost ([::1]:54832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCUFz-0003V3-0e
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 16:21:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTMg-0001XI-T8
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:24:02 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:45786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTMe-0007gI-Vk
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:24:02 -0500
Received: by mail-pl1-x633.google.com with SMTP id b8so8024429plh.12
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RltB6tJRO1PShAvoUlO75Uo0j450X071u7i11eDg0EU=;
 b=egDEQVH22XeWcASaUKtkT2pqW7DdxRmHwuSNyEUoIoDkhophevEfcnliImxD/DbPS0
 Uw5mAjbcnOYuQpNSf+w54ZP2g/GJLvtvjUVBAp158+ufQzyNa9K0iU27fnxHgulWDtGK
 0SMshyEC82hvuUcOtG9kCPz56xD9Uf9soZS+pbJWDoFhT/L90K9GEPMhjiUvdNM07fz6
 G5XJTA33c5aZyCT840pDIhhKOpVrjHd/5nGWQfyk3M/1wLLoIZqq0c2kCRwp9rI+AfP1
 TsvNWj7su/b77xmw07f4pBs1wpcpwTJbwETyc8vGZBP6lwUDPav1e62nMtLX6cxVb+wo
 TnhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RltB6tJRO1PShAvoUlO75Uo0j450X071u7i11eDg0EU=;
 b=gxWnU52JQGlkqfUsT6ZKMsjPI0b0e35MvlSdSTyTOlC8kcwo+m1EAyw05uIZ4Ic0ne
 /EJ5wCQ5OLiREcwCkpI3c2o9VyFIv198otIvPtnul6H1lnNetV8PgxqZtLJS7+RnBHlC
 WDDjAN5rXF4MYXuBRHce0rgNfwT2yUCaAWOeG3PkqlDDfSHS9OOOLsoCrS5zEK6IisDp
 C2xwGTeuBQGyXjSNfb1xx+cesYv+rlbyfifgxHLZ9TGepfKWC6tgRj73APVfrZGDs2eK
 xqkb0SxeFlPI8Q19a8VNyzGewnrl6laryEp06VHoXDTvE0ZCYJtpKc0pCSizq/zIskT9
 8rNA==
X-Gm-Message-State: AOAM5311x+bEUcE38pH23tB+dyiU66sNOiQJK+i0gCUTVqsFd82WFua2
 rfsDWoUMt+KKTN5oLogZ75Azs+2vxpZr0A==
X-Google-Smtp-Source: ABdhPJy8s4RV2Smz0M9V482V9KaE/l/KI6ey6rkUAdYUVx/g7OFd5eB+4PWFuTkAFH1SqCYcAthHvw==
X-Received: by 2002:a17:902:d3c1:b029:e3:91ab:8211 with SMTP id
 w1-20020a170902d3c1b02900e391ab8211mr670455plb.10.1613593439702; 
 Wed, 17 Feb 2021 12:23:59 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id v126sm3232038pfv.163.2021.02.17.12.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:23:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 52/71] tcg/tci: Split out tcg_out_op_rrrr
Date: Wed, 17 Feb 2021 12:20:17 -0800
Message-Id: <20210217202036.1724901-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index f7595fbd65..c2bbd85130 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -385,6 +385,20 @@ static void tcg_out_op_rrrbb(TCGContext *s, TCGOpcode op, TCGReg r0,
 }
 
 #if TCG_TARGET_REG_BITS == 32
+static void tcg_out_op_rrrr(TCGContext *s, TCGOpcode op,
+                            TCGReg r0, TCGReg r1, TCGReg r2, TCGReg r3)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out_r(s, r1);
+    tcg_out_r(s, r2);
+    tcg_out_r(s, r3);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 static void tcg_out_op_rrrrrc(TCGContext *s, TCGOpcode op,
                               TCGReg r0, TCGReg r1, TCGReg r2,
                               TCGReg r3, TCGReg r4, TCGCond c5)
@@ -632,12 +646,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         old_code_ptr[1] = s->code_ptr - old_code_ptr;
         break;
     case INDEX_op_mulu2_i32:
-        tcg_out_op_t(s, opc);
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        tcg_out_r(s, args[2]);
-        tcg_out_r(s, args[3]);
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_rrrr(s, opc, args[0], args[1], args[2], args[3]);
         break;
 #endif
 
-- 
2.25.1


