Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA4749E89A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 18:13:48 +0100 (CET)
Received: from localhost ([::1]:46520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD8LC-0005yz-OM
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 12:13:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD6z2-0005mo-NX
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:46:48 -0500
Received: from [2a00:1450:4864:20::331] (port=38789
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD6z0-0008Ev-3m
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:46:48 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 o30-20020a05600c511e00b0034f4c3186f4so6210733wms.3
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 07:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZZJxnO0wXp3VlaW8QIoFJ6AD9P5ehX63O95QyB7R9Xw=;
 b=GPWmK26oRrRzo6qTxk1QnyLLJT4NOZ51/eaym8TtSnugj4hGzL90ExvfuzVc9g6u+f
 HrXACdgG3x9s3GHGKk8CbyemjfkS7+buruDKHg4tiHwujMWmwWagbBd0yth7bdLVndNd
 /H1Fmrcs0R3PCHv362NQL8bxgUGLeOuFTUAygmFUXaL1A3YPjFkeCHwmF/zNl5SpBnSn
 ojlNLnF582zccAm9AG0aluK5Iz03heLu5uKwJpSs6rrFPS+w5srepzXtsWO/2rs5HiFl
 H5PK4lyY6HjoTKkjrLBUtndHlj0/CEOaU0bZLHNXUTSbTkugLZ3M6igxI3ngvGn161Bs
 WYDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZZJxnO0wXp3VlaW8QIoFJ6AD9P5ehX63O95QyB7R9Xw=;
 b=L/ZOQ7uzIrv2FKuJizpataMvzsyOpbup946mWv3VncIRwvzJDRLzXgEYWloxqMa7ju
 PPUhHsWCx+mf08K79eVclwdk97/ANjvgWBrqxxXKykQMY9M8SxKd4FiBYiOMpM/UIpwq
 wuE2757sexdPRIpKWbOIQ/2Krh+7SRpv9eIa4pkJ2UbmKaAnBfPIg07jw7hNxwfgyU2K
 3KuMYGBiqcIzeSZ63TrEOIGoAe+Y4sDoYhWVGaxXpcoVdEkeMyRvGoPHEDF7+HsscDC+
 uzz2CfXJuPGMPP/2W3U+Mu7bk7qfNVy0AWAm6ZIiSQ5bYdTho2nltaBn7M7XvwxNGL+0
 8wAw==
X-Gm-Message-State: AOAM531DzqvPr31OWA0HAcifmOMEf24CaPdu2Oy1JZTwi5AgVG4TTWkH
 gXj7Xn/YxioK3IWCel6vxDY7OA==
X-Google-Smtp-Source: ABdhPJz+jcWzgkOcpwEuwX2uDv1cWRhnotOCJ9gwLl4eUVfb2yWuBXVo6uX+YQFRBCClzjzFSiG5Gw==
X-Received: by 2002:a05:600c:a4b:: with SMTP id
 c11mr12437091wmq.135.1643298404398; 
 Thu, 27 Jan 2022 07:46:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id w9sm6687667wmc.36.2022.01.27.07.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 07:46:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 01/16] target/arm: make psci-conduit settable after realize
Date: Thu, 27 Jan 2022 15:46:24 +0000
Message-Id: <20220127154639.2090164-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127154639.2090164-1-peter.maydell@linaro.org>
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Rob Herring <robh@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Andre Przywara <andre.przywara@arm.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Yanan Wang <wangyanan55@huawei.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to allow the psci-conduit property to be set after realize,
because the parts of the code which are best placed to decide if it's
OK to enable QEMU's builtin PSCI emulation (the board code and the
arm_load_kernel() function are distant from the code which creates
and realizes CPUs (typically inside an SoC object's init and realize
method) and run afterwards.

Since the DEFINE_PROP_* macros don't have support for creating
properties which can be changed after realize, change the property to
be created with object_property_add_uint32_ptr(), which is what we
already use in this function for creating settable-after-realize
properties like init-svtor and init-nsvtor.

Note that it doesn't conceptually make sense to change the setting of
the property after the machine has been completely initialized,
beacuse this would mean that the behaviour of the machine when first
started would differ from its behaviour when the system is
subsequently reset.  (It would also require the underlying state to
be migrated, which we don't do.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index cdbc4cdd012..5a9c02a2561 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1317,6 +1317,11 @@ void arm_cpu_post_init(Object *obj)
                                        OBJ_PROP_FLAG_READWRITE);
     }
 
+    /* Not DEFINE_PROP_UINT32: we want this to be settable after realize */
+    object_property_add_uint32_ptr(obj, "psci-conduit",
+                                   &cpu->psci_conduit,
+                                   OBJ_PROP_FLAG_READWRITE);
+
     qdev_property_add_static(DEVICE(obj), &arm_cpu_cfgend_property);
 
     if (arm_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER)) {
@@ -1987,7 +1992,6 @@ static ObjectClass *arm_cpu_class_by_name(const char *cpu_model)
 }
 
 static Property arm_cpu_properties[] = {
-    DEFINE_PROP_UINT32("psci-conduit", ARMCPU, psci_conduit, 0),
     DEFINE_PROP_UINT64("midr", ARMCPU, midr, 0),
     DEFINE_PROP_UINT64("mp-affinity", ARMCPU,
                         mp_affinity, ARM64_AFFINITY_INVALID),
-- 
2.25.1


