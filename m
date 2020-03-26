Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2626E194B87
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Mar 2020 23:29:25 +0100 (CET)
Received: from localhost ([::1]:33538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHb08-0004vU-7P
	for lists+qemu-devel@lfdr.de; Thu, 26 Mar 2020 18:29:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51914)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <7c4e49a783c7b2f77aa81794892cf08b4feba914@lizzy.crudebyte.com>)
 id 1jHaz5-0004HY-47
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 18:28:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <7c4e49a783c7b2f77aa81794892cf08b4feba914@lizzy.crudebyte.com>)
 id 1jHaz4-0005A8-3e
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 18:28:19 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:42819)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71)
 (envelope-from <7c4e49a783c7b2f77aa81794892cf08b4feba914@lizzy.crudebyte.com>)
 id 1jHaz2-0004Dd-Dk
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 18:28:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=jPdUMVvPDb49VGrJsLB5Dy+OTfiFUvEBcazVO3auyKA=; b=LmoSC
 KPt/p2vnLztv/ExKLe2NSSkJG4t/GCl8C3HNr8PV/3KzOyXDD2HSiOsFzSQkB82Wbz9eTekUo/o+f
 VNPd/8aYrK5G7M6AHujALQtPa+h4zCNYwZqzreZZ40EN0snWsXqySuW/KlZ6Tq71SBXuHH699/ecy
 F3gOIIhKfo/rqSbm0T8dQgW1Z9uuv0qTTerrwISHJGBz6eGtbh76FwYdOPyF0rOOtiXxv30KwOWH1
 sH/CqMB3RCAbnVgPXyJ7IKWbEyKofceIYY/g1biIYFmvhQcvMmrMOO7WDY4rjF/B8JNVuBTiSq6k2
 NP7PpIt1J+vVfPHwCEjYuplFoV1jg==;
Message-Id: <7c4e49a783c7b2f77aa81794892cf08b4feba914.1585258105.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1585258105.git.qemu_oss@crudebyte.com>
References: <cover.1585258105.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Thu, 26 Mar 2020 22:25:32 +0100
Subject: [PATCH v5 6/6] 9pfs: clarify latency of v9fs_co_run_in_worker()
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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


