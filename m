Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 684624D9416
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 06:44:58 +0100 (CET)
Received: from localhost ([::1]:44466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTzzM-0004Ce-Ti
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 01:44:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTzuJ-0003ET-CP
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 01:39:43 -0400
Received: from [2607:f8b0:4864:20::42e] (port=41983
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTzuG-0007UW-V2
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 01:39:42 -0400
Received: by mail-pf1-x42e.google.com with SMTP id p8so17865330pfh.8
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 22:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q45ukfK0VSrusqnzSk9iQC1kLspbUT1o4LAabBuLza0=;
 b=JAYKxvs6mf6J+e05cSZiATi2EfSmX3hrBuNjQlEoxbHA2bgCnrMMl7PRztVcBVA/ED
 9az1jE9ZmAdSxb+9cIR95dSQoKOijsmALNuGRHK0RBh07j9M1W+Ag6HZCRl/TgBynsG4
 fd1A34An7JPIN5co9PubORLKB5TkWDgyUTaS0QT4OJYq/1pmPDTRcel3tkEc2NPR4pzk
 1mAb8Moe5mA2GBm2ZnH8EhEohztePcBaJMeH87uUYGffJcAtWhzdZIw9mKMM7IbnZ9cy
 kcnSrbCq7/9pnGVH36v/UTMyoGQsX4TV6bBZ08w9fNia063WRYc8gah0Brt5x7PRLxRx
 GSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q45ukfK0VSrusqnzSk9iQC1kLspbUT1o4LAabBuLza0=;
 b=ZTD0FG9DDOI5RSdK6u1ow9Zor5yPnx8Q/XEG0d0lvvhUtiVNzBCiRospo63sb7Jatc
 tB0KZG6ub1tX5ZM4+TAxJ1Dk1qV7DW68iDLj52pStVZTRyKpfkT+bbgOSvzt5MTUtHV3
 qIUjf7NEIEMhGlilcTYKLGcyfbxEVtnZBFLvDxipKq7EC9SSz27A9wbw72n8dA7qKNTT
 l7Oq8fcX3eQQm8JZC9KHb1Bp+JK7BtFD75pEAFOz3D502pGG7jB+2V2PDHtUysZewIkY
 Tz1hkhsLE/WmkKIi5IEAmyZGey324dRnO8cLUhuA84ObiQUYM/uuVlOqyCJAlbpetCNB
 Uclw==
X-Gm-Message-State: AOAM531ACsX/hDCdrCkNt6xQDFQ/aqlZUktWqkh5YQZwaOLe3bhwSzfh
 iHNCOCK53+uHzVD7SlcdXT+K7SKywqYUjg==
X-Google-Smtp-Source: ABdhPJxw0+I8sAAFvLgdcUAn6XH2K+JQ1/mV/SG8A67j27WKvr0WYP2YKhTbT4vWbpFDonFj+tkzVA==
X-Received: by 2002:a05:6a00:1898:b0:4f7:e60d:b171 with SMTP id
 x24-20020a056a00189800b004f7e60db171mr5605397pfh.7.1647322775620; 
 Mon, 14 Mar 2022 22:39:35 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 lb4-20020a17090b4a4400b001b9b20eabc4sm1462173pjb.5.2022.03.14.22.39.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 22:39:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/ppc: Replicate double->int32 result for some vector
 insns
Date: Mon, 14 Mar 2022 22:39:34 -0700
Message-Id: <20220315053934.377519-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: groug@kaod.org, danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Power ISA v3.1 formalizes the previously undefined result in
words 1 and 3 to be a copy of the result in words 0 and 2.

This affects: xscvdpsxws, xscvdpuxws, xvcvdpsxws, xvcvdpuxws.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/852
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/fpu_helper.c | 43 +++++++++++++++++++++++++++++++++++------
 1 file changed, 37 insertions(+), 6 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index bd12db960a..e76d2ae83a 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2891,22 +2891,53 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
 
 VSX_CVT_FP_TO_INT(xscvdpsxds, 1, float64, int64, VsrD(0), VsrD(0), \
                   0x8000000000000000ULL)
-VSX_CVT_FP_TO_INT(xscvdpsxws, 1, float64, int32, VsrD(0), VsrW(1), \
-                  0x80000000U)
 VSX_CVT_FP_TO_INT(xscvdpuxds, 1, float64, uint64, VsrD(0), VsrD(0), 0ULL)
-VSX_CVT_FP_TO_INT(xscvdpuxws, 1, float64, uint32, VsrD(0), VsrW(1), 0U)
 VSX_CVT_FP_TO_INT(xvcvdpsxds, 2, float64, int64, VsrD(i), VsrD(i), \
                   0x8000000000000000ULL)
-VSX_CVT_FP_TO_INT(xvcvdpsxws, 2, float64, int32, VsrD(i), VsrW(2 * i), \
-                  0x80000000U)
 VSX_CVT_FP_TO_INT(xvcvdpuxds, 2, float64, uint64, VsrD(i), VsrD(i), 0ULL)
-VSX_CVT_FP_TO_INT(xvcvdpuxws, 2, float64, uint32, VsrD(i), VsrW(2 * i), 0U)
 VSX_CVT_FP_TO_INT(xvcvspsxds, 2, float32, int64, VsrW(2 * i), VsrD(i), \
                   0x8000000000000000ULL)
 VSX_CVT_FP_TO_INT(xvcvspsxws, 4, float32, int32, VsrW(i), VsrW(i), 0x80000000U)
 VSX_CVT_FP_TO_INT(xvcvspuxds, 2, float32, uint64, VsrW(2 * i), VsrD(i), 0ULL)
 VSX_CVT_FP_TO_INT(xvcvspuxws, 4, float32, uint32, VsrW(i), VsrW(i), 0U)
 
+/*
+ * Likewise, except that the result is duplicated into both subwords.
+ * Power ISA v3.1 has Programming Notes for these insns:
+ *     Previous versions of the architecture allowed the contents of
+ *     word 0 of the result register to be undefined. However, all
+ *     processors that support this instruction write the result into
+ *     words 0 and 1 (and words 2 and 3) of the result register, as
+ *     is required by this version of the architecture.
+ */
+#define VSX_CVT_FP_TO_INT2(op, nels, stp, ttp, rnan)                         \
+void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
+{                                                                            \
+    int all_flags = env->fp_status.float_exception_flags, flags;             \
+    ppc_vsr_t t = { };                                                       \
+    int i;                                                                   \
+                                                                             \
+    for (i = 0; i < nels; i++) {                                             \
+        env->fp_status.float_exception_flags = 0;                            \
+        t.VsrW(2 * i) = stp##_to_##ttp##_round_to_zero(xb->VsrD(i), &env->fp_status);  \
+        flags = env->fp_status.float_exception_flags;                        \
+        if (unlikely(flags & float_flag_invalid)) {                          \
+            t.VsrW(2 * i) = float_invalid_cvt(env, flags, t.VsrW(2 * i), rnan, 0, GETPC()); \
+        }                                                                    \
+        t.VsrW(2 * i + 1) = t.VsrW(2 * i);                                   \
+        all_flags |= flags;                                                  \
+    }                                                                        \
+                                                                             \
+    *xt = t;                                                                 \
+    env->fp_status.float_exception_flags = all_flags;                        \
+    do_float_check_status(env, GETPC());                                     \
+}
+
+VSX_CVT_FP_TO_INT2(xscvdpsxws, 1, float64, int32, 0x80000000U)
+VSX_CVT_FP_TO_INT2(xscvdpuxws, 1, float64, uint32, 0U)
+VSX_CVT_FP_TO_INT2(xvcvdpsxws, 2, float64, int32, 0x80000000U)
+VSX_CVT_FP_TO_INT2(xvcvdpuxws, 2, float64, uint32, 0U)
+
 /*
  * VSX_CVT_FP_TO_INT_VECTOR - VSX floating point to integer conversion
  *   op    - instruction mnemonic
-- 
2.25.1


