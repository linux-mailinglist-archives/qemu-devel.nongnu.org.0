Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 238C33F93DB
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 06:58:00 +0200 (CEST)
Received: from localhost ([::1]:47240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJTwF-0005lI-6C
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 00:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJTpV-0008SH-S0
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 00:51:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJTpR-0000yZ-QV
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 00:51:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630039856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nil4oCky2ThalrTE8B6Fj1sg0/nu8aLttq8dyMFcGz0=;
 b=SenfJbw3sFhgdP5PT4gbGTByJFZh6eJH4UFKk+13RDNdgjq5b7KO1EFza3Tt7rIV3MkZTw
 6/M24B6b0mS+PXrfB3z7uOxPmo9YT4rxas76o2EaS0BrZvvam9ZiI/iA/QsMsh6Rfm8gsy
 8B6zfyY4vmxN9XmbFQe3CkQyqXBGwcg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-_Gt9aym6NwGu7xwkBZHF8w-1; Fri, 27 Aug 2021 00:50:54 -0400
X-MC-Unique: _Gt9aym6NwGu7xwkBZHF8w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B912185302D;
 Fri, 27 Aug 2021 04:50:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EB7DA604CC;
 Fri, 27 Aug 2021 04:50:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 89C1C11380B7; Fri, 27 Aug 2021 06:50:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/15] multi-process: Fix pci_proxy_dev_realize() error handling
Date: Fri, 27 Aug 2021 06:50:33 +0200
Message-Id: <20210827045044.388748-5-armbru@redhat.com>
In-Reply-To: <20210827045044.388748-1-armbru@redhat.com>
References: <20210827045044.388748-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.742, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, peter.maydell@linaro.org,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Error ** argument must be NULL, &error_abort, &error_fatal, or a
pointer to a variable containing NULL.  Passing an argument of the
latter kind twice without clearing it in between is wrong: if the
first call sets an error, it no longer points to NULL for the second
call.

pci_proxy_dev_realize() is wrong that way: it passes @errp to
qio_channel_new_fd() without checking for failure.  If it runs into
another failure, it trips error_setv()'s assertion.

Fix it to check for failure properly.

Fixes: 9f8112073aad8e485ac012ee18809457ab7f23a6
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Cc: Jagannathan Raman <jag.raman@oracle.com>
Cc: John G Johnson <john.g.johnson@oracle.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210720125408.387910-5-armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Jagannathan Raman <jag.raman@oracle.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/remote/proxy.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c
index 6dda705fc2..499f540c94 100644
--- a/hw/remote/proxy.c
+++ b/hw/remote/proxy.c
@@ -102,10 +102,18 @@ static void pci_proxy_dev_realize(PCIDevice *device, Error **errp)
     }
 
     dev->ioc = qio_channel_new_fd(fd, errp);
+    if (!dev->ioc) {
+        close(fd);
+        return;
+    }
 
     error_setg(&dev->migration_blocker, "%s does not support migration",
                TYPE_PCI_PROXY_DEV);
-    migrate_add_blocker(dev->migration_blocker, errp);
+    if (migrate_add_blocker(dev->migration_blocker, errp) < 0) {
+        error_free(dev->migration_blocker);
+        object_unref(dev->ioc);
+        return;
+    }
 
     qemu_mutex_init(&dev->io_mutex);
     qio_channel_set_blocking(dev->ioc, true, NULL);
-- 
2.31.1


