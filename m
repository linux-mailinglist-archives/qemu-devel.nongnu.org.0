Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E977148AEEC
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 14:53:57 +0100 (CET)
Received: from localhost ([::1]:35028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Hb3-0000Ru-0O
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 08:53:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1n7Glr-0004vK-44
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 08:01:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1n7Glo-0005i0-Rc
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 08:01:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641906060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ic08oG18HKE0ftYJKg9uTKlFpA5Jom9uIQYoRo57C4E=;
 b=Vemp0lc7pfPF2Ha3WzThWlagCAD0YTQ6ZRTf09kECEVW4/tvvT2JIw1o9pGzgIQhrkdnVD
 i/BYcBfElRRtGkCqnzBlDh2zusugArnEgMSoOI6Dxe0F3Ibq+gClVwSgRhov1Mvg2MX3a9
 /nEAlE9xTEbv8AN8dZbl8zbTYXzw/1U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-yKjFaP9FMXONfPFm76rPtw-1; Tue, 11 Jan 2022 08:00:59 -0500
X-MC-Unique: yKjFaP9FMXONfPFm76rPtw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8CC78042F6;
 Tue, 11 Jan 2022 13:00:57 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CEE371059179;
 Tue, 11 Jan 2022 13:00:55 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/23] multifd: Use proper maximum compression values
Date: Tue, 11 Jan 2022 14:00:08 +0100
Message-Id: <20220111130024.5392-8-quintela@redhat.com>
In-Reply-To: <20220111130024.5392-1-quintela@redhat.com>
References: <20220111130024.5392-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Leonardo Bras <leobras@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It happens that there are functions to calculate the worst possible
compression size for a packet.  Use them.

Suggested-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd-zlib.c | 4 ++--
 migration/multifd-zstd.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
index 9f6ebf1076..a2fec4d01d 100644
--- a/migration/multifd-zlib.c
+++ b/migration/multifd-zlib.c
@@ -54,8 +54,8 @@ static int zlib_send_setup(MultiFDSendParams *p, Error **errp)
         error_setg(errp, "multifd %u: deflate init failed", p->id);
         return -1;
     }
-    /* To be safe, we reserve twice the size of the packet */
-    z->zbuff_len = MULTIFD_PACKET_SIZE * 2;
+    /* This is the maxium size of the compressed buffer */
+    z->zbuff_len = compressBound(MULTIFD_PACKET_SIZE);
     z->zbuff = g_try_malloc(z->zbuff_len);
     if (!z->zbuff) {
         deflateEnd(&z->zs);
diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
index cc4e991724..97c08367d0 100644
--- a/migration/multifd-zstd.c
+++ b/migration/multifd-zstd.c
@@ -67,8 +67,8 @@ static int zstd_send_setup(MultiFDSendParams *p, Error **errp)
                    p->id, ZSTD_getErrorName(res));
         return -1;
     }
-    /* To be safe, we reserve twice the size of the packet */
-    z->zbuff_len = MULTIFD_PACKET_SIZE * 2;
+    /* This is the maxium size of the compressed buffer */
+    z->zbuff_len = ZSTD_compressBound(MULTIFD_PACKET_SIZE);
     z->zbuff = g_try_malloc(z->zbuff_len);
     if (!z->zbuff) {
         ZSTD_freeCStream(z->zcs);
-- 
2.34.1


