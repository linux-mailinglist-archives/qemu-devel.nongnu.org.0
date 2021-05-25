Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2ECB38F832
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 04:29:58 +0200 (CEST)
Received: from localhost ([::1]:59346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llMpS-0001R5-1Z
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 22:29:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLbB-0006YH-NZ
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:11:09 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:34591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLaz-0005t0-At
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:11:09 -0400
Received: by mail-pg1-x536.google.com with SMTP id l70so21423522pga.1
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XfuBVEtxztdNyxE+FEFKor3ofjnQkROtvEMf4bpqF2k=;
 b=CepxoKyW+bc5yvYR605Ifa14nsZh0kF7JUKziiPrUzh2mNI3ZOzDXLx6UVXu46SU5j
 ZfQwLO0ntxd9QIprRG0V1KZThCpOOJySDnUHnjd9gOji/6d1ew3aJkaJKhJjEV6X9ATl
 B4Z5HKuVYigGfUNafIuCfwzanTYS07RD2tGIRZ9bvH7JVzz3aeSj7gjKP9q8P5rsD0CN
 3LXCLsVfRcVU5PrO4EUiiQFtcaodRQPfA34JjMLHYdX0E8HrO6/2FzEXW6ElzH820Emn
 PgXNzMZvuWJF40eUPrN/TA/V/yQKMjz6XFUdmSZbDgGgxkWwz3WVzobAKyMhYWlQuebM
 au+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XfuBVEtxztdNyxE+FEFKor3ofjnQkROtvEMf4bpqF2k=;
 b=t+f82crm5UY35Bptex4MG8HGQZo4Px3uwBcL79FftUGX6dgV1ljWGMpkwYmek8aPOc
 zKh2Os1iDl/CltWBXOvryuBfsNmjppG7GqHTJfmUds3L3c/WjhQ5m89pIEatSWpBzs+f
 zewRoisHMHRaoBTi+Zd7GSKEqSMQcDEHmG3KM+6i/j1h91DrkT0SAbTnJygSXy3HEC5f
 yjsNbkFLT293C4f4b5fHLCKPvgnPHCogVA8XnLSCTM52msT5vbVq1tA3/AxFtcZcc2h1
 3Cg14wCIQ6KJcGlrAu9v6RP7lniJvyYs0EEnRMn8+k8qppiTcsQrDoWMDxAtQJS8oB3g
 jUuA==
X-Gm-Message-State: AOAM533yIgYeeOhMBL9jFRXiaSltJZcHnzOYlfUrsGzu2AbqG6zS2Pbz
 itSBTIq1RtEpdRBO56/NwmX2TF21J7dy5g==
X-Google-Smtp-Source: ABdhPJzY6RMAZGcSZ4upQxFq5weWusDRg+s9HaiXmNtTWjiBQox+7/oJQAeswFVnj03a89SGt8+Omg==
X-Received: by 2002:a65:67d5:: with SMTP id b21mr16149681pgs.117.1621905053154; 
 Mon, 24 May 2021 18:10:53 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id i8sm10614839pjs.54.2021.05.24.18.10.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:10:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 86/92] target/arm: Fix decode for VDOT (indexed)
Date: Mon, 24 May 2021 18:03:52 -0700
Message-Id: <20210525010358.152808-87-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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

We were extracting the M register twice, once incorrectly
as M:vm and once correctly as rm.  Remove the incorrect
name and remove the incorrect decode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/neon-shared.decode | 4 ++--
 target/arm/translate-neon.c   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/neon-shared.decode b/target/arm/neon-shared.decode
index ca0c699072..facb621450 100644
--- a/target/arm/neon-shared.decode
+++ b/target/arm/neon-shared.decode
@@ -61,8 +61,8 @@ VCMLA_scalar   1111 1110 0 . rot:2 .... .... 1000 . q:1 index:1 0 vm:4 \
 VCMLA_scalar   1111 1110 1 . rot:2 .... .... 1000 . q:1 . 0 .... \
                vm=%vm_dp vn=%vn_dp vd=%vd_dp size=2 index=0
 
-VDOT_scalar    1111 1110 0 . 10 .... .... 1101 . q:1 index:1 u:1 rm:4 \
-               vm=%vm_dp vn=%vn_dp vd=%vd_dp
+VDOT_scalar    1111 1110 0 . 10 .... .... 1101 . q:1 index:1 u:1 vm:4 \
+               vn=%vn_dp vd=%vd_dp
 
 %vfml_scalar_q0_rm 0:3 5:1
 %vfml_scalar_q1_index 5:1 3:1
diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index 14a9d0d4d3..9f7a88aab1 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -348,7 +348,7 @@ static bool trans_VDOT_scalar(DisasContext *s, arg_VDOT_scalar *a)
     opr_sz = (1 + a->q) * 8;
     tcg_gen_gvec_4_ool(vfp_reg_offset(1, a->vd),
                        vfp_reg_offset(1, a->vn),
-                       vfp_reg_offset(1, a->rm),
+                       vfp_reg_offset(1, a->vm),
                        vfp_reg_offset(1, a->vd),
                        opr_sz, opr_sz, a->index, fn_gvec);
     return true;
-- 
2.25.1


