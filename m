Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0001D212206
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 13:20:04 +0200 (CEST)
Received: from localhost ([::1]:37460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqxG8-0006Jc-0T
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 07:20:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jqx6H-0006tY-34
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 07:09:53 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:60244
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jqx67-00010B-5B
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 07:09:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593688182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7JGdN5mTfesNKdLExJR74pfmGKW5mxObK+R1k4yng2M=;
 b=XWJlh/RjpB8jETuyb3ibbx4zhQFUkLwccJd+BRswoK48yQra5p5odBDt9KDXGa089qMRFY
 yyzRICVk63NAPCqqrwt9IJBTtWNPBDNon75Q9ok8RzaTaBYwFc+aRSInJw5oO1vo2UJRxq
 5MYKjRGJSFPiWgh/vVPuBoGhWr325sc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-U2gpI-c2PO6v0gHL3oKLOg-1; Thu, 02 Jul 2020 07:09:38 -0400
X-MC-Unique: U2gpI-c2PO6v0gHL3oKLOg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D54A107ACCD;
 Thu,  2 Jul 2020 11:09:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C11E06109F;
 Thu,  2 Jul 2020 11:09:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9DE3D1138471; Thu,  2 Jul 2020 13:09:31 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/28] Clean up some calls to ignore Error objects the right way
Date: Thu,  2 Jul 2020 13:09:08 +0200
Message-Id: <20200702110931.2953148-6-armbru@redhat.com>
In-Reply-To: <20200702110931.2953148-1-armbru@redhat.com>
References: <20200702110931.2953148-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 04:18:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Jerome Forissier <jerome@forissier.org>,
 "Daniel P . Berrange" <berrange@redhat.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Receiving the error in a local variable only to free it is less clear
(and also less efficient) than passing NULL.  Clean up.

Cc: Daniel P. Berrange <berrange@redhat.com>
Cc: Jerome Forissier <jerome@forissier.org>
CC: Greg Kurz <groug@kaod.org>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Message-Id: <20200630090351.1247703-4-armbru@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 chardev/char-socket.c | 6 ++----
 hw/9pfs/9p.c          | 6 ++----
 hw/arm/virt.c         | 4 +---
 hw/ppc/spapr_drc.c    | 4 +---
 ui/vnc.c              | 3 +--
 5 files changed, 7 insertions(+), 16 deletions(-)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 569d54c144..5758d9900f 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -817,22 +817,20 @@ static void tcp_chr_tls_init(Chardev *chr)
 {
     SocketChardev *s = SOCKET_CHARDEV(chr);
     QIOChannelTLS *tioc;
-    Error *err = NULL;
     gchar *name;
 
     if (s->is_listen) {
         tioc = qio_channel_tls_new_server(
             s->ioc, s->tls_creds,
             s->tls_authz,
-            &err);
+            NULL);
     } else {
         tioc = qio_channel_tls_new_client(
             s->ioc, s->tls_creds,
             s->addr->u.inet.host,
-            &err);
+            NULL);
     }
     if (tioc == NULL) {
-        error_free(err);
         tcp_chr_disconnect(chr);
         return;
     }
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 45a788f6e6..9755fba9a9 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -1399,7 +1399,6 @@ static void coroutine_fn v9fs_attach(void *opaque)
     size_t offset = 7;
     V9fsQID qid;
     ssize_t err;
-    Error *local_err = NULL;
 
     v9fs_string_init(&uname);
     v9fs_string_init(&aname);
@@ -1437,9 +1436,8 @@ static void coroutine_fn v9fs_attach(void *opaque)
         error_setg(&s->migration_blocker,
                    "Migration is disabled when VirtFS export path '%s' is mounted in the guest using mount_tag '%s'",
                    s->ctx.fs_root ? s->ctx.fs_root : "NULL", s->tag);
-        err = migrate_add_blocker(s->migration_blocker, &local_err);
-        if (local_err) {
-            error_free(local_err);
+        err = migrate_add_blocker(s->migration_blocker, NULL);
+        if (err < 0) {
             error_free(s->migration_blocker);
             s->migration_blocker = NULL;
             clunk_fid(s, fid);
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index cd0834ce7f..af3050bc4b 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -217,11 +217,9 @@ static bool cpu_type_valid(const char *cpu)
 
 static void create_kaslr_seed(VirtMachineState *vms, const char *node)
 {
-    Error *err = NULL;
     uint64_t seed;
 
-    if (qemu_guest_getrandom(&seed, sizeof(seed), &err)) {
-        error_free(err);
+    if (qemu_guest_getrandom(&seed, sizeof(seed), NULL)) {
         return;
     }
     qemu_fdt_setprop_u64(vms->fdt, node, "kaslr-seed", seed);
diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index 2689104295..951bcdf2c0 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -1163,16 +1163,14 @@ static void rtas_ibm_configure_connector(PowerPCCPU *cpu,
     drck = SPAPR_DR_CONNECTOR_GET_CLASS(drc);
 
     if (!drc->fdt) {
-        Error *local_err = NULL;
         void *fdt;
         int fdt_size;
 
         fdt = create_device_tree(&fdt_size);
 
         if (drck->dt_populate(drc, spapr, fdt, &drc->fdt_start_offset,
-                              &local_err)) {
+                              NULL)) {
             g_free(fdt);
-            error_free(local_err);
             rc = SPAPR_DR_CC_RESPONSE_ERROR;
             goto out;
         }
diff --git a/ui/vnc.c b/ui/vnc.c
index 12a12714e1..0702a76cce 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -458,9 +458,8 @@ static VncServerInfo2List *qmp_query_server_entry(QIOChannelSocket *ioc,
     Error *err = NULL;
     SocketAddress *addr;
 
-    addr = qio_channel_socket_get_local_address(ioc, &err);
+    addr = qio_channel_socket_get_local_address(ioc, NULL);
     if (!addr) {
-        error_free(err);
         return prev;
     }
 
-- 
2.26.2


