Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB66045B82E
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 11:16:43 +0100 (CET)
Received: from localhost ([::1]:50498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mppKV-0000nA-0v
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 05:16:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mppB4-0007zj-Td
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:06:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mppB3-0006qx-43
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:06:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637748416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ulUQI87aAwgZRgREGrNbA238jZyNy23cNrEDcHJPeEo=;
 b=d+tvQrUxhE2lKKqv8mSKnh07hhWUOL/cxlTqCsg3p7AF2YDYRBBqPbHp5W6I7TwTJN8Kdu
 yR88et99VWYRScERv+4fIyMiTft/4rmZ0PvZowfaN0cDpLanh/z+b9HiiaQOdiZNb+3O13
 QqrMmW/PSnakswd8Tq8mYqdIoc7EmgY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-21-HvmJiSRoP7uvnF0kLh33UQ-1; Wed, 24 Nov 2021 05:06:55 -0500
X-MC-Unique: HvmJiSRoP7uvnF0kLh33UQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B53699F92B
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 10:06:54 +0000 (UTC)
Received: from redhat.mitica.com (unknown [10.39.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B9D560843;
 Wed, 24 Nov 2021 10:06:53 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/23] multifd: Make zlib use iov's
Date: Wed, 24 Nov 2021 11:06:06 +0100
Message-Id: <20211124100617.19786-13-quintela@redhat.com>
In-Reply-To: <20211124100617.19786-1-quintela@redhat.com>
References: <20211124100617.19786-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 migration/multifd-zlib.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
index da6201704c..478a4af115 100644
--- a/migration/multifd-zlib.c
+++ b/migration/multifd-zlib.c
@@ -143,6 +143,9 @@ static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
         }
         out_size += available - zs->avail_out;
     }
+    p->iov[p->iovs_num].iov_base = z->zbuff;
+    p->iov[p->iovs_num].iov_len = out_size;
+    p->iovs_num++;
     p->next_packet_size = out_size;
     p->flags |= MULTIFD_FLAG_ZLIB;
 
@@ -162,10 +165,7 @@ static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
  */
 static int zlib_send_write(MultiFDSendParams *p, uint32_t used, Error **errp)
 {
-    struct zlib_data *z = p->data;
-
-    return qio_channel_write_all(p->c, (void *)z->zbuff, p->next_packet_size,
-                                 errp);
+    return qio_channel_writev_all(p->c, p->iov, p->iovs_num, errp);
 }
 
 /**
-- 
2.33.1


