Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CC234D344
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 17:04:58 +0200 (CEST)
Received: from localhost ([::1]:58336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQtRp-0001Nv-3Q
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 11:04:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lQtOo-00085G-NQ
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 11:01:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lQtOk-0002Ik-Nm
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 11:01:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617030105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RIkErorTjiL3f7yPFbJXBnmkRoubtURSfd+beKRAr0g=;
 b=SokzmcfORKm5Cky318WrDwdZ1htG/tR+TVOk2s9yMGpwpQam/u18tybibWMJbmramwNnKd
 WxVqiBGLP1OPiLMTCp74B+dBlhnAglCsZ9yibnk0ZDkK2w/nNpHDQ847gPi6Y0e/PMcc/P
 3kQQkWLZfCChrU0e6B8+boelXCLOgwk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-kOjTGfK8OymLo1LEZNG8Rg-1; Mon, 29 Mar 2021 11:01:41 -0400
X-MC-Unique: kOjTGfK8OymLo1LEZNG8Rg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02681107BEF5;
 Mon, 29 Mar 2021 15:01:40 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-115-72.ams2.redhat.com
 [10.36.115.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 25D9B5D9D3;
 Mon, 29 Mar 2021 15:01:35 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] block/rbd: fix memory leak in qemu_rbd_connect()
Date: Mon, 29 Mar 2021 17:01:28 +0200
Message-Id: <20210329150129.121182-2-sgarzare@redhat.com>
In-Reply-To: <20210329150129.121182-1-sgarzare@redhat.com>
References: <20210329150129.121182-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=sgarzare@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Peter Lieven <pl@kamp.de>, Max Reitz <mreitz@redhat.com>,
 Florian Florensa <fflorensa@online.net>, Jason Dillaman <dillaman@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In qemu_rbd_connect(), 'mon_host' is allocated by qemu_rbd_mon_host()
using g_strjoinv(), but it's only freed in the error path, leaking
memory in the success path as reported by valgrind:

  80 bytes in 4 blocks are definitely lost in loss record 5,028 of 6,516
     at 0x4839809: malloc (vg_replace_malloc.c:307)
     by 0x5315BB8: g_malloc (in /usr/lib64/libglib-2.0.so.0.6600.8)
     by 0x532B6FF: g_strjoinv (in /usr/lib64/libglib-2.0.so.0.6600.8)
     by 0x87D07E: qemu_rbd_mon_host (rbd.c:538)
     by 0x87D07E: qemu_rbd_connect (rbd.c:562)
     by 0x87E1CE: qemu_rbd_open (rbd.c:740)
     by 0x840EB1: bdrv_open_driver (block.c:1528)
     by 0x8453A9: bdrv_open_common (block.c:1802)
     by 0x8453A9: bdrv_open_inherit (block.c:3444)
     by 0x8464C2: bdrv_open (block.c:3537)
     by 0x8108CD: qmp_blockdev_add (blockdev.c:3569)
     by 0x8EA61B: qmp_marshal_blockdev_add (qapi-commands-block-core.c:1086)
     by 0x90B528: do_qmp_dispatch_bh (qmp-dispatch.c:131)
     by 0x907EA4: aio_bh_poll (async.c:164)

Fix freeing 'mon_host' also when qemu_rbd_connect() ends correctly.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 block/rbd.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/block/rbd.c b/block/rbd.c
index 9071a00e3f..24cefcd0dc 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -563,13 +563,13 @@ static int qemu_rbd_connect(rados_t *cluster, rados_ioctx_t *io_ctx,
     if (local_err) {
         error_propagate(errp, local_err);
         r = -EINVAL;
-        goto failed_opts;
+        goto out;
     }
 
     r = rados_create(cluster, opts->user);
     if (r < 0) {
         error_setg_errno(errp, -r, "error initializing");
-        goto failed_opts;
+        goto out;
     }
 
     /* try default location when conf=NULL, but ignore failure */
@@ -626,11 +626,12 @@ static int qemu_rbd_connect(rados_t *cluster, rados_ioctx_t *io_ctx,
      */
     rados_ioctx_set_namespace(*io_ctx, opts->q_namespace);
 
-    return 0;
+    r = 0;
+    goto out;
 
 failed_shutdown:
     rados_shutdown(*cluster);
-failed_opts:
+out:
     g_free(mon_host);
     return r;
 }
-- 
2.30.2


