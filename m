Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FB145754B
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 18:19:05 +0100 (CET)
Received: from localhost ([::1]:40664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo7XU-0005ag-Ga
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 12:19:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mo7ES-0005Ni-LC
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:59:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mo7EN-00037c-0C
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:59:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637341155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i65KouW0qros+OIR6AIOQYFf5hMQeAXenZJYYpUSVVc=;
 b=acuSVmmeiTZmhxSlzis6Y5QOtSUL0WGsCKX4Xnb0PHiUPqn4R6JZkOgtQywq9ph2o4A9Th
 Bk4cYXZ0xrDF7h52NVe/eK+REXP8gAlBw6Tdq/jXyzO0rAFSm/WTu1KzjQT08MqrW+sDCr
 2ptudUmN+9BJaPW8x5jUn8vIxdbw+BA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-WJ3odMrdNfW-stbtMXpbGw-1; Fri, 19 Nov 2021 11:59:14 -0500
X-MC-Unique: WJ3odMrdNfW-stbtMXpbGw-1
Received: by mail-wm1-f70.google.com with SMTP id
 m14-20020a05600c3b0e00b0033308dcc933so5025403wms.7
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:59:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i65KouW0qros+OIR6AIOQYFf5hMQeAXenZJYYpUSVVc=;
 b=5V31Pi7Yec4TZOMG9+j2xzy2QGqyJWvgH+a2IuvacSzob2JJ8wtHbjH3n8MKwJM3Ft
 AASTOmM79TDe4KgKd98Yul8FHjmVRFJlwD/QsCZinyu+/Zfbjrke+F+CxiHIvVJ52FRG
 Vzy7iRKsZxDRUIpkAOQfgw9fM1rnE0pylpCx/nqsNu5VQrJ6/FkGeX4xo+RNNDvMHJeA
 1VaXKsvje00j60uhNiA9uVEiHstGhSm9njfGhA02z6ztEGMWME1DQFxhqUIPEYknH28m
 zw3nIV6xMOAd0ATZFGoanu6yeDtJYgYRcHb42PK5UAFo/HydOCnpVLAcIpNOzlLpE4t/
 qHEw==
X-Gm-Message-State: AOAM5330pEQoGtUg7QkjIRruDPWMBSFNYuu/3+c95dDmZx/c0mD1dbVe
 aNBemHw87TB/XnbhKQtNm17EPC6KTjjWr6zgkxtNbJvI0sUBt+4wL8U1Nhvol97XALgixtYN4xe
 rPoY0AuxXCPU8mrz5SgiMcH5qmVUcGbYIRtkyPxJ1K0pWBuq7Ccc+JRwLwUAdi6G50x8=
X-Received: by 2002:a5d:6c6a:: with SMTP id r10mr9543643wrz.211.1637341152928; 
 Fri, 19 Nov 2021 08:59:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy7gAXwONI7KBjAdoRaTRdt9K+KFrT/uhUv+G7NryByEpmBVwjhIqyDZIsIH1aZOE0A5rto9A==
X-Received: by 2002:a5d:6c6a:: with SMTP id r10mr9543589wrz.211.1637341152600; 
 Fri, 19 Nov 2021 08:59:12 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id f7sm16351799wmg.6.2021.11.19.08.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:59:12 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/11] migration: Move iov from pages to params
