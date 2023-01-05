Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D587F65E80B
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:40:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMMr-0003wV-4E; Thu, 05 Jan 2023 04:16:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMMp-0003vM-BW
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:16:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMMn-0007gH-OH
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:16:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X5TtsCljZSNcnA12xQ7QTfbnHFhdOa8MT79on78YvQ0=;
 b=DEjErJ1YfodIIbDJLHVEfjPrCWFsar+JN686bKjX2u2ot8Fbn+IICKQc3oRjZuMDz51CYZ
 Ygluchgt4q8pEqRvJ8MC7TpEiv2J96e45A/2lgltg7UqT+/Z8ZleipLz/L/FM7ogfCiNm1
 KaY9isMTadkZNEuqMwa+6N7iy8PuMMU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-447-qa97RqT2PWOqlQOgibW6sw-1; Thu, 05 Jan 2023 04:16:51 -0500
X-MC-Unique: qa97RqT2PWOqlQOgibW6sw-1
Received: by mail-wm1-f72.google.com with SMTP id
 q21-20020a7bce95000000b003d236c91639so261686wmj.8
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:16:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X5TtsCljZSNcnA12xQ7QTfbnHFhdOa8MT79on78YvQ0=;
 b=1pYJyaNQ/F9AMjpKrtjSdf/r1HXtFYJBGw7f4CiRxlv7+kx4iQ8tso7vsUUGXncDU3
 r+Mqb86B+Zl2Z4PgaJbdRedbBSJmtXi9E0BHO4mePtT107+b8oxELoONEBd/11uey5in
 KVUezGcebF/6a/HQr0pwYwKfNTyJ8y9f6q8u6ZqdTLQ1FYH9AejF65TRwpv4FBzj90M6
 278kc464QuPFqNCtdmebKleKxgo1mPY5+DNmsbNEQB+rCt7b5N/bq0AITr9TiA9wzhGL
 UetGZ/c0j7sp6svZVZH7DnRHmcVqjeE1IodMI4rFS0ZWnCpT88o57Maejgmm81W+Ol8R
 V84g==
X-Gm-Message-State: AFqh2kry7UBYIeg/Js1WBPzMrhy0IjNZl5FfY0yv8mCt1M2dvXa5mkYi
 jRaMW4LIwTHyYEz3HYX7DSLi2bTXPuH22E8q46EDmNbRBwZAWFQFF1ol9vA2npX+9CDarWhCAG9
 BOCHccZeklb3QmUKiDX6pPITJ7AG1n+9DDgYxzLEmnFv/pUuFLwDaCDFIvihP
X-Received: by 2002:a05:600c:5012:b0:3d3:5a4a:9103 with SMTP id
 n18-20020a05600c501200b003d35a4a9103mr35187949wmr.31.1672910209773; 
 Thu, 05 Jan 2023 01:16:49 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu8Dzj2JOKykrTmmwFP86w1yN+ha/YMnXLxK9I4+1l7tw/lrmXaLZoV7UeA3Y/fSivxl8NIxA==
X-Received: by 2002:a05:600c:5012:b0:3d3:5a4a:9103 with SMTP id
 n18-20020a05600c501200b003d35a4a9103mr35187931wmr.31.1672910209553; 
 Thu, 05 Jan 2023 01:16:49 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 m42-20020a05600c092a00b003d9a3a0d461sm1620836wmp.4.2023.01.05.01.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:16:49 -0800 (PST)
Date: Thu, 5 Jan 2023 04:16:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Yicong Yang <yangyicong@hisilicon.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 45/51] hw/acpi/aml-build: Only generate cluster node in PPTT
 when specified
Message-ID: <20230105091310.263867-46-mst@redhat.com>
References: <20230105091310.263867-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230105091310.263867-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Yicong Yang <yangyicong@hisilicon.com>

Currently we'll always generate a cluster node no matter user has
specified '-smp clusters=X' or not. Cluster is an optional level
and will participant the building of Linux scheduling domains and
only appears on a few platforms. It's unncessary to always build
it when it cannot reflect the real topology on platforms having no
cluster implementation and to avoid affecting the linux scheduling
domains in the VM. So only generate the cluster topology in ACPI
PPTT when the user has specified it explicitly in -smp.

Tested qemu-system-aarch64 with `-smp 8` and linux 6.1-rc1, without
this patch:
estuary:/sys/devices/system/cpu/cpu0/topology$ cat cluster_*
ff	# cluster_cpus
0-7	# cluster_cpus_list
56	# cluster_id

with this patch:
estuary:/sys/devices/system/cpu/cpu0/topology$ cat cluster_*
ff	# cluster_cpus
0-7	# cluster_cpus_list
36	# cluster_id, with no cluster node kernel will make it to
	  physical package id

Acked-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Tested-by: Yanan Wang <wangyanan55@huawei.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
Message-Id: <20221229065513.55652-3-yangyicong@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/boards.h   | 3 +++
 hw/acpi/aml-build.c   | 2 +-
 hw/core/machine-smp.c | 2 ++
 qemu-options.hx       | 3 +++
 4 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index d18d6d0073..b0abbdd5dc 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -130,11 +130,14 @@ typedef struct {
  * @prefer_sockets - whether sockets are preferred over cores in smp parsing
  * @dies_supported - whether dies are supported by the machine
  * @clusters_supported - whether clusters are supported by the machine
+ * @has_clusters - whether clusters are explicitly specified in the user
+ *                 provided SMP configuration
  */
 typedef struct {
     bool prefer_sockets;
     bool dies_supported;
     bool clusters_supported;
+    bool has_clusters;
 } SMPCompatProps;
 
 /**
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 42feb4d4d7..ea331a20d1 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -2030,7 +2030,7 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
                 0, socket_id, NULL, 0);
         }
 
-        if (mc->smp_props.clusters_supported) {
+        if (mc->smp_props.clusters_supported && mc->smp_props.has_clusters) {
             if (cpus->cpus[n].props.cluster_id != cluster_id) {
                 assert(cpus->cpus[n].props.cluster_id > cluster_id);
                 cluster_id = cpus->cpus[n].props.cluster_id;
diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
index b39ed21e65..c3dab007da 100644
--- a/hw/core/machine-smp.c
+++ b/hw/core/machine-smp.c
@@ -158,6 +158,8 @@ void machine_parse_smp_config(MachineState *ms,
     ms->smp.threads = threads;
     ms->smp.max_cpus = maxcpus;
 
+    mc->smp_props.has_clusters = config->has_clusters;
+
     /* sanity-check of the computed topology */
     if (sockets * dies * clusters * cores * threads != maxcpus) {
         g_autofree char *topo_msg = cpu_hierarchy_to_string(ms);
diff --git a/qemu-options.hx b/qemu-options.hx
index 7f99d15b23..8662568324 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -343,6 +343,9 @@ SRST
     ::
 
         -smp 2
+
+    Note: The cluster topology will only be generated in ACPI and exposed
+    to guest if it's explicitly specified in -smp.
 ERST
 
 DEF("numa", HAS_ARG, QEMU_OPTION_numa,
-- 
MST


