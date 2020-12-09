Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8E92D4C02
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 21:37:51 +0100 (CET)
Received: from localhost ([::1]:56776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn6De-00024a-BJ
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 15:37:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kn69l-0007ps-Jg
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 15:33:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kn69k-0005Zj-8C
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 15:33:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607546026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8+4qYXQ08FS1twXTXk0HguvPTSJfQOgsdOYbqBU6lg0=;
 b=D6K8n7U1pW9Fj+n/q+Cto1R78wWF1O6h2RGzSOEGe2jaG776dQMY8YPrz6ZPoo5sjAnwWb
 eAcy5n1lmOK2tgXNl2bZELosW9Vt0Vpfggbb0h8S7qkoKj3KJdv0fG6G7VjD4RbKF8rJPP
 utXi9mGGLdzzN5l+3vCoepmLvvgAlPY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-zjMu1cdpNsq7qiI2xgYbtQ-1; Wed, 09 Dec 2020 15:33:43 -0500
X-MC-Unique: zjMu1cdpNsq7qiI2xgYbtQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE714800D53;
 Wed,  9 Dec 2020 20:33:41 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 99A9519725;
 Wed,  9 Dec 2020 20:33:39 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 4/4] block: qcow2: remove the created file on
 initialization error
Date: Wed,  9 Dec 2020 22:33:26 +0200
Message-Id: <20201209203326.879381-5-mlevitsk@redhat.com>
In-Reply-To: <20201209203326.879381-1-mlevitsk@redhat.com>
References: <20201209203326.879381-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Reviewed-by: Alberto Garcia <berto@igalia.com>
---
 block/qcow2.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index 3a90ef2786..68c9182f92 100644
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
     }
 
     ret = 0;
-finish:
+
     qobject_unref(qdict);
     bdrv_unref(bs);
     bdrv_unref(data_bs);
-- 
2.26.2


