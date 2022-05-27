Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAA75367D4
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 22:04:24 +0200 (CEST)
Received: from localhost ([::1]:34802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nugC7-00020i-Kx
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 16:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecS-0003iv-Vp
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:29 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:45964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecK-0004Tw-N4
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:28 -0400
Received: by mail-pg1-x532.google.com with SMTP id l184so1965225pge.12
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JvrU4z0qiF+X3gMipUoQGDdO+V7kYOeb33r3CyRr2Uk=;
 b=U06EBk92PJev2AFR1CF5TXFCk9MJPvEzEslmtZ+BcKs8G9JM0HOoDSzlRvuHFfHlcb
 /HAe6HLbgZClkMzkMN1pFz9UhHTdawnAuro23Oo70oOfPEtVE81rIm2c3djJZE/o9Z3f
 2zjLI83NiH1Kd6Xzhl0egQ4yUQD57yFVYExYp0fP147Cnjv6cMHLNJZ0IK8ZTQ92yEj+
 pKNsP4R8rcl1GCrM+953wx6hb0uDW+ATiUxVVsK03rwza7sc2mSAL7jeTATMe8jOKvgM
 rV6/koeRiC1SaTx71MVPtT8Yc1cBSDqw+52TY1ofW6bCQ8oa4U9ISiCK3hjqcxbTq5Zd
 uvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JvrU4z0qiF+X3gMipUoQGDdO+V7kYOeb33r3CyRr2Uk=;
 b=gFZQL6r/IaoYhhJA7/4KoP7AiaTcoKnfWV5OUJ4kMfU+3sKyd1jh8Cry3GIrgUlKZY
 LwfcBRkcfQ6qTmkGTncmRyKm+cwKBMk3YCJAfSVbitevP2uJOnK8bPTSTEtU52Mx6We6
 ujLBophGcPoyN4QQAd2I9u4GHAc5U4WmjggygYlGHJVCyOnyzpioPT2vKvhDfawFU3iu
 z9aF24t7EWDXVqCeCCtYUI3hUccDmQsQYNm6uVzwE9Gxu7OjXG8Elrcyad5dryoAM6yt
 Dzi6xHFT8tIpYKfLUN+qLnZi9jmAWTK5QdEELvbidcqlBfBqal79YKR2lRv5W8ZgjyJq
 6XSA==
X-Gm-Message-State: AOAM532H0Xh1Uh+reEgIL9kvBgBzVg1yl8ugGeElodrpJs9IAekes0aU
 Qpe/yj5GJzm0mywdLq7kfL+Ib6DqhNzf3g==
X-Google-Smtp-Source: ABdhPJx2CRo96mF28BZr9p/cZCwxdr1Acz/cUJ+0SlcZJ4BJgv+uyuWQRD37PdNwQgQEwt0IkdGGsw==
X-Received: by 2002:a63:ea4b:0:b0:3db:5325:d55a with SMTP id
 l11-20020a63ea4b000000b003db5325d55amr38284598pgk.588.1653675792798; 
 Fri, 27 May 2022 11:23:12 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:23:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 070/114] target/arm: Use TRANS_FEAT for MUL_zzi
Date: Fri, 27 May 2022 11:18:23 -0700
Message-Id: <20220527181907.189259-71-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
 target/arm/translate-sve.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index d44b24e988..c0781ecf60 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3315,15 +3315,7 @@ static bool trans_SUBR_zzi(DisasContext *s, arg_rri_esz *a)
     return true;
 }
 
-static bool trans_MUL_zzi(DisasContext *s, arg_rri_esz *a)
-{
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        tcg_gen_gvec_muli(a->esz, vec_full_reg_offset(s, a->rd),
-                          vec_full_reg_offset(s, a->rn), a->imm, vsz, vsz);
-    }
-    return true;
-}
+TRANS_FEAT(MUL_zzi, aa64_sve, gen_gvec_fn_arg_zzi, tcg_gen_gvec_muli, a)
 
 static bool do_zzi_sat(DisasContext *s, arg_rri_esz *a, bool u, bool d)
 {
-- 
2.34.1


