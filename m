Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2368360EE7
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 17:24:36 +0200 (CEST)
Received: from localhost ([::1]:42206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX3r9-0005rs-PE
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 11:24:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lX3pR-0004Ro-Se
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 11:22:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lX3pO-0008Ed-N2
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 11:22:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618500165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MvIAIffJZkmyy5FYwfK9b2N1pZyUuOTjt4dirhwFjBE=;
 b=Sqo52LngtWMVKM+LXm+GdqDIjTxh8stIP8373TQvG2LUa/dtkvY3VvYl7/Rt377hyLq3fy
 XD3eRwFRbZtfZ+wH0Zk5NoNsQgzH3ps5ry03OKlXq5Jc0f+XdXzMDM1HdlyzTawHLVYBic
 ROhnqWD/D6hY3Ib0T3Vdb744UGQPf+E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-CJcybRe3NzuHkmqqYxJ1OA-1; Thu, 15 Apr 2021 11:22:44 -0400
X-MC-Unique: CJcybRe3NzuHkmqqYxJ1OA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BC50107ACCA;
 Thu, 15 Apr 2021 15:22:43 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-169.ams2.redhat.com [10.36.113.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A3BC32C15B;
 Thu, 15 Apr 2021 15:22:35 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH 2/2] qemu-img convert: Fix sparseness detection
Date: Thu, 15 Apr 2021 17:22:14 +0200
Message-Id: <20210415152214.279844-3-kwolf@redhat.com>
In-Reply-To: <20210415152214.279844-1-kwolf@redhat.com>
References: <20210415152214.279844-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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
Cc: kwolf@redhat.com, pl@kamp.de, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In order to avoid RMW cycles, is_allocated_sectors() treats zeroed areas
like non-zero data if the end of the checked area isn't aligned. This
can improve the efficiency of the conversion and was introduced in
commit 8dcd3c9b91a.

However, it comes with a correctness problem: qemu-img convert is
supposed to sparsify areas that contain only zeros, which it doesn't do
any more. It turns out that this even happens when not only the
unaligned area is zeroed, but also the blocks before and after it. In
the bug report, conversion of a fragmented 10G image containing only
zeros resulted in an image consuming 2.82 GiB even though the expected
size is only 4 KiB.

As a tradeoff between both, let's ignore zeroed sectors only after
non-zero data to fix the alignment, but if we're only looking at zeros,
keep them as such, even if it may mean additional RMW cycles.

Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1882917
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qemu-img.c                 | 18 ++++--------------
 tests/qemu-iotests/122.out | 12 ++++--------
 2 files changed, 8 insertions(+), 22 deletions(-)

diff --git a/qemu-img.c b/qemu-img.c
index a5993682aa..ca4eba2dd1 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -1168,20 +1168,10 @@ static int is_allocated_sectors(const uint8_t *buf, int n, int *pnum,
     }
 
     tail = (sector_num + i) & (alignment - 1);
-    if (tail) {
-        if (is_zero && i <= tail) {
-            /* treat unallocated areas which only consist
-             * of a small tail as allocated. */
-            is_zero = false;
-        }
-        if (!is_zero) {
-            /* align up end offset of allocated areas. */
-            i += alignment - tail;
-            i = MIN(i, n);
-        } else {
-            /* align down end offset of zero areas. */
-            i -= tail;
-        }
+    if (tail && !is_zero) {
+        /* align up end offset of allocated areas. */
+        i += alignment - tail;
+        i = MIN(i, n);
     }
     *pnum = i;
     return !is_zero;
diff --git a/tests/qemu-iotests/122.out b/tests/qemu-iotests/122.out
index dcc44a2304..fe0ea34164 100644
--- a/tests/qemu-iotests/122.out
+++ b/tests/qemu-iotests/122.out
@@ -199,11 +199,9 @@ convert -S 4k
 [{ "start": 0, "length": 4096, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
 { "start": 4096, "length": 4096, "depth": 0, "zero": true, "data": false},
 { "start": 8192, "length": 4096, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 12288, "length": 4096, "depth": 0, "zero": true, "data": false},
-{ "start": 16384, "length": 4096, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 20480, "length": 46080, "depth": 0, "zero": true, "data": false},
-{ "start": 66560, "length": 1024, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 67584, "length": 67041280, "depth": 0, "zero": true, "data": false}]
+{ "start": 12288, "length": 5120, "depth": 0, "zero": true, "data": false},
+{ "start": 17408, "length": 3072, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
+{ "start": 20480, "length": 67088384, "depth": 0, "zero": true, "data": false}]
 
 convert -c -S 4k
 [{ "start": 0, "length": 1024, "depth": 0, "zero": false, "data": true},
@@ -215,9 +213,7 @@ convert -c -S 4k
 
 convert -S 8k
 [{ "start": 0, "length": 24576, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 24576, "length": 41984, "depth": 0, "zero": true, "data": false},
-{ "start": 66560, "length": 1024, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 67584, "length": 67041280, "depth": 0, "zero": true, "data": false}]
+{ "start": 24576, "length": 67084288, "depth": 0, "zero": true, "data": false}]
 
 convert -c -S 8k
 [{ "start": 0, "length": 1024, "depth": 0, "zero": false, "data": true},
-- 
2.30.2


