Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0197B20AD2C
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 09:32:37 +0200 (CEST)
Received: from localhost ([::1]:53812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joiqh-0005nk-Vq
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 03:32:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1joiiu-0001FU-F7
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 03:24:32 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:29844
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1joiis-0003gf-K6
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 03:24:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593156269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ixl7QfJkwAYyodyhlCJxjZxzcNyJM6Cu9mf4u+9M5Gc=;
 b=Fl0kPUQZAH2oMM7Y1BYft6rssSdPwsWi30C8QUbuhCRSuyPvbc1Oc6dlhV8r8xtcpwX7/i
 mrcFmL+YSdPUVuhUSkd6QMpp61etVgNbdwOjuKtBwDxdNh1KILJ4VwrSKo23zu03IPLdG2
 w+ner6KJQN5psEs7t0z/WdP9gBb5G8c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-TeIFQ7vVOVugPuvt93BuPw-1; Fri, 26 Jun 2020 03:24:28 -0400
X-MC-Unique: TeIFQ7vVOVugPuvt93BuPw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 093021800D4A;
 Fri, 26 Jun 2020 07:24:27 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-35.ams2.redhat.com [10.36.113.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D0A057C1FB;
 Fri, 26 Jun 2020 07:24:24 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 14/21] numa: Handle virtio-mem in NUMA stats
Date: Fri, 26 Jun 2020 09:22:41 +0200
Message-Id: <20200626072248.78761-15-david@redhat.com>
In-Reply-To: <20200626072248.78761-1-david@redhat.com>
References: <20200626072248.78761-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=207.211.31.81; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/26 03:23:21
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Account the memory to the configured nid.

Reviewed-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/core/numa.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/core/numa.c b/hw/core/numa.c
index 5f81900f88..ca0b2e5fa7 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -817,6 +817,7 @@ static void numa_stat_memory_devices(NumaNodeMem node_mem[])
     MemoryDeviceInfoList *info;
     PCDIMMDeviceInfo     *pcdimm_info;
     VirtioPMEMDeviceInfo *vpi;
+    VirtioMEMDeviceInfo *vmi;
 
     for (info = info_list; info; info = info->next) {
         MemoryDeviceInfo *value = info->value;
@@ -837,6 +838,11 @@ static void numa_stat_memory_devices(NumaNodeMem node_mem[])
                 node_mem[0].node_mem += vpi->size;
                 node_mem[0].node_plugged_mem += vpi->size;
                 break;
+            case MEMORY_DEVICE_INFO_KIND_VIRTIO_MEM:
+                vmi = value->u.virtio_mem.data;
+                node_mem[vmi->node].node_mem += vmi->size;
+                node_mem[vmi->node].node_plugged_mem += vmi->size;
+                break;
             default:
                 g_assert_not_reached();
             }
-- 
2.26.2