Date: Fri, 19 Nov 2021 17:58:58 +0100
Message-Id: <20211119165903.18813-7-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211119165903.18813-1-quintela@redhat.com>
References: <20211119165903.18813-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will allow us to reduce the number of system calls on the next patch.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd.h |  8 ++++++--
 migration/multifd.c | 30 +++++++++++++++++++++---------
 2 files changed, 27 insertions(+), 11 deletions(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index 15c50ca0b2..67f9104051 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -62,8 +62,6 @@ typedef struct {
     uint64_t packet_num;
     /* offset of each page */
     ram_addr_t *offset;
-    /* pointer to each page */
-    struct iovec *iov;
     RAMBlock *block;
 } MultiFDPages_t;
 
@@ -110,6 +108,10 @@ typedef struct {
     uint64_t num_pages;
     /* syncs main thread and channels */
     QemuSemaphore sem_sync;
+    /* buffers to send */
+    struct iovec *iov;
+    /* used for compression methods */
+    uint32_t iovs_used;
     /* used for compression methods */
     void *data;
 }  MultiFDSendParams;
@@ -149,6 +151,8 @@ typedef struct {
     uint64_t num_pages;
     /* syncs main thread and channels */
     QemuSemaphore sem_sync;
+    /* buffers to recv */
+    struct iovec *iov;
     /* used for de-compression methods */
     void *data;
 } MultiFDRecvParams;
diff --git a/migration/multifd.c b/migration/multifd.c
index e2adcdffa1..4368b7f855 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -87,6 +87,14 @@ static void nocomp_send_cleanup(MultiFDSendParams *p, Error **errp)
 static int nocomp_send_prepare(MultiFDSendParams *p, uint32_t used,
                                Error **errp)
 {
+    MultiFDPages_t *pages = p->pages;
+
+    for (int i = 0; i < used; i++) {
+        p->iov[p->iovs_used].iov_base = pages->block->host + pages->offset[i];
+        p->iov[p->iovs_used].iov_len = qemu_target_page_size();
+        p->iovs_used++;
+    }
+
     p->next_packet_size = used * qemu_target_page_size();
     p->flags |= MULTIFD_FLAG_NOCOMP;
     return 0;
@@ -105,7 +113,7 @@ static int nocomp_send_prepare(MultiFDSendParams *p, uint32_t used,
  */
 static int nocomp_send_write(MultiFDSendParams *p, uint32_t used, Error **errp)
 {
-    return qio_channel_writev_all(p->c, p->pages->iov, used, errp);
+    return qio_channel_writev_all(p->c, p->iov, p->iovs_used, errp);
 }
 
 /**
@@ -154,7 +162,11 @@ static int nocomp_recv_pages(MultiFDRecvParams *p, uint32_t used, Error **errp)
                    p->id, flags, MULTIFD_FLAG_NOCOMP);
         return -1;
     }
-    return qio_channel_readv_all(p->c, p->pages->iov, used, errp);
+    for (int i = 0; i < p->pages->used; i++) {
+        p->iov[i].iov_base = p->pages->block->host + p->pages->offset[i];
+        p->iov[i].iov_len = qemu_target_page_size();
+    }
+    return qio_channel_readv_all(p->c, p->iov, used, errp);
 }
 
 static MultiFDMethods multifd_nocomp_ops = {
@@ -244,7 +256,6 @@ static MultiFDPages_t *multifd_pages_init(size_t size)
     MultiFDPages_t *pages = g_new0(MultiFDPages_t, 1);
 
     pages->allocated = size;
-    pages->iov = g_new0(struct iovec, size);
     pages->offset = g_new0(ram_addr_t, size);
 
     return pages;
@@ -256,8 +267,6 @@ static void multifd_pages_clear(MultiFDPages_t *pages)
     pages->allocated = 0;
     pages->packet_num = 0;
     pages->block = NULL;
-    g_free(pages->iov);
-    pages->iov = NULL;
     g_free(pages->offset);
     pages->offset = NULL;
     g_free(pages);
@@ -366,8 +375,6 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
         }
         p->pages->offset[i] = offset;
         p->pages->block = block;
-        p->pages->iov[i].iov_base = block->host + offset;
-        p->pages->iov[i].iov_len = qemu_target_page_size();
     }
 
     return 0;
@@ -471,8 +478,6 @@ int multifd_queue_page(QEMUFile *f, RAMBlock *block, ram_addr_t offset)
 
     if (pages->block == block) {
         pages->offset[pages->used] = offset;
-        pages->iov[pages->used].iov_base = block->host + offset;
-        pages->iov[pages->used].iov_len = qemu_target_page_size();
         pages->used++;
 
         if (pages->used < pages->allocated) {
@@ -565,6 +570,8 @@ void multifd_save_cleanup(void)
         p->packet_len = 0;
         g_free(p->packet);
         p->packet = NULL;
+        g_free(p->iov);
+        p->iov = NULL;
         multifd_send_state->ops->send_cleanup(p, &local_err);
         if (local_err) {
             migrate_set_error(migrate_get_current(), local_err);
@@ -653,6 +660,7 @@ static void *multifd_send_thread(void *opaque)
             uint32_t used = p->pages->used;
             uint64_t packet_num = p->packet_num;
             flags = p->flags;
+            p->iovs_used = 0;
 
             if (used) {
                 ret = multifd_send_state->ops->send_prepare(p, used,
@@ -922,6 +930,7 @@ int multifd_save_setup(Error **errp)
         p->packet->version = cpu_to_be32(MULTIFD_VERSION);
         p->name = g_strdup_printf("multifdsend_%d", i);
         p->tls_hostname = g_strdup(s->hostname);
+        p->iov = g_new0(struct iovec, page_count);
         socket_send_channel_create(multifd_new_send_channel_async, p);
     }
 
@@ -1021,6 +1030,8 @@ int multifd_load_cleanup(Error **errp)
         p->packet_len = 0;
         g_free(p->packet);
         p->packet = NULL;
+        g_free(p->iov);
+        p->iov = NULL;
         multifd_recv_state->ops->recv_cleanup(p);
     }
     qemu_sem_destroy(&multifd_recv_state->sem_sync);
@@ -1161,6 +1172,7 @@ int multifd_load_setup(Error **errp)
                       + sizeof(uint64_t) * page_count;
         p->packet = g_malloc0(p->packet_len);
         p->name = g_strdup_printf("multifdrecv_%d", i);
+        p->iov = g_new0(struct iovec, page_count);
     }
 
     for (i = 0; i < thread_count; i++) {
-- 
2.33.1


