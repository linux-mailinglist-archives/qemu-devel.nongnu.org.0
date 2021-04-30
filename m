Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2CE36F888
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 12:36:32 +0200 (CEST)
Received: from localhost ([::1]:56522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcQVb-0000YB-D7
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 06:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQTr-0007DG-66
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:34:43 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:40667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQTp-00019h-Hg
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:34:42 -0400
Received: by mail-wr1-x432.google.com with SMTP id d4so1560655wru.7
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 03:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=LCSM795lit02iUbRuFeeRsvWeeO13Mxp9oArfvKi8Bs=;
 b=oQCshL7f5SG/1Fu4jTlZUst03MTlzhnYyCfCeDBSZUChl/ORsBVrejm8lFrgctb8AF
 C6KxsYoVQiK/HcfaXmEezytNi4G/MpGka1ouTqEuiAkzIG0q3JyYUO4WFgluyZIpEf3X
 ZsZvPwmVIir2Y8mztFHywxUZQqWkrNOZ1plUXF0hLVY/LK5LaAQUXuoU3OufpMLhlUrr
 +ae7ZtIs6ptQEKWLIGqbudVclmBuDpHHmJdpjvIjVcgLcGTHE3mTU2kEI83p4+9ZpD5s
 N20qpZgU/UbgRieX/XW/akLZwX/wTSTZzNDLgIgKN8qS2jmN1W1RIKn/7zpUE9WyYZ5l
 bdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LCSM795lit02iUbRuFeeRsvWeeO13Mxp9oArfvKi8Bs=;
 b=JdTvOkqhDxV1d6Fx6gJJqoi7OhN4jJ+gxMpthVerSQIX9/I/wykymMXhip9lnFvhv0
 +qyIPH7ItYEi6YXjnjNpZcyGl7edLIyVpPcdMTdBfdw65md3AHBrFvSSwzbZR7f3LDzw
 0Hi2PjA68CpGGGhu74USIslhx2lC2aZDJPJa/fk5KSS1HAb+oF+j9l3J6drDigsvCdqb
 EutLFlUaZrtnO6xvlU4n3TTvGjYE53AvKGAFxHvsx87hIstL68q/b1qYOebi0QFX6j3D
 cIo/rzXWayUk3BA79GkdUnMxl5P2LbTlIE3VsVCiqtUIwS7rBweKVhdbjvUeSGF9aIN3
 8LMw==
X-Gm-Message-State: AOAM530mIW+1I1Q/0laR2RuFXbbFVt1TAOmMCVOUax/yiu2E8ye0c7YS
 lZok8O8GotLe/OXKjrhndFZWzCfSvbD8DhZN
X-Google-Smtp-Source: ABdhPJzCoazBjA5NjnpjmllVccWjuCXbUTZLg+JXt2/44c8doESxwtaB/66y9g8nX9Kyw3f9ivgbWA==
X-Received: by 2002:adf:dd52:: with SMTP id u18mr5879456wrm.32.1619778880097; 
 Fri, 30 Apr 2021 03:34:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 18sm12997817wmo.47.2021.04.30.03.34.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 03:34:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/43] hw/arm/smmuv3: Support 16K translation granule
Date: Fri, 30 Apr 2021 11:33:55 +0100
Message-Id: <20210430103437.4140-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430103437.4140-1-peter.maydell@linaro.org>
References: <20210430103437.4140-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

From: Kunkun Jiang <jiangkunkun@huawei.com>

The driver can query some bits in SMMUv3 IDR5 to learn which
translation granules are supported. Arm recommends that SMMUv3
implementations support at least 4K and 64K granules. But in
the vSMMUv3, there seems to be no reason not to support 16K
translation granule. In addition, if 16K is not supported,
vSVA will failed to be enabled in the future for 16K guest
kernel. So it'd better to support it.

Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/smmuv3.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 87056125357..228dc54b0bc 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -259,8 +259,9 @@ static void smmuv3_init_regs(SMMUv3State *s)
     s->idr[3] = FIELD_DP32(s->idr[3], IDR3, RIL, 1);
     s->idr[3] = FIELD_DP32(s->idr[3], IDR3, HAD, 1);
 
-   /* 4K and 64K granule support */
+    /* 4K, 16K and 64K granule support */
     s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN4K, 1);
+    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN16K, 1);
     s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN64K, 1);
     s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, SMMU_IDR5_OAS); /* 44 bits */
 
@@ -503,7 +504,8 @@ static int decode_cd(SMMUTransCfg *cfg, CD *cd, SMMUEventInfo *event)
 
         tg = CD_TG(cd, i);
         tt->granule_sz = tg2granule(tg, i);
-        if ((tt->granule_sz != 12 && tt->granule_sz != 16) || CD_ENDI(cd)) {
+        if ((tt->granule_sz != 12 && tt->granule_sz != 14 &&
+             tt->granule_sz != 16) || CD_ENDI(cd)) {
             goto bad_cd;
         }
 
-- 
2.20.1


