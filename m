Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B514A495244
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 17:23:34 +0100 (CET)
Received: from localhost ([::1]:43324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAaDl-00032E-BS
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 11:23:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgJ-00046T-1M
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:36:47 -0500
Received: from [2a00:1450:4864:20::331] (port=43642
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgA-00038B-VL
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:36:41 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 e9-20020a05600c4e4900b0034d23cae3f0so13398144wmq.2
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 04:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=a8FVRNOZ9o8qruWDr+i0LLRC1Db87DIJZkRZ+SFtA/4=;
 b=kafEIF6Gu2QblYdqu4L4O3+S15smUd0O05ZrhYojM8DDBft8S8NJAx1OHeXukCKizc
 T0EcdTYzMpSw7gLVHWNvmjuR4Z2MJSdrv70AcClajsFplLCOOwN1RRCdAVacRm/Nhfbx
 nUkpKJ+1+s8hmjz2rU3pxfUDghPdmZ7Co8u/ARtoj76hMJM6VzzvA2CNraDUVUfkCNln
 Y/LC/n/3jnPMP0+h14OU35URFpZO22cjPkmSF0+CRh6XK2JghfgSrvYSaaY9+VxKhmLu
 itBSSNPz9uSCnxvHa5qDlvdlWi3ByyN3ZV+egFVZmgy+Hw6vdgVTnweZZOpjOYM3SwaX
 y+yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a8FVRNOZ9o8qruWDr+i0LLRC1Db87DIJZkRZ+SFtA/4=;
 b=OoOq5OLa8EAMu+xEZon/Nkc5H/jY+MctOkD0fPeF4MUzIdSVxeFNp9YEr8VgYG7Ziw
 NoW85yjqdXpC6Zq+QiMk3PLnGYi9LYPp5irMHlRKcsMyU9lirOYgY/VKIaNtogICP/ea
 rhXNXGvoGL+xTHk0QZaYy6qRqAZfzBQLLDYDq6uFUnYSi0KxJ4IW7YGKyd2wXy8Wafg5
 x4mxY3r5B60WAZJfugOc7VJD0csctXbh1E8sRaaimYvYYQicgZOosepCfpdaheHr5R0I
 984xE9TBVMVqAgZ+oIqZHGROhEtulWGGzBiBJKk52LvBEwv2rwP9AGLrOdX2KPgm2iDb
 vRUA==
X-Gm-Message-State: AOAM533AbMTi64n9m8V2uObig98NsdaLUdY9Nb8hIFCqcPIJZuA3krj/
 X/RAdW3ZIlWOgITWgjZW7cP5PKavyMbiCg==
X-Google-Smtp-Source: ABdhPJzjpu6OxiSkbf7LcwlcUHSy13m8rprp88IGwCihfHKz7tHcB1hYXEUTVCG/RqNGXyxEYuS2xg==
X-Received: by 2002:adf:e2cc:: with SMTP id d12mr33055494wrj.107.1642682197418; 
 Thu, 20 Jan 2022 04:36:37 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t8sm7993324wmq.43.2022.01.20.04.36.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 04:36:37 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/38] hw/arm/virt: Support CPU cluster on ARM virt machine
Date: Thu, 20 Jan 2022 12:35:57 +0000
Message-Id: <20220120123630.267975-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120123630.267975-1-peter.maydell@linaro.org>
References: <20220120123630.267975-1-peter.maydell@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yanan Wang <wangyanan55@huawei.com>

ARM64 machines like Kunpeng Family Server Chips have a level
of hardware topology in which a group of CPU cores share L3
cache tag or L2 cache. For example, Kunpeng 920 typically
has 6 or 8 clusters in each NUMA node (also represent range
of CPU die), and each cluster has 4 CPU cores. All clusters
share L3 cache data, but CPU cores in each cluster share a
local L3 tag.

Running a guest kernel with Cluster-Aware Scheduling on the
Hosts which have physical clusters, if we can design a vCPU
topology with cluster level for guest kernel and then have
a dedicated vCPU pinning, the guest will gain scheduling
performance improvement from cache affinity of CPU cluster.

So let's enable the support for this new parameter on ARM
virt machines. After this patch, we can define a 4-level
CPU hierarchy like: cpus=*,maxcpus=*,sockets=*,clusters=*,
cores=*,threads=*.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Message-id: 20220107083232.16256-2-wangyanan55@huawei.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c   |  1 +
 qemu-options.hx | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 84c2444fff6..688d8736909 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2718,6 +2718,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     hc->unplug_request = virt_machine_device_unplug_request_cb;
     hc->unplug = virt_machine_device_unplug_cb;
     mc->nvdimm_supported = true;
+    mc->smp_props.clusters_supported = true;
     mc->auto_enable_numa_with_memhp = true;
     mc->auto_enable_numa_with_memdev = true;
     mc->default_ram_id = "mach-virt.ram";
diff --git a/qemu-options.hx b/qemu-options.hx
index ec90505d84e..ba3ae6a42aa 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -277,6 +277,16 @@ SRST
 
         -smp 16,sockets=2,dies=2,cores=2,threads=2,maxcpus=16
 
+    The following sub-option defines a CPU topology hierarchy (2 sockets
+    totally on the machine, 2 clusters per socket, 2 cores per cluster,
+    2 threads per core) for ARM virt machines which support sockets/clusters
+    /cores/threads. Some members of the option can be omitted but their values
+    will be automatically computed:
+
+    ::
+
+        -smp 16,sockets=2,clusters=2,cores=2,threads=2,maxcpus=16
+
     Historically preference was given to the coarsest topology parameters
     when computing missing values (ie sockets preferred over cores, which
     were preferred over threads), however, this behaviour is considered
-- 
2.25.1


