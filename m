Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BFD1DB3DD
	for <lists+qemu-devel@lfdr.de>; Wed, 20 May 2020 14:41:40 +0200 (CEST)
Received: from localhost ([::1]:59212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbO2V-0005u4-V0
	for lists+qemu-devel@lfdr.de; Wed, 20 May 2020 08:41:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1jbNuD-000680-B5
 for qemu-devel@nongnu.org; Wed, 20 May 2020 08:33:05 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:56509
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1jbNuB-0007YW-83
 for qemu-devel@nongnu.org; Wed, 20 May 2020 08:33:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589977982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FoqG/7LlE0aGkoDnmNDY3ApCiNG/45FhuQTIXGIJ13U=;
 b=CkCdYnFv9s1RXcKuNVGpdnxsNhmQk6yiE/IcEiKROWNRCnpiEFsO04VB6kNjIzlUiaMVyq
 Kd05giRYqvch48F+MVAczFlFGTuq3v2fXBoJunsBWSPQNJ+r/mYbCBCDB1ZrluDBwzQ1EG
 nREa0gyi9xPBHVP7eSHwiVKJjMmlkyY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-ULeDmb9XNHSQOhE4S5Jlrw-1; Wed, 20 May 2020 08:33:00 -0400
X-MC-Unique: ULeDmb9XNHSQOhE4S5Jlrw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA52D461;
 Wed, 20 May 2020 12:32:59 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-76.ams2.redhat.com [10.36.113.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 363C46AD00;
 Wed, 20 May 2020 12:32:52 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/19] hmp: Handle virtio-mem when printing memory device
 info
Date: Wed, 20 May 2020 14:31:46 +0200
Message-Id: <20200520123152.60527-14-david@redhat.com>
In-Reply-To: <20200520123152.60527-1-david@redhat.com>
References: <20200520123152.60527-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=207.211.31.120; envelope-from=david@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 01:34:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Print the memory device info just like for other memory devices.

Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 monitor/hmp-cmds.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 9c61e769ca..afc9a28069 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1818,6 +1818,7 @@ void hmp_info_memory_devices(Monitor *mon, const QDict *qdict)
     MemoryDeviceInfoList *info_list = qmp_query_memory_devices(&err);
     MemoryDeviceInfoList *info;
     VirtioPMEMDeviceInfo *vpi;
+    VirtioMEMDeviceInfo *vmi;
     MemoryDeviceInfo *value;
     PCDIMMDeviceInfo *di;
 
@@ -1852,6 +1853,21 @@ void hmp_info_memory_devices(Monitor *mon, const QDict *qdict)
                 monitor_printf(mon, "  size: %" PRIu64 "\n", vpi->size);
                 monitor_printf(mon, "  memdev: %s\n", vpi->memdev);
                 break;
+            case MEMORY_DEVICE_INFO_KIND_VIRTIO_MEM:
+                vmi = value->u.virtio_mem.data;
+                monitor_printf(mon, "Memory device [%s]: \"%s\"\n",
+                               MemoryDeviceInfoKind_str(value->type),
+                               vmi->id ? vmi->id : "");
+                monitor_printf(mon, "  memaddr: 0x%" PRIx64 "\n", vmi->memaddr);
+                monitor_printf(mon, "  node: %" PRId64 "\n", vmi->node);
+                monitor_printf(mon, "  requested-size: %" PRIu64 "\n",
+                               vmi->requested_size);
+                monitor_printf(mon, "  size: %" PRIu64 "\n", vmi->size);
+                monitor_printf(mon, "  max-size: %" PRIu64 "\n", vmi->max_size);
+                monitor_printf(mon, "  block-size: %" PRIu64 "\n",
+                               vmi->block_size);
+                monitor_printf(mon, "  memdev: %s\n", vmi->memdev);
+                break;
             default:
                 g_assert_not_reached();
             }
-- 
2.25.4


