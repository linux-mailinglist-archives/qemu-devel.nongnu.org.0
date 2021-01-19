Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 622972FBB29
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:29:21 +0100 (CET)
Received: from localhost ([::1]:45122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1swa-0004XN-CC
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:29:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sfG-0007f8-72
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:26 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:39576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sf9-0001FJ-G4
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:25 -0500
Received: by mail-wm1-x32f.google.com with SMTP id u14so56497wmq.4
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=x+fvMvunQsXDRY9AdxkBS0U4eAYaH50cOCjSDwUSzns=;
 b=VDOtQr/356DVqz98MBRDBaZtewQNoZi4FNJfgcVjUsOsNIZ57bzVgA5nW+EZqOubT+
 qmzsKeC2DxUtPb7qWRytFuDgcHt04Wb5eiRzYz2Ah8orrp01ICmrsqm+zsbaCgxrX9Wa
 lPMeUhLuFr2rUoDu8v5TAzsec1gTD3HwLvvACHcfjgx6SLLby0M86EWNa2WLpyGNsMLt
 57iygYpSeabirH3aZxSydLCC9vxhaM8N4EmFUxBuseav5yPwIq2l30/FQkbCRU1mtHPX
 wV1pbi0pNrcwxPW30+IR0hrnjYcrZWAxsh/CsSh8iuhpy17Dfx5YMsKtiBP3zuiimHlD
 eomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x+fvMvunQsXDRY9AdxkBS0U4eAYaH50cOCjSDwUSzns=;
 b=Bldv5i/xSzjriUJxY+V1NwJkFhzNztRUOQDf4nGPfkF/7kPuvr0vR13JcWfbkIGGm2
 Uaj2QlSC4ZKoOyBdefEmMW8+DqwrLolsXtKDNpwFeCTevwpdk3OekG9Opnr/qZDpnSvr
 v6Bgr1E7Rjk+h63HyANwHst3Zw9o8feUihDgJE/6gwnZFnluKtPQL2m6M8OrGvgzvWZC
 6FQlvQAZb7GjYSC/vRUfzJhLydpWCDhQaClkQ3mzeMyImId7+rjd29iC+QD9cMOhmvK1
 IPps+S/oYoSj1F3j4tcpqygrJcSO45dNlt9mokwhoV4hoTCTDglw+xiI7tHLsnKK3f50
 d1mg==
X-Gm-Message-State: AOAM5302Ur88nDpTHf2mYEkqIcdiZCmyT5D7jNck8dzLEMLRq5u2fT7p
 A3XoKhtQHUx1ZymgCNKpQynUG4j8p8Ee1w==
X-Google-Smtp-Source: ABdhPJw0VxJOIBsa1mY61YBDLEOOu42KmHDWZFquNVDN2nlNh31RabQFyQKqMuvS9+7xzrB9OWSr5A==
X-Received: by 2002:a1c:398a:: with SMTP id g132mr119391wma.38.1611069078034; 
 Tue, 19 Jan 2021 07:11:18 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a184sm4843699wme.35.2021.01.19.07.11.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 07:11:17 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/33] target/arm: do S1_ptw_translate() before address space
 lookup
Date: Tue, 19 Jan 2021 15:10:45 +0000
Message-Id: <20210119151104.16264-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210119151104.16264-1-peter.maydell@linaro.org>
References: <20210119151104.16264-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

In the secure stage 2 translation regime, the VSTCR.SW and VTCR.NSW
bits can invert the secure flag for pagetable walks. This patchset
allows S1_ptw_translate() to change the non-secure bit.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210112104511.36576-11-remi.denis.courmont@huawei.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index f8c18ab6c05..ae0ccf72f58 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10393,7 +10393,7 @@ static bool get_level1_table_address(CPUARMState *env, ARMMMUIdx mmu_idx,
 
 /* Translate a S1 pagetable walk through S2 if needed.  */
 static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
-                               hwaddr addr, MemTxAttrs txattrs,
+                               hwaddr addr, bool *is_secure,
                                ARMMMUFaultInfo *fi)
 {
     if (arm_mmu_idx_is_stage1_of_2(mmu_idx) &&
@@ -10403,6 +10403,9 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
         int s2prot;
         int ret;
         ARMCacheAttrs cacheattrs = {};
+        MemTxAttrs txattrs = {};
+
+        assert(!*is_secure); /* TODO: S-EL2 */
 
         ret = get_phys_addr_lpae(env, addr, MMU_DATA_LOAD, ARMMMUIdx_Stage2,
                                  false,
@@ -10443,9 +10446,9 @@ static uint32_t arm_ldl_ptw(CPUState *cs, hwaddr addr, bool is_secure,
     AddressSpace *as;
     uint32_t data;
 
+    addr = S1_ptw_translate(env, mmu_idx, addr, &is_secure, fi);
     attrs.secure = is_secure;
     as = arm_addressspace(cs, attrs);
-    addr = S1_ptw_translate(env, mmu_idx, addr, attrs, fi);
     if (fi->s1ptw) {
         return 0;
     }
@@ -10472,9 +10475,9 @@ static uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
     AddressSpace *as;
     uint64_t data;
 
+    addr = S1_ptw_translate(env, mmu_idx, addr, &is_secure, fi);
     attrs.secure = is_secure;
     as = arm_addressspace(cs, attrs);
-    addr = S1_ptw_translate(env, mmu_idx, addr, attrs, fi);
     if (fi->s1ptw) {
         return 0;
     }
-- 
2.20.1


