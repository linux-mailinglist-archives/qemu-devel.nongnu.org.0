Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 218A964872C
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 18:02:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3gke-0000xN-2C; Fri, 09 Dec 2022 12:01:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3gk8-0000p9-Ho
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 12:01:00 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3gk4-000563-E9
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 12:00:59 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 ja4-20020a05600c556400b003cf6e77f89cso6262254wmb.0
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 09:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NyRVy4kGd1CBNGiegqnPBW94HKs6xXQbwkS3kH7rClY=;
 b=L6CQpOYjf4IojBrudVOtBJFR2qYBU7FUgQRGuX8cpCm42+sdqKUw/xfn+37PzWqs27
 Isp81l5LJ3ZVI3yYkDnO+Ajs5e0SnB6O226xsyZ1Rgu7UMPYmymDuURFonmuBv65fKkt
 oYUSqFcFfUEyHPjm09r8mquklg31dsOwaNE9OpppMEzQ3ubL9DTk+h8GZufZDdlLYVOh
 nv1p83shDrHTbgN++0IG57JtOOQm6oC/vKj8us374Zmmma52kY6X53FR57L39E7Ecx76
 /gn1W1WO9H9KTqw0h/H0by2ZRFKNKxvTLlilXIre4Oq2C9XQ6BZhVXroQ5AVVE9pj5ZY
 Q8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NyRVy4kGd1CBNGiegqnPBW94HKs6xXQbwkS3kH7rClY=;
 b=1m8EtSd/bgyjf+26SEvat2MA1YLwNRyCkzwNrPgHOkuyvqA0jzIG3XzsUBUxKY7HPf
 Xqp7WCnCADiP67vx0I8+XB4pPSg/3EppZ00cYH4p51JckTt4HrUf/EmgVPzMLMTis8Y2
 1UTvowZDc+wFcZGBrIUqLF9Q07mwCwH5pFr4sSPWm23sbimHknxzVhrVwBvorOrMe7AK
 V7ccnl5f6IiCpHBPIpimRQh4YTpdklhWJg3BlP8bBAlDcVHW8cV4kQ1VnUILR2kiegKf
 RCo1/OKhpEbRNoSfZQtc4+4iI4wVVS1ljeo1GXU/joE9BlPIrv8B7slXZ+H8JSajcL1o
 iKfQ==
X-Gm-Message-State: ANoB5pk0aiTRPDy+30Z0pexNhdTvmsVA+m1mYCSkd9oQ1VzQRTPAXzCn
 IBFfcbTdd4A+eQlEd5dbKf72GmfUi5uRYTZTdWs=
X-Google-Smtp-Source: AA0mqf5IJ8oOfpjItwT/w9GAzpDxQZAJ0CCS6zslJEeuOcfhsNanJXqUJpNnRC3pPPzO88Wo3N+0yw==
X-Received: by 2002:a05:600c:3d06:b0:3c6:e60f:3f55 with SMTP id
 bh6-20020a05600c3d0600b003c6e60f3f55mr5735345wmb.12.1670605254121; 
 Fri, 09 Dec 2022 09:00:54 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p25-20020a05600c205900b003a6125562e1sm238587wmg.46.2022.12.09.09.00.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 09 Dec 2022 09:00:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 2/3] hw/intc: Move omap_lcdc.c out of target-specific
 source set
Date: Fri,  9 Dec 2022 18:00:41 +0100
Message-Id: <20221209170042.71169-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209170042.71169-1-philmd@linaro.org>
References: <20221209170042.71169-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The Goldfish interrupt controller is not target specific.

While the Exynos interrupt combiner is only used by the ARM
targets, we can build this device once for all.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/intc/meson.build | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index bcbf22ff51..2ad8648366 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -13,6 +13,8 @@ softmmu_ss.add(when: 'CONFIG_ARM_GICV3_TCG', if_true: files(
   'arm_gicv3_redist.c',
 ))
 softmmu_ss.add(when: 'CONFIG_ETRAXFS', if_true: files('etraxfs_pic.c'))
+softmmu_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_combiner.c'))
+softmmu_ss.add(when: 'CONFIG_GOLDFISH_PIC', if_true: files('goldfish_pic.c'))
 softmmu_ss.add(when: 'CONFIG_HEATHROW_PIC', if_true: files('heathrow_pic.c'))
 softmmu_ss.add(when: 'CONFIG_I8259', if_true: files('i8259_common.c', 'i8259.c'))
 softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_avic.c', 'imx_gpcv2.c'))
@@ -33,7 +35,7 @@ specific_ss.add(when: 'CONFIG_ARM_GIC_KVM', if_true: files('arm_gic_kvm.c'))
 specific_ss.add(when: ['CONFIG_ARM_GIC_KVM', 'TARGET_AARCH64'], if_true: files('arm_gicv3_kvm.c', 'arm_gicv3_its_kvm.c'))
 specific_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('armv7m_nvic.c'))
 specific_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_vic.c'))
-specific_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_gic.c', 'exynos4210_combiner.c'))
+specific_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_gic.c'))
 specific_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_irqmp.c'))
 specific_ss.add(when: 'CONFIG_IOAPIC', if_true: files('ioapic.c'))
 specific_ss.add(when: 'CONFIG_LOONGSON_LIOINTC', if_true: files('loongson_liointc.c'))
@@ -60,7 +62,6 @@ specific_ss.add(when: 'CONFIG_PSERIES', if_true: files('xics_spapr.c', 'spapr_xi
 specific_ss.add(when: 'CONFIG_XIVE', if_true: files('xive.c'))
 specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XIVE'],
 		if_true: files('spapr_xive_kvm.c'))
-specific_ss.add(when: 'CONFIG_GOLDFISH_PIC', if_true: files('goldfish_pic.c'))
 specific_ss.add(when: 'CONFIG_M68K_IRQC', if_true: files('m68k_irqc.c'))
 specific_ss.add(when: 'CONFIG_NIOS2_VIC', if_true: files('nios2_vic.c'))
 specific_ss.add(when: 'CONFIG_LOONGARCH_IPI', if_true: files('loongarch_ipi.c'))
-- 
2.38.1


