Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D870A6A2794
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 07:38:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVoBW-0000hW-M4; Sat, 25 Feb 2023 01:37:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pVoBU-0000g9-K7
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 01:37:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pVoBS-0002re-7R
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 01:37:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677307045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OcGg8UwD1oAse3CxtUrhYuooopXoY1Ay8EyEOaaEFCY=;
 b=U2QMTCcjXxNQLlcWYPu1lhvQTQXHeXmvG/L6eF6RaUTUO77sHaWdu58CmmKLOF27O4Oz0w
 j4ieqXravmsQiWxtppLspAmN/4dg7A6/5EBoP4IcuNJxvwoxkOxlvisENll57Fjp1Ke4F+
 Wcg0GXgRTbZXwRujU4wbygnQPzOOAC4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-bctDuSKxOZ-5Pk91YuTzuw-1; Sat, 25 Feb 2023 01:37:21 -0500
X-MC-Unique: bctDuSKxOZ-5Pk91YuTzuw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92B96811E6E;
 Sat, 25 Feb 2023 06:37:20 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-20.bne.redhat.com [10.64.54.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 073CC40C945A;
 Sat, 25 Feb 2023 06:37:11 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, rad@semihalf.com,
 peter.maydell@linaro.org, quic_llindhol@quicinc.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 thuth@redhat.com, lvivier@redhat.com, pbonzini@redhat.com,
 imammedo@redhat.com, yihyu@redhat.com, ajones@ventanamicro.com,
 berrange@redhat.com, dbarboza@ventanamicro.com, shan.gavin@gmail.com
Subject: [PATCH v3 3/3] hw/riscv: Validate cluster and NUMA node boundary
Date: Sat, 25 Feb 2023 14:35:27 +0800
Message-Id: <20230225063527.281479-4-gshan@redhat.com>
In-Reply-To: <20230225063527.281479-1-gshan@redhat.com>
References: <20230225063527.281479-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
---
 hw/riscv/spike.c | 2 ++
 hw/riscv/virt.c  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index cc3f6dac17..b09b993634 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -357,6 +357,8 @@ static void spike_machine_class_init(ObjectClass *oc, void *data)
     mc->cpu_index_to_instance_props = riscv_numa_cpu_index_to_props;
     mc->get_default_cpu_node_id = riscv_numa_get_default_cpu_node_id;
     mc->numa_mem_supported = true;
+    /* platform instead of architectural choice */
+    mc->cpu_cluster_has_numa_boundary = true;
     mc->default_ram_id = "riscv.spike.ram";
 }
 
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index b81081c70b..e5bb168169 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1636,6 +1636,8 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
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


