Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC704393FD
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 12:49:05 +0200 (CEST)
Received: from localhost ([::1]:38600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mexXN-0002nJ-16
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 06:49:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mex4X-0005v0-M3
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 06:19:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mex4V-0007Gw-9n
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 06:19:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635157154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gK0ll+F7P/91Xa6bvFOkD2r1M+KSiqbmblh8npRLZIk=;
 b=Xw4JuLXviveNBmWIdrduWhmf01wPDbBZUUhuXPniGZxGk26IRJ6G8PQNzpZE+qAyq0dRql
 ouGhpdcEiogCoghFg9SeMq2FfEsgF+fbSrul0S0gMpJWgcfmtfYdzHmFwC482aE1/DnVOb
 fJVriu+JLT3bwLdc6hyDAGettBdMonU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-Ed7qT8YPO12uSXYB6CBXgw-1; Mon, 25 Oct 2021 06:19:13 -0400
X-MC-Unique: Ed7qT8YPO12uSXYB6CBXgw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBB8E36301;
 Mon, 25 Oct 2021 10:19:11 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE0F65E26A;
 Mon, 25 Oct 2021 10:19:10 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 23/25] block-backend-common.h: split function pointers in
 BlockDevOps
Date: Mon, 25 Oct 2021 06:17:33 -0400
Message-Id: <20211025101735.2060852-24-eesposit@redhat.com>
In-Reply-To: <20211025101735.2060852-1-eesposit@redhat.com>
References: <20211025101735.2060852-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
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
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/sysemu/block-backend-common.h | 28 ++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/include/sysemu/block-backend-common.h b/include/sysemu/block-backend-common.h
index 52ff6a4d26..9ffd098458 100644
--- a/include/sysemu/block-backend-common.h
+++ b/include/sysemu/block-backend-common.h
@@ -17,6 +17,14 @@
 
 /* Callbacks for block device models */
 typedef struct BlockDevOps {
+
+    /*
+     * Global state (GS) API. These functions run under the BQL lock.
+     *
+     * See include/block/block-global-state.h for more information about
+     * the GS API.
+     */
+
     /*
      * Runs when virtual media changed (monitor commands eject, change)
      * Argument load is true on load and false on eject.
@@ -34,16 +42,26 @@ typedef struct BlockDevOps {
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
+     * I/O API functions. These functions are thread-safe.
+     *
+     * See include/block/block-io.h for more information about
+     * the I/O API.
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


