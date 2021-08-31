Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CDE3FC5CC
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 13:05:30 +0200 (CEST)
Received: from localhost ([::1]:35578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL1a6-0001Ix-0f
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 07:05:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mL1Xl-0007aq-Qw
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 07:03:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mL1Xi-00066y-Ml
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 07:03:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630407781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p9rSUW+5mIJo1lA0bnwvxvKcuIMBAj1Pcz7IyE4l0jw=;
 b=ZO4lLgHT44wYAmbZMsts4n2LYdj6DA3OwOU2ONvO730a1MwzA70ZfG/91vgPxE92Idu3p5
 RKe10pm3WYwZq820D0U1JmWRxzqVzfQNjjWWqUKDfaNheicjA2IE+88CyGGOKvVe54iLji
 vaPPAG0Filoqg7ebu8EyPo3C2ChTU6c=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-HO-MfMR1M3KbvcOq9IOaGQ-1; Tue, 31 Aug 2021 07:03:00 -0400
X-MC-Unique: HO-MfMR1M3KbvcOq9IOaGQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 h135-20020a379e8d000000b003f64b0f4865so1927891qke.12
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 04:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p9rSUW+5mIJo1lA0bnwvxvKcuIMBAj1Pcz7IyE4l0jw=;
 b=C0T78B/Wx84uN0ZbNAnosl9LlbMazoJXS1nee5JF6ez/2h/odWajyubUYGg6LHLMZL
 e0tJiKTUI4Rkd8GyMCw0FXZXOwZRNJjV7KluoFA3DOQXoSrxaIAat5F/DCOBDyqux4V1
 kAmXEXGQhreTHrlWAVAmz5F+PWjEVOQECQh68mjNWQKkEH74bcFBltNJgbOztj31X7SE
 WXr2hN8gM9+7sC0LePsKOzhlnkYCHGn5NbupRn0qdK2XtPRRngYnXifKSYO38n7uA7HU
 C+yTKvFzOveAxA79Testb6CB5C1gm0S6kqVyYbdkAU+IM4fLBJRf8xR3dHU52+N4/b3Z
 ZkVA==
X-Gm-Message-State: AOAM5303ZFbjHI8XxT1GATDW03BiumvA/GCKySNbNh98RDUhP8FUArhu
 zSuyvpM6287lUhhs2xIfJqQb6WpbdrUG5CDm3Bb0ngMfAYWFuZ5yFkxdG9Uxz5Hu/VCa3+nPFVT
 LGaVaUtf7A0PbKjk=
X-Received: by 2002:ae9:df07:: with SMTP id t7mr2373497qkf.95.1630407780006;
 Tue, 31 Aug 2021 04:03:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy55gEMfNxL9DZMfGwWVHLuMA91xOVcCUV2MRQG6EAN/0L9opZbMvfI+XtxQVgkYAVOngyTxA==
X-Received: by 2002:ae9:df07:: with SMTP id t7mr2373483qkf.95.1630407779843;
 Tue, 31 Aug 2021 04:02:59 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7f1:e948:8e69:9cd6:5512:12f4])
 by smtp.gmail.com with ESMTPSA id b25sm13315536qka.23.2021.08.31.04.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 04:02:59 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH v1 3/3] migration: multifd: Enable zerocopy
Date: Tue, 31 Aug 2021 08:02:39 -0300
Message-Id: <20210831110238.299458-4-leobras@redhat.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210831110238.299458-1-leobras@redhat.com>
References: <20210831110238.299458-1-leobras@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=leobras@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Call qio_channel_set_zerocopy(true) in the start of every multifd thread.

Change the send_write() interface of multifd, allowing it to pass down
flags for qio_channel_write*().

Pass down MSG_ZEROCOPY flag for sending memory pages, while keeping the
other data being sent at the default copying approach.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 migration/multifd-zlib.c | 7 ++++---
 migration/multifd-zstd.c | 7 ++++---
 migration/multifd.c      | 9 ++++++---
 migration/multifd.h      | 3 ++-
 4 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
