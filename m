Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C673721B2AF
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jul 2020 11:51:52 +0200 (CEST)
Received: from localhost ([::1]:36764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtph9-00034M-OA
	for lists+qemu-devel@lfdr.de; Fri, 10 Jul 2020 05:51:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jtpg6-0002ZW-8h
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 05:50:46 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:40220
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jtpg3-00071x-8O
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 05:50:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594374641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vIFyRzx4MqN4FE6E6BLKgEtInHxI6tAzwG9R2FhnPcQ=;
 b=a6oa0WuhsRHTgNP8wQFCkT+h+T4xWUAXULjFmAUw6XdX35jLXNS5/HcGGwfogCL0oiMyVT
 tpQ+rsd4Pe9ViriWjgOEXxNuUHyQxmEvbkVtdwd/Cjp3REkbLYZ219Jy+U9f4TatEvovKK
 Q+85TSq0xIwD2kcAGxf/MnnDQarRYbc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-B8VQWNjIP0uSp7RlpKaRiw-1; Fri, 10 Jul 2020 05:50:40 -0400
X-MC-Unique: B8VQWNjIP0uSp7RlpKaRiw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51ED8800D5C;
 Fri, 10 Jul 2020 09:50:39 +0000 (UTC)
Received: from localhost (ovpn-113-127.ams2.redhat.com [10.36.113.127])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EB7397EF85;
 Fri, 10 Jul 2020 09:50:38 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] block/amend: Check whether the node exists
Date: Fri, 10 Jul 2020 11:50:37 +0200
Message-Id: <20200710095037.10885-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mreitz@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/10 04:36:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
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


