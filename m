Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B1F49DB2C
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 08:06:56 +0100 (CET)
Received: from localhost ([::1]:59110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCyrv-0001PT-85
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 02:06:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCyMh-00043s-D8
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 01:34:41 -0500
Received: from [2607:f8b0:4864:20::1036] (port=38563
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCyMf-0005ib-PN
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 01:34:38 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 d12-20020a17090a628c00b001b4f47e2f51so6583112pjj.3
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 22:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E75DjW4QVNIQo9iQ7CSqAeo7IxlAo+AuZWRbk+594s4=;
 b=Rs3dXyFlt76aY9nfZGtdOqYTIllhdbtDsJjTrXpaojxuneTJQubSdUoPBw6BMLhxgU
 4pxj7sy2q4HMrNidZL33uc3TN4aMLX5ndC2UFkyPZ8UztVmOb9wo4aBS2nqgXg+M5stm
 ubFY2y+7z9FhY3fOP9NeVeigjDBk7GvHRk1IZtYQSwQBpjZ0KdtC7ehgZQoZ7VnrWm/4
 lOMRmeb4NNogoOqf9RFF+H1YkjMw+Q+BJCr2kKgUj0MS43PXNngdYiQc3vQLoIF8zIYZ
 e8zoYfln9i/jlfmXM8vD2EVqsvdvpcvi8BSfzAw952fSrnW1pWVz7An6Xk+Z8YI7cG03
 p8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E75DjW4QVNIQo9iQ7CSqAeo7IxlAo+AuZWRbk+594s4=;
 b=DAQgBx5OlBF4bPY3kH9yLQGkuC9hFLvf3Bt+iEB+8NI+dwCyHNTCmpJYlTtmkrmO1a
 2F8jnkLWVP8g9YzxlcHAge/NcPiIGG1qmn/sMXYUfiT+T1ETWjxPj3Aa9JIwbKJ1p0GA
 yGrHJEM3FBYyDupMGTBmdTabLDhHSJTc47h/SKyJSgSeoPLdjYulwj0IZ9944VbOV7ei
 FLUIceHd0QQjTDhb87yftxJIBnBsY3tG6O3e2Rqicqmime7meVa5IhTGLi541iQOtsZm
 lIFo+YKYRavA5tA8vD2kyU9tm+iVBc1HfRy6Hc/LAm20oq5h89u/A/4+PXuxdMxcItXc
 11Dw==
X-Gm-Message-State: AOAM532UNV+UIQa31yiULhHNOSxN5+ZCM87Id0nBxmNYjAgnxe2om903
 PQpIpk/pmqs75AS3TIRRLWtu+yop+bCbQING
X-Google-Smtp-Source: ABdhPJxRVrpD7QchzXhknYWFRCPUYQ4jfV1Mq4N4ngifqJi3xWOneimUNVdNGRaL2/W8NJTspzBujg==
X-Received: by 2002:a17:902:8d96:: with SMTP id
 v22mr2471111plo.77.1643265276453; 
 Wed, 26 Jan 2022 22:34:36 -0800 (PST)
Received: from localhost.localdomain (alanje.lnk.telstra.net.
 [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id y20sm4231855pfi.78.2022.01.26.22.34.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 22:34:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] target/arm: Fix sve_zcr_len_for_el for VHE mode running
Date: Thu, 27 Jan 2022 17:34:25 +1100
Message-Id: <20220127063428.30212-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127063428.30212-1-richard.henderson@linaro.org>
References: <20220127063428.30212-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: yuzenghui@huawei.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When HCR_EL2.{E2H,TGE} == '11', ZCR_EL1 is unused.

Reported-by: Zenghui Yu <yuzenghui@huawei.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index cfca0f5ba6..d9ee2ba5f4 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6225,7 +6225,8 @@ uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
     ARMCPU *cpu = env_archcpu(env);
     uint32_t zcr_len = cpu->sve_max_vq - 1;
 
-    if (el <= 1) {
+    if (el <= 1 &&
+        (arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
         zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[1]);
     }
     if (el <= 2 && arm_feature(env, ARM_FEATURE_EL2)) {
-- 
2.25.1


