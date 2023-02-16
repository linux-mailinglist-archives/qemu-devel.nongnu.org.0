Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D47169974B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 15:24:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSfBS-00063W-21; Thu, 16 Feb 2023 09:24:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSfBE-0005ll-KN
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:24:16 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSfBC-0007BX-7g
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:24:11 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 k8-20020a05600c1c8800b003dc57ea0dfeso4372643wms.0
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 06:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AgNv7jvYIv3Rzz9yuX+hevsRvmOvV3oj8SZGxY0IVW0=;
 b=l+8FD4H3zVooq0SzPC/ib6S6JI3vQSFaDYPJYAWNN0G+qHz7Jf5NpxUWs1mf+Vgdmq
 pomqy0+Uj9oETTzlrdROIrXgwM9MjfW/lBzRRmVHfc1YBuyoiZ3TP/yFOsCpp2scjQii
 YntcrG6Lr09VS/vtBKjYh0GpV/ZLKyidKdXCvYURsiNdPAXL55vXMQ6Drq4cD2PUoYIy
 7aWBBzM9fej+amgrmRIDGjjI+ejfs3jaYbuEMNctFL7vkgwrCtzUrQmcAIoH+DPrX4OL
 7tAJCuzH5ZKYfdZi3yGO6rB53deKCLJmiktbTijzDwYb/l/C5dLrCzLNS12iZidBxcl4
 8UoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AgNv7jvYIv3Rzz9yuX+hevsRvmOvV3oj8SZGxY0IVW0=;
 b=cR+3X4NfKMicmIGDNetvrCRF7H53DJOIJdmgcNqFLFgr3GRjIEcVG8VtiYYoNroVpQ
 QVTqQ1Zjs6/aQTuiRcv4exU/uNjbDrxuD9yNA3zKXVFAOmh51jtnJ5h0yKswhTpRqwbO
 tODWr71audqNerDcAzWUDeXBtXB9f1EQjuwF6RyWpmWocVU3jSHOT5Zw4ffwsntuIcKu
 2CvMKWlaudt7vjTcnd5/po4zA/+Ud+q2+6kvG8H+sXfEg1Zo25x7LXnU92b3J9LGe+zH
 2c5lYeSozYCftWUnS1kS7WXb/ctxuK9L1C2g4aekqyRRWkN5sIWgbPFr0neuHcUHkwhj
 0yRQ==
X-Gm-Message-State: AO0yUKWNGKCPFT33bEbZeyYzGUAp3FC63BZ4p7rRwmIs+f7tf0ww2jge
 UlZhVrtGzTAIN3nqWjI9CHVW4MAAHqj0qzbt
X-Google-Smtp-Source: AK7set/UWYHmFPqEOMIV//qApgjFDnwnf390ffK0+E8AnuyibGwHyodYaDcVG/wvJsI1eeeqsteqlA==
X-Received: by 2002:a05:600c:4f52:b0:3df:d431:cf64 with SMTP id
 m18-20020a05600c4f5200b003dfd431cf64mr4667921wmq.39.1676557449269; 
 Thu, 16 Feb 2023 06:24:09 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 bd27-20020a05600c1f1b00b003e20cf0408esm1908939wmb.40.2023.02.16.06.24.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 16 Feb 2023 06:24:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Dapeng Mi <dapeng1.mi@intel.com>, Sean Christopherson <seanjc@google.com>,
 Bin Meng <bin.meng@windriver.com>,
 Zhuocheng Ding <zhuocheng.ding@intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Zhenyu Wang <zhenyu.z.wang@intel.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Zhao Liu <zhao1.liu@intel.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Yanan Wang <wangyanan55@huawei.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Like Xu <like.xu.linux@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Zhao Liu <zhao1.liu@linux.intel.com>, Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH 5/5] hw/riscv: Restrict CPU clusters to the expected type
Date: Thu, 16 Feb 2023 15:23:38 +0100
Message-Id: <20230216142338.82982-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230216142338.82982-1-philmd@linaro.org>
References: <20230216142338.82982-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Microchip PolarFire SoC expects U51/U54 cores,
the SiFive Freedom board: the E31/E51 and U34/U54.

Do not allow any other CPU type by setting the cluster
'cpu-type' property.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/riscv/microchip_pfsoc.c | 4 ++++
 hw/riscv/sifive_u.c        | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 2b91e49561..658307fdfb 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -150,6 +150,8 @@ static void microchip_pfsoc_soc_instance_init(Object *obj)
 
     object_initialize_child(obj, "e-cluster", &s->e_cluster, TYPE_CPU_CLUSTER);
     qdev_prop_set_uint32(DEVICE(&s->e_cluster), "cluster-id", 0);
+    qdev_prop_set_string(DEVICE(&s->e_cluster), "cpu-type",
+                         TYPE_RISCV_CPU_SIFIVE_E51);
 
     object_initialize_child(OBJECT(&s->e_cluster), "e-cpus", &s->e_cpus,
                             TYPE_RISCV_HART_ARRAY);
@@ -161,6 +163,8 @@ static void microchip_pfsoc_soc_instance_init(Object *obj)
 
     object_initialize_child(obj, "u-cluster", &s->u_cluster, TYPE_CPU_CLUSTER);
     qdev_prop_set_uint32(DEVICE(&s->u_cluster), "cluster-id", 1);
+    qdev_prop_set_string(DEVICE(&s->e_cluster), "cpu-type",
+                         TYPE_RISCV_CPU_SIFIVE_U54);
 
     object_initialize_child(OBJECT(&s->u_cluster), "u-cpus", &s->u_cpus,
                             TYPE_RISCV_HART_ARRAY);
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index d3ab7a9cda..d0535746ca 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -763,6 +763,7 @@ static void sifive_u_soc_instance_init(Object *obj)
 
     object_initialize_child(obj, "e-cluster", &s->e_cluster, TYPE_CPU_CLUSTER);
     qdev_prop_set_uint32(DEVICE(&s->e_cluster), "cluster-id", 0);
+    qdev_prop_set_string(DEVICE(&s->e_cluster), "cpu-type", SIFIVE_E_CPU);
 
     object_initialize_child(OBJECT(&s->e_cluster), "e-cpus", &s->e_cpus,
                             TYPE_RISCV_HART_ARRAY);
@@ -813,6 +814,7 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
      * CPU must exist and have been parented into the cluster before the
      * cluster is realized.
      */
+    qdev_prop_set_string(DEVICE(&s->u_cluster), "cpu-type", s->cpu_type);
     qdev_realize(DEVICE(&s->e_cluster), NULL, &error_abort);
     qdev_realize(DEVICE(&s->u_cluster), NULL, &error_abort);
 
-- 
2.38.1


