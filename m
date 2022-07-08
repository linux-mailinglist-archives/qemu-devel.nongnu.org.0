Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 335A356BD22
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 18:03:18 +0200 (CEST)
Received: from localhost ([::1]:57220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9qRp-0005zS-A4
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 12:03:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pmw-0003XA-O6
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:21:02 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:44623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pmv-0003Gv-Bs
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:21:02 -0400
Received: by mail-pf1-x431.google.com with SMTP id e16so11018081pfm.11
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H9uf8O4CUiqyVcmvjic8DcvLpWT2fCMJa8CUUeRGTi0=;
 b=GB4PC84GnlTLbLfDNQpejeBxBDIV/D4gw5BDGWnulLVKnzZcoEN5D0EVV9gkkitUHY
 6aDhlEy2X15c4lIzekAYmvNvMRP4zCgnL5ZVYUlexDYs/L47roGhfKragbHc0flB4CGh
 pk9rpZpOtYNyI/2gSGHkwIAGTAkHLOD34DQ8XkvIW2YVBTe/Wq5mokrhKWZKHYc3aIbY
 eXwI5avX04ClhSHyrTUchojkMTKgw+H3BjBpiPVvrkbeoGD9wHFJsgHmRNEQUsRU6T/c
 Jwq2WyXIooX4WErFOmukNn1NPDlasQC9TG5snI9TqgFiQLwc/q740uHVgsv2kcTf9uXU
 dsCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H9uf8O4CUiqyVcmvjic8DcvLpWT2fCMJa8CUUeRGTi0=;
 b=a6Haxo55X9EHfmbg1z4MUVD7C0XtQjBzhtuz3+aC/ovYDFrlst4AAlbRxqm40qdhtC
 s1CmGok+qE8hjNJYPn2dV7P4JCAmFCBmL3KIj6rIaQVQqe6FcX5RwR1GOgSOtClqvFl/
 UpbjRzCTaPJH6gz8jnt7wKs89HW/LI31/IwNVSWE7aoBaDCT76g8JIbNhX+q2hDwZj08
 5XMsVjwznjt1rmiUIMm044LWLmY8CvrxaS/owDqVIZmXMMVwQS0XUx6nf0Xab3NWeRmi
 zutvcYWw0P6BBnvyxxUrqFqx0wDr5+Bgv35c/7PnERF2fq9HA56Ul/Eqo+Sorgkwd5FE
 KzQQ==
X-Gm-Message-State: AJIora8786Hj8b1e5lJQUqL2pwzvL/u+7so0ttVvRYb1x/dSUVYcqFuj
 c5R+PiTYCX7cRIa/3nUR/NpiRSuPFEwgc9c4
X-Google-Smtp-Source: AGRyM1tDqNKpHD2wB2AgL64yFLWAruwwSOlVRxll7Q1mIg8ewIpsUrHtlKVswZK/V7sINEfEpGqieg==
X-Received: by 2002:a05:6a00:218c:b0:525:5236:74c with SMTP id
 h12-20020a056a00218c00b005255236074cmr4396978pfi.44.1657293659628; 
 Fri, 08 Jul 2022 08:20:59 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 cp2-20020a170902e78200b0015e8d4eb1d7sm30067741plb.33.2022.07.08.08.20.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:20:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 43/45] target/arm: Only set ZEN in reset if SVE present
Date: Fri,  8 Jul 2022 20:45:38 +0530
Message-Id: <20220708151540.18136-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

There's no reason to set CPACR_EL1.ZEN if SVE disabled.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 9c58be8b14..9b54443843 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -204,11 +204,10 @@ static void arm_cpu_reset(DeviceState *dev)
         /* and to the FP/Neon instructions */
         env->cp15.cpacr_el1 = FIELD_DP64(env->cp15.cpacr_el1,
                                          CPACR_EL1, FPEN, 3);
-        /* and to the SVE instructions */
-        env->cp15.cpacr_el1 = FIELD_DP64(env->cp15.cpacr_el1,
-                                         CPACR_EL1, ZEN, 3);
-        /* with reasonable vector length */
+        /* and to the SVE instructions, with default vector length */
         if (cpu_isar_feature(aa64_sve, cpu)) {
+            env->cp15.cpacr_el1 = FIELD_DP64(env->cp15.cpacr_el1,
+                                             CPACR_EL1, ZEN, 3);
             env->vfp.zcr_el[1] = cpu->sve_default_vq - 1;
         }
         /*
-- 
2.34.1


