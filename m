Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF445FE25E
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 21:05:32 +0200 (CEST)
Received: from localhost ([::1]:36216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj3WN-0003FT-Gk
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 15:05:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oj3Qk-0006c4-7D
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 14:59:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oj3Qi-00044z-Mp
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 14:59:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665687580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Si3ngGKtQ37Tc9moyJg9LdNUwHwty4UA7DMk5607KiM=;
 b=VIi3GNFUGMIbMF+lN1cr2geu/4gIJaDXM/D2kO3jlHj2ABPMWxYDYhipFwEJYXnViVHRQ7
 MbjRv4Dmp+P3Trp6t35jJXIgJF2uHwSY77X5EhFYFKig8YRxWf21yZBiTn4N+/R+blVpDi
 91E8zyWB9g5bOckAMKuCqiBjjQ86Bp8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-45-s9jRaOMsNp-4wlr1ML8qvQ-1; Thu, 13 Oct 2022 14:59:35 -0400
X-MC-Unique: s9jRaOMsNp-4wlr1ML8qvQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C3218027F5;
 Thu, 13 Oct 2022 18:59:34 +0000 (UTC)
Received: from localhost (unknown [10.39.194.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 404422166BA3;
 Thu, 13 Oct 2022 18:59:32 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>,
 afaria@redhat.com, Jeff Cody <codyprime@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, sgarzare@redhat.com,
 integration@gluster.org, Peter Xu <peterx@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "Denis V. Lunev" <den@openvz.org>
Subject: [PATCH v7 05/13] block: use BdrvRequestFlags type for supported flag
 fields
Date: Thu, 13 Oct 2022 14:59:00 -0400
Message-Id: <20221013185908.1297568-6-stefanha@redhat.com>
In-Reply-To: <20221013185908.1297568-1-stefanha@redhat.com>
References: <20221013185908.1297568-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the enum type so GDB displays the enum members instead of printing a
numeric constant.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
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


