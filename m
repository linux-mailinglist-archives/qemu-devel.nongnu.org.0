Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1B745AAAC
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 18:58:51 +0100 (CET)
Received: from localhost ([::1]:34108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpa4A-00045n-NT
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 12:58:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpZxF-0006dp-Rr
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:51:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpZx6-0006r4-Pg
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:51:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637689891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JCdDh3ludzQAxMfzS4ktrQ1Cbf8eu31L+AmHakZVN3Q=;
 b=GVrJee+7Eehoz2IAv0IzCcTYN0ZSoMnRwlOKwMgJEjOpEgAtfOXsokt2ALxnBVHFatsq+P
 7UIrGnEM+v3ljJVk06g7oj2sl0pMQ+zUxJNQFlhlhZef4WB0DL8OxVc1TN5/jvZ+FS9SJk
 O2c9jSLmlXy/j9wAVo9UtdEg7IghBx4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-328-C0uVMW3EM06dUSibMXOXrg-1; Tue, 23 Nov 2021 12:51:30 -0500
X-MC-Unique: C0uVMW3EM06dUSibMXOXrg-1
Received: by mail-wm1-f70.google.com with SMTP id
 l4-20020a05600c1d0400b00332f47a0fa3so1917086wms.8
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 09:51:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JCdDh3ludzQAxMfzS4ktrQ1Cbf8eu31L+AmHakZVN3Q=;
 b=bxEIdM5kY/aghtC0tm7IwmnD/2vLYnNPMBhrna68fQt7vHK2f5npRygJ6HRdgEpb51
 Ej7mAwc+YukfjobN5jJbwsdz/ttcMBuwOow73+diMsTC+KIkwDHjEoozWK2gmMp+EEyt
 q6Tw9u8bgLSmbPhZ1Koa+ACyXbDBqXRraOKNMSCVTexxlbSw1znvul49/sLhgQ3lokOR
 O4fHnR5wAQL1nKPF3T0rVVHrr16Cj7sEFL9ESo03rN0vhDXfs6DTET82HBrGyS+3tU8M
 AdDirJsNfghx5nlQir5r/V9z/H3GxipLzUp0/WjSTeiDTMgAoYo0DwnRJrBmp71X4AgV
 b9GQ==
X-Gm-Message-State: AOAM532NXwI0PqnjFVGWF605FETZZxKRp1tQQ/FG+uae54xTau/280lp
 ywP9JXePz2AHd6qbriptyM1lNpexQkqoPDkExz8oXvSwyxTSe3wGwqRNXX/MIRuG1GH65OgWpuC
 YdX31mvlBn/LH5ayUe4aZkmAr0o80XbvFtym4O1kYI6HHnygnTwLwEp7z3POpCygPpio=
X-Received: by 2002:a7b:c341:: with SMTP id l1mr5555185wmj.60.1637689889118;
 Tue, 23 Nov 2021 09:51:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqxYrn1FyUt/DnXRfSpX6amR9ZEup4rAh37suA5vEoMDHGpzXzXLdGXpPs3WoB60C18jk4yw==
X-Received: by 2002:a7b:c341:: with SMTP id l1mr5555130wmj.60.1637689888810;
 Tue, 23 Nov 2021 09:51:28 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id c1sm12646618wrt.14.2021.11.23.09.51.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 09:51:28 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/23] multifd: Make zstd compression method not use iovs
Date: Tue, 23 Nov 2021 18:50:59 +0100
Message-Id: <20211123175113.35569-10-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211123175113.35569-1-quintela@redhat.com>
References: <20211123175113.35569-1-quintela@redhat.com>
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


