Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6250C1D4E2F
	for <lists+qemu-devel@lfdr.de>; Fri, 15 May 2020 14:55:10 +0200 (CEST)
Received: from localhost ([::1]:46686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZZrp-00020K-Bu
	for lists+qemu-devel@lfdr.de; Fri, 15 May 2020 08:55:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jZZil-0002QP-0z
 for qemu-devel@nongnu.org; Fri, 15 May 2020 08:45:47 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:23510
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jZZij-00027z-EV
 for qemu-devel@nongnu.org; Fri, 15 May 2020 08:45:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589546744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oBF7fCfMe5jbzsXW//h34ma+BN+TM4yPDi0NoZ45ZdM=;
 b=OS+4hVugmsi4wnTx+hbQUj589kHlzSIDwVFJhJWeUlWX+0jZQSArVoELFPzbH2seeD9RnY
 rAuwlil93jtNCYN9mGXxMKEzqnrY4f5DJzSG1ZknAJGTddpsZCyoh1aZJtOCdumABBENGB
 ++jDWrSYPZQY4CL6yRxwAH5gh7DWX0U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-Wpcmy6lTOZOXnvqqbKhAAw-1; Fri, 15 May 2020 08:45:42 -0400
X-MC-Unique: Wpcmy6lTOZOXnvqqbKhAAw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69030835B41;
 Fri, 15 May 2020 12:45:41 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-113-110.ams2.redhat.com
 [10.36.113.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7005F2E024;
 Fri, 15 May 2020 12:45:40 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 09/51] block: Add blk_make_empty()
Date: Fri, 15 May 2020 14:44:39 +0200
Message-Id: <20200515124521.335403-10-kwolf@redhat.com>
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

Two callers of BlockDriver.bdrv_make_empty() remain that should not call
this method directly.  Both do not have access to a BdrvChild, but they
can use a BlockBackend, so we add this function that lets them use it.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20200429141126.85159-4-mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/sysemu/block-backend.h |  2 ++
 block/block-backend.c          | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index 0917663d89..8203d7f6f9 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -266,4 +266,6 @@ int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
 
 const BdrvChild *blk_root(BlockBackend *blk);
 
+int blk_make_empty(BlockBackend *blk, Error **errp);
+
 #endif
diff --git a/block/block-backend.c b/block/block-backend.c
index f4944861fa..47bd56244d 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2402,3 +2402,13 @@ const BdrvChild *blk_root(BlockBackend *blk)
 {
     return blk->root;
 }
+
+int blk_make_empty(BlockBackend *blk, Error **errp)
+{
+    if (!blk_is_available(blk)) {
+        error_setg(errp, "No medium inserted");
+        return -ENOMEDIUM;
+    }
+
+    return bdrv_make_empty(blk->root, errp);
+}
-- 
2.25.4


