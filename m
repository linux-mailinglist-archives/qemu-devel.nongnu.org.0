Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E3B6F6849
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 11:30:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puVHB-0001Io-Iy; Thu, 04 May 2023 05:29:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1puVH9-0001Bb-7J
 for qemu-devel@nongnu.org; Thu, 04 May 2023 05:29:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1puVH7-0001aD-MM
 for qemu-devel@nongnu.org; Thu, 04 May 2023 05:29:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683192561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=760do11jc3iXril9t35fcWDkgKuZmBJWXZ+rInX0Ui4=;
 b=At/HDMU80kJFaRuFEDlq9dtZQoKTxyjYkWt+LaU14aw0rb2Wa0HAM4xvaKXTIyqH3tPQ38
 c+Ytd+xZj6r0L5kfuKgRPdvNbiDmONEm7AqQ0+3ncHe7jKteJFpqbAd7il4Bbx72I0d6hU
 5m6TbPV+Ip/Cc932UroSv1jf022A8XI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-240-gyOJkJiVP7mNI7UIObXKSQ-1; Thu, 04 May 2023 05:29:00 -0400
X-MC-Unique: gyOJkJiVP7mNI7UIObXKSQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f315735edeso34359915e9.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 02:29:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683192539; x=1685784539;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=760do11jc3iXril9t35fcWDkgKuZmBJWXZ+rInX0Ui4=;
 b=R5XxN6DcispvzzbgcerFwnn3nLiITkdYdSa8Q5fnyVjUtnPmgRJfRsRhYV2GWn3FHf
 J9EF8iYO3/uFTmNB3TPt38/CA6Z1rgDRhu7NZ5nWEEkjfu6ixKDggk/3LB8r09lSPysX
 sRvreqzJ/WsGs+Brt7TLDmz+0J4niYUjWdZeTF86Ml1pMN14HYez4zMJ2Waua4dmtMLC
 GNjUy5vqx2ltFCjUlXK2S6TRyhDNPGka4ydVM07IQvFzt/Hgs7KMA3wjr14BKNm5toF4
 nXcJIinOzn93j+7Hpj3u8RhBeUh3wHRGOWMajjJXBM84xqAIPm21Ou9t9gmazDH4fQDC
 BjlA==
X-Gm-Message-State: AC+VfDwHoWfe/0n3lbGKqpvCxAvbIOiEVbVULYmRjBl3wtOW/nKj6Ufs
 Hre/KaeY0Ado+FQixkG84NSNvtXFP35DmZy6d0Oj5LQK6EDBX0WewswWRx3yVdC97nHfWOR3DyD
 8bC0vdLXWAV8Kuq1U0wZOGsz4r80fBc/CN5g9HMr5yePfPzgBh47/DG5Yafsa6FUkOY6vKH7qgA
 s=
X-Received: by 2002:adf:fb8e:0:b0:306:459c:495 with SMTP id
 a14-20020adffb8e000000b00306459c0495mr1945488wrr.30.1683192538946; 
 Thu, 04 May 2023 02:28:58 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7zwe4JPgcPsruP9gUPG/0o0WBukX+HYhif8at7Nuju7VtyknnGoyiZJCFGaM4GHEg4OHmZBw==
X-Received: by 2002:adf:fb8e:0:b0:306:459c:495 with SMTP id
 a14-20020adffb8e000000b00306459c0495mr1945466wrr.30.1683192538663; 
 Thu, 04 May 2023 02:28:58 -0700 (PDT)
Received: from step1.redhat.com ([5.179.186.0])
 by smtp.gmail.com with ESMTPSA id
 f24-20020a1cc918000000b003f0ad8d1c69sm4268317wmb.25.2023.05.04.02.28.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 02:28:57 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, jjongsma@redhat.com,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v2 2/2] block/blkio: add 'fd' option to virtio-blk-vhost-vdpa
 driver
Date: Thu,  4 May 2023 11:28:43 +0200
Message-Id: <20230504092843.62493-3-sgarzare@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230504092843.62493-1-sgarzare@redhat.com>
References: <20230504092843.62493-1-sgarzare@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

