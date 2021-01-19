Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 955BE2FBADB
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:17:07 +0100 (CET)
Received: from localhost ([::1]:35774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1skk-0005Oz-L0
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:17:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sfD-0007bG-Vd
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:24 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sf8-0001E2-TG
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:23 -0500
Received: by mail-wr1-x42e.google.com with SMTP id g10so1692592wrx.1
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=MMTS9vRbvJncUllPtju36AwVTASA2OFHbr2FlFAYMlM=;
 b=DOWmLmVWHf9ZlLatllonnkUmskbO3Kaq4QzDQBFNEDLlkmpVVb2DccGd1Lmf2bCmMP
 E1YJpmr3kQiGiGp3Mv2A3pzRHxQviWM2V9VrzIIj31hgUIhKzuh4Nh+MVEPrCPxDevox
 fHOopwYKdGJko0kp4VVwUne6nSPDnOjk3xv5WTvznaUlgqxgSnL71aA/hVNbNs5uhiZ7
 6JH7InMKxoGSotP2guGgB4GBduuDIPABx8DhLOYIReBErtdoLlVX17RHkIsr7WF2qqZf
 K0fAb+xofgCLDetKqQDq2veahiGj3yeo/QUrLEsnsfaSXBt2GDRLodyERGviCWcBTkJy
 roZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MMTS9vRbvJncUllPtju36AwVTASA2OFHbr2FlFAYMlM=;
 b=uWnThYzBRWRi1JhR+k76tLJQce1EW2KnSxg+mRv+hNW1bSXuAf8M2X/uVkZT3S11Zh
 9xxIcNBYeXUV44rw5XboNNAttDf5gyxJSJxcJQKNi0eoZ3q0neE9N2+27UOLYTxxgHf2
 YtzRtF9vHmAJS1xPrCwTcWbKDhS3s1qr2sD2geBHkWlkRsSiAPRxlxMR1+9goHB7tbKu
 LG92bhB2ZUF6z8Pya2IvhGs11k+wCtp2KOt+p3ZmVrH4UlSXg/UAH70S8r1q6hFWlbFA
 jzLBxRoT3nVvSCuk+4PwlwqhH91Gul+tSlY8dqDNjPowmjzfFp9A1/1t3A1+ji3B58Wv
 LjGw==
X-Gm-Message-State: AOAM530/Wbs0KMDkuivNNL20xpDXPsZA1j0NNCILWoOgoqBYhDkBqKYv
 V/0tqhE0dBEtgGSlVaBkLHwKEPXG6z4ZAg==
X-Google-Smtp-Source: ABdhPJzBW/AA4BVQhBOeSYAZHLeYH0NyNcxxNeK9CsShYQF8YGHTX6PbPm/t9F2f6hUx0AI/EhyJlw==
X-Received: by 2002:adf:d085:: with SMTP id y5mr4954647wrh.41.1611069077260;
 Tue, 19 Jan 2021 07:11:17 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a184sm4843699wme.35.2021.01.19.07.11.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 07:11:16 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/33] target/arm: handle VMID change in secure state
Date: Tue, 19 Jan 2021 15:10:44 +0000
Message-Id: <20210119151104.16264-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210119151104.16264-1-peter.maydell@linaro.org>
References: <20210119151104.16264-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

The VTTBR write callback so far assumes that the underlying VM lies in
non-secure state. This handles the secure state scenario.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210112104511.36576-10-remi.denis.courmont@huawei.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 9a0b8c9aa0a..f8c18ab6c05 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4018,10 +4018,15 @@ static void vttbr_write(CPUARMState *env, const ARMCPRegInfo *ri,
      * the combined stage 1&2 tlbs (EL10_1 and EL10_0).
      */
     if (raw_read(env, ri) != value) {
-        tlb_flush_by_mmuidx(cs,
-                            ARMMMUIdxBit_E10_1 |
-                            ARMMMUIdxBit_E10_1_PAN |
-                            ARMMMUIdxBit_E10_0);
+        uint16_t mask = ARMMMUIdxBit_E10_1 |
+                        ARMMMUIdxBit_E10_1_PAN |
+                        ARMMMUIdxBit_E10_0;
+
+        if (arm_is_secure_below_el3(env)) {
+            mask >>= ARM_MMU_IDX_A_NS;
+        }
+
+        tlb_flush_by_mmuidx(cs, mask);
         raw_write(env, ri, value);
     }
 }
-- 
2.20.1


