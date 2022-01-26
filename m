Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF27449C336
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 06:25:51 +0100 (CET)
Received: from localhost ([::1]:51918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCaoW-0002OH-2W
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 00:25:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nCanD-0001Vw-Ss
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 00:24:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nCanA-00087k-H5
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 00:24:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643174663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dznFP3bgV41JRfvdifDcfP/ydWiArt86s9nanJ2wuwI=;
 b=avBh44iXh9drgklHLAW5TFc3Odym6mQMtRUcPSMdwbGZ5+0qU/ZgPQMrzraMVvGJ3VlLqu
 MOYPgMxj2stadAd0BwM5ZS0hw7jFWyJKPFIaOsUktBIePltVIg6ZWRG+IhBvI+bhl7CEZm
 s0HJmzDSbm1TTyaRX9x+tdPYocWwM60=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-usonZEpEMQKmMFORtUz49g-1; Wed, 26 Jan 2022 00:24:18 -0500
X-MC-Unique: usonZEpEMQKmMFORtUz49g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C7D01853026;
 Wed, 26 Jan 2022 05:24:17 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-12-154.pek2.redhat.com [10.72.12.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6810F4E2A6;
 Wed, 26 Jan 2022 05:24:14 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH] hw/arm/virt: Fix CPU's default NUMA node ID
Date: Wed, 26 Jan 2022 13:24:10 +0800
Message-Id: <20220126052410.36380-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The default CPU-to-NUMA association is given by mc->get_default_cpu_node_id()
when it isn't provided explicitly. However, the CPU topology isn't fully
considered in the default association and it causes CPU topology broken
warnings on booting Linux guest.

For example, the following warning messages are observed when the Linux guest
is booted with the following command lines.

  /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
  -accel kvm -machine virt,gic-version=host               \
  -cpu host                                               \
  -smp 6,sockets=2,cores=3,threads=1                      \
  -m 1024M,slots=16,maxmem=64G                            \
  -object memory-backend-ram,id=mem0,size=128M            \
  -object memory-backend-ram,id=mem1,size=128M            \
  -object memory-backend-ram,id=mem2,size=128M            \
  -object memory-backend-ram,id=mem3,size=128M            \
  -object memory-backend-ram,id=mem4,size=128M            \
  -object memory-backend-ram,id=mem4,size=384M            \
  -numa node,nodeid=0,memdev=mem0                         \
  -numa node,nodeid=1,memdev=mem1                         \
  -numa node,nodeid=2,memdev=mem2                         \
  -numa node,nodeid=3,memdev=mem3                         \
  -numa node,nodeid=4,memdev=mem4                         \
  -numa node,nodeid=5,memdev=mem5
         :
  alternatives: patching kernel code
  BUG: arch topology borken
  the CLS domain not a subset of the MC domain
  <the above error log repeats>
  BUG: arch topology borken
  the DIE domain not a subset of the NODE domain

With current implementation of mc->get_default_cpu_node_id(), CPU#0 to CPU#5
are associated with NODE#0 to NODE#5 separately. That's incorrect because
CPU#0/1/2 should be associated with same NUMA node because they're seated
in same socket.

This fixes the issue by considering the socket when default CPU-to-NUMA
is given. With this applied, no more CPU topology broken warnings are seen
from the Linux guest. The 6 CPUs are associated with NODE#0/1, but there are
no CPUs associated with NODE#2/3/4/5.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 141350bf21..b4a95522d3 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2499,7 +2499,7 @@ virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
 
 static int64_t virt_get_default_cpu_node_id(const MachineState *ms, int idx)
 {
-    return idx % ms->numa_state->num_nodes;
+    return idx / (ms->smp.dies * ms->smp.clusters * ms->smp.cores * ms->smp.threads);
 }
 
 static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
-- 
2.23.0


