Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE2C4AD839
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 13:19:31 +0100 (CET)
Received: from localhost ([::1]:41040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHPT0-000314-M1
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 07:19:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqm-0000iZ-Qj
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:02 -0500
Received: from [2a00:1450:4864:20::332] (port=45982
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqi-00023p-59
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:39:59 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 j5-20020a05600c1c0500b0034d2e956aadso1393813wms.4
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=vq/df6xgkKKAE6qKHg9aukmBZl7u0CV6QFgmU7R9Q6U=;
 b=cb1+xAdAmyaRkS57gasjBDqUic+MQX1mBJcpzMBaTISJB11aK2X5RFG1WP0hEV9AE4
 zI8g/byaNpXfStch0TfbQpbLg2yOi1sC9Vc/JvS0EYaLbZKunqnUq/zXeNynCFpJiJJR
 wDQNEihqIR17tMG03gJFCbzKDxXzcdKW6ttzcxzrv/r8Jph/KfgJJsOzPw4jf7MB4o06
 A0YpGZVS2e4Cy9mUJp6LHLwb1NussMpBjsf+1aTyXM1lPrmkw5UD/doYAQ2islB/XuKX
 IwayqdGChWjfPVbUaeOz5S+tLdJKRAvYMtMQm0I484kUOhQdgYKmyg/72aVkzEtqz32S
 MttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vq/df6xgkKKAE6qKHg9aukmBZl7u0CV6QFgmU7R9Q6U=;
 b=vxPebksiFV3Os/1z3eg2UIXQv9iexOEZZRZi8iWFYqxdVAZjaE5n2Z3w+OmLPoIEaM
 zeu3KN1ywOItVVtABwA1+P6Q86ObwkInfTtCRu+8X5ylcsTEShd6DrKoBFVpqg3Wh0rl
 Qg99sI9z8CCxIUjXHRv7yr92JoBLJub1nzELgUJVPFXCQ8LH4acthnDchwps2cecGk+J
 7dKlbp1sqrNbV0NIbr7eZbrZaUatsLR8vMFCvehsXwkyPkMvWxTvq5AjShDRMzZwBYB7
 rEX5uXRCDx8iLRvWseKIgyAeUMXwz02O8ETIAcKOTsUVqymNLuE7Ieb92t6JHieMlY1Q
 1WRQ==
X-Gm-Message-State: AOAM531b5nHyzSVg/QRy+RREWjVeobrXhy3xd1TtRjP7t5of3DgTGZ0Q
 p95sdOCn+RInY42jtXPlF4IkAJjoJhWmnA==
X-Google-Smtp-Source: ABdhPJzTsz03sFXkm7MBDJlixugisF5NbC5rAkeOQYH/B/VEq1NXULIncaGpuoap7hx2cJ0k3zBhdQ==
X-Received: by 2002:a7b:c7c3:: with SMTP id z3mr786123wmk.68.1644320394224;
 Tue, 08 Feb 2022 03:39:54 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id r11sm4245199wrt.28.2022.02.08.03.39.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 03:39:53 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/39] target/arm: make psci-conduit settable after realize
Date: Tue,  8 Feb 2022 11:39:15 +0000
Message-Id: <20220208113948.3217356-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208113948.3217356-1-peter.maydell@linaro.org>
References: <20220208113948.3217356-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Cédric Le Goater <clg@kaod.org>
Message-id: 20220127154639.2090164-2-peter.maydell@linaro.org
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


