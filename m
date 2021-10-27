Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF45C43CA1E
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 14:52:18 +0200 (CEST)
Received: from localhost ([::1]:56024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfiPh-0007Yb-Ve
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 08:52:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mfiJl-0008GM-2S
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 08:46:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mfiJf-00037P-Ae
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 08:46:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635338761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S8/nicczR9pseL6axCf0NoW1qX9tQ1hx5V0enNVRtU0=;
 b=RgXUaHtNz7/b/WiA9BI7rxGRMeLMXUvT0eFvT0fRagj2P+jJHR/I2wgATY0GHBZUFiKYmG
 D/555mx5wjNylk46MPZFP4a9KecSU1dD5FaRDZaP43efxI7Drl6EW4WkR2i0NJb7ANmWgE
 fHkKanGcDfpNmJDT1tQAA8F5xRZ9vO0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-DbfXdOn_NBeY2lX9nHYyZg-1; Wed, 27 Oct 2021 08:45:58 -0400
X-MC-Unique: DbfXdOn_NBeY2lX9nHYyZg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7FC410A8E01;
 Wed, 27 Oct 2021 12:45:56 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76C95196E6;
 Wed, 27 Oct 2021 12:45:53 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 05/12] memory-device: Move memory_device_check_addable()
 directly into memory_device_pre_plug()
Date: Wed, 27 Oct 2021 14:45:24 +0200
Message-Id: <20211027124531.57561-6-david@redhat.com>
In-Reply-To: <20211027124531.57561-1-david@redhat.com>
References: <20211027124531.57561-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>, Hui Zhu <teawater@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move it out of memory_device_get_free_addr(), which is cleaner and
prepares for future changes.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/mem/memory-device.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/hw/mem/memory-device.c b/hw/mem/memory-device.c
index 7f76a09e57..68a2c3dbcc 100644
--- a/hw/mem/memory-device.c
+++ b/hw/mem/memory-device.c
@@ -67,9 +67,10 @@ static int memory_device_used_region_size(Object *obj, void *opaque)
     return 0;
 }
 
-static void memory_device_check_addable(MachineState *ms, uint64_t size,
+static void memory_device_check_addable(MachineState *ms, MemoryRegion *mr,
                                         Error **errp)
 {
+    const uint64_t size = memory_region_size(mr);
     uint64_t used_region_size = 0;
 
     /* we will need a new memory slot for kvm and vhost */
@@ -99,7 +100,6 @@ static uint64_t memory_device_get_free_addr(MachineState *ms,
                                             uint64_t align, uint64_t size,
                                             Error **errp)
 {
-    Error *err = NULL;
     GSList *list = NULL, *item;
     Range as, new = range_empty;
 
@@ -125,12 +125,6 @@ static uint64_t memory_device_get_free_addr(MachineState *ms,
                     align);
     }
 
-    memory_device_check_addable(ms, size, &err);
-    if (err) {
-        error_propagate(errp, err);
-        return 0;
-    }
-
     if (hint && !QEMU_IS_ALIGNED(*hint, align)) {
         error_setg(errp, "address must be aligned to 0x%" PRIx64 " bytes",
                    align);
@@ -259,6 +253,11 @@ void memory_device_pre_plug(MemoryDeviceState *md, MachineState *ms,
         goto out;
     }
 
+    memory_device_check_addable(ms, mr, &local_err);
+    if (local_err) {
+        goto out;
+    }
+
     if (legacy_align) {
         align = *legacy_align;
     } else {
-- 
2.31.1


