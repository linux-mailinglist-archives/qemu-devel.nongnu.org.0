Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCF469974A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 15:24:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSfAz-0005dh-7K; Thu, 16 Feb 2023 09:23:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSfAw-0005d6-LX
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:23:54 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSfAv-00079r-4h
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:23:54 -0500
Received: by mail-wm1-x32e.google.com with SMTP id r18so1678221wmq.5
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 06:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mp16C8opTjs5capPqEpUNYeRp9xjtzcoAR4MvUbLxj4=;
 b=H6p4daE/Kz3tCO31ndsJ/BJM2mMtyqWplOw7nhJDYtNnepPf6xGO8z87MEh4lqTIYv
 BggD/hXpaI5snCBZH5DlV1svBtmLWIEhE8RL7SiHo4v1MpNGyjr9Z9rsqBx4nPagxLQ0
 zJY0BmDTDiY8Uj9u2cPLm1uEkKP6/YZCT7oisyuYufzA3FvLbgc6SIFogHbDNtjV4GO/
 6VtmwpWunTGBLUO07MQMkgBPkmWpRGuK2XXOd4HR79/JNE+lVAjRCXNqFEgq9ntxJB+u
 pAyrIg6082amKhKrs/Jn+vD1ChIrbP2n7ac5IuLdY0nnNc0FaJ+926XuDCSiBNnXViJ4
 b3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mp16C8opTjs5capPqEpUNYeRp9xjtzcoAR4MvUbLxj4=;
 b=DCesnjjxmVgOPAqOgrZu0SeLg15OllIJ4c6dEy1+VMlHSshaN8cG8ORl2JsVznOeId
 aKkYWCmIc5Lo55/OlRNDyJMHjy3iksI5CtlrmHgqOvAgtWa0XkIdd5n9MySZDV2tWtZl
 O8ZPs2W+JI/cdr2FSWJmMiK7iIxlWk8sYrOlnOsUk5Rd+PKwi4tDuPfEPDUPczf3wMEM
 LuxuRNgrBcXn9AFPdLLWdFRAdfd0Iwk/fenKzmkgKav1d8SX8Au+/t9BhjAQLgRA8cge
 VeVdfjuR3AaINx6Bf5Pypa1xLMeccWXycf855boMAixt+POmliDYoRZ3EtPDbu77Gs6G
 DfiA==
X-Gm-Message-State: AO0yUKXWjbk/SJ3NShYPwz7Y0DLtfAaf9lEniM3Val+tSLbJNIU1JF5C
 JIRpW8gLicAZN3psp4wAS2pHApIsPOseXS3u
X-Google-Smtp-Source: AK7set8ovpStILq+IXLgnaen1PQ146dQ+ti5Wy/ucK86cF/OUvzH3RBwLW6OLeSsnqJCFhSIrU4W5A==
X-Received: by 2002:a05:600c:18a6:b0:3e2:f80:3df1 with SMTP id
 x38-20020a05600c18a600b003e20f803df1mr1794039wmp.19.1676557432074; 
 Thu, 16 Feb 2023 06:23:52 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a05600c348400b003df5be8987esm5562823wmq.20.2023.02.16.06.23.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 16 Feb 2023 06:23:51 -0800 (PST)
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
Subject: [PATCH 2/5] hw/cpu/cluster: Only add CPU objects to CPU cluster
Date: Thu, 16 Feb 2023 15:23:35 +0100
Message-Id: <20230216142338.82982-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230216142338.82982-1-philmd@linaro.org>
References: <20230216142338.82982-1-philmd@linaro.org>
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

Do not recursively add CPU and all their children objects.
Simply iterate on the cluster direct children, which must
be of TYPE_CPU. Otherwise raise an error.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/cpu/cluster.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/hw/cpu/cluster.c b/hw/cpu/cluster.c
index bf3e27e945..b0cdf7d931 100644
--- a/hw/cpu/cluster.c
+++ b/hw/cpu/cluster.c
@@ -39,12 +39,19 @@ typedef struct CallbackData {
 static bool add_cpu_to_cluster(Object *obj, void *opaque, Error **errp)
 {
     CallbackData *cbdata = opaque;
-    CPUState *cpu = (CPUState *)object_dynamic_cast(obj, TYPE_CPU);
+    CPUState *cpu;
 
-    if (cpu) {
-        cpu->cluster_index = cbdata->cluster->cluster_id;
-        cbdata->cpu_count++;
+    cpu = (CPUState *)object_dynamic_cast(obj, TYPE_CPU);
+    if (!cpu) {
+        error_setg(errp, "cluster %s can only accept CPU types (got %s)",
+                   object_get_canonical_path(OBJECT(cbdata->cluster)),
+                   object_get_typename(obj));
+        return false;
     }
+
+    cpu->cluster_index = cbdata->cluster->cluster_id;
+    cbdata->cpu_count++;
+
     return true;
 }
 
@@ -63,8 +70,9 @@ static void cpu_cluster_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    object_child_foreach_recursive(cluster_obj, add_cpu_to_cluster,
-                                   &cbdata, NULL);
+    if (!object_child_foreach(cluster_obj, add_cpu_to_cluster, &cbdata, errp)) {
+        return;
+    }
 
     /*
      * A cluster with no CPUs is a bug in the board/SoC code that created it;
-- 
2.38.1


