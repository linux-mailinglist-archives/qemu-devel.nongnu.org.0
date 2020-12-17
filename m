Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 328662DD61B
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 18:28:39 +0100 (CET)
Received: from localhost ([::1]:47458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpx4v-00044u-M7
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 12:28:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kpwmI-0004zw-FT
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 12:09:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kpwmB-0005Wd-Ug
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 12:09:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608224955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9IkhuNugCpPw+Z6+e+QlkZMvo72EP6bO1+z1cs3T5kQ=;
 b=bse1H9ZzoX8+I4C8dXfUelUQjdz6XmqV/I2vVDq+lepvJDgB6f3eMJSlfCgnI0s0J+Msci
 NhwKzyfE+dMdM6bDVckD+0vn8GgKUBcq+vEz7t1dQjukQ1DTYJHjiNdAOTwc7v0fw+c8hq
 433aeN+WGBjAb/1pJFkvKwhURyjNFjQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-8gp5k52SNZCaT7ZmmRjaCw-1; Thu, 17 Dec 2020 12:09:11 -0500
X-MC-Unique: 8gp5k52SNZCaT7ZmmRjaCw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59F5D800D53;
 Thu, 17 Dec 2020 17:09:10 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 585E660BE5;
 Thu, 17 Dec 2020 17:09:08 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 1/3] crypto: luks: Fix tiny memory leak
Date: Thu, 17 Dec 2020 19:09:02 +0200
Message-Id: <20201217170904.946013-2-mlevitsk@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the underlying block device doesn't support the
bdrv_co_delete_file interface, an 'Error' object was leaked.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/crypto.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/block/crypto.c b/block/crypto.c
index aef5a5721a..b3a5275132 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -735,6 +735,8 @@ fail:
          */
         if ((r_del < 0) && (r_del != -ENOTSUP)) {
             error_report_err(local_delete_err);
+        } else {
+            error_free(local_delete_err);
         }
     }
 
-- 
2.26.2


