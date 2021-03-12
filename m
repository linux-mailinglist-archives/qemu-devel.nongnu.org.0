Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7010F338F38
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 14:57:23 +0100 (CET)
Received: from localhost ([::1]:56490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKiI6-0000sW-Eo
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 08:57:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiCq-0002lS-7D
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:51:56 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:56174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiCi-0001xD-US
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:51:54 -0500
Received: by mail-wm1-x334.google.com with SMTP id o26so3849009wmc.5
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 05:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=HKmHDcXIJAUUSlzqGjOL+quzVszw3mV237yRUNF0PvE=;
 b=cuDd/+S8Ng5NfIz5wefpHiRxvKco5bJxFo9LiMP48Ejk+Jb/sHhwlzuFL3QWOToAGk
 RLfeH+ulc1FxwzOEn8A+otmTYJaWlH22HUlIe7efjLZG5gj2WkMl3qYsuOKG23Ryt85U
 1hJGvdYkmbx51RiaV2bv13SEiHS5M+775aUq5foKjPdsfbUFv/QkJL6e6nyIw5WG0MBl
 jIAxEsHyA9w2Pfflwi1Vm7yMHH5Qd08l5exafoQAsiEz7H+6bv5pGtN+f1ixCmtvb//5
 giQKEwt4t9ocwiYo+020gLyEiMbGp8XGbJplot3lROspt/M2psyHmDKkrfE24jaZJXQH
 p8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HKmHDcXIJAUUSlzqGjOL+quzVszw3mV237yRUNF0PvE=;
 b=RLL94SO4beaccz/L9I7mRflHF3a49+QWh7rlfg1ZeKTURyBTqG+qd8PUAP1ASVMnnD
 F6pq1UoWbGnHd5a3Wnehpip/1lDxHu3HrPoRG8r6X24qaBeakAcC6cDWCtvb8xtpaj8H
 NXYNaK1I9U6sVHDMOJFPvSs+B5w5cYQNHLgRTM6u8KYf4FtBsoZKFdlyrYvLSawBCVBG
 iYJRYy1lsoCPlVoz/0znzIDAyBDcq2ii8YirgNkGNRXrgbAT06zWeJSThC05mE5NhU8D
 370UYCZlhyxslnjfW7M2S3lzYhEicXRhQWVrrjyBXnqLL3Z0NPRtc0raJ1X7QOQ6xp7B
 lilw==
X-Gm-Message-State: AOAM531ZlbKxVc/jo4gOmGW+h+6TSF+1U1yPiB1z3V+I2srr2x0nm47m
 xcTQTcylOKIeJ3lvCAJsM0DumZhxxOCbvieU
X-Google-Smtp-Source: ABdhPJwR93qRbo8VEOJwgQs9yA4gblM4BtlVynBff8oEc0oYx4hzg1z0Q0zPQOvfmWKwZOAYyucb5Q==
X-Received: by 2002:a05:600c:290a:: with SMTP id
 i10mr13348198wmd.91.1615557106983; 
 Fri, 12 Mar 2021 05:51:46 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m6sm7964994wrv.73.2021.03.12.05.51.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 05:51:46 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/39] hw/arm/smmu-common: Fix smmu_iotlb_inv_iova when asid is
 not set
Date: Fri, 12 Mar 2021 13:51:07 +0000
Message-Id: <20210312135140.1099-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312135140.1099-1-peter.maydell@linaro.org>
References: <20210312135140.1099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

From: Eric Auger <eric.auger@redhat.com>

If the asid is not set, do not attempt to locate the key directly
as all inserted keys have a valid asid.

Use g_hash_table_foreach_remove instead.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Message-id: 20210309102742.30442-5-eric.auger@redhat.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/smmu-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 405d5c53258..e9ca3aebb26 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -151,7 +151,7 @@ inline void
 smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
                     uint8_t tg, uint64_t num_pages, uint8_t ttl)
 {
-    if (ttl && (num_pages == 1)) {
+    if (ttl && (num_pages == 1) && (asid >= 0)) {
         SMMUIOTLBKey key = smmu_get_iotlb_key(asid, iova, tg, ttl);
 
         g_hash_table_remove(s->iotlb, &key);
-- 
2.20.1


