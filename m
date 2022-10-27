Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4D160FA08
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 16:03:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo3Sc-0007Cr-Dr; Thu, 27 Oct 2022 10:02:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oo3Sa-00076S-Jk
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 10:02:16 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oo3SZ-0004yk-13
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 10:02:16 -0400
Received: by mail-wr1-x435.google.com with SMTP id bs21so2340989wrb.4
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 07:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nNtjyiRH/CIEjeKDHvpJCfaqZyeMGogdKG4xYD/wkmY=;
 b=yrBraNwzd30pXmNdBZ9MbsFKaZWk8cgz39Si3hT+SpY64IUviyfru5olumaCiaW+lr
 rHHzuU9WL1r80ZhvXxG0xa5/cWIOa1Y9G2wsjDLdk380g1hybxqcHpoEeGe8RFYm5Vr5
 sHaKlqhzoVJIgAy4Px72tmu2DT/WVwif0knYlbgzkGM4ANWgKaAKwX43Zpfv3Cuoq+QC
 /JRDjOg7FylKn4B2UZ82ghZqmL8l+sjnxnxZMoVHv2oVk3Gy/Ew7end32h3Aq3TOTR9C
 4X4ukFLwM0qyW3qY98P8v4RyC9rXA7su4Ut135Zv+MAwAoo9H0a67OSWzp34SVe+Nex4
 RS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nNtjyiRH/CIEjeKDHvpJCfaqZyeMGogdKG4xYD/wkmY=;
 b=NrXrLjemgacLQarNVPVWywS7Zb6OwDLXAFNA/dGt1qu9kFVx4pblehAhu7W3ahc9P+
 j21AAUY+q7Vny0qYvYBeA5GVOKr5y6IqVv8ilsFP6TRwa/1dMqm+W2sk0ee0MwdtnvRT
 D2A18PLegk+cKibCf70WYyEGp4eF2ktXQWBAZWwb4+9Z2SQXXo20tGGxvGWPovpXKtfI
 ZHeeDohc6CqveVu1YYs01q1OHsuzbebXaGJIqra4Qop0FqFarPNyXXb1euJvQXqlAG/P
 FcqdKE4LGxBTZJ+6YN7GaZYzoYO/FESPF/+1wdZGAQB2KEeWw/hkjxkE+3guLuH164O6
 hWFw==
X-Gm-Message-State: ACrzQf1GRoQmt3+Eaa0nYQZJ1pUgojAGR9d+5txoPdLMdvLFpDkKnHdz
 mOgA8W5AamGDqYAL0cmOkumWeQ==
X-Google-Smtp-Source: AMsMyM5yWhUAGSZrQTuyv8OCnpaWt5pZbca/QlYL+ld+y7v2DVZmigbIadTkmPo9jmkPV5Z6pwQRrQ==
X-Received: by 2002:a5d:4441:0:b0:236:6c3e:efb4 with SMTP id
 x1-20020a5d4441000000b002366c3eefb4mr15512585wrr.539.1666879333297; 
 Thu, 27 Oct 2022 07:02:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bp6-20020a5d5a86000000b00228a6ce17b4sm1301236wrb.37.2022.10.27.07.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 07:02:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jerome Forissier <jerome.forissier@linaro.org>
Subject: [PATCH 2/2] hw/arm/boot: Set SCR_EL3.HXEn when booting kernel
Date: Thu, 27 Oct 2022 15:02:07 +0100
Message-Id: <20221027140207.413084-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221027140207.413084-1-peter.maydell@linaro.org>
References: <20221027140207.413084-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When we direct boot a kernel on a CPU which emulates EL3, we need to
set up the EL3 system registers as the Linux kernel documentation
specifies:
     https://www.kernel.org/doc/Documentation/arm64/booting.rst

For CPUs with FEAT_HCX support this includes:
    - SCR_EL3.HXEn (bit 38) must be initialised to 0b1.

but we forgot to do this when implementing FEAT_HCX, which would mean
that a guest trying to access the HCRX_EL2 register would crash.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/boot.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 0e4d1e5a816..ddb7b1bdba0 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -769,6 +769,9 @@ static void do_cpu_reset(void *opaque)
                         env->cp15.scr_el3 |= SCR_ENTP2;
                         env->vfp.smcr_el[3] = 0xf;
                     }
+                    if (cpu_isar_feature(aa64_hcx, cpu)) {
+                        env->cp15.scr_el3 |= SCR_HXEN;
+                    }
                     /* AArch64 kernels never boot in secure mode */
                     assert(!info->secure_boot);
                     /* This hook is only supported for AArch32 currently:
-- 
2.25.1


