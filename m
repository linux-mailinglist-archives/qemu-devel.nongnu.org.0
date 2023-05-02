Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8136F4663
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 16:53:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptrMT-0000Ib-C8; Tue, 02 May 2023 10:52:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ptrMM-0000HZ-LN
 for qemu-devel@nongnu.org; Tue, 02 May 2023 10:52:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ptrMK-00059c-QN
 for qemu-devel@nongnu.org; Tue, 02 May 2023 10:52:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683039123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=H9wvWNGkI6Ohe2b7rH63zBh+Mnu82nr5CzFbkTL6oUM=;
 b=iGLl56TT6YtS5OaVZ+nd2UAbrZqqu6H5/lk5QNgEEXeS2qcno93xfhRPVlPN7sT5qpb1Ce
 CPSSldaq+PXUZDJpKUoohNPfMA6VFwzRLbY0vTtudRcMr3DfRgAN83/k37pyVNL6dU2/DP
 S1G/bfVWfHbc51ccUAdoD9r+Y73SEE0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-yWayfi8gM-Oo1vBa3jii7A-1; Tue, 02 May 2023 10:50:56 -0400
X-MC-Unique: yWayfi8gM-Oo1vBa3jii7A-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f1757ebb1eso11776165e9.2
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 07:50:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683039054; x=1685631054;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H9wvWNGkI6Ohe2b7rH63zBh+Mnu82nr5CzFbkTL6oUM=;
 b=kx30Awm1zA4rxZV5ztdR+6PWc+oUowxFI4DDPEwmWIDD0vX49sYDuoA25+U7aFy5ES
 ujoF/vbzthel4F9C5w6Qj6PWAN+8AZUKEZdaI7LxdCJyDQOTk8XlTtTgY98u6tIXvQGU
 TAZqklKhSawMQ1F9yNrekn2y6AW9wzrtMkmeFwoHGUnZe8NMjxbRBWuuaooav56GRZ1H
 TPfRWl9I36bfd0vJH2Gvolw2ORZMCguC6rYY/QfDDI4GcIfQt0xrNbm5NypbawVhAxOu
 cyvSwcjLL9T1oi5aChVIUJcqxfNP7NVTEOjI5rEl6OjYjxxvESLhtuKdhKGGQ/wW2rUv
 h3PA==
X-Gm-Message-State: AC+VfDyl/1Rl3jObTOtTvN/6WRMHTdcePWrPsM1tTg1CKvCbu3o0wQmc
 ln76Hq15ZAuFNqmKAEI/0k9mm/plm8hIZ+moqsT756OVEGG6oHe4XNerZ3kpZnris1SapZfe+fu
 1C8oHIvv0I2T+zWF436F1iFYQLyerpI/b/sn21a1EE0zxKKN+P35HN/EgyPipKOhKRlzwuXNgBO
 Y=
X-Received: by 2002:a1c:7502:0:b0:3ed:af6b:7fb3 with SMTP id
 o2-20020a1c7502000000b003edaf6b7fb3mr12152160wmc.2.1683039054709; 
 Tue, 02 May 2023 07:50:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Z0JUdHOBNyz3TgzDUWbn/lf2KuhbCeF0GzY+kxJxekHpbFCMrZlFhwrVqubtOkGooEl7ZkA==
X-Received: by 2002:a1c:7502:0:b0:3ed:af6b:7fb3 with SMTP id
 o2-20020a1c7502000000b003edaf6b7fb3mr12152139wmc.2.1683039054281; 
 Tue, 02 May 2023 07:50:54 -0700 (PDT)
Received: from step1.redhat.com ([5.77.70.74])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a05600c204100b003ef64affec7sm35718106wmg.22.2023.05.02.07.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 07:50:53 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, jjongsma@redhat.com,
 Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH] block/blkio: add 'fd' option to virtio-blk-vhost-vdpa driver
Date: Tue,  2 May 2023 16:50:50 +0200
Message-Id: <20230502145050.224615-1-sgarzare@redhat.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
    As an alternative we could support passing `/dev/fdset/N` via 'path',
    always opening the path with qemu_open() and passing the fd to the
    libblkio driver.
    I preferred to add a new parameter though, because the code is
    simpler without changing how path works (alternatively we should check
    first if fd is supported by the driver or not).
    
    What do you think?
    
    Thanks,
    Stefano

 qapi/block-core.json |  6 +++++-
 block/blkio.c        | 45 +++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 49 insertions(+), 2 deletions(-)

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
index 0cdc99a729..98394b5745 100644
--- a/block/blkio.c
+++ b/block/blkio.c
@@ -694,6 +694,49 @@ static int blkio_virtio_blk_common_open(BlockDriverState *bs,
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
+        ret = blkio_set_str(s->blkio, "fd", fd_str);
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
@@ -717,7 +760,7 @@ static int blkio_file_open(BlockDriverState *bs, QDict *options, int flags,
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


