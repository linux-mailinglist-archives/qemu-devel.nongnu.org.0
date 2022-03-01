Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC814C985E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 23:28:24 +0100 (CET)
Received: from localhost ([::1]:58194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPAyk-0006o6-Sz
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 17:28:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPAXq-0001g2-Cn
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:00:34 -0500
Received: from [2607:f8b0:4864:20::62a] (port=41688
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPAXo-00059G-QA
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:00:34 -0500
Received: by mail-pl1-x62a.google.com with SMTP id z2so14581734plg.8
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 14:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iLI26UK0ClZ5ceLdr/V+YxsQZY+vXN5fVFJqBZWb1js=;
 b=GfFDE2bFDZ+5PPhFBgKKvyFW2AVfDfF5JcHtKMFiV2VTtvKhIC9AcyMWZQf1ubJnVK
 TOYfmT954iUkgtYMP2oDkexrhe+lVgu9nttCCNB5evxfWm/4kiBaGu0cvpowwMiKXfQy
 FJbIvZirlcjatMpvCRwYDWy29Yrl0canwp9rQ2H6EcNXtdr15bWBhvq8I+D5N2ZwjZVb
 hIIYYv4vV/yu5EfXyLjgV+gMN5SsCMTMvnzOkrWYY3PPVaWRzBAm8bEPCGj7LyT/hS4s
 yG2p5g/gSp6oYsuPRq8ebLkgCy43k+/PZ6CS15Vgz0rzDXagSesqvFP2xdnJV7hiShmK
 9Ojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iLI26UK0ClZ5ceLdr/V+YxsQZY+vXN5fVFJqBZWb1js=;
 b=yc4FQqojpMQapoYVWhFY3Jw5/6tFKKHogebOafBTXHljF+b1EfG/Vpnv7tUaudjiuv
 GCGiCPYXbBLuP155KzUfSJ6egrlGZuR/PyGZ279kocr0QHhhI1UERDr3MP2hkIxe4Pdx
 5i8mAsKf5QERFtliUgGoQexWLnrvdxsiY/DVkdMlatb/qK4CfRLhvLvJUxZ+zyrs+J15
 3t+C0zPEDKmjH5S2EB2R/Q3Fx55E4A1HyxOvCX77OcZc4sgWpYw8PLQcEW/IoBaCZSoJ
 xAJvgYxTN1MErxi60geWz0vELzCdiscVsrh1c19cs2iFjKIq6rnhzeKCDVBiOwi9Ozkx
 oMdg==
X-Gm-Message-State: AOAM533xJEl47BtFQ1b4dIy8BogL9THXAL4N4yUYSKSWfB7TU5fHbc+y
 kaYmpE48Ys6sQVOufyfx8iBCGV+dSqMyVA==
X-Google-Smtp-Source: ABdhPJygwAFOEOCRH+heEJWiAr3FTKgqIS8lf27Ehxa4julYAdm0dNBwHw1PCfAby02wmqOOISTeaQ==
X-Received: by 2002:a17:902:ea05:b0:150:1294:cd91 with SMTP id
 s5-20020a170902ea0500b001501294cd91mr28201707plg.112.1646172031520; 
 Tue, 01 Mar 2022 14:00:31 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 m4-20020a17090a7f8400b001bef3fc3938sm284392pjl.49.2022.03.01.14.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 14:00:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 18/18] hw/arm/virt: Disable LPA2 for -machine virt-6.2
Date: Tue,  1 Mar 2022 11:59:58 -1000
Message-Id: <20220301215958.157011-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301215958.157011-1-richard.henderson@linaro.org>
References: <20220301215958.157011-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is a Linux kernel bug present until v5.12 that prevents
booting with FEAT_LPA2 enabled.  As a workaround for TCG,
disable this feature for machine versions prior to 7.0.

Cc: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/arm/virt.h | 1 +
 hw/arm/virt.c         | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index c1ea17d0de..7e76ee2619 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -132,6 +132,7 @@ struct VirtMachineClass {
     bool no_secure_gpio;
     /* Machines < 6.2 have no support for describing cpu topology to guest */
     bool no_cpu_topology;
+    bool no_tcg_lpa2;
 };
 
 struct VirtMachineState {
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 46bf7ceddf..46a42502bc 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2102,6 +2102,10 @@ static void machvirt_init(MachineState *machine)
             object_property_set_bool(cpuobj, "pmu", false, NULL);
         }
 
+        if (vmc->no_tcg_lpa2 && object_property_find(cpuobj, "lpa2")) {
+            object_property_set_bool(cpuobj, "lpa2", false, NULL);
+        }
+
         if (object_property_find(cpuobj, "reset-cbar")) {
             object_property_set_int(cpuobj, "reset-cbar",
                                     vms->memmap[VIRT_CPUPERIPHS].base,
@@ -3020,8 +3024,11 @@ DEFINE_VIRT_MACHINE_AS_LATEST(7, 0)
 
 static void virt_machine_6_2_options(MachineClass *mc)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
+
     virt_machine_7_0_options(mc);
     compat_props_add(mc->compat_props, hw_compat_6_2, hw_compat_6_2_len);
+    vmc->no_tcg_lpa2 = true;
 }
 DEFINE_VIRT_MACHINE(6, 2)
 
-- 
2.25.1


