Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0269C51030C
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 18:17:44 +0200 (CEST)
Received: from localhost ([::1]:54886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njNsl-0000f8-4R
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 12:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1njNfy-0006U5-9Z
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:04:30 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:41832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1njNfw-0007oS-J1
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:04:30 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 u9-20020a05600c00c900b00393e729e655so1894061wmm.0
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OsQV7ZmcQTGgPLMSTvn131giURirHLy7ThlcG0+Jl1Q=;
 b=UcxDkNq6HwUVjI7SrSKIKyl7zkUmsYOum2JX9evLnWcVIAuuoKk3bvJdVwp/qBl6yW
 VzfjkWA3QHRXRiVS8I0GOL8l/uXW7yPDIyuAt3Pn/pofYHCfrtPuLjWxVAZHb2uMOwbh
 cwOLyu+pUycF72ELo2/5nkj1eyjpZ7OrxBkldNRalZl6CpE/oR9/F9eSz2opfWYTr5T0
 igkb6n0k437jI6JhTGEAFri4t830yt1xdSPTKZzGIlfwIK3Og+7gCAmqhw1unTPcX7jQ
 jkqUQByGFgSfEh/mIWlUbngWk56k5Tp8b4eAcx6coC5qSStXIy48dox6mNqKUNcSI20u
 CBjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OsQV7ZmcQTGgPLMSTvn131giURirHLy7ThlcG0+Jl1Q=;
 b=VtEV5t5Tww1xKfgGq7+rkKM4sqr1z2WnBKaRRS+9dBjYoGA+QXwdtZ6Ah18jbaQg8c
 t6iNDDPlB7YPwUgZ1gx63Gy4GzY5oV7eYLHfuYucIiz+bgzRgmPCeBg4usWeTzgvO8v7
 PldyIlqhGQ6edCoMyr9udsq9GuNDWmxCYIstsqoAKG4bhCkhqY+Tas5bMR2iljWBI7ne
 jsP50bn3yQoj6icn0urlEyPE2jJYhFohwOOl1CpLgYg+lUmAtwHUc9GUEO7fVnC6rOJG
 OGU+dPa8RATaP3RZRnlsn46CU17MYF1j6drvw7APrBdaP+TapF6QrWMuN/Hg40c+DqC9
 CTeA==
X-Gm-Message-State: AOAM532AS5EZtIIXfpdys7J4LYSFSOPxQqAdo4hWZOhCCiNEGcuplKw2
 sQR2cCjnZ403C2Zh+CZ9Eho0Tw==
X-Google-Smtp-Source: ABdhPJyJ4NocQYl74Z6s2c21T267RXEJ4GaE8iE92PHriPPAB3LLK2G9BZytVI2N30SjnEgpZZkdSQ==
X-Received: by 2002:a1c:f30b:0:b0:380:e444:86b9 with SMTP id
 q11-20020a1cf30b000000b00380e44486b9mr21957069wmq.81.1650989067083; 
 Tue, 26 Apr 2022 09:04:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p26-20020adf959a000000b0020aca418f14sm13584777wrp.54.2022.04.26.09.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:04:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/3] hw/arm/smmuv3: Advertise support for SMMUv3.2-BBML2
Date: Tue, 26 Apr 2022 17:04:22 +0100
Message-Id: <20220426160422.2353158-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426160422.2353158-1-peter.maydell@linaro.org>
References: <20220426160422.2353158-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: Eric Auger <eric.auger@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Arm SMMUv3 includes an optional feature equivalent to the CPU
FEAT_BBM, which permits an OS to switch a range of memory between
"covered by a huge page" and "covered by a sequence of normal pages"
without having to engage in the traditional 'break-before-make'
dance. (This is particularly important for the SMMU, because devices
performing I/O through an SMMU are less likely to be able to cope with
the window in the sequence where an access results in a translation
fault.)  The SMMU spec explicitly notes that one of the valid ways to
be a BBM level 2 compliant implementation is:
 * if there are multiple entries in the TLB for an address,
   choose one of them and use it, ignoring the others

Our SMMU TLB implementation (unlike our CPU TLB) does allow multiple
TLB entries for an address, because the translation table level is
part of the SMMUIOTLBKey, and so our IOTLB hashtable can include
entries for the same address where the leaf was at different levels
(i.e. both hugepage and normal page). Our TLB lookup implementation in
smmu_iotlb_lookup() will always find the entry with the lowest level
(i.e. it prefers the hugepage over the normal page) and ignore any
others. TLB invalidation correctly removes all TLB entries matching
the specified address or address range (unless the guest specifies the
leaf level explicitly, in which case it gets what it asked for). So we
can validly advertise support for BBML level 2.

Note that we still can't yet advertise ourselves as an SMMU v3.2,
because v3.2 requires support for the S2FWB feature, which we don't
yet implement.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/smmuv3-internal.h | 1 +
 hw/arm/smmuv3.c          | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index d1885ae3f25..e9150a6ff33 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -56,6 +56,7 @@ REG32(IDR2,                0x8)
 REG32(IDR3,                0xc)
      FIELD(IDR3, HAD,         2, 1);
      FIELD(IDR3, RIL,        10, 1);
+     FIELD(IDR3, BBML,       11, 2);
 REG32(IDR4,                0x10)
 REG32(IDR5,                0x14)
      FIELD(IDR5, OAS,         0, 3);
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 707eb430c23..74bc2e85ee4 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -259,6 +259,7 @@ static void smmuv3_init_regs(SMMUv3State *s)
 
     s->idr[3] = FIELD_DP32(s->idr[3], IDR3, RIL, 1);
     s->idr[3] = FIELD_DP32(s->idr[3], IDR3, HAD, 1);
+    s->idr[3] = FIELD_DP32(s->idr[3], IDR3, BBML, 2);
 
     /* 4K, 16K and 64K granule support */
     s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN4K, 1);
-- 
2.25.1