The virtio-blk-vhost-vdpa driver in libblkio 1.3.0 supports the new
'fd' property. Let's expose this to the user, so the management layer
can pass the file descriptor of an already opened vhost-vdpa character
device. This is useful especially when the device can only be accessed
with certain privileges.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---

Notes:
    v2:
    - used monitor_fd_param() to parse the fd like vhost devices [Stefan]

 qapi/block-core.json |  6 ++++-
 block/blkio.c        | 53 +++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index b57978957f..9f70777d49 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -3841,10 +3841,14 @@
 #
 # @path: path to the vhost-vdpa character device.
 #
+# @fd: file descriptor of an already opened vhost-vdpa character device.
+#      (Since 8.1)
+#
 # Since: 7.2
 ##
 { 'struct': 'BlockdevOptionsVirtioBlkVhostVdpa',
-  'data': { 'path': 'str' },
+  'data': { '*path': 'str',
+            '*fd': 'str' },
   'if': 'CONFIG_BLKIO' }
 
 ##
diff --git a/block/blkio.c b/block/blkio.c
index 0cdc99a729..66b3dd2cd0 100644
--- a/block/blkio.c
+++ b/block/blkio.c
@@ -18,6 +18,7 @@
 #include "qapi/qmp/qdict.h"
 #include "qemu/module.h"
 #include "exec/memory.h" /* for ram_block_discard_disable() */
+#include "monitor/monitor.h"
 
 #include "block/block-io.h"
 
@@ -694,6 +695,56 @@ static int blkio_virtio_blk_common_open(BlockDriverState *bs,
     return 0;
 }
 
+static int blkio_virtio_blk_vhost_vdpa_open(BlockDriverState *bs,
+        QDict *options, int flags, Error **errp)
+{
+    const char *path = qdict_get_try_str(options, "path");
+    const char *fd_str = qdict_get_try_str(options, "fd");
+    BDRVBlkioState *s = bs->opaque;
+    int ret;
+
+    if (path && fd_str) {
+        error_setg(errp, "'path' and 'fd' options are mutually exclusive");
+        return -EINVAL;
+    }
+
+    if (!path && !fd_str) {
+        error_setg(errp, "none of 'path' or 'fd' options was specified");
+        return -EINVAL;
+    }
+
+    if (path) {
+        ret = blkio_set_str(s->blkio, "path", path);
+        qdict_del(options, "path");
+        if (ret < 0) {
+            error_setg_errno(errp, -ret, "failed to set path: %s",
+                             blkio_get_error_msg());
+            return ret;
+        }
+    } else {
+        int fd = monitor_fd_param(monitor_cur(), fd_str, errp);
+
+        if (fd < 0) {
+            error_prepend(errp, "unable to parse 'fd' option: ");
+            return -EINVAL;
+        }
+
+        ret = blkio_set_int(s->blkio, "fd", fd);
+        qdict_del(options, "fd");
+        if (ret < 0) {
+            error_setg_errno(errp, -ret, "failed to set fd: %s",
+                             blkio_get_error_msg());
+            return ret;
+        }
+    }
+
+    if (!(flags & BDRV_O_NOCACHE)) {
+        error_setg(errp, "cache.direct=off is not supported");
+        return -EINVAL;
+    }
+    return 0;
+}
+
 static int blkio_file_open(BlockDriverState *bs, QDict *options, int flags,
                            Error **errp)
 {
@@ -717,7 +768,7 @@ static int blkio_file_open(BlockDriverState *bs, QDict *options, int flags,
     } else if (strcmp(blkio_driver, DRIVER_VIRTIO_BLK_VHOST_USER) == 0) {
         ret = blkio_virtio_blk_common_open(bs, options, flags, errp);
     } else if (strcmp(blkio_driver, DRIVER_VIRTIO_BLK_VHOST_VDPA) == 0) {
-        ret = blkio_virtio_blk_common_open(bs, options, flags, errp);
+        ret = blkio_virtio_blk_vhost_vdpa_open(bs, options, flags, errp);
     } else {
         g_assert_not_reached();
     }
-- 
2.40.1


