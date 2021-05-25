Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6811A3906C7
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:39:50 +0200 (CEST)
Received: from localhost ([::1]:60766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lla5s-000272-Mq
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYf1-00036N-4S
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:59 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:34731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYet-000779-3T
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:58 -0400
Received: by mail-wr1-x434.google.com with SMTP id r12so32629658wrp.1
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dbyliIthkFbmX+YLVqzUxO4W3eWgC6NaxgIObnKKYDk=;
 b=Jw65jqF/WPAwT9p/hRYjQJBun8Xt/qqKIh0TnzrSqTLntO/Qq511M176MhQXJjOYkR
 bIdT1X0oKYy4pi3MdPwOXWdx/Opmn81uQ/uFhHyYNDF/JQTmKn5jctfKgqpYq/EFvY0s
 ag9U0bT5Lox2FYHow5QrnNVw8amsfLjlDgN7AAFAtsmnvxQotIIjHFI4UTh/AETsz5dP
 noIDckrjCSeBHohqL2cl/t2ux9svr9A2KZr+VUb5jctd+zXDFJw80KTwD++hFreqlAeL
 kD0C/is3Dptf8k1WuGms/13agjbP26nxjnuo7N58oAw+M8k7ZoYuTB51nTUmqtPIscGX
 /bzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dbyliIthkFbmX+YLVqzUxO4W3eWgC6NaxgIObnKKYDk=;
 b=PnZ5GfRUJuD4pQTjUGgk+cw96X3S3xEgQK9uKxsvYZDCZDTGEQY4Y0mrp9biRQ8cpL
 kjLKhykQS4g/dJ6loOZq6Nf+HdHX49H5CWn2FK9WrJzpmBKqjRuaFbxwM9enQ1D1iNyL
 L9pGJwnh4+902taRKb/4e4hZBjbr2sOgoSeEVa6JeC+FP9B016vP27cTBLXyiax5pCOY
 2RJdaOjYzALzkOO+kHa5ZG7UBAEn9WB8XWIvE9y58lgRazIjWajj6sa+2u+bJfzZVd6M
 sw42fH/lXyopLM51esa2OcfG5OSFsRMTxJ/6egTgHmMtlB9w4rj4zVVQEDsH+1jnGVyY
 OrXg==
X-Gm-Message-State: AOAM531gNdjsIHGcgA+Ht9XQapi1iP2Qa0lyOMz1JKzZSotX7U8RNwCD
 2MbaHFZdM0+wjHLAAF688wgfUpAGfhvkbo0+
X-Google-Smtp-Source: ABdhPJydx9eMt52/lKOKLuvx+pWC4Ba3M21RzX8ellVRRIow5ZSSWMMUpMXJsdykYeYG/5z2NTbWDw==
X-Received: by 2002:adf:e411:: with SMTP id g17mr27432954wrm.402.1621955269691; 
 Tue, 25 May 2021 08:07:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a11sm16643357wrr.48.2021.05.25.08.07.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:07:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 107/114] target/arm: Remove unused fpst from VDOT_scalar
Date: Tue, 25 May 2021 16:07:29 +0100
Message-Id: <20210525150736.32695-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150736.32695-1-peter.maydell@linaro.org>
References: <20210525150736.32695-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Cut and paste error from another pattern.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525010358.152808-86-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-neon.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index 1a8fc7fb390..14a9d0d4d30 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -325,7 +325,6 @@ static bool trans_VDOT_scalar(DisasContext *s, arg_VDOT_scalar *a)
 {
     gen_helper_gvec_4 *fn_gvec;
     int opr_sz;
-    TCGv_ptr fpst;
 
     if (!dc_isar_feature(aa32_dp, s)) {
         return false;
@@ -347,13 +346,11 @@ static bool trans_VDOT_scalar(DisasContext *s, arg_VDOT_scalar *a)
 
     fn_gvec = a->u ? gen_helper_gvec_udot_idx_b : gen_helper_gvec_sdot_idx_b;
     opr_sz = (1 + a->q) * 8;
-    fpst = fpstatus_ptr(FPST_STD);
     tcg_gen_gvec_4_ool(vfp_reg_offset(1, a->vd),
                        vfp_reg_offset(1, a->vn),
                        vfp_reg_offset(1, a->rm),
                        vfp_reg_offset(1, a->vd),
                        opr_sz, opr_sz, a->index, fn_gvec);
-    tcg_temp_free_ptr(fpst);
     return true;
 }
 
-- 
2.20.1


