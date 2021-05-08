Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B42A376E65
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:10:16 +0200 (CEST)
Received: from localhost ([::1]:42098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCQ3-0007oz-CT
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:10:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4x-0004Ch-6T
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:28 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:38543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4j-0003a9-FN
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:24 -0400
Received: by mail-pg1-x529.google.com with SMTP id i14so8638823pgk.5
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MiCAsnwsyr5jz7kk+vBhCEvkm3DwoUGr8DX9RFGFP2o=;
 b=uVG5rDFZT9+qZpClEs74s87kBgMFSSZfl/I4V0itU+4bsTWqr6Y6Emgna2h9Wf/Zf4
 uTyxhSiQY5P0zjS8kaedSIwSaMXC1N/hba7C44Q1GqFMHOYsHf+tvKC/GrBnmeCBMPIL
 94AOVFW6P8stGtFOUaKwwSmqtG89kC4e5JGz6+dtW1fT6jp6d//Ob3s/tsO5nDRqsN1b
 g0wNFb7ElbikAkqxCTrjwMM9NmES+OM27LWsFFj3VHzH9MVKK/GjKeYGkLmSHjqkRx5p
 oWnzLVYY+sMcuoSSQPUCvAF+MuOBymKm6D9eOd2/Qm3h6AhrbkidE17KnG42B2TMXRwj
 xE7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MiCAsnwsyr5jz7kk+vBhCEvkm3DwoUGr8DX9RFGFP2o=;
 b=oHsDHD4SbrDPc8JMf61MZoFfL0Nyp+Z6PVZH3SgaoVPip7/47kTfA4f7ggyd8ZDolE
 Nz9f5/92WHR2VL5VGZLdLxplxbwxqCNG12VQtJ2ZasD9zXTv7TUzXI1si64GRscN1CU6
 QMzoxWDwmCOtXg0/UGyEGdk3BO/pakQbZ360QVTXUBITxgqe+0CuXUVwCB7Dnv2690LO
 0/PByqoODEDhrpGZxQqzCQbYPOj/aD/p7wD43wTcvuRiX9IQ9e0Xb7UItzPTURWisSjJ
 4kRPr42B9zFF1kK7aF7FJh4jvsc40KDFJv49flEVdlwJI1KgAzHXgXjH/I0C8zLeIrLl
 Zq8g==
X-Gm-Message-State: AOAM530HTz7OYsAa4CT+4ggyzkpgQ/DF/eetmAvP0YeoT8ujrqXtbHoN
 coqQSS+/C1epnOU9KJcECWqRohADkHbJ2g==
X-Google-Smtp-Source: ABdhPJwNbEjHPmYyqqfXf1i7xm3Lp0cr+GzZFUVvjOyoVJnc9HTmuFrbVd17QYl0n38igeEbkJnOCw==
X-Received: by 2002:a63:d710:: with SMTP id d16mr13190101pgg.214.1620438492139; 
 Fri, 07 May 2021 18:48:12 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t4sm5819681pfq.165.2021.05.07.18.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:48:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/72] target/mips: Set set_default_nan_mode with
 set_snan_bit_is_one
Date: Fri,  7 May 2021 18:47:03 -0700
Message-Id: <20210508014802.892561-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: alex.bennee@linaro.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This behavior is currently hard-coded in parts_silence_nan,
but setting this bit properly will allow this to be cleaned up.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/fpu_helper.h | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/target/mips/fpu_helper.h b/target/mips/fpu_helper.h
index 1c2d6d35a7..ad1116e8c1 100644
--- a/target/mips/fpu_helper.h
+++ b/target/mips/fpu_helper.h
@@ -27,8 +27,14 @@ static inline void restore_flush_mode(CPUMIPSState *env)
 
 static inline void restore_snan_bit_mode(CPUMIPSState *env)
 {
-    set_snan_bit_is_one((env->active_fpu.fcr31 & (1 << FCR31_NAN2008)) == 0,
-                        &env->active_fpu.fp_status);
+    bool nan2008 = env->active_fpu.fcr31 & (1 << FCR31_NAN2008);
+
+    /*
+     * With nan2008, SNaNs are silenced in the usual way.
+     * Before that, SNaNs are not silenced; default nans are produced.
+     */
+    set_snan_bit_is_one(!nan2008, &env->active_fpu.fp_status);
+    set_default_nan_mode(!nan2008, &env->active_fpu.fp_status);
 }
 
 static inline void restore_fp_status(CPUMIPSState *env)
-- 
2.25.1


