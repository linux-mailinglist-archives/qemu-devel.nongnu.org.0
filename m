Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F71E60E851
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 21:06:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onld0-0007jc-SQ; Wed, 26 Oct 2022 14:59:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1onlcy-0007cR-3V
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 14:59:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1onlcw-00072O-NW
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 14:59:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666810786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XKo/22Ql8EILbGlyLiJvJ9MWjBrMnRp9fXY1UfQXXA0=;
 b=Ve9bT72s++KCnhbJYUHs3IyrhROqpeV4qYq7fCCbM6ZZTKUxu0yMijMbg+wYJ//vsiW59n
 h6sVkHt5KOxJFlwdCMlwv9H3Fse/NARDyYqV+PiM6xdSRzHnbWNE+r+/XVokZKQxy+DaT1
 DYa2/Vy+pyWV7b29fW+xIMMJy4lNbfE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-458-i4NVsBh3MHm8oBLzW-NNXg-1; Wed, 26 Oct 2022 14:59:41 -0400
X-MC-Unique: i4NVsBh3MHm8oBLzW-NNXg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C5B8800B23;
 Wed, 26 Oct 2022 18:59:40 +0000 (UTC)
Received: from localhost (unknown [10.39.192.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70A8AC15BAB;
 Wed, 26 Oct 2022 18:59:39 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Thomas Huth <thuth@redhat.com>,
 integration@gluster.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, Peter Xu <peterx@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Fam Zheng <fam@euphon.net>, Xie Changlong <xiechanglong.d@gmail.com>,
 Jeff Cody <codyprime@gmail.com>, John Snow <jsnow@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Stefano Garzarella <sgarzare@redhat.com>
Subject: [PULL 05/13] block: use BdrvRequestFlags type for supported flag
 fields
Date: Wed, 26 Oct 2022 14:58:38 -0400
Message-Id: <20221026185846.120544-6-stefanha@redhat.com>
In-Reply-To: <20221026185846.120544-1-stefanha@redhat.com>
References: <20221026185846.120544-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Use the enum type so GDB displays the enum members instead of printing a
numeric constant.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Message-id: 20221013185908.1297568-6-stefanha@redhat.com
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


