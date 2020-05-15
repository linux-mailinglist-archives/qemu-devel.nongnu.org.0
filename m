Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3C71D4E15
	for <lists+qemu-devel@lfdr.de>; Fri, 15 May 2020 14:50:25 +0200 (CEST)
Received: from localhost ([::1]:54546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZZnE-0001Xi-I9
	for lists+qemu-devel@lfdr.de; Fri, 15 May 2020 08:50:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jZZim-0002TT-Fq
 for qemu-devel@nongnu.org; Fri, 15 May 2020 08:45:48 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:25621
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jZZil-00028v-G9
 for qemu-devel@nongnu.org; Fri, 15 May 2020 08:45:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589546746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dJDtGGcIP6+8LgMCcsMZV1AiSWgUqZdbNItFO9gCMLo=;
 b=OAXJo6JZZCw3NV4f6uUx2k3APMFtrLuuk1oH4NfJHjyGKfnYD30BW1kkcLdRumLCcpWPYn
 iEYi4SjXNSEvkdknH4bSMgTxq+9ODrKSdPzwwI/hI3iqrat+HLoMld24Mw1M7RWvq2AVMb
 hUfTGUJcPWe7s8bmCZzI/Ax/Y98XD9c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-_eWyIroaOa-sKEFhg9og_g-1; Fri, 15 May 2020 08:45:45 -0400
X-MC-Unique: _eWyIroaOa-sKEFhg9og_g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF8D51005510;
 Fri, 15 May 2020 12:45:43 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-113-110.ams2.redhat.com
 [10.36.113.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 016292E166;
 Fri, 15 May 2020 12:45:42 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 11/51] replication: Avoid blk_make_empty() on read-only child
Date: Fri, 15 May 2020 14:44:41 +0200
Message-Id: <20200515124521.335403-12-kwolf@redhat.com>
In-Reply-To: <20200515124521.335403-1-kwolf@redhat.com>
References: <20200515124521.335403-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/15 00:07:24
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

This is just a bandaid to keep tests/test-replication working after
bdrv_make_empty() starts to assert that we're not trying to call it on a
read-only child.

For the real solution in the future, replication should not steal the
BdrvChild from its backing file (this is never correct to do!), but
instead have its own child node references, with the appropriate
permissions.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/replication.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/block/replication.c b/block/replication.c
index c03980a192..eb480a8e08 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -343,9 +343,18 @@ static void secondary_do_checkpoint(BDRVReplicationState *s, Error **errp)
         return;
     }
 
-    ret = s->hidden_disk->bs->drv->bdrv_make_empty(s->hidden_disk->bs);
+    BlockBackend *blk = blk_new(qemu_get_current_aio_context(),
+                                BLK_PERM_WRITE, BLK_PERM_ALL);
+    blk_insert_bs(blk, s->hidden_disk->bs, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        blk_unref(blk);
+        return;
+    }
+
+    ret = blk_make_empty(blk, errp);
+    blk_unref(blk);
     if (ret < 0) {
-        error_setg(errp, "Cannot make hidden disk empty");
         return;
     }
 }
-- 
2.25.4


