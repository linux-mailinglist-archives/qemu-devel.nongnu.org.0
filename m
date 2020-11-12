Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BACA2B0CE9
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 19:44:28 +0100 (CET)
Received: from localhost ([::1]:57374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdHa7-00016J-7D
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 13:44:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kdHUp-00039w-Ow
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:38:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kdHUn-0006bI-8Z
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:38:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605206336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fcuHErFPMcHNVdgPBonXztwigpZoR6kVXPrHKyICSLk=;
 b=WHAsRCW8JApIF40oWuhg9BDoivcnE07/aerqS4UKVD2LBkV5k3qx0kwa/59MV3k1vUVIls
 tYmKg9hDqv39H4jvcsylMYmJAKMB8XcvVtEVD20Insp23wkS+WQZlk0b7wEI2Iy5MvOvFC
 f2xCcsw/VISu6pYQXvONy3g05m22Bro=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-n47Kf1F-Oz2O6j0UNAMPEQ-1; Thu, 12 Nov 2020 13:38:52 -0500
X-MC-Unique: n47Kf1F-Oz2O6j0UNAMPEQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2EDC801817;
 Thu, 12 Nov 2020 18:38:50 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-60.ams2.redhat.com
 [10.36.115.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 68A8D5D9E4;
 Thu, 12 Nov 2020 18:38:43 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, kuhn.chenqun@huawei.com, zhengchuan@huawei.com,
 lihaotian9@huawei.com, longpeng2@huawei.com, liangpeng10@huawei.com,
 philmd@redhat.com, liuzhiqiang26@huawei.com
Subject: [PULL 10/11] virtiofsd: check whether lo_map_reserve returns NULL in,
 main func
Date: Thu, 12 Nov 2020 18:37:57 +0000
Message-Id: <20201112183758.203176-11-dgilbert@redhat.com>
In-Reply-To: <20201112183758.203176-1-dgilbert@redhat.com>
References: <20201112183758.203176-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: stefanha@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Haotian Li <lihaotian9@huawei.com>

In main func, func lo_map_reserve is called without NULL check.
If reallocing new_elems fails in func lo_map_grow, the func
lo_map_reserve may return NULL. We should check whether
lo_map_reserve returns NULL before using it.

Signed-off-by: Haotian Li <lihaotian9@huawei.com>
Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-Id: <48887813-1c95-048c-6d10-48e3dd2bac71@huawei.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 6c64b03f1a..9545a0d174 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -3425,6 +3425,7 @@ int main(int argc, char *argv[])
         .proc_self_fd = -1,
     };
     struct lo_map_elem *root_elem;
+    struct lo_map_elem *reserve_elem;
     int ret = -1;
 
     /* Don't mask creation mode, kernel already did that */
@@ -3444,8 +3445,17 @@ int main(int argc, char *argv[])
      * [1] Root inode
      */
     lo_map_init(&lo.ino_map);
-    lo_map_reserve(&lo.ino_map, 0)->in_use = false;
+    reserve_elem = lo_map_reserve(&lo.ino_map, 0);
+    if (!reserve_elem) {
+        fuse_log(FUSE_LOG_ERR, "failed to alloc reserve_elem.\n");
+        goto err_out1;
+    }
+    reserve_elem->in_use = false;
     root_elem = lo_map_reserve(&lo.ino_map, lo.root.fuse_ino);
+    if (!root_elem) {
+        fuse_log(FUSE_LOG_ERR, "failed to alloc root_elem.\n");
+        goto err_out1;
+    }
     root_elem->inode = &lo.root;
 
     lo_map_init(&lo.dirp_map);
-- 
2.28.0


