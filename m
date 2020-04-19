Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4736E1AFBEC
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Apr 2020 18:24:43 +0200 (CEST)
Received: from localhost ([::1]:43948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQCkM-00030B-Ba
	for lists+qemu-devel@lfdr.de; Sun, 19 Apr 2020 12:24:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41460 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <963b183c516011237108a0212402affd35f0b799@lizzy.crudebyte.com>)
 id 1jQCjI-00025J-Ko
 for qemu-devel@nongnu.org; Sun, 19 Apr 2020 12:23:36 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <963b183c516011237108a0212402affd35f0b799@lizzy.crudebyte.com>)
 id 1jQCjI-0001S2-8M
 for qemu-devel@nongnu.org; Sun, 19 Apr 2020 12:23:36 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:36621)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <963b183c516011237108a0212402affd35f0b799@lizzy.crudebyte.com>)
 id 1jQCjH-0000AX-P2
 for qemu-devel@nongnu.org; Sun, 19 Apr 2020 12:23:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=jPdUMVvPDb49VGrJsLB5Dy+OTfiFUvEBcazVO3auyKA=; b=mIz+o
 3PDM0Xel6Awqkv1/reRMJZAQeH+9Mbs417FWxI4mKnPI+QcJI9W9dXQOfOvtbClRbcaSqh626hUQk
 DqepnK748Z6yiyhBsAyeNChBM9Cf5xwwtsJcICVMye+MGZc309qn3IXQ5/TLSIkDmYxZ8FU8QV+b/
 i0JHXi5Xi8k6lQC35fgfDYf4n1m+V3CDBmtkg22JZbxR4xw23nCGSWq6L8Pif5v0ud8GaFVwdKcoE
 eY5fGbeNNPg/nOEleCC3WIdmh8BLI9rZLoQ3G/dYA8ElkL7f4wR94Bigdug0HWcBwwKog49So5ml+
 +ug8IO6cZAQYFBlLXysO5xqwu6Fvg==;
Message-Id: <963b183c516011237108a0212402affd35f0b799.1587309014.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1587309014.git.qemu_oss@crudebyte.com>
References: <cover.1587309014.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Sun, 19 Apr 2020 17:07:01 +0200
Subject: [PATCH v6 5/5] 9pfs: clarify latency of v9fs_co_run_in_worker()
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=963b183c516011237108a0212402affd35f0b799@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs1p.gnu.org: Linux 3.11 and newer
X-Received-From: 91.194.90.13
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As we just fixed a severe performance issue with Treaddir request
handling, clarify this overall issue as a comment on
v9fs_co_run_in_worker() with the intention to hopefully prevent
such performance mistakes in future (and fixing other yet
outstanding ones).

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/coth.h | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/9pfs/coth.h b/hw/9pfs/coth.h
index a6851822d5..8b6f76840a 100644
--- a/hw/9pfs/coth.h
+++ b/hw/9pfs/coth.h
@@ -19,7 +19,7 @@
 #include "qemu/coroutine.h"
 #include "9p.h"
 
-/*
+/**
  * we want to use bottom half because we want to make sure the below
  * sequence of events.
  *
@@ -28,6 +28,16 @@
  *   3. Enter the coroutine in the worker thread.
  * we cannot swap step 1 and 2, because that would imply worker thread
  * can enter coroutine while step1 is still running
+ *
+ * @b PERFORMANCE @b CONSIDERATIONS: As a rule of thumb, keep in mind
+ * that hopping between threads adds @b latency! So when handling a
+ * 9pfs request, avoid calling v9fs_co_run_in_worker() too often, because
+ * this might otherwise sum up to a significant, huge overall latency for
+ * providing the response for just a single request. For that reason it
+ * is highly recommended to fetch all data from fs driver with a single
+ * fs driver request on a background I/O thread (bottom half) in one rush
+ * first and then eventually assembling the final response from that data
+ * on main I/O thread (top half).
  */
 #define v9fs_co_run_in_worker(code_block)                               \
     do {                                                                \
-- 
2.20.1


