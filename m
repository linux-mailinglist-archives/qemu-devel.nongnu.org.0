Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CB440CC9C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 20:33:41 +0200 (CEST)
Received: from localhost ([::1]:53126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQZj2-0002pI-KU
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 14:33:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ75-0007g4-33
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:54:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ71-0007E5-Nc
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:54:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631728463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OQEYhPE9nXPUBTQOUn4zz3K5hWB46g2ANnP4UKtpmOE=;
 b=JevSxG/v74mUiAzBW/UkTofNRiBXdEPzwoFKoxhHcsICgM80a7seB5A4YeRbmWsB5kpJNK
 GORi1g2HfhdmrgJpNUNy8xpZ1yQJSmvcOYogBd7aCUcFNgtz4cjxXdEFLqToMaLJMWV5V1
 lRytzJdun/LYOYG5skAdaPZCjeJRdVs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-KhLD0gXNMnGpFmZQyJGyfw-1; Wed, 15 Sep 2021 13:54:21 -0400
X-MC-Unique: KhLD0gXNMnGpFmZQyJGyfw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D96B80124F;
 Wed, 15 Sep 2021 17:54:20 +0000 (UTC)
Received: from localhost (unknown [10.39.192.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2437460583;
 Wed, 15 Sep 2021 17:54:19 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 28/32] qcow2-refcount: check_refcounts_l2(): check reserved bits
Date: Wed, 15 Sep 2021 19:53:14 +0200
Message-Id: <20210915175318.853225-29-hreitz@redhat.com>
In-Reply-To: <20210915175318.853225-1-hreitz@redhat.com>
References: <20210915175318.853225-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.39, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Tested-by: Kirill Tkhai <ktkhai@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20210914122454.141075-8-vsementsov@virtuozzo.com>
[hreitz: Separated `type` declaration from statements]
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/qcow2.h          |  1 +
 block/qcow2-refcount.c | 14 +++++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index c0e1e83796..b8b1093b61 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -587,6 +587,7 @@ typedef enum QCow2MetadataOverlap {
 
 #define L1E_OFFSET_MASK 0x00fffffffffffe00ULL
 #define L2E_OFFSET_MASK 0x00fffffffffffe00ULL
+#define L2E_STD_RESERVED_MASK 0x3f000000000001feULL
 
 #define REFT_OFFSET_MASK 0xfffffffffffffe00ULL
 
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 9a5ae3cac4..bdac7b1780 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1680,10 +1680,22 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
     for (i = 0; i < s->l2_size; i++) {
         uint64_t coffset;
         int csize;
+        QCow2ClusterType type;
+
         l2_entry = get_l2_entry(s, l2_table, i);
         l2_bitmap = get_l2_bitmap(s, l2_table, i);
+        type = qcow2_get_cluster_type(bs, l2_entry);
+
+        if (type != QCOW2_CLUSTER_COMPRESSED) {
+            /* Check reserved bits of Standard Cluster Descriptor */
+            if (l2_entry & L2E_STD_RESERVED_MASK) {
+                fprintf(stderr, "ERROR found l2 entry with reserved bits set: "
+                        "%" PRIx64 "\n", l2_entry);
+                res->corruptions++;
+            }
+        }
 
-        switch (qcow2_get_cluster_type(bs, l2_entry)) {
+        switch (type) {
         case QCOW2_CLUSTER_COMPRESSED:
             /* Compressed clusters don't have QCOW_OFLAG_COPIED */
             if (l2_entry & QCOW_OFLAG_COPIED) {
-- 
2.31.1


