Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC87B430CCE
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 00:58:49 +0200 (CEST)
Received: from localhost ([::1]:38346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcF7A-0003lF-Up
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 18:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcF2H-0004fI-7i
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 18:53:45 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcF2F-0000V4-Ob
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 18:53:44 -0400
Received: by mail-wr1-x433.google.com with SMTP id v17so37762179wrv.9
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 15:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VkAqLI31u+CpladBFCKFa8JbOaSADiFIq/q3d5+qh7s=;
 b=hve08zlhs31YAjBCzR3Cvsleh7PeaGkfVzYLFAtZfQSZDd/v57xpxFCP1j6sROamUU
 e5RBkAFCrFR9CfBSYiRrgvv9QU2W+DTlEHWEHKtTcAY++cEhaz8/SDi4pjOAPOaWVkXK
 vzk1c5zVwuq1vlELiEo3GBGHTNUi4hWKs6jpV2jeq4WGZTtPs4GYELt/iK/biXVqSz/4
 uUPVQolhmf3gdYTiRPS5y6gW1/wXhVGfllP78ai1e+eynVvm/CzM8Z/SbCoauy+zex+p
 zmC36QDsJg27ygX+cHIjroLPZytR/PeVvfHtxAT47pZCAHvdoBy8IDxW73dbKqTqSrMw
 db1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VkAqLI31u+CpladBFCKFa8JbOaSADiFIq/q3d5+qh7s=;
 b=EDjZGqbAy7qcz+CZMN+vYmbdqLloCzrNcz1ZtZW/X7RZr418lkz8uEwKFnG+TgAIxw
 VIWccSzKVcSSUGJi3Pw+ifYN6VbkIFifcc54QZ8vkOmXCJpkMKizaxYm3t1PeDMyn2dK
 8PAi3fI9Fpwv7mV3gtiJWxrXNdl7ad6dDwwnFXxzcLcOVW0Ctsi6FcIEflzJ3DQuVaTX
 UnvDWyQbzu9BUF+PvWS4aBWhSx4i0CmPnlJJTGMfsEG65rZtLbJSpgBBrXEJGTNDQxaE
 rFbZtTRewHglfiHi80Sz0UwS2q10krXxelZ+atRRmVXvZPNtNA9m8Wd68ol1hr3S+5YV
 kH9w==
X-Gm-Message-State: AOAM5314PVuXRJOg/gaXkmlZkDAzFUGqWUNGu1htKoFIMwaCXPMhq8/J
 Q4qdTgLhh8ipHeagnvNh3ty7iivuhgs=
X-Google-Smtp-Source: ABdhPJxniw/9/5vLHSrcTDXfkzuB/lQvEtS7tdMeRhbKlhONEj/MA58JMEW9J32/z5hj6wyRLMi8kQ==
X-Received: by 2002:a05:6000:188e:: with SMTP id
 a14mr30174981wri.223.1634511222277; 
 Sun, 17 Oct 2021 15:53:42 -0700 (PDT)
Received: from x1w.. (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id u2sm10576007wrr.35.2021.10.17.15.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 15:53:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/17] target/mips: Use tcg_constant_tl() in
 gen_compute_compact_branch()
Date: Mon, 18 Oct 2021 00:52:39 +0200
Message-Id: <20211017225245.2618892-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211017225245.2618892-1-f4bug@amsat.org>
References: <20211017225245.2618892-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paul Burton <paulburton@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The offset is constant and read-only: move it to the constant pool.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211003175743.3738710-9-f4bug@amsat.org>
---
 target/mips/tcg/translate.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 0e59b97190f..5fdeb67e82b 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -11857,13 +11857,11 @@ static void gen_compute_compact_branch(DisasContext *ctx, uint32_t opc,
         } else {
             /* OPC_JIC, OPC_JIALC */
             TCGv tbase = tcg_temp_new();
-            TCGv toffset = tcg_temp_new();
+            TCGv toffset = tcg_constant_tl(offset);
 
             gen_load_gpr(tbase, rt);
-            tcg_gen_movi_tl(toffset, offset);
             gen_op_addr_add(ctx, btarget, tbase, toffset);
             tcg_temp_free(tbase);
-            tcg_temp_free(toffset);
         }
         break;
     default:
-- 
2.31.1


