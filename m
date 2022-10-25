Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E5D60C2DA
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 06:53:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onBt8-0006NS-US; Tue, 25 Oct 2022 00:50:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1onBt5-0006Gw-Pu
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 00:50:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1onBt4-0002vE-5y
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 00:50:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666673401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rhDoG+PrbRzibg6I8lz2xrP5yTvQnEEi4Wd2QPyWLnM=;
 b=QQrOfy6+2oDKwJSN4EgFJOKZfiDwLpvtbfGK33jZfAiBwdhOr/HRZp9W0yY5YIOHpSmjSL
 BLJlkpk1/jKLqCstav82TUVclYJ/ToSXO+mnJLFp3FV2PqKRehG+Al6iN0GKvdChxWJOt0
 hWWYL83Zn2NS/BH85hE6OdzcUHuLnmU=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-380-2truoTIxPEig8hbRCiwOhg-1; Tue, 25 Oct 2022 00:48:12 -0400
X-MC-Unique: 2truoTIxPEig8hbRCiwOhg-1
Received: by mail-qk1-f197.google.com with SMTP id
 f12-20020a05620a408c00b006ced53b80e5so10636097qko.17
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 21:48:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rhDoG+PrbRzibg6I8lz2xrP5yTvQnEEi4Wd2QPyWLnM=;
 b=R3XZvRfBNU2f+ifVIGdnSgyWoCgYxghwmoF5G2yt+6ETjkDPnvTqI7dHMk0hQTTJtr
 TkT8rtnstH5ReUTSQrsTAG0VJg8KIA3jtK9rfBLOQndLXy/3Wz9nfxALw4h2iNgBlmRM
 avl8TLROkfRa1TMO/a40afsPunbLaLMCFYQ3Sw0cuzHdtW58QlI5CT5VlwCEQ4uqqZOK
 d/cWcYnz09lpLYhPPQ8N4BRcM4LbKut1SQfsjAJBc5OEmLcAOl4UpDuopckNjeUow6H3
 E9KjmxUfZLvqaOpAGIExxk10gaBn71UsNUvuAFIVAMkUzDMSB7vprby9WPeVEgG53Cbc
 OlLQ==
X-Gm-Message-State: ACrzQf1c2R79reQK2UcK3rjJ+dFpo99dFy9VoRkySvZsVHvnyy6DGtWF
 a9wG+NK9akpg2Ra+sFA5JEjJnupVs/XK623z+tPBKcygHLJscVeLEDAyHhjoAKOqvPbTFNrxjCG
 CsLwG2OtPbK5lAFE=
X-Received: by 2002:ae9:e107:0:b0:6ed:638:930 with SMTP id
 g7-20020ae9e107000000b006ed06380930mr24680782qkm.211.1666673276930; 
 Mon, 24 Oct 2022 21:47:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6l2vfpZCORdHGlrDtwXNc2ykEbJBl5R5EoMNV1NNs7qSblFsrMB9KSuz+x4o3Zah6UE99VwA==
X-Received: by 2002:ae9:e107:0:b0:6ed:638:930 with SMTP id
 g7-20020ae9e107000000b006ed06380930mr24680778qkm.211.1666673276713; 
 Mon, 24 Oct 2022 21:47:56 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:1b3:a801:de5e:6447:4a67:eb7c:b690])
 by smtp.gmail.com with ESMTPSA id
 d23-20020a05620a141700b006cbcdc6efedsm1350968qkj.41.2022.10.24.21.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 21:47:56 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH 4/4] migration/multifd/zero-copy: Flush only the LRU half
 of the header array
Date: Tue, 25 Oct 2022 01:47:31 -0300
Message-Id: <20221025044730.319941-5-leobras@redhat.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221025044730.319941-1-leobras@redhat.com>
References: <20221025044730.319941-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Zero-copy multifd migration sends both the header and the memory pages in a
single syscall. Since it's necessary to flush before reusing the header, a
header array was implemented, so each write call uses a different
array, and flushing only take place after all headers have been used,
meaning 1 flush for each N writes.

This method has a bottleneck, though: After the last write, a flush will
have to wait for all writes to finish, which will be a lot, meaning the
recvmsg() syscall called in qio_channel_socket_flush() will be called a
lot. On top of that, it will create a time period when the I/O queue is
empty and nothing is getting send: between the flush and the next write.

To avoid that, use qio_channel_flush()'s new max_pending parameter to wait
until at most half of the array is still in use. (i.e. the LRU half of the
array can be reused)

Flushing for the LRU half of the array is much faster, since it does not
have to wait for the most recent writes to finish, making up for having
to flush twice per array.

As a main benefit, this approach keeps the I/O queue from being empty while
there are still data to be sent, making it easier to keep the I/O maximum
throughput while consuming less cpu time.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 migration/multifd.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index c5d1f911a4..fe9df460f6 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -569,12 +569,13 @@ void multifd_save_cleanup(void)
     multifd_send_state = NULL;
 }
 
-static int multifd_zero_copy_flush(QIOChannel *c)
+static int multifd_zero_copy_flush(QIOChannel *c,
+                                   int max_remaining)
 {
     int ret;
     Error *err = NULL;
 
-    ret = qio_channel_flush(c, 0, &err);
+    ret = qio_channel_flush(c, max_remaining, &err);
     if (ret < 0) {
         error_report_err(err);
         return -1;
@@ -636,7 +637,7 @@ int multifd_send_sync_main(QEMUFile *f)
         qemu_mutex_unlock(&p->mutex);
         qemu_sem_post(&p->sem);
 
-        if (flush_zero_copy && p->c && (multifd_zero_copy_flush(p->c) < 0)) {
+        if (flush_zero_copy && p->c && (multifd_zero_copy_flush(p->c, 0) < 0)) {
             return -1;
         }
     }
@@ -719,12 +720,17 @@ static void *multifd_send_thread(void *opaque)
 
             if (use_zero_copy_send) {
                 p->packet_idx = (p->packet_idx + 1) % HEADER_ARR_SZ;
-
-                if (!p->packet_idx && (multifd_zero_copy_flush(p->c) < 0)) {
+                /*
+                 * When half the array have been used, flush to make sure the
+                 * next half is available
+                 */
+                if (!(p->packet_idx % (HEADER_ARR_SZ / 2)) &&
+                    (multifd_zero_copy_flush(p->c, HEADER_ARR_SZ / 2) < 0)) {
                     break;
                 }
                 header = (void *)p->packet + p->packet_idx * p->packet_len;
             }
+
             qemu_mutex_lock(&p->mutex);
             p->pending_job--;
             qemu_mutex_unlock(&p->mutex);
-- 
2.38.0


