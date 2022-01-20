Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BB9495387
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 18:49:40 +0100 (CET)
Received: from localhost ([::1]:48840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAbZ5-0000Wl-6n
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 12:49:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgJ-00046g-3O
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:36:47 -0500
Received: from [2a00:1450:4864:20::32b] (port=37552
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgC-00038Q-KR
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:36:42 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso21597878wmj.2
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 04:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=QRlPMZ+3SOWpYRDLtqqPsi0l9673RnCh6jSali9P81o=;
 b=DAAvGH/4Rjc9uzvlakUsp+fhlZLwx8UVa4LYWJevhGS2phn2evzZ1DxjJZHKbv+J3u
 2nw9Q6jaBizUOb6R3196uluChOkv3EadmRIEnRClRFVPJbjorYy3W3Jhn+qC/WoF+rB1
 EdokTSjTVstLGOsKkIH0UC3j5UIGrG9+4ZKKuBBUskXp8yqWw5sDLsbXPavCcYUeDxzr
 DFrcxqzXBQhogTO1lodPaaNYUp75Yjn1KKPhi6mq3MS/3Geip5+TQTvVQ2CESvhwUUSa
 UAY/3dTY8bLw3gqTMX4mN6gdpOm3mmzT4eXLkHx8dWBiXtC1pl+t9vwp/P+dToXiY9s+
 FDOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QRlPMZ+3SOWpYRDLtqqPsi0l9673RnCh6jSali9P81o=;
 b=ZbBxLFC7GiB8iwcJk6fTOCuLPjbYvKSEkhEz4v0E7YDWH9vJoBKCj+I7u3BJiF6RPQ
 RqeFELTXKjhV1E69ivLJSc+nqnKmPASwsYIIE3wAACFqFKxh9O8T+kLfJNTM3coKNNz9
 iol5X6hdK5Nt0gMA1h0YFyvwTkyTnW9HWHtbTU4Km/Ft/2zF7rlbVrDT93xE21xQONPA
 NX4ESalujDeMDykWxGE7V+RN6Z/Ehf2BxWcNj3badEH+TlpRQvz4zxPtdkwV7l97/6tH
 YInM6JpMUAElRwWiIpg4RZ3rmvYUTb6siArMBdmZc/ObvrHHw+mgK49jaDyN3+++ucRG
 qNrw==
X-Gm-Message-State: AOAM530Rk/wxjTZNIG8QbNPpJIu8SuQOrJMN4CTrIy2j+i2NjJkN1EH+
 c+B7mLBqGDMtd+ycZmOafgvyifCTF0fmbg==
X-Google-Smtp-Source: ABdhPJwk1JnA4y/jEvwLC67yxDAECskbE6XHIhbYjWZlegWTtIrw2qyooF0Po6Q0WhknLEb4pYBePA==
X-Received: by 2002:a5d:61d2:: with SMTP id q18mr726143wrv.547.1642682198206; 
 Thu, 20 Jan 2022 04:36:38 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t8sm7993324wmq.43.2022.01.20.04.36.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 04:36:37 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/38] hw/arm/virt: Support cluster level in DT cpu-map
Date: Thu, 20 Jan 2022 12:35:58 +0000
Message-Id: <20220120123630.267975-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120123630.267975-1-peter.maydell@linaro.org>
References: <20220120123630.267975-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yanan Wang <wangyanan55@huawei.com>

Support one cluster level between core and physical package in the
cpu-map of Arm/virt devicetree. This is also consistent with Linux
Doc "Documentation/devicetree/bindings/cpu/cpu-topology.txt".

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Message-id: 20220107083232.16256-3-wangyanan55@huawei.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 688d8736909..177db1da12e 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -434,9 +434,8 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
          * can contain several layers of clustering within a single physical
          * package and cluster nodes can be contained in parent cluster nodes.
          *
-         * Given that cluster is not yet supported in the vCPU topology,
-         * we currently generate one cluster node within each socket node
-         * by default.
+         * Note: currently we only support one layer of clustering within
+         * each physical package.
          */
         qemu_fdt_add_subnode(ms->fdt, "/cpus/cpu-map");
 
@@ -446,14 +445,16 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
 
             if (ms->smp.threads > 1) {
                 map_path = g_strdup_printf(
-                    "/cpus/cpu-map/socket%d/cluster0/core%d/thread%d",
-                    cpu / (ms->smp.cores * ms->smp.threads),
+                    "/cpus/cpu-map/socket%d/cluster%d/core%d/thread%d",
+                    cpu / (ms->smp.clusters * ms->smp.cores * ms->smp.threads),
+                    (cpu / (ms->smp.cores * ms->smp.threads)) % ms->smp.clusters,
                     (cpu / ms->smp.threads) % ms->smp.cores,
                     cpu % ms->smp.threads);
             } else {
                 map_path = g_strdup_printf(
-                    "/cpus/cpu-map/socket%d/cluster0/core%d",
-                    cpu / ms->smp.cores,
+                    "/cpus/cpu-map/socket%d/cluster%d/core%d",
+                    cpu / (ms->smp.clusters * ms->smp.cores),
+                    (cpu / ms->smp.cores) % ms->smp.clusters,
                     cpu % ms->smp.cores);
             }
             qemu_fdt_add_path(ms->fdt, map_path);
-- 
2.25.1


