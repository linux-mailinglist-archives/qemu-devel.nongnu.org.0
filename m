Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E2A5F707D
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 23:42:23 +0200 (CEST)
Received: from localhost ([::1]:47750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogYdK-0005ef-SB
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 17:42:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ogYWg-0003B9-DB
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 17:35:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ogYWf-0006oD-0s
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 17:35:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665092128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hr4Rs7hpdNS7b3o4WidAG60QG2JI1UtqbqZ1ZxluRD8=;
 b=P8xljHvdgErG9TLW4MiMIJ4Wm6MnFhsbLm+PgLH7YE0KUC4b4/CgKjwZV/zoWpxv9kvCI1
 rn5Gi7A/xJh7rvpzHwG9gTN5hLne6j//Z/j6GnQp2abT7xT0qOgCwbFaKSZGLwjljHjhUe
 WuGObdQr/bwG8i53hrxCYj+CGic7Z3Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-134-semXQyuDO5mMYd05rD517w-1; Thu, 06 Oct 2022 17:35:24 -0400
X-MC-Unique: semXQyuDO5mMYd05rD517w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 405C83826A41;
 Thu,  6 Oct 2022 21:35:24 +0000 (UTC)
Received: from localhost (unknown [10.39.193.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 69322207AD4C;
 Thu,  6 Oct 2022 21:35:23 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Yanan Wang <wangyanan55@huawei.com>, sgarzare@redhat.com,
 "Richard W.M. Jones" <rjones@redhat.com>, Fam Zheng <fam@euphon.net>,
 Hanna Reitz <hreitz@redhat.com>, David Hildenbrand <david@redhat.com>,
 integration@gluster.org, qemu-block@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 afaria@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Xie Changlong <xiechanglong.d@gmail.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Jeff Cody <codyprime@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Peter Xu <peterx@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wen Congyang <wencongyang2@huawei.com>
Subject: [PATCH v6 05/13] block: use BdrvRequestFlags type for supported flag
 fields
Date: Thu,  6 Oct 2022 17:34:59 -0400
Message-Id: <20221006213507.645402-6-stefanha@redhat.com>
In-Reply-To: <20221006213507.645402-1-stefanha@redhat.com>
References: <20221006213507.645402-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the enum type so GDB displays the enum members instead of printing a
numeric constant.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/block/block_int-common.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index b7a7cbd3a5..19798d0e77 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -1051,7 +1051,7 @@ struct BlockDriverState {
     /*
      * Flags honored during pread
      */
-    unsigned int supported_read_flags;
+    BdrvRequestFlags supported_read_flags;
     /*
      * Flags honored during pwrite (so far: BDRV_REQ_FUA,
      * BDRV_REQ_WRITE_UNCHANGED).
@@ -1069,12 +1069,12 @@ struct BlockDriverState {
      * flag), or they have to explicitly take the WRITE permission for
      * their children.
      */
-    unsigned int supported_write_flags;
+    BdrvRequestFlags supported_write_flags;
     /*
      * Flags honored during pwrite_zeroes (so far: BDRV_REQ_FUA,
      * BDRV_REQ_MAY_UNMAP, BDRV_REQ_WRITE_UNCHANGED)
      */
-    unsigned int supported_zero_flags;
+    BdrvRequestFlags supported_zero_flags;
     /*
      * Flags honoured during truncate (so far: BDRV_REQ_ZERO_WRITE).
      *
@@ -1082,7 +1082,7 @@ struct BlockDriverState {
      * that any added space reads as all zeros. If this can't be guaranteed,
      * the operation must fail.
      */
-    unsigned int supported_truncate_flags;
+    BdrvRequestFlags supported_truncate_flags;
 
     /* the following member gives a name to every node on the bs graph. */
     char node_name[32];
-- 
2.37.3


