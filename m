Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B874025F92E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 13:19:25 +0200 (CEST)
Received: from localhost ([::1]:42710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFFBE-0002bV-Pd
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 07:19:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFF2C-0002Be-5u
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 07:10:04 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27518
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFF2A-0007uJ-Ag
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 07:10:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599477001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uu2IkbFXH5HjFLKPLPi8t856kast2SXuxKIV2d7STAo=;
 b=Gj/+0LYwK7DfxNRjiHpVV9oYJW361HnR4qkbHSV7Cy3vvKEKKza720L0R1aIs4QhEvdO3s
 vkwSBXBNBLWPux7tuFdVWyhuKCrEYTzPuhSg74vequQC7C6P6SDL0jvfAWOALmvMLSTYl/
 kKnMY1n1A37F9ECOYHN0j9rPiYuoiVs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-Hz_NJ7KzPoSI875wyYF_9g-1; Mon, 07 Sep 2020 07:09:59 -0400
X-MC-Unique: Hz_NJ7KzPoSI875wyYF_9g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63CAE802B6B;
 Mon,  7 Sep 2020 11:09:58 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-114-154.ams2.redhat.com
 [10.36.114.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 715249CBA;
 Mon,  7 Sep 2020 11:09:57 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 13/64] block/nvme: Replace BDRV_POLL_WHILE by AIO_WAIT_WHILE
Date: Mon,  7 Sep 2020 13:08:45 +0200
Message-Id: <20200907110936.261684-14-kwolf@redhat.com>
In-Reply-To: <20200907110936.261684-1-kwolf@redhat.com>
References: <20200907110936.261684-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/07 03:19:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

BDRV_POLL_WHILE() is defined as:

  #define BDRV_POLL_WHILE(bs, cond) ({          \
      BlockDriverState *bs_ = (bs);             \
      AIO_WAIT_WHILE(bdrv_get_aio_context(bs_), \
                     cond); })

As we will remove the BlockDriverState use in the next commit,
start by using the exploded version of BDRV_POLL_WHILE().

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200821195359.1285345-13-philmd@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/nvme.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/block/nvme.c b/block/nvme.c
index e04e1fa4f8..b03735129d 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -493,6 +493,7 @@ static void nvme_cmd_sync_cb(void *opaque, int ret)
 static int nvme_cmd_sync(BlockDriverState *bs, NVMeQueuePair *q,
                          NvmeCmd *cmd)
 {
+    AioContext *aio_context = bdrv_get_aio_context(bs);
     NVMeRequest *req;
     int ret = -EINPROGRESS;
     req = nvme_get_free_req(q);
@@ -501,7 +502,7 @@ static int nvme_cmd_sync(BlockDriverState *bs, NVMeQueuePair *q,
     }
     nvme_submit_command(q, req, cmd, nvme_cmd_sync_cb, &ret);
 
-    BDRV_POLL_WHILE(bs, ret == -EINPROGRESS);
+    AIO_WAIT_WHILE(aio_context, ret == -EINPROGRESS);
     return ret;
 }
 
-- 
2.25.4


