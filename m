Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAB245B807
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 11:07:11 +0100 (CET)
Received: from localhost ([::1]:49560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mppBG-00068G-Ca
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 05:07:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpp0R-0003Y0-BL
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:56:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpp0O-0004u1-SE
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:55:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637747756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JCdDh3ludzQAxMfzS4ktrQ1Cbf8eu31L+AmHakZVN3Q=;
 b=bq9L8h5KyhLYV2XHz2twZ1l+jsAVZcDog8gT8ogCjyOl/79ThLuK0qHw2mm4b3Bw4XbDTg
 0B3ditwOClhPMNejyEj29fJ38bsd76Ovt/RPbQcQ9lnxdBH4MQjUOLKvsLAQx/alTgeRDQ
 cDQKyv+XLjfs8acRQA/EMLddC2sx85I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-96-wRVQRn10PtGZjawlcl9F1Q-1; Wed, 24 Nov 2021 04:55:55 -0500
X-MC-Unique: wRVQRn10PtGZjawlcl9F1Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 g81-20020a1c9d54000000b003330e488323so1499487wme.0
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 01:55:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JCdDh3ludzQAxMfzS4ktrQ1Cbf8eu31L+AmHakZVN3Q=;
 b=pJB5sOtF5J2LBk/4+0ISH75cXNBlGWalkGmM2/3t9/uo984rE8OFsP//yQagUK2rJt
 PJvYri4/uE2W/spLvLaExf/fm7wJ0yPtdiP3UVOy2e/lCJgdMOQxRZgy31z1ku4X36aB
 AiG414YCxVi1C6DQs1PDuxhUuPSIpDUVGpoyxDVsolUb3nWs2x0XxLPbB/JDd29Hdw5X
 TBxMjVAFypD7zFJe/EEBtl0it3yM7EBJMkHrJKQDe63P2QVcY4X6wn3Al9NAEMgYFko0
 XgjIEXkZ5tuyneCth1s5LP8alKBeMWdy+eyV93k3GsJ6dwzVq0g8uyymwMkTUkfYyVkb
 9ixw==
X-Gm-Message-State: AOAM530Z87LyApw5ZEhrJ0bmPBAVHYMzoghQMmKINaoiWFRPWEKdc6QX
 Lhdgev3mxKOYnh/fgvkLYx6aRh0BA4LVQxkuiJeltw6ssQGewRjlIccoNvZQsEdUkO3LfHMDtKy
 NWZolkJ9DT8F1KhToNd0Q8oVsZ82fyyRSr0TwbUFxPFdpgOxIaTLyRXAyCSZSx8KJah0=
X-Received: by 2002:a5d:4843:: with SMTP id n3mr16063147wrs.335.1637747753865; 
 Wed, 24 Nov 2021 01:55:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZjF9RWki0dFc8P54NwkGz0Umpbl5APS3FLloFIl9J5HYgmVwenZMXut0FGApPbkwBHbDxCg==
X-Received: by 2002:a5d:4843:: with SMTP id n3mr16063109wrs.335.1637747753603; 
 Wed, 24 Nov 2021 01:55:53 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id bg12sm5568100wmb.5.2021.11.24.01.55.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 01:55:53 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/23] multifd: Make zstd compression method not use iovs
Date: Wed, 24 Nov 2021 10:54:46 +0100
Message-Id: <20211124095500.42078-10-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124095500.42078-1-quintela@redhat.com>
References: <20211124095500.42078-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
Cc: Leonardo Bras <leobras@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd-zstd.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
index a8b104f4ee..2d5b61106c 100644
--- a/migration/multifd-zstd.c
+++ b/migration/multifd-zstd.c
@@ -13,6 +13,7 @@
 #include "qemu/osdep.h"
 #include <zstd.h>
 #include "qemu/rcu.h"
+#include "exec/ramblock.h"
 #include "exec/target_page.h"
 #include "qapi/error.h"
 #include "migration.h"
@@ -111,8 +112,8 @@ static void zstd_send_cleanup(MultiFDSendParams *p, Error **errp)
  */
 static int zstd_send_prepare(MultiFDSendParams *p, Error **errp)
 {
-    struct iovec *iov = p->pages->iov;
     struct zstd_data *z = p->data;
+    size_t page_size = qemu_target_page_size();
     int ret;
     uint32_t i;
 
@@ -126,8 +127,8 @@ static int zstd_send_prepare(MultiFDSendParams *p, Error **errp)
         if (i == p->pages->num - 1) {
             flush = ZSTD_e_flush;
         }
-        z->in.src = iov[i].iov_base;
-        z->in.size = iov[i].iov_len;
+        z->in.src = p->pages->block->host + p->pages->offset[i];
+        z->in.size = page_size;
         z->in.pos = 0;
 
         /*
@@ -256,7 +257,8 @@ static int zstd_recv_pages(MultiFDRecvParams *p, Error **errp)
 {
     uint32_t in_size = p->next_packet_size;
     uint32_t out_size = 0;
-    uint32_t expected_size = p->pages->num * qemu_target_page_size();
+    size_t page_size = qemu_target_page_size();
+    uint32_t expected_size = p->pages->num * page_size;
     uint32_t flags = p->flags & MULTIFD_FLAG_COMPRESSION_MASK;
     struct zstd_data *z = p->data;
     int ret;
@@ -278,10 +280,8 @@ static int zstd_recv_pages(MultiFDRecvParams *p, Error **errp)
     z->in.pos = 0;
 
     for (i = 0; i < p->pages->num; i++) {
-        struct iovec *iov = &p->pages->iov[i];
-
-        z->out.dst = iov->iov_base;
-        z->out.size = iov->iov_len;
+        z->out.dst = p->pages->block->host + p->pages->offset[i];
+        z->out.size = page_size;
         z->out.pos = 0;
 
         /*
@@ -295,8 +295,8 @@ static int zstd_recv_pages(MultiFDRecvParams *p, Error **errp)
         do {
             ret = ZSTD_decompressStream(z->zds, &z->out, &z->in);
         } while (ret > 0 && (z->in.size - z->in.pos > 0)
-                         && (z->out.pos < iov->iov_len));
-        if (ret > 0 && (z->out.pos < iov->iov_len)) {
+                         && (z->out.pos < page_size));
+        if (ret > 0 && (z->out.pos < page_size)) {
             error_setg(errp, "multifd %d: decompressStream buffer too small",
                        p->id);
             return -1;
-- 
2.33.1


