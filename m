Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 428691D4E63
	for <lists+qemu-devel@lfdr.de>; Fri, 15 May 2020 15:04:02 +0200 (CEST)
Received: from localhost ([::1]:55294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZa0P-00020f-AJ
	for lists+qemu-devel@lfdr.de; Fri, 15 May 2020 09:04:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jZZjE-0002yV-VT
 for qemu-devel@nongnu.org; Fri, 15 May 2020 08:46:17 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:51863
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jZZjD-0002Mc-D6
 for qemu-devel@nongnu.org; Fri, 15 May 2020 08:46:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589546774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nXmlJBI08iCrvv2Fjzsccnd+uFEZ5bU04UQLWc261dg=;
 b=AsaiUB69ZKXF8SkM2ppq2An1RMYY2M57JHHW4t8LQsypxv4TzrbJRCVOS2lL+0klaE+1VI
 N9WImV7QeLLMqT0Pk/4Ob0yi3OR67k9VC5Dg+nQYpJgTh/W8vZPdr/g++oNZFqBkmc3Ct3
 mK3cXc4q7rsi6XPHoFMFFm2itMG7ny4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-ox-k4WhmObq2haeSPA2LCg-1; Fri, 15 May 2020 08:46:12 -0400
X-MC-Unique: ox-k4WhmObq2haeSPA2LCg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9EC95835B42;
 Fri, 15 May 2020 12:46:11 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-113-110.ams2.redhat.com
 [10.36.113.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A266F2E16D;
 Fri, 15 May 2020 12:46:10 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 28/51] block: Pull out bdrv_default_perms_for_cow()
Date: Fri, 15 May 2020 14:44:58 +0200
Message-Id: <20200515124521.335403-29-kwolf@redhat.com>
In-Reply-To: <20200515124521.335403-1-kwolf@redhat.com>
References: <20200515124521.335403-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/14 23:27:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

From: Max Reitz <mreitz@redhat.com>

Right now, bdrv_format_default_perms() is used by format parents
(generally). We want to switch to a model where most parents use a
single BdrvChildClass, which then decides the permissions based on the
child role. To do so, we have to split bdrv_format_default_perms() into
separate functions for each such role.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20200513110544.176672-17-mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 62 +++++++++++++++++++++++++++++++++++++--------------------
 1 file changed, 40 insertions(+), 22 deletions(-)

diff --git a/block.c b/block.c
index b3e7ae70c7..b12222a471 100644
--- a/block.c
+++ b/block.c
@@ -2468,6 +2468,44 @@ void bdrv_filter_default_perms(BlockDriverState *bs, BdrvChild *c,
     *nshared = (shared & DEFAULT_PERM_PASSTHROUGH) | DEFAULT_PERM_UNCHANGED;
 }
 
+static void bdrv_default_perms_for_cow(BlockDriverState *bs, BdrvChild *c,
+                                       const BdrvChildClass *child_class,
+                                       BdrvChildRole role,
+                                       BlockReopenQueue *reopen_queue,
+                                       uint64_t perm, uint64_t shared,
+                                       uint64_t *nperm, uint64_t *nshared)
+{
+    assert(child_class == &child_backing ||
+           (child_class == &child_of_bds && (role & BDRV_CHILD_COW)));
+
+    /*
+     * We want consistent read from backing files if the parent needs it.
+     * No other operations are performed on backing files.
+     */
+    perm &= BLK_PERM_CONSISTENT_READ;
+
+    /*
+     * If the parent can deal with changing data, we're okay with a
+     * writable and resizable backing file.
+     * TODO Require !(perm & BLK_PERM_CONSISTENT_READ), too?
+     */
+    if (shared & BLK_PERM_WRITE) {
+        shared = BLK_PERM_WRITE | BLK_PERM_RESIZE;
+    } else {
+        shared = 0;
+    }
+
+    shared |= BLK_PERM_CONSISTENT_READ | BLK_PERM_GRAPH_MOD |
+              BLK_PERM_WRITE_UNCHANGED;
+
+    if (bs->open_flags & BDRV_O_INACTIVE) {
+        shared |= BLK_PERM_WRITE | BLK_PERM_RESIZE;
+    }
+
+    *nperm = perm;
+    *nshared = shared;
+}
+
 void bdrv_format_default_perms(BlockDriverState *bs, BdrvChild *c,
                                const BdrvChildClass *child_class,
                                BdrvChildRole role,
@@ -2505,28 +2543,8 @@ void bdrv_format_default_perms(BlockDriverState *bs, BdrvChild *c,
         *nperm = perm;
         *nshared = shared;
     } else {
-        /* We want consistent read from backing files if the parent needs it.
-         * No other operations are performed on backing files. */
-        perm &= BLK_PERM_CONSISTENT_READ;
-
-        /* If the parent can deal with changing data, we're okay with a
-         * writable and resizable backing file. */
-        /* TODO Require !(perm & BLK_PERM_CONSISTENT_READ), too? */
-        if (shared & BLK_PERM_WRITE) {
-            shared = BLK_PERM_WRITE | BLK_PERM_RESIZE;
-        } else {
-            shared = 0;
-        }
-
-        shared |= BLK_PERM_CONSISTENT_READ | BLK_PERM_GRAPH_MOD |
-                  BLK_PERM_WRITE_UNCHANGED;
-
-        if (bs->open_flags & BDRV_O_INACTIVE) {
-            shared |= BLK_PERM_WRITE | BLK_PERM_RESIZE;
-        }
-
-        *nperm = perm;
-        *nshared = shared;
+        bdrv_default_perms_for_cow(bs, c, child_class, role, reopen_queue,
+                                   perm, shared, nperm, nshared);
     }
 }
 
-- 
2.25.4


