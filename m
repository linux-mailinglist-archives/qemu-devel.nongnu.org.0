Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8656F3F5D98
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 14:04:01 +0200 (CEST)
Received: from localhost ([::1]:52672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIV9s-0003Gc-E0
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 08:04:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mIV8k-0002Ke-3U
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 08:02:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mIV8h-0001y9-8e
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 08:02:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629806566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bog25Znfsn8fcygf1zPfXMNHSWtPJczSj6FpWmZTEWg=;
 b=AMCzCeYwvGsZZgxvr5J6RpWdQlBpu7A78jssWckTQSB8ih2M+BsnThUCDNzGOvey7mDXhV
 BGFXCgyZLhDmmwT03LhpBgVmHl+8pt9yKQmmzcK7pdhItT3DNbk7+vxQdDxpHDPrS3uesE
 8hlnQKlE61KQxlV5n2ZTOstYqWjuYOg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-2YVIRZKEOYK-yOdtmcDQpg-1; Tue, 24 Aug 2021 08:02:45 -0400
X-MC-Unique: 2YVIRZKEOYK-yOdtmcDQpg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B7D6106F714;
 Tue, 24 Aug 2021 12:02:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B5F81036D28;
 Tue, 24 Aug 2021 12:01:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D2CBE18000A3; Tue, 24 Aug 2021 14:01:53 +0200 (CEST)
Date: Tue, 24 Aug 2021 14:01:53 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH v2 0/5] physmem: Have flaview API check bus
 permission from MemTxAttrs argument
Message-ID: <20210824120153.altqys6jjiuxh35p@sirius.home.kraxel.org>
References: <20210823164157.751807-1-philmd@redhat.com>
 <CAFEAcA9_=6n4w86gD3MHhiLeCiui9_+ePT7E2sSHdSRufUJdyA@mail.gmail.com>
 <YSQKHaGiJZE5OAk2@t490s>
 <CAFEAcA_23vc7hE3iaM-JVA6W38LK4hJoWae5KcknhPRD5fPBZA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_23vc7hE3iaM-JVA6W38LK4hJoWae5KcknhPRD5fPBZA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
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
Cc: David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm <qemu-arm@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> I was vaguely tossing an idea around in the back of my mind
> about whether you could have a flag on devices that marked
> them as "this device is currently involved in IO", such that
> you could then just fail the last DMA (or qemu_irq_set, or
> whatever) that would complete the loop back to a device that
> was already doing IO. But that would need a lot of thinking
> through to figure out if it's feasible, and it's probably
> a lot of code change.

Quick & dirty hack trying the above.  Not much code, it is opt-in per
MemoryRegion (so less overhead for devices which already handle all DMA
in a BH), tracks state in DeviceState.  Adds a check to a rather hot
code path though.  Not tested yet (stopped investigating when I noticed
Philippe tries to fix the same thing with another approach).  Not
benchmarked.

Maybe it helps ...

take care,
  Gerd

From 80e58a2cd2c630f0bddd9d0eaee71abb7eeb9440 Mon Sep 17 00:00:00 2001
From: Gerd Hoffmann <kraxel@redhat.com>
Date: Tue, 17 Aug 2021 07:35:37 +0200
Subject: [PATCH] allow track active mmio handlers

---
 include/exec/memory.h  |  1 +
 include/hw/qdev-core.h |  1 +
 softmmu/memory.c       | 24 ++++++++++++++++++++++--
 3 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index c3d417d317f0..b1883d45e817 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -265,6 +265,7 @@ struct MemoryRegionOps {
          */
         bool unaligned;
     } impl;
+    bool block_reenter;
 };
 
 typedef struct MemoryRegionClass {
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index bafc311bfa1b..4cf281a81fa9 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -191,6 +191,7 @@ struct DeviceState {
     int instance_id_alias;
     int alias_required_for_version;
     ResettableState reset;
+    bool io_handler_active;
 };
 
 struct DeviceListener {
diff --git a/softmmu/memory.c b/softmmu/memory.c
index bfedaf9c4dfc..5eb5dd465dd2 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -437,7 +437,18 @@ static MemTxResult  memory_region_read_accessor(MemoryRegion *mr,
 {
     uint64_t tmp;
 
-    tmp = mr->ops->read(mr->opaque, addr, size);
+    if (mr->ops->block_reenter) {
+        DeviceState *dev = DEVICE(mr->owner);
+        if (!dev->io_handler_active) {
+            dev->io_handler_active = true;
+            tmp = mr->ops->read(mr->opaque, addr, size);
+            dev->io_handler_active = false;
+        } else {
+            tmp = MEMTX_OK;
+        }
+    } else {
+        tmp = mr->ops->read(mr->opaque, addr, size);
+    }
     if (mr->subpage) {
         trace_memory_region_subpage_read(get_cpu_index(), mr, addr, tmp, size);
     } else if (trace_event_get_state_backends(TRACE_MEMORY_REGION_OPS_READ)) {
@@ -489,7 +500,16 @@ static MemTxResult memory_region_write_accessor(MemoryRegion *mr,
         trace_memory_region_ops_write(get_cpu_index(), mr, abs_addr, tmp, size,
                                       memory_region_name(mr));
     }
-    mr->ops->write(mr->opaque, addr, tmp, size);
+    if (mr->ops->block_reenter) {
+        DeviceState *dev = DEVICE(mr->owner);
+        if (!dev->io_handler_active) {
+            dev->io_handler_active = true;
+            mr->ops->write(mr->opaque, addr, tmp, size);
+            dev->io_handler_active = false;
+        }
+    } else {
+        mr->ops->write(mr->opaque, addr, tmp, size);
+    }
     return MEMTX_OK;
 }
 
-- 
2.31.1


