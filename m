Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6942DE6D7
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 16:44:19 +0100 (CET)
Received: from localhost ([::1]:37640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqHvW-0003q8-Tv
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 10:44:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHSC-00030n-UX
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:14:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHSB-0005bd-3W
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:14:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608304438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bbESsW0annaeju1lI3S5fHFEdy1nFIfky+7IOLaBTig=;
 b=VkrQT6wxWFIg9EwBAErX+kJ2du/zk5LlLOalq/CbgsowxIG9Vx8AlB/gPcOJrlohl/aTcl
 FlCXCFPR16HktGBHBrgCpHEPfBxf6cXeUmcrf6DJs3LqH8VZGdZACwh6flZ0O176tYh64N
 myE8/RYVeDtZAHOriG/LH6sdGPlTf8w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-UmRTWybROTm9EHgLm7eaAg-1; Fri, 18 Dec 2020 10:13:55 -0500
X-MC-Unique: UmRTWybROTm9EHgLm7eaAg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF6BF803620;
 Fri, 18 Dec 2020 15:13:54 +0000 (UTC)
Received: from localhost (ovpn-114-84.ams2.redhat.com [10.36.114.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 84CC7648A3;
 Fri, 18 Dec 2020 15:13:54 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 28/30] block/nvme: Implement fake truncate() coroutine
Date: Fri, 18 Dec 2020 16:12:47 +0100
Message-Id: <20201218151249.715731-29-mreitz@redhat.com>
In-Reply-To: <20201218151249.715731-1-mreitz@redhat.com>
References: <20201218151249.715731-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

NVMe drive cannot be shrunk.

Since commit c80d8b06cfa we can use the @exact parameter (set
to false) to return success if the block device is larger than
the requested offset (even if we can not be shrunk).

Use this parameter to implement the NVMe truncate() coroutine,
similarly how it is done for the iscsi and file-posix drivers
(see commit 82325ae5f2f "Evaluate @exact in protocol drivers").

Reported-by: Xueqiang Wei <xuwei@redhat.com>
Suggested-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20201210125202.858656-1-philmd@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/nvme.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/block/nvme.c b/block/nvme.c
index a06a188d53..5a6fbacf4a 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -1389,6 +1389,29 @@ out:
 
 }
 
+static int coroutine_fn nvme_co_truncate(BlockDriverState *bs, int64_t offset,
+                                         bool exact, PreallocMode prealloc,
+                                         BdrvRequestFlags flags, Error **errp)
+{
+    int64_t cur_length;
+
+    if (prealloc != PREALLOC_MODE_OFF) {
+        error_setg(errp, "Unsupported preallocation mode '%s'",
+                   PreallocMode_str(prealloc));
+        return -ENOTSUP;
+    }
+
+    cur_length = nvme_getlength(bs);
+    if (offset != cur_length && exact) {
+        error_setg(errp, "Cannot resize NVMe devices");
+        return -ENOTSUP;
+    } else if (offset > cur_length) {
+        error_setg(errp, "Cannot grow NVMe devices");
+        return -EINVAL;
+    }
+
+    return 0;
+}
 
 static int nvme_reopen_prepare(BDRVReopenState *reopen_state,
                                BlockReopenQueue *queue, Error **errp)
@@ -1523,6 +1546,7 @@ static BlockDriver bdrv_nvme = {
     .bdrv_close               = nvme_close,
     .bdrv_getlength           = nvme_getlength,
     .bdrv_probe_blocksizes    = nvme_probe_blocksizes,
+    .bdrv_co_truncate         = nvme_co_truncate,
 
     .bdrv_co_preadv           = nvme_co_preadv,
     .bdrv_co_pwritev          = nvme_co_pwritev,
-- 
2.29.2


