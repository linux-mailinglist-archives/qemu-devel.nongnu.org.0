Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 371C26BE13D
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 07:29:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pd3Yp-0001qi-8h; Fri, 17 Mar 2023 02:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pd3Yn-0001pq-8n
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 02:27:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pd3Yk-0002w9-U9
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 02:27:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679034446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SMTpAH1VNIj8/8DM28+aXu+qVXcaJh5NWbLcUgKEflQ=;
 b=R+8N30OUFg3f91d8t7AdbeNbNDeptLZU7ehrPOQIpgzNiGtz2LSpLuZ7FU3toohUMW1mXv
 mtDMRBIts8pxBGlEKs56wLVUJJlyELs2BMKgaVKzDxi4uII3sbVI47+NlgDQiPT0IV4hdB
 6VRPT7zqWlaiVLjW6lD4o1iHvvkw1hk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-19-Tg79abGfMHGrLApvxnAlBA-1; Fri, 17 Mar 2023 02:27:20 -0400
X-MC-Unique: Tg79abGfMHGrLApvxnAlBA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C742185A588;
 Fri, 17 Mar 2023 06:27:19 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-12-80.pek2.redhat.com [10.72.12.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A2F222166B26;
 Fri, 17 Mar 2023 06:27:09 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, rad@semihalf.com,
 peter.maydell@linaro.org, quic_llindhol@quicinc.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 thuth@redhat.com, lvivier@redhat.com, pbonzini@redhat.com,
 imammedo@redhat.com, ajones@ventanamicro.com, berrange@redhat.com,
 dbarboza@ventanamicro.com, yihyu@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v4 3/3] hw/riscv: Validate cluster and NUMA node boundary
Date: Fri, 17 Mar 2023 14:25:42 +0800
Message-Id: <20230317062542.61061-4-gshan@redhat.com>
In-Reply-To: <20230317062542.61061-1-gshan@redhat.com>
References: <20230317062542.61061-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

There are two RISCV machines where NUMA is aware: 'virt' and 'spike'.
Both of them are required to follow cluster-NUMA-node boundary. To
enable the validation to warn about the irregular configuration where
multiple CPUs in one cluster has been associated with multiple NUMA
nodes.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/spike.c | 2 ++
 hw/riscv/virt.c  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index a584d5b3a2..4bf783884b 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -349,6 +349,8 @@ static void spike_machine_class_init(ObjectClass *oc, void *data)
     mc->cpu_index_to_instance_props = riscv_numa_cpu_index_to_props;
     mc->get_default_cpu_node_id = riscv_numa_get_default_cpu_node_id;
     mc->numa_mem_supported = true;
+    /* platform instead of architectural choice */
+    mc->cpu_cluster_has_numa_boundary = true;
     mc->default_ram_id = "riscv.spike.ram";
 }
 
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 4e3efbee16..84a2bca460 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1678,6 +1678,8 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->cpu_index_to_instance_props = riscv_numa_cpu_index_to_props;
     mc->get_default_cpu_node_id = riscv_numa_get_default_cpu_node_id;
     mc->numa_mem_supported = true;
+    /* platform instead of architectural choice */
+    mc->cpu_cluster_has_numa_boundary = true;
     mc->default_ram_id = "riscv_virt_board.ram";
     assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
-- 
2.23.0


