Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B432D2D2A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 15:27:09 +0100 (CET)
Received: from localhost ([::1]:42254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmdxM-0006yf-CU
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 09:27:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kmdsg-0002Vs-BL
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 09:22:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kmdsc-0005Dy-Am
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 09:22:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607437332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TUvYH7Ab9K730Vam2H02MvE9Tv11hlA9Pwl56H34s7Y=;
 b=eZWMwQQw2QQlOQ0fvlipDKEf2aDQlmdIp91m9IK7t7DFcbNZp4xNKJRwv/aehkeGxO4V/Z
 0Vu6cr4Izi7qXHU+vkVMh/w8w9/PVYFBz7DpB36fL/Uvn2UqtPCKqwluPUC4x/jmWCey7z
 HUWg/IeCl7ac5ArB1EStATWcNF/l1RY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-wr9Bm5iCNPyAax3ZdBUf-g-1; Tue, 08 Dec 2020 09:22:11 -0500
X-MC-Unique: wr9Bm5iCNPyAax3ZdBUf-g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3625107ACF5;
 Tue,  8 Dec 2020 14:22:09 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB68E63B8C;
 Tue,  8 Dec 2020 14:22:07 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/2] block: qcow2: remove the created file on
 initialization error
Date: Tue,  8 Dec 2020 16:21:59 +0200
Message-Id: <20201208142159.492489-3-mlevitsk@redhat.com>
In-Reply-To: <20201208142159.492489-1-mlevitsk@redhat.com>
References: <20201208142159.492489-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
---
 block/qcow2.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/block/qcow2.c b/block/qcow2.c
index 3a90ef2786..3bc2096b72 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -3848,6 +3848,19 @@ static int coroutine_fn qcow2_co_create_opts(BlockDriver *drv,
     /* Create the qcow2 image (format layer) */
     ret = qcow2_co_create(create_options, errp);
     if (ret < 0) {
+
+        Error *local_delete_err = NULL;
+        int r_del = bdrv_co_delete_file(bs, &local_delete_err);
+        /*
+         * ENOTSUP will happen if the block driver doesn't support
+         * the 'bdrv_co_delete_file' interface. This is a predictable
+         * scenario and shouldn't be reported back to the user.
+         */
+        if ((r_del < 0) && (r_del != -ENOTSUP)) {
+            error_report_err(local_delete_err);
+        } else {
+            error_free(local_delete_err);
+        }
         goto finish;
     }
 
-- 
2.26.2


