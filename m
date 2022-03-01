Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7D64C9829
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 23:08:52 +0100 (CET)
Received: from localhost ([::1]:46484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPAfr-0004NI-Gc
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 17:08:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPAXh-0001Lz-6F
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:00:25 -0500
Received: from [2607:f8b0:4864:20::429] (port=41596
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPAXf-00053n-4v
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:00:24 -0500
Received: by mail-pf1-x429.google.com with SMTP id p8so55332pfh.8
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 14:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LEHpSJT8J9ebqqTQjfyKLCxLV+2FFN9FnOSHNM/yVQA=;
 b=eae7XyHXBL9mKPwMEeDJvp2ibsiKf2ZNiUp90oXmnM4cwMTIo8y6XgGqjz+TsXrIym
 zlLeh5/D7eVCXXHYhL70zq5126nT/rQdpXoRazhAa2YxjDniT/0LOSQ6lQk+jtNOvb2t
 7yGSVPwc9ebB3oKqEMGpUXAhFIyaIbWeLhVpoGxDjx8TjowyK/eeZ93h7YGi3GtnIZP1
 D8WZmsXhgnFROtPO1vHOPdKeD5XJc+ClOuedH0wpV+MRchzaiGZfmBgUCF9/2NhmrSBR
 iTHJOQ6dtE+3jLK5276NHpS9d/Pv+PcinCtQcUDpAFSeD4I/xm40azQjq1UbmwjXpQLR
 9b5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LEHpSJT8J9ebqqTQjfyKLCxLV+2FFN9FnOSHNM/yVQA=;
 b=NbyyB+swsbQauZ78ZRHV/npXhQg5ewjaMBOTXf31RSRP0fiAMcPoKvwVLaUm83EbOq
 Scs218JnvPM2dp57Oo0YKGJMgQt7DKhKDmgpFLaXz9Gf6FSkBimK7/bLAnVk+LAuzgvq
 7RmbjQM23gbzDtmaMqi32CkUmwmVEjqwrgpelh7qh1PzzRYHz1USsfsTCmiJ0dH4lO3Z
 ECAnPVsDJyBLG06jSEKIKBT0HnkIiHz2WFNeS1+9yOVLC10Q63XCpSH/am30XQd4BT2+
 uq/8c5og3YhwQj29H8OT81rVJAdWY8qHBcGncnSNchA0hlruZdiLhWj59vkpekymuQ9q
 AApA==
X-Gm-Message-State: AOAM531+YUhVuMBGPJDhFjfd3KTDgfsjf5dCGkdz8jDppimSaSpHtJvz
 wek2+vTB/wKiyueVMn51gUJMmwVw+K4DHw==
X-Google-Smtp-Source: ABdhPJwLniKbATL9r/QdTvrer38MfKczOjcSqJqAE2eJ6RSxsq9pMj1nEJ6w+Sp9gMX/myTT5xpBtA==
X-Received: by 2002:a05:6a00:1354:b0:4c9:1e96:d15c with SMTP id
 k20-20020a056a00135400b004c91e96d15cmr29714068pfu.30.1646172020158; 
 Tue, 01 Mar 2022 14:00:20 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 m4-20020a17090a7f8400b001bef3fc3938sm284392pjl.49.2022.03.01.14.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 14:00:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/18] target/arm: Extend arm_fi_to_lfsc to level -1
Date: Tue,  1 Mar 2022 11:59:51 -1000
Message-Id: <20220301215958.157011-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301215958.157011-1-richard.henderson@linaro.org>
References: <20220301215958.157011-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With FEAT_LPA2, rather than introducing translation level 4,
we introduce level -1, below the current level 0.  Extend
arm_fi_to_lfsc to handle these faults.

Assert that this new translation level does not leak into
fault types for which it is not defined, which allows some
masking of fi->level to be removed.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 3d3d41ba2b..00af41d792 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -462,28 +462,51 @@ static inline uint32_t arm_fi_to_lfsc(ARMMMUFaultInfo *fi)
     case ARMFault_None:
         return 0;
     case ARMFault_AddressSize:
-        fsc = fi->level & 3;
+        assert(fi->level >= -1 && fi->level <= 3);
+        if (fi->level < 0) {
+            fsc = 0b101001;
+        } else {
+            fsc = fi->level;
+        }
         break;
     case ARMFault_AccessFlag:
-        fsc = (fi->level & 3) | (0x2 << 2);
+        assert(fi->level >= 0 && fi->level <= 3);
+        fsc = 0b001000 | fi->level;
         break;
     case ARMFault_Permission:
-        fsc = (fi->level & 3) | (0x3 << 2);
+        assert(fi->level >= 0 && fi->level <= 3);
+        fsc = 0b001100 | fi->level;
         break;
     case ARMFault_Translation:
-        fsc = (fi->level & 3) | (0x1 << 2);
+        assert(fi->level >= -1 && fi->level <= 3);
+        if (fi->level < 0) {
+            fsc = 0b101011;
+        } else {
+            fsc = 0b000100 | fi->level;
+        }
         break;
     case ARMFault_SyncExternal:
         fsc = 0x10 | (fi->ea << 12);
         break;
     case ARMFault_SyncExternalOnWalk:
-        fsc = (fi->level & 3) | (0x5 << 2) | (fi->ea << 12);
+        assert(fi->level >= -1 && fi->level <= 3);
+        if (fi->level < 0) {
+            fsc = 0b010011;
+        } else {
+            fsc = 0b010100 | fi->level;
+        }
+        fsc |= fi->ea << 12;
         break;
     case ARMFault_SyncParity:
         fsc = 0x18;
         break;
     case ARMFault_SyncParityOnWalk:
-        fsc = (fi->level & 3) | (0x7 << 2);
+        assert(fi->level >= -1 && fi->level <= 3);
+        if (fi->level < 0) {
+            fsc = 0b011011;
+        } else {
+            fsc = 0b011100 | fi->level;
+        }
         break;
     case ARMFault_AsyncParity:
         fsc = 0x19;
-- 
2.25.1


