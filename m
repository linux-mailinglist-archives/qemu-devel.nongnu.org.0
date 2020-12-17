Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E113A2DD5E7
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 18:19:24 +0100 (CET)
Received: from localhost ([::1]:54582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpwvz-0003Vb-MI
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 12:19:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kpwmN-00059m-8W
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 12:09:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kpwmL-0005XP-6Y
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 12:09:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608224963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NXHRHevDuDHBmrbi+Qd1cRZtQl8RBWFSvvZJHFj2YC4=;
 b=h/+CPWf6h3y1fvutaatbAw1QGzG49MOkfSJ8qAjnb++tu/kkZ68VK1y8VY8Kce4GVyPN++
 61UD+Xg5c4lY5K4LH87L6abrdjjbH4NJlD2OmQq6nTksbi6xf/oVcPpnq2kSpU7mbl8s7c
 at11vfYb8KIByMzs5f2C0CizWs+l7Sk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-Q8D8qebyOryfRP1bAv6wPA-1; Thu, 17 Dec 2020 12:09:21 -0500
X-MC-Unique: Q8D8qebyOryfRP1bAv6wPA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4DF2800D55;
 Thu, 17 Dec 2020 17:09:20 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3706F60BE5;
 Thu, 17 Dec 2020 17:09:15 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 3/3] block: qcow2: remove the created file on
 initialization error
Date: Thu, 17 Dec 2020 19:09:04 +0200
Message-Id: <20201217170904.946013-4-mlevitsk@redhat.com>
In-Reply-To: <20201217170904.946013-1-mlevitsk@redhat.com>
References: <20201217170904.946013-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the qcow initialization fails, we should remove the file if it was
already created, to avoid leaving stale files around.

We already do this for luks raw images.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
---
 block/qcow2.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index 3a90ef2786..a8638d250a 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -3847,12 +3847,14 @@ static int coroutine_fn qcow2_co_create_opts(BlockDriver *drv,
 
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
2.26.2


