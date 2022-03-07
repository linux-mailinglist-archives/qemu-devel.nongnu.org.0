Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E504D049F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 17:54:55 +0100 (CET)
Received: from localhost ([::1]:58540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRGdK-0001sL-Qj
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 11:54:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRGWB-00023Y-KD
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:47:33 -0500
Received: from [2a00:1450:4864:20::42d] (port=43538
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRGW8-0007mo-BE
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:47:29 -0500
Received: by mail-wr1-x42d.google.com with SMTP id e24so11303259wrc.10
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 08:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=rQyfB/hnr8PD3XNGQDMI+Pr8j6F6XBEv5eRGs9i8nt8=;
 b=D10jSVS475FnNaqQh2gJODWNdi1neVRNrKh53wfYyDUs+tiW/M7zdjfMwtlKeAZEKs
 VXrfpT63vUe30Bs6R6VJEKooRm8UI26e6wEKrWGTXtQUJfJrKkgXS0kVlcZYPd0m2myX
 tqNy7NM2OSPiP9D/Xfaqi7Ybe/b4eZ4XcskAQdYO0j+JlxvBRmL3KwI/IbuzsrLz0m2L
 YHXSn2jOazIt2iyzhxD9CdwmcyMsYYNkAhnosk4i8zC3DOq8XUCjOWmNCCpIoVS1fBjP
 K9gq9s9FQf++OYd4DalwzpuHciybry3EPTzF2F3t70+GuKJsnC9lJa/KcatG82l1HbjS
 /2Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rQyfB/hnr8PD3XNGQDMI+Pr8j6F6XBEv5eRGs9i8nt8=;
 b=4n4AnLhPdzGYt/k0TG5rwQtAUnW5cpwXLJit4O5Oy7wQte8+r7JxLLwYY7d8TInmeW
 oPARBXLW30vHhzGo2HgZs5kBq+PAMoFqzbRYiF3QNtirpsgdfRqeQ8rP9NM3uAevd5Nc
 HmE2ovWr5uzKZVbysj3W6X1PYXSU7KD1wxX8cU0kNMFflqTNNEJBikyyUR/XEy/nAoQE
 kpVrPNeBh/xA07+kj/m9rxLDMBHcObvAhmaoXmm2XKh5sLL9FuqyBqQuvCj76fr7SAoo
 k2pJRXNKzMomxAgOvjbAGSTNUeGaGYl8hmHouREMmXqt+BJ2h+MxGqnWKuAfA4cWmEm7
 xO3A==
X-Gm-Message-State: AOAM531RB07f2amgiPRuIR35K8Aq7++PIEudNHmhpvqoEQ12VaFipQPd
 gs2pOhIe/fBpe3QMvTQkyM/4V1xYVkpctw==
X-Google-Smtp-Source: ABdhPJyKeUTbsSK8hdf3HcsCMZSIPJ98z8/0O17kpLVYybnDr1eyhDTv43f8WVnNEOUQRMogio3LMQ==
X-Received: by 2002:a05:6000:1206:b0:1f1:e68d:a72b with SMTP id
 e6-20020a056000120600b001f1e68da72bmr6537274wrx.368.1646671647036; 
 Mon, 07 Mar 2022 08:47:27 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v188-20020a1cacc5000000b00384b71a50d5sm13806652wme.24.2022.03.07.08.47.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 08:47:26 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/18] hw/arm/virt: Disable LPA2 for -machine virt-6.2
Date: Mon,  7 Mar 2022 16:47:09 +0000
Message-Id: <20220307164709.2503250-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307164709.2503250-1-peter.maydell@linaro.org>
References: <20220307164709.2503250-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

There is a Linux kernel bug present until v5.12 that prevents
booting with FEAT_LPA2 enabled.  As a workaround for TCG,
disable this feature for machine versions prior to 7.0.

Cc: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/virt.h | 1 +
 hw/arm/virt.c         | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index c1ea17d0def..7e76ee26198 100644
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
index 46bf7ceddf3..46a42502bc5 100644
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


