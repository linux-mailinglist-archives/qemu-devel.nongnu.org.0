Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7A749E70C
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 17:08:15 +0100 (CET)
Received: from localhost ([::1]:55622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD7Jm-0007Rc-0m
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 11:08:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6TG-0006Ds-IN
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:14:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6TB-0002cj-77
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:13:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643296428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MkAbiCYttSVRqU0/R/ggcgebKM7ODj+Bue3CTNACnp8=;
 b=ENwccVP+8j30u+DsuD5t6ueRglfc2AR1nBVZip+l6/MhsBOnQ5cOeK4j/6XrqLVBIUrRkO
 CGsM88IhA92zX1vY6IVe1V9PuIn0S9Lb42FeZj0gJnv8rGJy/ESKAe7tOptugbe75JwxLd
 KuOZ/0Ms1prV1UtCdygov5DqA96BPvw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-t3fof3xhPd-4-w1Z9qZNsA-1; Thu, 27 Jan 2022 10:13:47 -0500
X-MC-Unique: t3fof3xhPd-4-w1Z9qZNsA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8CEF1858E16;
 Thu, 27 Jan 2022 15:13:43 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F5FE70D2D;
 Thu, 27 Jan 2022 15:13:21 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/38] multifd: recv side only needs the RAMBlock host address
Date: Thu, 27 Jan 2022 16:05:26 +0100
Message-Id: <20220127150548.20595-17-quintela@redhat.com>
In-Reply-To: <20220127150548.20595-1-quintela@redhat.com>
References: <20220127150548.20595-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Eric Blake <eblake@redhat.com>,
 Hannes Reinecke <hare@suse.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>, Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Laurent Vivier <laurent@vivier.eu>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

So we can remove the MultiFDPages.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/multifd.h      | 4 ++--
 migration/multifd-zlib.c | 2 +-
 migration/multifd-zstd.c | 2 +-
 migration/multifd.c      | 7 ++-----
 4 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index 850889c5d8..be460f821b 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -136,8 +136,8 @@ typedef struct {
     bool running;
     /* should this thread finish */
     bool quit;
-    /* array of pages to receive */
-    MultiFDPages_t *pages;
+    /* ramblock host address */
+    uint8_t *host;
     /* packet allocated len */
     uint32_t packet_len;
     /* pointer to the packet */
diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
index 8239c840d3..aba1c88a0c 100644
--- a/migration/multifd-zlib.c
+++ b/migration/multifd-zlib.c
@@ -253,7 +253,7 @@ static int zlib_recv_pages(MultiFDRecvParams *p, Error **errp)
         }
 
         zs->avail_out = page_size;
-        zs->next_out = p->pages->block->host + p->normal[i];
+        zs->next_out = p->host + p->normal[i];
 
         /*
          * Welcome to inflate semantics
diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
index c5ed72ddcd..d788d309f2 100644
--- a/migration/multifd-zstd.c
+++ b/migration/multifd-zstd.c
@@ -264,7 +264,7 @@ static int zstd_recv_pages(MultiFDRecvParams *p, Error **errp)
     z->in.pos = 0;
 
     for (i = 0; i < p->normal_num; i++) {
-        z->out.dst = p->pages->block->host + p->normal[i];
+        z->out.dst = p->host + p->normal[i];
         z->out.size = page_size;
         z->out.pos = 0;
 
diff --git a/migration/multifd.c b/migration/multifd.c
index e362b1bb89..b39fef5dfe 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -147,7 +147,7 @@ static int nocomp_recv_pages(MultiFDRecvParams *p, Error **errp)
         return -1;
     }
     for (int i = 0; i < p->normal_num; i++) {
-        p->iov[i].iov_base = p->pages->block->host + p->normal[i];
+        p->iov[i].iov_base = p->host + p->normal[i];
         p->iov[i].iov_len = page_size;
     }
     return qio_channel_readv_all(p->c, p->iov, p->normal_num, errp);
@@ -340,7 +340,7 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
         return -1;
     }
 
-    p->pages->block = block;
+    p->host = block->host;
     for (i = 0; i < p->normal_num; i++) {
         uint64_t offset = be64_to_cpu(packet->offset[i]);
 
@@ -1007,8 +1007,6 @@ int multifd_load_cleanup(Error **errp)
         qemu_sem_destroy(&p->sem_sync);
         g_free(p->name);
         p->name = NULL;
-        multifd_pages_clear(p->pages);
-        p->pages = NULL;
         p->packet_len = 0;
         g_free(p->packet);
         p->packet = NULL;
@@ -1149,7 +1147,6 @@ int multifd_load_setup(Error **errp)
         qemu_sem_init(&p->sem_sync, 0);
         p->quit = false;
         p->id = i;
-        p->pages = multifd_pages_init(page_count);
         p->packet_len = sizeof(MultiFDPacket_t)
                       + sizeof(uint64_t) * page_count;
         p->packet = g_malloc0(p->packet_len);
-- 
2.34.1


