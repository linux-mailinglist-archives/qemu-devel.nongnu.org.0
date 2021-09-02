Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFED63FEEAA
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 15:28:06 +0200 (CEST)
Received: from localhost ([::1]:47824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLmlC-0006wU-0v
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 09:28:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mLmYV-0007EN-Sl
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:15:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mLmYU-0006YI-AH
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:14:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630588497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TBY+mAqGioqKKMSOPOr/xV/Fu/kzVNkYe5+whDj4jKM=;
 b=cz9eD6/PQJaC7EiDgumTd7LiBf1RTFEVOo2EDaBp7ngTGpJkDDanFR4GBqUXmcoNAHy1pY
 NoXKSI03Pow6ZByRJoOp9lfzdiyjvWr7c3iiwPiQTYFd9BvQIJet/P4cpBBPtBMJwOCNG3
 DvJG5jWZ2CvEnTXXYDE81GdiBYiOAKQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-TvcK9_c0MlGxicTi__-4Mw-1; Thu, 02 Sep 2021 09:14:54 -0400
X-MC-Unique: TvcK9_c0MlGxicTi__-4Mw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F348E107ACC7;
 Thu,  2 Sep 2021 13:14:52 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7CAC36ACE5;
 Thu,  2 Sep 2021 13:14:49 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/9] memory: Introduce replay_discarded callback for
 RamDiscardManager
Date: Thu,  2 Sep 2021 15:14:24 +0200
Message-Id: <20210902131432.23103-2-david@redhat.com>
In-Reply-To: <20210902131432.23103-1-david@redhat.com>
References: <20210902131432.23103-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce replay_discarded callback similar to our existing
replay_populated callback, to be used my migration code to never migrate
discarded memory.

Acked-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/exec/memory.h | 21 +++++++++++++++++++++
 softmmu/memory.c      | 11 +++++++++++
 2 files changed, 32 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index c3d417d317..93e972b55a 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -537,6 +537,7 @@ static inline void ram_discard_listener_init(RamDiscardListener *rdl,
 }
 
 typedef int (*ReplayRamPopulate)(MemoryRegionSection *section, void *opaque);
+typedef void (*ReplayRamDiscard)(MemoryRegionSection *section, void *opaque);
 
 /*
  * RamDiscardManagerClass:
@@ -625,6 +626,21 @@ struct RamDiscardManagerClass {
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
@@ -669,6 +685,11 @@ int ram_discard_manager_replay_populated(const RamDiscardManager *rdm,
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
index bfedaf9c4d..cd86205627 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2076,6 +2076,17 @@ int ram_discard_manager_replay_populated(const RamDiscardManager *rdm,
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


