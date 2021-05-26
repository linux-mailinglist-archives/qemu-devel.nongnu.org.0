Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B148D391EF2
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 20:23:35 +0200 (CEST)
Received: from localhost ([::1]:39766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llyBq-00037w-Py
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 14:23:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1llxcE-0003kL-Vu
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:46:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1llxcA-0000Cz-Rp
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:46:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622051200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z6T4C5Mvf7vfy8lCrCGb1AmdQxQ9C5lpRtECCRFldYM=;
 b=Q+lsvEenRLyKpm9qWqMDgsmcUKVGJyfyJ5gHmaWzLI1H3dG8McwmaMW6cQgQtyWdSpvaEQ
 Smd5uRQzCqI1MAbWZ/EFQHX3sDpoSzb6qejdOBQgiFptfv4txjqZ94qyiaH5UzKMuvbJEP
 ynB+xje4OZATGlJr/0MVpCKkfvklnc0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-_RPIgxirP5agu_46T5mdXQ-1; Wed, 26 May 2021 13:46:38 -0400
X-MC-Unique: _RPIgxirP5agu_46T5mdXQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 804358049CB;
 Wed, 26 May 2021 17:46:37 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-247.ams2.redhat.com
 [10.36.114.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10E3F5D9C6;
 Wed, 26 May 2021 17:46:35 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, kwolf@redhat.com, vgoyal@redhat.com,
 ma.mandourr@gmail.com, lizhijian@cn.fujitsu.com
Subject: [PULL 14/15] migration/rdma: destination: create the return patch
 after the first accept
Date: Wed, 26 May 2021 18:45:39 +0100
Message-Id: <20210526174540.290588-15-dgilbert@redhat.com>
In-Reply-To: <20210526174540.290588-1-dgilbert@redhat.com>
References: <20210526174540.290588-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: peterx@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Li Zhijian <lizhijian@cn.fujitsu.com>

destination side:
$ build/qemu-system-x86_64 -enable-kvm -netdev tap,id=hn0,script=/etc/qemu-ifup,downscript=/etc/qemu-ifdown -device e1000,netdev=hn0,mac=50:52:54:00:11:22 -boot c -drive if=none,file=./Fedora-rdma-server-migration.qcow2,id=drive-virtio-disk0 -device virtio-blk-pci,bus=pci.0,addr=0x4,drive=drive-virtio-disk0,id=virtio-disk0 -m 2048 -smp 2 -device piix3-usb-uhci -device usb-tablet -monitor stdio -vga qxl -spice streaming-video=filter,port=5902,disable-ticketing -incoming rdma:192.168.1.10:8888
(qemu) migrate_set_capability postcopy-ram on
(qemu)
dest_init RDMA Device opened: kernel name rocep1s0f0 uverbs device name uverbs0, infiniband_verbs class device path /sys/class/infiniband_verbs/uverbs0, infiniband class device path /sys/class/infiniband/rocep1s0f0, transport: (2) Ethernet
Segmentation fault (core dumped)

 (gdb) bt
 #0  qemu_rdma_accept (rdma=0x0) at ../migration/rdma.c:3272
 #1  rdma_accept_incoming_migration (opaque=0x0) at     ../migration/rdma.c:3986
 #2  0x0000563c9e51f02a in aio_dispatch_handler
     (ctx=ctx@entry=0x563ca0606010, node=0x563ca12b2150) at ../util/aio-posix.c:329
 #3  0x0000563c9e51f752 in aio_dispatch_handlers (ctx=0x563ca0606010) at      ../util/aio-posix.c:372
 #4  aio_dispatch (ctx=0x563ca0606010) at ../util/aio-posix.c:382
 #5  0x0000563c9e4f4d9e in aio_ctx_dispatch (source=<optimized out>,      callback=<optimized out>, user_data=<optimized out>)    at ../util/async.c:306
 #6  0x00007fe96ef3fa9f in g_main_context_dispatch () at      /lib64/libglib-2.0.so.0
 #7  0x0000563c9e4ffeb8 in glib_pollfds_poll () at     ../util/main-loop.c:231
 #8  os_host_main_loop_wait (timeout=12188789) at     ../util/main-loop.c:254
 #9  main_loop_wait (nonblocking=nonblocking@entry=0) at     ../util/main-loop.c:530
 #10 0x0000563c9e3c7211 in qemu_main_loop () at     ../softmmu/runstate.c:725
 #11 0x0000563c9dfd46fe in main (argc=<optimized out>, argv=<optimized     out>, envp=<optimized out>) at ../softmmu/main.c:50

The rdma return path will not be created when qemu incoming is starting
since migrate_copy() is false at that moment, then a  NULL return path
rdma was referenced if the user enabled postcopy later.

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
Message-Id: <20210525080552.28259-3-lizhijian@cn.fujitsu.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/rdma.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index 651534e825..d829d08d07 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -316,6 +316,7 @@ typedef struct RDMALocalBlocks {
 typedef struct RDMAContext {
     char *host;
     int port;
+    char *host_port;
 
     RDMAWorkRequestData wr_data[RDMA_WRID_MAX];
 
@@ -2392,7 +2393,9 @@ static void qemu_rdma_cleanup(RDMAContext *rdma)
         rdma->channel = NULL;
     }
     g_free(rdma->host);
+    g_free(rdma->host_port);
     rdma->host = NULL;
+    rdma->host_port = NULL;
 }
 
 
@@ -2648,6 +2651,7 @@ static void *qemu_rdma_data_init(const char *host_port, Error **errp)
         if (!inet_parse(addr, host_port, NULL)) {
             rdma->port = atoi(addr->port);
             rdma->host = g_strdup(addr->host);
+            rdma->host_port = g_strdup(host_port);
         } else {
             ERROR(errp, "bad RDMA migration address '%s'", host_port);
             g_free(rdma);
@@ -3276,6 +3280,7 @@ static int qemu_rdma_accept(RDMAContext *rdma)
                                             .private_data = &cap,
                                             .private_data_len = sizeof(cap),
                                          };
+    RDMAContext *rdma_return_path = NULL;
     struct rdma_cm_event *cm_event;
     struct ibv_context *verbs;
     int ret = -EINVAL;
@@ -3291,6 +3296,20 @@ static int qemu_rdma_accept(RDMAContext *rdma)
         goto err_rdma_dest_wait;
     }
 
+    /*
+     * initialize the RDMAContext for return path for postcopy after first
+     * connection request reached.
+     */
+    if (migrate_postcopy() && !rdma->is_return_path) {
+        rdma_return_path = qemu_rdma_data_init(rdma->host_port, NULL);
+        if (rdma_return_path == NULL) {
+            rdma_ack_cm_event(cm_event);
+            goto err_rdma_dest_wait;
+        }
+
+        qemu_rdma_return_path_dest_init(rdma_return_path, rdma);
+    }
+
     memcpy(&cap, cm_event->param.conn.private_data, sizeof(cap));
 
     network_to_caps(&cap);
@@ -3406,6 +3425,7 @@ static int qemu_rdma_accept(RDMAContext *rdma)
 err_rdma_dest_wait:
     rdma->error_state = ret;
     qemu_rdma_cleanup(rdma);
+    g_free(rdma_return_path);
     return ret;
 }
 
@@ -4048,17 +4068,6 @@ void rdma_start_incoming_migration(const char *host_port, Error **errp)
 
     trace_rdma_start_incoming_migration_after_rdma_listen();
 
-    /* initialize the RDMAContext for return path */
-    if (migrate_postcopy()) {
-        rdma_return_path = qemu_rdma_data_init(host_port, &local_err);
-
-        if (rdma_return_path == NULL) {
-            goto cleanup_rdma;
-        }
-
-        qemu_rdma_return_path_dest_init(rdma_return_path, rdma);
-    }
-
     qemu_set_fd_handler(rdma->channel->fd, rdma_accept_incoming_migration,
                         NULL, (void *)(intptr_t)rdma);
     return;
@@ -4069,6 +4078,7 @@ err:
     error_propagate(errp, local_err);
     if (rdma) {
         g_free(rdma->host);
+        g_free(rdma->host_port);
     }
     g_free(rdma);
     g_free(rdma_return_path);
-- 
2.31.1


