Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6105664CE50
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 17:47:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Uu8-00050K-DD; Wed, 14 Dec 2022 11:46:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5Uu2-0004x8-Kd
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 11:46:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5Uu0-0002QW-SN
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 11:46:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671036400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cpODgtRkmdX4Pi0K6GmMxW9omE8TLUyjHK4HKMS/Z+w=;
 b=dLWzU+oHIbMlAzNi1D/p7ergZ8aRtk3Dl4w43WRho/G0VrhB7NtYTdQ1HoOcUhEovOGhnS
 G7ejpQVd17wme82wxjaeBRWcIlVIOI1IhiLXAduXgBjkt4YRqaBd6XNpwGB3PKAMUJwSHR
 Kr+xH4Ga2OQWEuAkTR9zSxWBXJMeSHk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-NecI-gQmPdCe_AVtClWtQw-1; Wed, 14 Dec 2022 11:46:37 -0500
X-MC-Unique: NecI-gQmPdCe_AVtClWtQw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D89585A588;
 Wed, 14 Dec 2022 16:46:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 682BBC15BA0;
 Wed, 14 Dec 2022 16:46:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4F81F21E649E; Wed, 14 Dec 2022 17:46:29 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Fam Zheng <fam@euphon.net>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 13/14] block/vmdk: Simplify vmdk_co_create() to return directly
Date: Wed, 14 Dec 2022 17:46:28 +0100
Message-Id: <20221214164629.919880-14-armbru@redhat.com>
In-Reply-To: <20221214164629.919880-1-armbru@redhat.com>
References: <20221214164629.919880-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Cc: Fam Zheng <fam@euphon.net>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-block@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20221122134917.1217307-3-armbru@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 block/vmdk.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/block/vmdk.c b/block/vmdk.c
index 26376352b9..bac3d8db50 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -2821,7 +2821,6 @@ static BlockBackend *vmdk_co_create_cb(int64_t size, int idx,
 static int coroutine_fn vmdk_co_create(BlockdevCreateOptions *create_options,
                                        Error **errp)
 {
-    int ret;
     BlockdevCreateOptionsVmdk *opts;
 
     opts = &create_options->u.vmdk;
@@ -2829,24 +2828,19 @@ static int coroutine_fn vmdk_co_create(BlockdevCreateOptions *create_options,
     /* Validate options */
     if (!QEMU_IS_ALIGNED(opts->size, BDRV_SECTOR_SIZE)) {
         error_setg(errp, "Image size must be a multiple of 512 bytes");
-        ret = -EINVAL;
-        goto out;
+        return -EINVAL;
     }
 
-    ret = vmdk_co_do_create(opts->size,
-                            opts->subformat,
-                            opts->adapter_type,
-                            opts->backing_file,
-                            opts->hwversion,
-                            opts->toolsversion,
-                            false,
-                            opts->zeroed_grain,
-                            vmdk_co_create_cb,
-                            opts, errp);
-    return ret;
-
-out:
-    return ret;
+    return vmdk_co_do_create(opts->size,
+                             opts->subformat,
+                             opts->adapter_type,
+                             opts->backing_file,
+                             opts->hwversion,
+                             opts->toolsversion,
+                             false,
+                             opts->zeroed_grain,
+                             vmdk_co_create_cb,
+                             opts, errp);
 }
 
 static void vmdk_close(BlockDriverState *bs)
-- 
2.37.3


