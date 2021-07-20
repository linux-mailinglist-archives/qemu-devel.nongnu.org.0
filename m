Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6BD3CFA08
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 15:02:45 +0200 (CEST)
Received: from localhost ([::1]:36420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5pOW-0002Ca-Gg
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 09:02:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m5pGS-0004pm-5V
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:54:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m5pGO-0008IV-Gl
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:54:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626785659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rs9zwa5qSsRspBnzyLbulXj8LtHbZMghQ8qhtcBNeUY=;
 b=h7jxHZndLESmU4K52jHZ9ARH/IGZeJI5qGT9YD3Z9Hq3qY+hVHqJQeTPwa35/k8XPoD62a
 oED7SVitiVO3R0YUoDSSVJRqQaGl5BjrUaZDv3VtKq8Akg+vyQW8K8alCx9+6erJADmZjZ
 U2w8Z6EhjGizYx7izJVsJqVjCvhuwtg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-d6q1XpkaP_y6OrdGcje5ww-1; Tue, 20 Jul 2021 08:54:16 -0400
X-MC-Unique: d6q1XpkaP_y6OrdGcje5ww-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E99719251A1;
 Tue, 20 Jul 2021 12:54:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-187.ams2.redhat.com
 [10.36.114.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 792BA5D9D3;
 Tue, 20 Jul 2021 12:54:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F3012112D845; Tue, 20 Jul 2021 14:54:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/16] multi-process: Fix pci_proxy_dev_realize() error
 handling
Date: Tue, 20 Jul 2021 14:53:56 +0200
Message-Id: <20210720125408.387910-5-armbru@redhat.com>
In-Reply-To: <20210720125408.387910-1-armbru@redhat.com>
References: <20210720125408.387910-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.474, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
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


