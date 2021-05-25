Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B58390CD0
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 01:12:23 +0200 (CEST)
Received: from localhost ([::1]:59810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llgDm-000814-1U
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 19:12:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llg0b-0003BE-Vs
 for qemu-devel@nongnu.org; Tue, 25 May 2021 18:58:46 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:53054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llg0M-0004qs-Lz
 for qemu-devel@nongnu.org; Tue, 25 May 2021 18:58:45 -0400
Received: by mail-pj1-x1030.google.com with SMTP id q6so17725914pjj.2
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 15:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zs9Prz7ExZU1dWkJoVWg1ReLLRdWEnLSyOhH0GKyXmc=;
 b=KI0+RGE4oQXODgj+e0qG21N1cb+djD6h12rXj6oIJOkKxaAGQSXRFcNt0hod4MIaVA
 wvrWVlU1q5UmVduGASahS0ZlaT7d45je6lJ3DSjkBPXMr6a1h9hebh9yUioYN3u6BHkJ
 4+qpzPXtQtbqoocUceOQIIbte3BGRK2TIdf0RQpaFjg8/znN+VskVxhNBvXwnHFlLR5m
 D94cn3mBH6BpplOlQtHrEKAxeVGcPIADTzBI3lkiX5Lj2A8+gCRHGhPyK8wiCD8WHCwc
 fO5cV0PMtFk+EATAGU+vaMxyglJTL1X8KHDmsyumXMO9573s8MIlmwdQIBb22ULRzA59
 LK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zs9Prz7ExZU1dWkJoVWg1ReLLRdWEnLSyOhH0GKyXmc=;
 b=nC1f/UlY//H6eYIxpUREDV0qhji2Y9HXDIkS9z9EWPaIqq0g+DU2O/+yTmchhzdRUI
 X57z9A3Kv1vI5OiZ1MI9dokxSk36oqn+FQfheQI77Pr+g5mY5k7WZImm+3frex87NtUr
 QNTIhSiJ3eHCq4oBABPKrCtbxAkf8k7oyrEEYPYkpi41oGF5n/ju6K/bPyZmxInaZY6D
 YZnhGp1j/I8Zg3xDj+tO8w31bLjnMWLlO+anxD/AtsZT7CxWfAbuDPehan64a0jd2X7M
 l+P3YLodbtHuMVIazSyZhoV8B7oD+wyAutJRDBcPhKN503G1fNB4Ln1ysEcQ8oOuBdif
 xy/g==
X-Gm-Message-State: AOAM531FglGz+kwR0awf0Ii7RJQYsel0f7W7uODScUrYttp7EOqIGrpK
 oDYLEJwHNzAyiRz9+krWK/8V5APCtZDl6w==
X-Google-Smtp-Source: ABdhPJyMz+pL4xp0z6NouBWG79eqXlI6clvAGlWv2o9Ku4Cdu5RBWxXmfUIg3KZyHrW0DM4AEohkqw==
X-Received: by 2002:a17:902:6bc7:b029:ee:f84f:1093 with SMTP id
 m7-20020a1709026bc7b02900eef84f1093mr32272753plt.37.1621983505533; 
 Tue, 25 May 2021 15:58:25 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id l6sm1669928pjf.28.2021.05.25.15.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 15:58:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/12] linux-user/aarch64: Enable hwcap bits for bfloat16
Date: Tue, 25 May 2021 15:58:16 -0700
Message-Id: <20210525225817.400336-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525225817.400336-1-richard.henderson@linaro.org>
References: <20210525225817.400336-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 1ab97e38e0..17ab06f612 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -659,7 +659,9 @@ static uint32_t get_elf_hwcap2(void)
     GET_FEATURE_ID(aa64_sve_i8mm, ARM_HWCAP2_A64_SVEI8MM);
     GET_FEATURE_ID(aa64_sve_f32mm, ARM_HWCAP2_A64_SVEF32MM);
     GET_FEATURE_ID(aa64_sve_f64mm, ARM_HWCAP2_A64_SVEF64MM);
+    GET_FEATURE_ID(aa64_sve_bf16, ARM_HWCAP2_A64_SVEBF16);
     GET_FEATURE_ID(aa64_i8mm, ARM_HWCAP2_A64_I8MM);
+    GET_FEATURE_ID(aa64_bf16, ARM_HWCAP2_A64_BF16);
     GET_FEATURE_ID(aa64_rndr, ARM_HWCAP2_A64_RNG);
     GET_FEATURE_ID(aa64_bti, ARM_HWCAP2_A64_BTI);
     GET_FEATURE_ID(aa64_mte, ARM_HWCAP2_A64_MTE);
-- 
2.25.1


