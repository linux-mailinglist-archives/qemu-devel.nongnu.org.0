Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C4F699749
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 15:24:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSfBE-0005gU-B0; Thu, 16 Feb 2023 09:24:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSfB3-0005fO-CI
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:24:02 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSfB1-0007DH-In
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:24:01 -0500
Received: by mail-wr1-x431.google.com with SMTP id a2so2014395wrd.6
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 06:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TZ4uzPiIvaikQ5NFFcOsPUHe0pcwccK15cuAkxemPTA=;
 b=JArp8dD4R8i9ifo9Kg88q6SCj/BK1wTc2w+bvfRsuUg2ItI2ElysT+3mjeNwa8TTt9
 4ogl0/DxDGnr80jQwyUjDHT7W4sOIlYC4hzDq9QtxOEoCF53Zq50ui4MGI1mARCvpS6l
 Bz0U03E0DTPSCq5i/4xEOmtEHMY0Rqd1cq3OHYdZZeawxLrAxweQg7JgrgKjUvcUMD15
 6jI7PKtyt2UNcqNa8RQ4wtGkkUOK6hHPwcLF7JGpD9+srXEQK9GpAQzTt/bsedZ3yerz
 sNhWUug7bTQnU4Bj6i1/Z75gbbUeffCIM4a0Q4qpraXRHkaXWuqhF99e5hcpCw6Bqw6Y
 AXYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TZ4uzPiIvaikQ5NFFcOsPUHe0pcwccK15cuAkxemPTA=;
 b=cEig4Io4l/zeNkCW0rY5SBhRHdQcuFX2NeIxbcS1hJgedBuSWoLLuyuXELtveRrTpe
 saQn8z3XrE1XV8/jfA8dMFpoCaKtymP5iPC5qptnrtwHSpqQ9VBhN4kb3bJYd6bA+2hM
 lhk3Vq3/jhMocb5bmsCJR4bFsIN/H+Mnw7/wqQM5VqG7Iyk8gVVaXw9U8E00Tk2PTOsc
 qwndOWhxKTaETF7HVGwjMs676qUjUA9f6l3fYhPDlsH/QoKqC+0avuMYE6+HS8bP6Yby
 pgyfj8jBYlNv2oSw+6s+MPxNlNQlnZO3/v4i98T6vDU2fD/yv/G7YLMRiHNKnM4RzEZN
 I2ng==
X-Gm-Message-State: AO0yUKUCksHjfmIv/FEReSAosARp2+QFuhjuGvK274tnakk9WnNofFXN
 eBqOUyn2Lt2DM38pQHdnXJRYJIST31Qx+L5u
X-Google-Smtp-Source: AK7set8XlXGDEcTFxARBu57Ip2Ufhe6qVEFVF5ij33wD24nwWwNzihpnZ+ZkKjS9nTycV0iezXPFdQ==
X-Received: by 2002:adf:f092:0:b0:2c5:4af3:3d26 with SMTP id
 n18-20020adff092000000b002c54af33d26mr4287485wro.9.1676557437923; 
 Thu, 16 Feb 2023 06:23:57 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a1c7902000000b003dd1bd66e0dsm1879797wme.3.2023.02.16.06.23.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 16 Feb 2023 06:23:57 -0800 (PST)
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
Subject: [PATCH 3/5] hw/cpu/cluster: Restrict CPU cluster to a particular CPU
 type
Date: Thu, 16 Feb 2023 15:23:36 +0100
Message-Id: <20230216142338.82982-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230216142338.82982-1-philmd@linaro.org>
References: <20230216142338.82982-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

CPU cluster id is used by TCG accelerator to "group" CPUs
sharing the same ISA features, so TranslationBlock can be
shared between the cluster (see commit f7b78602fd "accel/tcg:
Add cluster number to TCG TB hash"). This mean we shouldn't
mix different kind of CPUs into the same cluster.

Enforce that by adding a 'cpu-type' property. The cluster's
realize() method will check all children are of that 'cpu-type'
class.

If the property is not set, the first CPU added to a cluster
sets its CPU type, and only that type fo CPU can be added.

Example of error:

  qemu-system-aarch64: cluster /machine/soc/rpu-cluster can only accept cortex-r5f-arm-cpu CPUs (got cortex-a9-arm-cpu)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/cpu/cluster.c         | 19 ++++++++++++++++---
 include/hw/cpu/cluster.h |  1 +
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/hw/cpu/cluster.c b/hw/cpu/cluster.c
index b0cdf7d931..0d06944824 100644
--- a/hw/cpu/cluster.c
+++ b/hw/cpu/cluster.c
@@ -28,6 +28,7 @@
 
 static Property cpu_cluster_properties[] = {
     DEFINE_PROP_UINT32("cluster-id", CPUClusterState, cluster_id, 0),
+    DEFINE_PROP_STRING("cpu-type", CPUClusterState, cpu_type),
     DEFINE_PROP_END_OF_LIST()
 };
 
@@ -41,11 +42,17 @@ static bool add_cpu_to_cluster(Object *obj, void *opaque, Error **errp)
     CallbackData *cbdata = opaque;
     CPUState *cpu;
 
-    cpu = (CPUState *)object_dynamic_cast(obj, TYPE_CPU);
+    if (cbdata->cluster->cpu_type == NULL) {
+        /* If no 'cpu-type' property set, enforce it with the first CPU added */
+        assert(object_dynamic_cast(obj, TYPE_CPU) != NULL);
+        cbdata->cluster->cpu_type = g_strdup(object_get_typename(obj));
+    }
+
+    cpu = (CPUState *)object_dynamic_cast(obj, cbdata->cluster->cpu_type);
     if (!cpu) {
-        error_setg(errp, "cluster %s can only accept CPU types (got %s)",
+        error_setg(errp, "cluster %s can only accept %s CPUs (got %s)",
                    object_get_canonical_path(OBJECT(cbdata->cluster)),
-                   object_get_typename(obj));
+                   cbdata->cluster->cpu_type, object_get_typename(obj));
         return false;
     }
 
@@ -69,6 +76,12 @@ static void cpu_cluster_realize(DeviceState *dev, Error **errp)
         error_setg(errp, "cluster-id must be less than %d", MAX_CLUSTERS);
         return;
     }
+    if (cluster->cpu_type) {
+        if (object_class_is_abstract(object_class_by_name(cluster->cpu_type))) {
+            error_setg(errp, "cpu-type must be a concrete class");
+            return;
+        }
+    }
 
     if (!object_child_foreach(cluster_obj, add_cpu_to_cluster, &cbdata, errp)) {
         return;
diff --git a/include/hw/cpu/cluster.h b/include/hw/cpu/cluster.h
index 53fbf36af5..c9792d6f05 100644
--- a/include/hw/cpu/cluster.h
+++ b/include/hw/cpu/cluster.h
@@ -76,6 +76,7 @@ struct CPUClusterState {
 
     /*< public >*/
     uint32_t cluster_id;
+    char *cpu_type;
 };
 
 #endif
-- 
2.38.1


