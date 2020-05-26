Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4D21CE109
	for <lists+qemu-devel@lfdr.de>; Mon, 11 May 2020 18:58:32 +0200 (CEST)
Received: from localhost ([::1]:43566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYBl9-0004kK-N9
	for lists+qemu-devel@lfdr.de; Mon, 11 May 2020 12:58:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1jYBkA-0003O6-CO; Mon, 11 May 2020 12:57:30 -0400
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:15343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1jYBk9-0006R0-0H; Mon, 11 May 2020 12:57:29 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id C04E542B40;
 Mon, 11 May 2020 18:51:15 +0200 (CEST)
From: Stefan Reiter <s.reiter@proxmox.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [RFC] bdrv_flush: only use fast path when in owned AioContext
Date: Mon, 11 May 2020 18:50:32 +0200
Message-Id: <20200511165032.11384-1-s.reiter@proxmox.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=212.186.127.180;
 envelope-from=s.reiter@proxmox.com; helo=proxmox-new.maurer-it.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/11 12:51:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: fam@euphon.net, kwolf@redhat.com, t.lamprecht@proxmox.com,
 stefanha@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just because we're in a coroutine doesn't imply ownership of the context
of the flushed drive. In such a case use the slow path which explicitly
enters bdrv_flush_co_entry in the correct AioContext.

Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
---

We've experienced some lockups in this codepath when taking snapshots of VMs
with drives that have IO-Threads enabled (we have an async 'savevm'
implementation running from a coroutine).

Currently no reproducer for upstream versions I could find, but in testing this
patch fixes all issues we're seeing and I think the logic checks out.

The fast path pattern is repeated a few times in this file, so if this change
makes sense, it's probably worth evaluating the other occurences as well.

 block/io.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/block/io.c b/block/io.c
index aba67f66b9..ee7310fa13 100644
--- a/block/io.c
+++ b/block/io.c
@@ -2895,8 +2895,9 @@ int bdrv_flush(BlockDriverState *bs)
         .ret = NOT_DONE,
     };
 
-    if (qemu_in_coroutine()) {
-        /* Fast-path if already in coroutine context */
+    if (qemu_in_coroutine() &&
+        bdrv_get_aio_context(bs) == qemu_get_current_aio_context()) {
+        /* Fast-path if already in coroutine and we own the drive's context */
         bdrv_flush_co_entry(&flush_co);
     } else {
         co = qemu_coroutine_create(bdrv_flush_co_entry, &flush_co);
-- 
2.20.1