index ab4ba75d75..d8cce1810a 100644
--- a/migration/multifd-zlib.c
+++ b/migration/multifd-zlib.c
@@ -160,12 +160,13 @@ static int zlib_send_prepare(MultiFDSendParams *p, uint32_t used, Error **errp)
  * @used: number of pages used
  * @errp: pointer to an error
  */
-static int zlib_send_write(MultiFDSendParams *p, uint32_t used, Error **errp)
+static int zlib_send_write(MultiFDSendParams *p, uint32_t used, int flags,
+                           Error **errp)
 {
     struct zlib_data *z = p->data;
 
-    return qio_channel_write_all(p->c, (void *)z->zbuff, p->next_packet_size,
-                                 errp);
+    return qio_channel_write_all_flags(p->c, (void *)z->zbuff,
+                                       p->next_packet_size, flags, errp);
 }
 
 /**
diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
index 693bddf8c9..fa063fd33e 100644
--- a/migration/multifd-zstd.c
+++ b/migration/multifd-zstd.c
@@ -171,12 +171,13 @@ static int zstd_send_prepare(MultiFDSendParams *p, uint32_t used, Error **errp)
  * @used: number of pages used
  * @errp: pointer to an error
  */
-static int zstd_send_write(MultiFDSendParams *p, uint32_t used, Error **errp)
+static int zstd_send_write(MultiFDSendParams *p, uint32_t used, int flags,
+                           Error **errp)
 {
     struct zstd_data *z = p->data;
 
-    return qio_channel_write_all(p->c, (void *)z->zbuff, p->next_packet_size,
-                                 errp);
+    return qio_channel_write_all_flags(p->c, (void *)z->zbuff,
+                                       p->next_packet_size, flags, errp);
 }
 
 /**
diff --git a/migration/multifd.c b/migration/multifd.c
index 377da78f5b..097621c12c 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -103,9 +103,10 @@ static int nocomp_send_prepare(MultiFDSendParams *p, uint32_t used,
  * @used: number of pages used
  * @errp: pointer to an error
  */
-static int nocomp_send_write(MultiFDSendParams *p, uint32_t used, Error **errp)
+static int nocomp_send_write(MultiFDSendParams *p, uint32_t used, int flags,
+                             Error **errp)
 {
-    return qio_channel_writev_all(p->c, p->pages->iov, used, errp);
+    return qio_channel_writev_all_flags(p->c, p->pages->iov, used, flags, errp);
 }
 
 /**
@@ -675,7 +676,8 @@ static void *multifd_send_thread(void *opaque)
             }
 
             if (used) {
-                ret = multifd_send_state->ops->send_write(p, used, &local_err);
+                ret = multifd_send_state->ops->send_write(p, used, MSG_ZEROCOPY,
+                                                          &local_err);
                 if (ret != 0) {
                     break;
                 }
@@ -815,6 +817,7 @@ static bool multifd_channel_connect(MultiFDSendParams *p,
         } else {
             /* update for tls qio channel */
             p->c = ioc;
+            qio_channel_set_zerocopy(ioc, true);
             qemu_thread_create(&p->thread, p->name, multifd_send_thread, p,
                                    QEMU_THREAD_JOINABLE);
        }
diff --git a/migration/multifd.h b/migration/multifd.h
index 8d6751f5ed..7243ba4185 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -157,7 +157,8 @@ typedef struct {
     /* Prepare the send packet */
     int (*send_prepare)(MultiFDSendParams *p, uint32_t used, Error **errp);
     /* Write the send packet */
-    int (*send_write)(MultiFDSendParams *p, uint32_t used, Error **errp);
+    int (*send_write)(MultiFDSendParams *p, uint32_t used, int flags,
+                      Error **errp);
     /* Setup for receiving side */
     int (*recv_setup)(MultiFDRecvParams *p, Error **errp);
     /* Cleanup for receiving side */
-- 
2.33.0


