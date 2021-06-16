Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 510FE3AA175
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 18:36:09 +0200 (CEST)
Received: from localhost ([::1]:56418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltYWO-0002PQ-CJ
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 12:36:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ltYRL-0002us-Mz
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:30:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ltYRG-0007aR-Ro
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:30:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623861049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IdggkUwN/97+RRPskx1Ww94j6yugnn6qzW8xr+/5R6k=;
 b=FsJ7Lv6Z/P5oN/k+ifZRBSaOGuIDE2pIhcTsDTWTTgD632KNDfoSsqPJiD6BWMHLtFbx65
 iQOXDY8UUxrEfWBc53woR4LzBj2tgGjqjH9Sa5bYPEcMN+WNniSfrieeAgdwTEdSN7Wms5
 Q3PvZS91KZtrDRkfM3a8d2cPl+0qAco=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-_zu_lGOsMS6ARqgM1D6rIQ-1; Wed, 16 Jun 2021 12:30:12 -0400
X-MC-Unique: _zu_lGOsMS6ARqgM1D6rIQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE9DB101258B;
 Wed, 16 Jun 2021 16:30:10 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-100.ams2.redhat.com [10.36.114.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D74D60C54;
 Wed, 16 Jun 2021 16:30:00 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/6] memory: Introduce replay_discarded callback for
 RamDiscardManager
Date: Wed, 16 Jun 2021 18:29:35 +0200
Message-Id: <20210616162940.28630-2-david@redhat.com>
In-Reply-To: <20210616162940.28630-1-david@redhat.com>
References: <20210616162940.28630-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce replay_discarded callback similar to our existing
replay_populated callback, to be used my migration code to never migrate
discarded memory.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/exec/memory.h | 21 +++++++++++++++++++++
 softmmu/memory.c      | 11 +++++++++++
 2 files changed, 32 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 84e739f106..1afdba2c27 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -530,6 +530,7 @@ static inline void ram_discard_listener_init(RamDiscardListener *rdl,
 }
 
 typedef int (*ReplayRamPopulate)(MemoryRegionSection *section, void *opaque);
+typedef void (*ReplayRamDiscard)(MemoryRegionSection *section, void *opaque);
 
 /*
  * RamDiscardManagerClass:
@@ -618,6 +619,21 @@ struct RamDiscardManagerClass {
                             MemoryRegionSection *section,
                             ReplayRamPopulate replay_fn, void *opaque);
 
+    /**
+     * @replay_discarded:
+     *
+     * Call the #ReplayRamDiscard callback for all discarded parts within the
+     * #MemoryRegionSection via the #RamDiscardManager.
+     *
+     * @rdm: the #RamDiscardManager
+     * @section: the #MemoryRegionSection
+     * @replay_fn: the #ReplayRamDiscard callback
+     * @opaque: pointer to forward to the callback
+     */
+    void (*replay_discarded)(const RamDiscardManager *rdm,
+                             MemoryRegionSection *section,
+                             ReplayRamDiscard replay_fn, void *opaque);
+
     /**
      * @register_listener:
      *
@@ -662,6 +678,11 @@ int ram_discard_manager_replay_populated(const RamDiscardManager *rdm,
                                          ReplayRamPopulate replay_fn,
                                          void *opaque);
 
+void ram_discard_manager_replay_discarded(const RamDiscardManager *rdm,
+                                          MemoryRegionSection *section,
+                                          ReplayRamDiscard replay_fn,
+                                          void *opaque);
+
 void ram_discard_manager_register_listener(RamDiscardManager *rdm,
                                            RamDiscardListener *rdl,
                                            MemoryRegionSection *section);
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 920ebc0f4e..ae32083873 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2073,6 +2073,17 @@ int ram_discard_manager_replay_populated(const RamDiscardManager *rdm,
     return rdmc->replay_populated(rdm, section, replay_fn, opaque);
 }
 
+void ram_discard_manager_replay_discarded(const RamDiscardManager *rdm,
+                                          MemoryRegionSection *section,
+                                          ReplayRamDiscard replay_fn,
+                                          void *opaque)
+{
+    RamDiscardManagerClass *rdmc = RAM_DISCARD_MANAGER_GET_CLASS(rdm);
+
+    g_assert(rdmc->replay_discarded);
+    rdmc->replay_discarded(rdm, section, replay_fn, opaque);
+}
+
 void ram_discard_manager_register_listener(RamDiscardManager *rdm,
                                            RamDiscardListener *rdl,
                                            MemoryRegionSection *section)
-- 
2.31.1


