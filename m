Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 322FF5367B8
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:54:05 +0200 (CEST)
Received: from localhost ([::1]:38312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nug28-0000W3-9B
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefM-0001Yu-DT
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:28 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:34502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefK-0005Hh-ML
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:28 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 nn3-20020a17090b38c300b001e0e091cf03so3370305pjb.1
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YmQfRyXiJ7G8Uhk1ju3ws5zMd0eaGDWO+P6zNeKsjhU=;
 b=MV/fGOeHMwsJmBQJ4OlIzUeHK0zgMy7qvtAuHKOYyKgAWxem94WrV9PO5CM6wMmRVJ
 ZgaFmQQZN8urhPLC4H2Hm1JrcmFFZUZqc8pCvcLiD09Ix+U5uo9nOUvJb02fyZvkF5mJ
 OaLDnjB3exmVH7luA0SZGlyGEU7U95aG9SU0Ip0NBP+kqRt+e2dtaQN7kqfHnxarFKf8
 0IdZWHbp8xiYlC8j59LNOIh3Fu/m/B84OmRchDeXVLZSXZRdG+kzxPsqqX0mD9DbSojl
 J/n0fiVBfLbaRJ1K+NVfjoZGhBVwBpmWuUg8OKkLnoenO48Phzs9SqUJkcZ3i6wrXOVI
 gLfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YmQfRyXiJ7G8Uhk1ju3ws5zMd0eaGDWO+P6zNeKsjhU=;
 b=JxV0yhfdwrWvJHX117H9KKbRsdl3Uc2DoIWDVsTqv8+RAU8ZKCWQtrhiuoPFF5mgR1
 GKBHJ6fl8imhC+drbUWcSzjeuxf46korOh0bRMF+iHUmJEczqGWWlRG+n2WG8z2bLq2T
 6b/ZqJkZ9SeqaA9yJ5+nYv0dCASxpjl7IR6jINsZX401kNjbZL/0pOUi2r+iZRJUdd1o
 f9imTLyf1r4UQhuJQHVe/vO1+Cawr0ScA84Bkl7WxEd9FDzAaR5gq5j6mn9fgk42nLlW
 OXYFkrx6Qj8w7Gtvjk+Qj0PR1UF6o9SI3FQ5xQInLu7xQ/+5T2T4fieJZRp7Senj2xcQ
 0+BQ==
X-Gm-Message-State: AOAM533BN28Em7Dit+2/aOkyQ33JaXLXUDW2jcqJSZwbv+WL24rGpOxr
 jL7LNfvvz7m6lXSaXc/8U3D8T13Vd13Jgg==
X-Google-Smtp-Source: ABdhPJxfpZ/gFKYJkGu316gxIIRPrEw22/EdYSwBHwgLor5zJ8iy1HzBavGU+shAa4fNaDS9FXiVSw==
X-Received: by 2002:a17:903:28c:b0:161:6b8a:dcd4 with SMTP id
 j12-20020a170903028c00b001616b8adcd4mr43851972plr.120.1653675983726; 
 Fri, 27 May 2022 11:26:23 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 081/114] target/arm: Use TRANS_FEAT for SEL_zpzz
Date: Fri, 27 May 2022 11:18:34 -0700
Message-Id: <20220527181907.189259-82-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index b6b5980e2d..a040d694ea 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -795,10 +795,7 @@ static gen_helper_gvec_4 * const udiv_fns[4] = {
 };
 TRANS_FEAT(UDIV_zpzz, aa64_sve, gen_gvec_ool_arg_zpzz, udiv_fns[a->esz], a, 0)
 
-static bool trans_SEL_zpzz(DisasContext *s, arg_rprr_esz *a)
-{
-    return do_sel_z(s, a->rd, a->rn, a->rm, a->pg, a->esz);
-}
+TRANS_FEAT(SEL_zpzz, aa64_sve, do_sel_z, a->rd, a->rn, a->rm, a->pg, a->esz)
 
 /*
  *** SVE Integer Arithmetic - Unary Predicated Group
-- 
2.34.1


