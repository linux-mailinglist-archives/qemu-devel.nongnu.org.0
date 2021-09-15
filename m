Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A3140CCAC
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 20:37:59 +0200 (CEST)
Received: from localhost ([::1]:34806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQZnC-0000yK-IV
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 14:37:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ77-0007oB-DN
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:54:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ75-0007HI-K7
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:54:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631728467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jq24j4hmzhxp6qwU39w7PkxHqqQF+fATDblPaviuxOQ=;
 b=NvmjqMpZogO/ax3MR26p6rZBhCFeGHIgh1nqmOm63MhAVt4VxmfgaOlBjntK1EA7Akp/Gt
 6OIbUs6cGQh+zh0/N+E9oLpDnaYcALyrTXEByw52tUy64DsnlXR1BGhS6je7PyvRgoC5oy
 zelfwcO0OFOEpO4JU0UJlXbjutKlWQo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-aQUawDfCPtuC8YNP55L6sA-1; Wed, 15 Sep 2021 13:54:25 -0400
X-MC-Unique: aQUawDfCPtuC8YNP55L6sA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A846A1966327;
 Wed, 15 Sep 2021 17:54:24 +0000 (UTC)
Received: from localhost (unknown [10.39.192.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A7C83AC0;
 Wed, 15 Sep 2021 17:54:24 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 30/32] qcow2-refcount: check_refcounts_l1(): check reserved bits
Date: Wed, 15 Sep 2021 19:53:16 +0200
Message-Id: <20210915175318.853225-31-hreitz@redhat.com>
In-Reply-To: <20210915175318.853225-1-hreitz@redhat.com>
References: <20210915175318.853225-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Message-Id: <20210914122454.141075-10-vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/qcow2.h          | 1 +
 block/qcow2-refcount.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/block/qcow2.h b/block/qcow2.h
index b8b1093b61..58fd7f1678 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -586,6 +586,7 @@ typedef enum QCow2MetadataOverlap {
     (QCOW2_OL_CACHED | QCOW2_OL_INACTIVE_L2)
 
 #define L1E_OFFSET_MASK 0x00fffffffffffe00ULL
+#define L1E_RESERVED_MASK 0x7f000000000001ffULL
 #define L2E_OFFSET_MASK 0x00fffffffffffe00ULL
 #define L2E_STD_RESERVED_MASK 0x3f000000000001feULL
 
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 3c89e09599..1c246b9227 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1902,6 +1902,12 @@ static int check_refcounts_l1(BlockDriverState *bs,
             continue;
         }
 
+        if (l1_table[i] & L1E_RESERVED_MASK) {
+            fprintf(stderr, "ERROR found L1 entry with reserved bits set: "
+                    "%" PRIx64 "\n", l1_table[i]);
+            res->corruptions++;
+        }
+
         l2_offset = l1_table[i] & L1E_OFFSET_MASK;
 
         /* Mark L2 table as used */
-- 
2.31.1


