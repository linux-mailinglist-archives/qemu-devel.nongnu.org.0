Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC326FEE7E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 11:16:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px2Os-0006Ij-Bk; Thu, 11 May 2023 05:15:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1px2Oq-0006IE-Du
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:15:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1px2Oi-00079K-Gs
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:15:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683796540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bub0TNVeCA4HprPsiYdDzaSxOR8D+n+oo9piFcKHuao=;
 b=HDxL3jJ+2Cm+BStJsPk4S0R7vwZdKSfkL/NyLt5FCfNryPQflkVVZQzVmA2r5A2VasOZBv
 kIjTOKXE+TwSWwUCx2pZqnzbPvfznLQr4wYkIjOjtR72/XTG1Xfx2TkRiUd1IvoYVncXtS
 dN266ip/bCcnCGXRCVZQCacYo4LKYLE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-Zwh4gBc-No2kT881ocCxeQ-1; Thu, 11 May 2023 05:15:38 -0400
X-MC-Unique: Zwh4gBc-No2kT881ocCxeQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-306281812d6so3293341f8f.2
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 02:15:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683796537; x=1686388537;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bub0TNVeCA4HprPsiYdDzaSxOR8D+n+oo9piFcKHuao=;
 b=V8I8CMpe90YQ3rk26pZh+DKrSPZb3HnEk0KNCaGaSQ8Ox+cgvwW7YMumcz9Ja6cxzT
 3SCD7iEigyEcLMfHeIaoe3liPISStFxiNQyQZCrZb8Bh9H30TH6Symlm1hz58tMGW1C/
 deTnuEJFcI6JR7eIcXPonjU8KwWenf6p+eDtQylcYOEAwxtOJS1nHztdFS+iQv/myMVv
 B1vYpNM3evIQ7bGTKWWcNUAGe73xJU3rvVEODa86KA+STuXbqym+paIWQq0uZ0hkqlgE
 R8xrwxoLOaLU16EKWZVeKsVIQOT3fmF1ByGXVui59ODWGG7CDz6AYH5qLt3LNkVaZ+Oh
 ufcQ==
X-Gm-Message-State: AC+VfDxckKNxBabfxDqT0eBkDNnFK3XoOoW1+vTZ78JTm4QtNOnijSq1
 u6mkeq7EL92c1pmz3N+/++bVUaa8i01uxY8UM87R+SrjDDZKzVuVk2kwCs6yLQYaxSZYzQHKCJx
 8p+4XzgtFiozsaL55QaaDe6FwiYEwBloliFGOdR/jgOjA5TM8VToE8KmwwmJ3ws6icXBQeJnmI6
 o=
X-Received: by 2002:adf:ef47:0:b0:2f0:e287:1fbc with SMTP id
 c7-20020adfef47000000b002f0e2871fbcmr13518518wrp.11.1683796537263; 
 Thu, 11 May 2023 02:15:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6qw2EHquUoXuvnOU6bPvR3WzBrpbM3/oCu/2/pMc8QkMtkZcGnbzV/iSpsXaMkSSIqxD1tHw==
X-Received: by 2002:adf:ef47:0:b0:2f0:e287:1fbc with SMTP id
 c7-20020adfef47000000b002f0e2871fbcmr13518491wrp.11.1683796536749; 
 Thu, 11 May 2023 02:15:36 -0700 (PDT)
Received: from step1.lan ([5.77.69.175]) by smtp.gmail.com with ESMTPSA id
 p14-20020a1c740e000000b003f420667807sm15145859wmc.11.2023.05.11.02.15.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 02:15:36 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Jonathon Jongsma <jjongsma@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v3 1/1] block/blkio: use qemu_open() to support fd passing for
 virtio-blk
Date: Thu, 11 May 2023 11:15:27 +0200
Message-Id: <20230511091527.46620-2-sgarzare@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230511091527.46620-1-sgarzare@redhat.com>
References: <20230511091527.46620-1-sgarzare@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

If the libblkio virtio-blk driver supports fd passing, let's always
use qemu_open() to open the `path`, so we can handle fd passing
from the management layer through the "/dev/fdset/N" special path.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---

Notes:
    v3:
    - use qemu_open() on `path` to simplify libvirt code [Jonathon]

 block/blkio.c | 53 ++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 44 insertions(+), 9 deletions(-)

diff --git a/block/blkio.c b/block/blkio.c
index 0cdc99a729..6a6f20f923 100644
--- a/block/blkio.c
+++ b/block/blkio.c
@@ -672,25 +672,60 @@ static int blkio_virtio_blk_common_open(BlockDriverState *bs,
 {
     const char *path = qdict_get_try_str(options, "path");
     BDRVBlkioState *s = bs->opaque;
-    int ret;
+    bool fd_supported = false;
+    int fd, ret;
 
     if (!path) {
         error_setg(errp, "missing 'path' option");
         return -EINVAL;
     }
 
-    ret = blkio_set_str(s->blkio, "path", path);
-    qdict_del(options, "path");
-    if (ret < 0) {
-        error_setg_errno(errp, -ret, "failed to set path: %s",
-                         blkio_get_error_msg());
-        return ret;
-    }
-
     if (!(flags & BDRV_O_NOCACHE)) {
         error_setg(errp, "cache.direct=off is not supported");
         return -EINVAL;
     }
+
+    if (blkio_get_int(s->blkio, "fd", &fd) == 0) {
+        fd_supported = true;
+    }
+
+    /*
+     * If the libblkio driver supports fd passing, let's always use qemu_open()
+     * to open the `path`, so we can handle fd passing from the management
+     * layer through the "/dev/fdset/N" special path.
+     */
+    if (fd_supported) {
+        int open_flags;
+
+        if (flags & BDRV_O_RDWR) {
+            open_flags = O_RDWR;
+        } else {
+            open_flags = O_RDONLY;
+        }
+
+        fd = qemu_open(path, open_flags, errp);
+        if (fd < 0) {
+            return -EINVAL;
+        }
+
+        ret = blkio_set_int(s->blkio, "fd", fd);
+        if (ret < 0) {
+            error_setg_errno(errp, -ret, "failed to set fd: %s",
+                             blkio_get_error_msg());
+            qemu_close(fd);
+            return ret;
+        }
+    } else {
+        ret = blkio_set_str(s->blkio, "path", path);
+        if (ret < 0) {
+            error_setg_errno(errp, -ret, "failed to set path: %s",
+                             blkio_get_error_msg());
+            return ret;
+        }
+    }
+
+    qdict_del(options, "path");
+
     return 0;
 }
 
-- 
2.40.1


