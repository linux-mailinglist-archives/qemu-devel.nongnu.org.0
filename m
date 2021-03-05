Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A81332F10F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:24:40 +0100 (CET)
Received: from localhost ([::1]:59924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIEBr-00076r-K1
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:24:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDkQ-000740-Mn
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDkA-0007FG-HE
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614963359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DsMqEQ84ndUdTctY5ycuDO4t+nQuf19CMdj+3Zxei+U=;
 b=Ii9++fD3D8Ba8A4IRMX9BK1DbsabN03pM/GdVBARVMJLIkq+q8QUms4Q4mjm7E/flsEf3S
 26g4BZ4uAuaXlDzCW6NY5LLxyIrQ8alF1hAhBOdLpfk7H9exA0fvPOWsUjkm+zF/JCuk9Z
 OHJUjb1sSZUbW2QA4+AKW2hhGpqefsc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-EtPP_JJgNtOOWe12-4XFrw-1; Fri, 05 Mar 2021 11:55:56 -0500
X-MC-Unique: EtPP_JJgNtOOWe12-4XFrw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BD43879A1F;
 Fri,  5 Mar 2021 16:55:42 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F061960BF3;
 Fri,  5 Mar 2021 16:55:40 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 25/31] parallels.txt: fix bitmap L1 table description
Date: Fri,  5 Mar 2021 17:54:48 +0100
Message-Id: <20210305165454.356840-26-kwolf@redhat.com>
In-Reply-To: <20210305165454.356840-1-kwolf@redhat.com>
References: <20210305165454.356840-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Actually L1 table entry offset is in 512 bytes sectors. Fix the spec.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210224104707.88430-3-vsementsov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 docs/interop/parallels.txt | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/docs/interop/parallels.txt b/docs/interop/parallels.txt
index f15bf35bd1..bb3fadf369 100644
--- a/docs/interop/parallels.txt
+++ b/docs/interop/parallels.txt
@@ -208,21 +208,25 @@ of its data area are:
   28 - 31:    l1_size
               The number of entries in the L1 table of the bitmap.
 
-  variable:   l1_table (8 * l1_size bytes)
-              L1 offset table (in bytes)
+  variable:   L1 offset table (l1_table), size: 8 * l1_size bytes
 
-A dirty bitmap is stored using a one-level structure for the mapping to host
-clusters - an L1 table.
+The dirty bitmap described by this feature extension is stored in a set of
+clusters inside the Parallels image file. The offsets of these clusters are
+saved in the L1 offset table specified by the feature extension. Each L1 table
+entry is a 64 bit integer as described below:
 
-Given an offset in bytes into the bitmap data, the offset in bytes into the
-image file can be obtained as follows:
+Given an offset in bytes into the bitmap data, corresponding L1 entry is
 
-    offset = l1_table[offset / cluster_size] + (offset % cluster_size)
+    l1_table[offset / cluster_size]
 
-If an L1 table entry is 0, the corresponding cluster of the bitmap is assumed
-to be zero.
+If an L1 table entry is 0, all bits in the corresponding cluster of the bitmap
+are assumed to be 0.
 
-If an L1 table entry is 1, the corresponding cluster of the bitmap is assumed
-to have all bits set.
+If an L1 table entry is 1, all bits in the corresponding cluster of the bitmap
+are assumed to be 1.
 
-If an L1 table entry is not 0 or 1, it allocates a cluster from the data area.
+If an L1 table entry is not 0 or 1, it contains the corresponding cluster
+offset (in 512b sectors). Given an offset in bytes into the bitmap data the
+offset in bytes into the image file can be obtained as follows:
+
+    offset = l1_table[offset / cluster_size] * 512 + (offset % cluster_size)
-- 
2.29.2


