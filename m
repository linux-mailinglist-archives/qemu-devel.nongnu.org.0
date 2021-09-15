Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2CF40CC7E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 20:21:42 +0200 (CEST)
Received: from localhost ([::1]:56100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQZXR-0002de-UK
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 14:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ79-0007wT-Hj
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:54:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ77-0007JE-Qt
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:54:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631728469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C56eKEevVNFSB3qbkBOrLbpsNKhnoUq4V0uA9Yj62eI=;
 b=KomaMfgs88GBBgGjVE5jQpk40Pv7seHxj3ScO9I2ez4a2xxbZilS6ZfzRy1FVT1QnhnZ3x
 Pa+Qn3Mg6h4JfQjqdQDNEK7B4miu6UIkDJXk1TcZBZb7r9Zp7pma8Q2BCfRLrxfAAYErb1
 0zAeJw4FHQ6EgoMLdQ97ZSWOPZXZmUk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-W-MZ_lJSPVu8D3pH5LzC_A-1; Wed, 15 Sep 2021 13:54:27 -0400
X-MC-Unique: W-MZ_lJSPVu8D3pH5LzC_A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C733A1084684;
 Wed, 15 Sep 2021 17:54:26 +0000 (UTC)
Received: from localhost (unknown [10.39.192.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 727185C1C5;
 Wed, 15 Sep 2021 17:54:26 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 31/32] qcow2-refcount: check_refblocks(): add separate message
 for reserved
Date: Wed, 15 Sep 2021 19:53:17 +0200
Message-Id: <20210915175318.853225-32-hreitz@redhat.com>
In-Reply-To: <20210915175318.853225-1-hreitz@redhat.com>
References: <20210915175318.853225-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Split checking for reserved bits out of aligned offset check.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Tested-by: Kirill Tkhai <ktkhai@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20210914122454.141075-11-vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/qcow2.h          |  1 +
 block/qcow2-refcount.c | 10 +++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index 58fd7f1678..fd48a89d45 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -591,6 +591,7 @@ typedef enum QCow2MetadataOverlap {
 #define L2E_STD_RESERVED_MASK 0x3f000000000001feULL
 
 #define REFT_OFFSET_MASK 0xfffffffffffffe00ULL
+#define REFT_RESERVED_MASK 0x1ffULL
 
 #define INV_OFFSET (-1ULL)
 
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 1c246b9227..4614572252 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -2089,9 +2089,17 @@ static int check_refblocks(BlockDriverState *bs, BdrvCheckResult *res,
 
     for(i = 0; i < s->refcount_table_size; i++) {
         uint64_t offset, cluster;
-        offset = s->refcount_table[i];
+        offset = s->refcount_table[i] & REFT_OFFSET_MASK;
         cluster = offset >> s->cluster_bits;
 
+        if (s->refcount_table[i] & REFT_RESERVED_MASK) {
+            fprintf(stderr, "ERROR refcount table entry %" PRId64 " has "
+                    "reserved bits set\n", i);
+            res->corruptions++;
+            *rebuild = true;
+            continue;
+        }
+
         /* Refcount blocks are cluster aligned */
         if (offset_into_cluster(s, offset)) {
             fprintf(stderr, "ERROR refcount block %" PRId64 " is not "
-- 
2.31.1


