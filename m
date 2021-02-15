Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B91CD31BBE1
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 16:09:28 +0100 (CET)
Received: from localhost ([::1]:50844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBfV9-0003sg-Qi
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 10:09:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lBfNX-0005ky-4S
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 10:01:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lBfNP-0000pH-Ge
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 10:01:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613401286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CBTRNqmafznyYCVZMQP0yfudKciY85Jk+uk/dwgJ4n0=;
 b=ELnOiotBEXzwB3bXgnj9Pq9lgs2H5Mq4zxJIb7QWu82igPh4sf7vxB5wX3NQanlZbJYiFr
 w3iTre/lDjG3vk/shLaIgJC62rNnUUcM0y9eIAM3bLOgQH7/48NJu8rzFtNbxQpgxfkljx
 drrp1fIRvfkPozcP+gpDNOJoGG3ZjcM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-MQZ0lMWdMBOAjg7vIsbA0w-1; Mon, 15 Feb 2021 10:01:24 -0500
X-MC-Unique: MQZ0lMWdMBOAjg7vIsbA0w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6257E814738;
 Mon, 15 Feb 2021 15:01:15 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-28.ams2.redhat.com [10.36.113.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6AF685C233;
 Mon, 15 Feb 2021 15:01:14 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 09/11] block: qcow2: remove the created file on initialization
 error
Date: Mon, 15 Feb 2021 16:00:58 +0100
Message-Id: <20210215150100.436555-10-kwolf@redhat.com>
In-Reply-To: <20210215150100.436555-1-kwolf@redhat.com>
References: <20210215150100.436555-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Maxim Levitsky <mlevitsk@redhat.com>

If the qcow initialization fails, we should remove the file if it was
already created, to avoid leaving stale files around.

We already do this for luks raw images.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Message-Id: <20201217170904.946013-4-mlevitsk@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/qcow2.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index 5d94f45be9..d9f49a52e7 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -3846,12 +3846,14 @@ static int coroutine_fn qcow2_co_create_opts(BlockDriver *drv,
 
     /* Create the qcow2 image (format layer) */
     ret = qcow2_co_create(create_options, errp);
+finish:
     if (ret < 0) {
-        goto finish;
+        bdrv_co_delete_file_noerr(bs);
+        bdrv_co_delete_file_noerr(data_bs);
+    } else {
+        ret = 0;
     }
 
-    ret = 0;
-finish:
     qobject_unref(qdict);
     bdrv_unref(bs);
     bdrv_unref(data_bs);
-- 
2.29.2


