Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B321F22F25C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jul 2020 16:39:42 +0200 (CEST)
Received: from localhost ([::1]:54722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k04I1-0004fv-OO
	for lists+qemu-devel@lfdr.de; Mon, 27 Jul 2020 10:39:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1k04Gk-0002vS-SN
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 10:38:22 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:29689
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1k04Gj-0001xW-2o
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 10:38:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595860700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fp8X7gIpKH6iz8HjHeEv2VjCcxBcFNqJiwjqghVZCuI=;
 b=Ats0DdC9uNc8C2r2wR4MkKw1ntT9XT348WqH3gXlBpTeoR78VybOvO3rMPnxV6uKJ6FXoW
 IMpawySnxbKv5aPtWk5yGkBqvtmMU2y2xFkPGz62zQPtza+w3Yba44bZg8QUvHfKZjLHpe
 CTfmazKihTgZWawpdIb5+xZN/09v3ec=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-qxvSwG-SNVqdv9_O1wV63w-1; Mon, 27 Jul 2020 10:38:17 -0400
X-MC-Unique: qxvSwG-SNVqdv9_O1wV63w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98266100AA25;
 Mon, 27 Jul 2020 14:38:16 +0000 (UTC)
Received: from localhost (ovpn-113-45.ams2.redhat.com [10.36.113.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F95F10013C0;
 Mon, 27 Jul 2020 14:38:16 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 1/3] block/amend: Check whether the node exists
Date: Mon, 27 Jul 2020 16:38:10 +0200
Message-Id: <20200727143812.1101547-2-mreitz@redhat.com>
In-Reply-To: <20200727143812.1101547-1-mreitz@redhat.com>
References: <20200727143812.1101547-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mreitz@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/27 01:44:14
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We should check whether the user-specified node-name actually refers to
a node.  The simplest way to do that is to use bdrv_lookup_bs() instead
of bdrv_find_node() (the former wraps the latter, and produces an error
message if necessary).

Reported-by: Coverity (CID 1430268)
Fixes: ced914d0ab9fb2c900f873f6349a0b8eecd1fdbe
Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20200710095037.10885-1-mreitz@redhat.com>
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 block/amend.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/block/amend.c b/block/amend.c
index f4612dcf08..392df9ef83 100644
--- a/block/amend.c
+++ b/block/amend.c
@@ -69,8 +69,12 @@ void qmp_x_blockdev_amend(const char *job_id,
     BlockdevAmendJob *s;
     const char *fmt = BlockdevDriver_str(options->driver);
     BlockDriver *drv = bdrv_find_format(fmt);
-    BlockDriverState *bs = bdrv_find_node(node_name);
+    BlockDriverState *bs;
 
+    bs = bdrv_lookup_bs(NULL, node_name, errp);
+    if (!bs) {
+        return;
+    }
 
     if (!drv) {
         error_setg(errp, "Block driver '%s' not found or not supported", fmt);
-- 
2.26.2


