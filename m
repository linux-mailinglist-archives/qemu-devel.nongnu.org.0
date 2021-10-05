Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C6B422BB0
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 17:01:23 +0200 (CEST)
Received: from localhost ([::1]:45346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXlwX-0005KF-IT
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 11:01:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mXlY1-0004fb-Vs
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 10:36:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mXlXv-0005WP-TV
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 10:36:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633444555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l96+gyHamARpqL9o+1xsA/DMOsEDvMBK7/u8XMNDR2c=;
 b=eern96IU1UDXyew1fnIWaSQXLlkkAcaqc4AllggJt+lMVfEzewmJ8RlUnm3J5pBWiTcfy4
 6gmTPc8G0Sipfr3hFRCmnC4BwIpRQD4VXGYSw1zO2lEcEJRV2gQdOCVuVIxVfgAec/n5MT
 F/aqqYozirGbRGSPjo9+poXtvDCjnoA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-ye7NiKicOWS_HZKAi8_kjA-1; Tue, 05 Oct 2021 10:35:53 -0400
X-MC-Unique: ye7NiKicOWS_HZKAi8_kjA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19B04362FE;
 Tue,  5 Oct 2021 14:35:52 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 83E241042AAA;
 Tue,  5 Oct 2021 14:35:49 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH v2 23/25] block-backend-common.h: split function pointers
 in BlockDevOps
Date: Tue,  5 Oct 2021 10:32:13 -0400
Message-Id: <20211005143215.29500-24-eesposit@redhat.com>
In-Reply-To: <20211005143215.29500-1-eesposit@redhat.com>
References: <20211005143215.29500-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.066, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Assertions in the callers of the funciton pointrs are already
added by previous patches.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/sysemu/block-backend-common.h | 42 +++++++++++++++++++++++----
 1 file changed, 37 insertions(+), 5 deletions(-)

diff --git a/include/sysemu/block-backend-common.h b/include/sysemu/block-backend-common.h
index 52ff6a4d26..25f34917b6 100644
--- a/include/sysemu/block-backend-common.h
+++ b/include/sysemu/block-backend-common.h
@@ -17,6 +17,29 @@
 
 /* Callbacks for block device models */
 typedef struct BlockDevOps {
+
+    /*
+     * Global state (GS) API. These functions run under the BQL lock.
+     *
+     * If a function modifies the graph, it also uses drain and/or
+     * aio_context_acquire/release to be sure it has unique access.
+     * aio_context locking is needed together with BQL because of
+     * the thread-safe I/O API that concurrently runs and accesses
+     * the graph without the BQL.
+     *
+     * It is important to note that not all of these functions are
+     * necessarily limited to running under the BQL, but they would
+     * require additional auditing and may small thread-safety changes
+     * to move them into the I/O API. Often it's not worth doing that
+     * work since the APIs are only used with the BQL held at the
+     * moment, so they have been placed in the GS API (for now).
+     *
+     * All bdrv_* callers that use these function pointers must
+     * use this assertion:
+     * g_assert(qemu_in_main_thread());
+     * to catch when they are accidentally called without the BQL.
+     */
+
     /*
      * Runs when virtual media changed (monitor commands eject, change)
      * Argument load is true on load and false on eject.
@@ -34,16 +57,25 @@ typedef struct BlockDevOps {
      * true, even if they do not support eject requests.
      */
     void (*eject_request_cb)(void *opaque, bool force);
-    /*
-     * Is the virtual tray open?
-     * Device models implement this only when the device has a tray.
-     */
-    bool (*is_tray_open)(void *opaque);
+
     /*
      * Is the virtual medium locked into the device?
      * Device models implement this only when device has such a lock.
      */
     bool (*is_medium_locked)(void *opaque);
+
+    /*
+     * I/O API functions. These functions are thread-safe, and therefore
+     * can run in any thread as long as they have called
+     * aio_context_acquire/release().
+     */
+
+    /*
+     * Is the virtual tray open?
+     * Device models implement this only when the device has a tray.
+     */
+    bool (*is_tray_open)(void *opaque);
+
     /*
      * Runs when the size changed (e.g. monitor command block_resize)
      */
-- 
2.27.0


