Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D77C4650C5D
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 14:04:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Fn3-0004dh-Ik; Mon, 19 Dec 2022 08:02:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p7Fmj-0004Ut-J9
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 08:02:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p7Fme-0007Bd-PF
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 08:02:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671454940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4JFb6QDUDH0Iblrn1PZyR6v+EegDDw+5LlL9IfN5m+I=;
 b=g07AC4bxBgWA4MylYKSc3U70lOg0oO/xIPEd+OKBtRNUFA1t7R1GBETeImK1dT0P1gBsXp
 Fr9CjIdC+rUi8RPyh3CSR+M8a7aABj4I/yhE83gXcrA/lNhblGn+kR0B9HM5XGNnT668/S
 bGKrseeDFGrd11x4Tn2au3RwNpexXkY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-481-EAFyuzouPl60pgDLpips4g-1; Mon, 19 Dec 2022 08:02:16 -0500
X-MC-Unique: EAFyuzouPl60pgDLpips4g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B72588742F;
 Mon, 19 Dec 2022 13:02:08 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com
 (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B2A8C14171C5;
 Mon, 19 Dec 2022 13:02:07 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-ppc@nongnu.org,
 xen-devel@lists.xenproject.org, Laurent Vivier <lvivier@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, virtio-fs@redhat.com,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Paul Durrant <paul@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Greg Kurz <groug@kaod.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 2/6] hw/xen: use G_GNUC_PRINTF/SCANF for various functions
Date: Mon, 19 Dec 2022 08:02:01 -0500
Message-Id: <20221219130205.687815-3-berrange@redhat.com>
In-Reply-To: <20221219130205.687815-1-berrange@redhat.com>
References: <20221219130205.687815-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/xen/xen-bus.c                | 1 +
 hw/xen/xen_pvdev.c              | 1 +
 include/hw/xen/xen-bus-helper.h | 6 ++++--
 include/hw/xen/xen-bus.h        | 3 ++-
 4 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index 645a29a5a0..df3f6b9ae0 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -561,6 +561,7 @@ void xen_device_backend_printf(XenDevice *xendev, const char *key,
     }
 }
 
+G_GNUC_SCANF(3, 4)
 static int xen_device_backend_scanf(XenDevice *xendev, const char *key,
                                     const char *fmt, ...)
 {
diff --git a/hw/xen/xen_pvdev.c b/hw/xen/xen_pvdev.c
index 037152f063..1a5177b354 100644
--- a/hw/xen/xen_pvdev.c
+++ b/hw/xen/xen_pvdev.c
@@ -196,6 +196,7 @@ const char *xenbus_strstate(enum xenbus_state state)
  *  2 == noisy debug messages (logfile only).
  *  3 == will flood your log (logfile only).
  */
+G_GNUC_PRINTF(3, 0)
 static void xen_pv_output_msg(struct XenLegacyDevice *xendev,
                               FILE *f, const char *fmt, va_list args)
 {
diff --git a/include/hw/xen/xen-bus-helper.h b/include/hw/xen/xen-bus-helper.h
index 629a904d1a..8782f30550 100644
--- a/include/hw/xen/xen-bus-helper.h
+++ b/include/hw/xen/xen-bus-helper.h
@@ -31,10 +31,12 @@ void xs_node_printf(struct xs_handle *xsh,  xs_transaction_t tid,
 /* Read from node/key unless node is empty, in which case read from key */
 int xs_node_vscanf(struct xs_handle *xsh,  xs_transaction_t tid,
                    const char *node, const char *key, Error **errp,
-                   const char *fmt, va_list ap);
+                   const char *fmt, va_list ap)
+    G_GNUC_SCANF(6, 0);
 int xs_node_scanf(struct xs_handle *xsh,  xs_transaction_t tid,
                   const char *node, const char *key, Error **errp,
-                  const char *fmt, ...);
+                  const char *fmt, ...)
+    G_GNUC_SCANF(6, 7);
 
 /* Watch node/key unless node is empty, in which case watch key */
 void xs_node_watch(struct xs_handle *xsh, const char *node, const char *key,
diff --git a/include/hw/xen/xen-bus.h b/include/hw/xen/xen-bus.h
index 713e763348..4d966a2dbb 100644
--- a/include/hw/xen/xen-bus.h
+++ b/include/hw/xen/xen-bus.h
@@ -94,7 +94,8 @@ void xen_device_frontend_printf(XenDevice *xendev, const char *key,
     G_GNUC_PRINTF(3, 4);
 
 int xen_device_frontend_scanf(XenDevice *xendev, const char *key,
-                              const char *fmt, ...);
+                              const char *fmt, ...)
+    G_GNUC_SCANF(3, 4);
 
 void xen_device_set_max_grant_refs(XenDevice *xendev, unsigned int nr_refs,
                                    Error **errp);
-- 
2.38.1


