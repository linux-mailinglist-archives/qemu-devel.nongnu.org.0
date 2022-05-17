Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0507529A98
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 09:13:34 +0200 (CEST)
Received: from localhost ([::1]:47204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqrOf-0007UJ-7W
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 03:13:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nqrLf-000688-TX
 for qemu-devel@nongnu.org; Tue, 17 May 2022 03:10:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nqrLc-0005AO-MM
 for qemu-devel@nongnu.org; Tue, 17 May 2022 03:10:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652771418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=m7sBWzc3ink6IbHaTeIrbGxG+koBMXneQrV7hajKjwM=;
 b=McI13z5TLO5U5ypzUt4gQeArWzx8qu6zVL0Z3lDH/WEKBROFjXLJpL9XAwunYVR7ezGafa
 7eNRCIKfEanT2yPSR4rrYIMHxZcwIgr9LqkZaoFRWTHo3u1VGFbcC2msV+18B6DYg72ftq
 hY9lPXUmOxldUbBWJ1SYahM0zgs6fgY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-48-WW4ANxVMOwWRqFL1_lLHbg-1; Tue, 17 May 2022 03:10:17 -0400
X-MC-Unique: WW4ANxVMOwWRqFL1_lLHbg-1
Received: by mail-wm1-f70.google.com with SMTP id
 e9-20020a05600c4e4900b00394779649b1so873737wmq.3
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 00:10:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m7sBWzc3ink6IbHaTeIrbGxG+koBMXneQrV7hajKjwM=;
 b=PcRHg1O6JDWsLM92umOyDIcoE1Bl0CJFxOGZjOpW2AVSqVSccxAC6Gfd5QWjns+h2P
 2G829srZTg9J0G1Et4Nj1KZ+EbMpOaGlV72fQRKuUkD5ZBRL/FJCnlGdL11Pe23K1Yzw
 XhRMJc9dnntS/OrT1QyiIdF1pwPXfKWYXBmBD32nYtXpvI7JaI8JfH1uxjArLX87kwMe
 xZdXI/J7COI+ddS0lcB0uVv67oCsgHOhDbh2LDusJ91w9wDm5q+4XDah/4SUSrAdscKn
 xj4CZgBQ/uw7vSTfhGtddcIcI0q6mRF+oFQ9A63uXRUM9ieeGeBLkDGL9p4YwMsaRtp3
 4KRA==
X-Gm-Message-State: AOAM531/40Fsyz5z6t/ucAP3ChYG7T/V+vGYUO8JNDeosFlIaRAO+3tP
 BQdGXB0cv78lX/2xN3Sv2vrAQ4uV0D9lTIKlaeAWjfF8SfzEHpfjkks4McE5cFu76ox7lFZ6w0P
 YFmgdTXK50QjdIX/d7qO8YllSrjjOpqWb7KIUng0B9KsidNXNEWSMJJX3gcg/tddG6ss=
X-Received: by 2002:adf:d1cd:0:b0:20c:51c6:5d9f with SMTP id
 b13-20020adfd1cd000000b0020c51c65d9fmr17750069wrd.244.1652771415511; 
 Tue, 17 May 2022 00:10:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1V6J3xGRZlqK0EijCwLg2qUnzb+3GmafkaeIl4xIA3GobVQBSnGN3TO0wDa9B1YERR1du9w==
X-Received: by 2002:adf:d1cd:0:b0:20c:51c6:5d9f with SMTP id
 b13-20020adfd1cd000000b0020c51c65d9fmr17750036wrd.244.1652771415117; 
 Tue, 17 May 2022 00:10:15 -0700 (PDT)
Received: from step1.redhat.com (host-87-12-25-16.business.telecomitalia.it.
 [87.12.25.16]) by smtp.gmail.com with ESMTPSA id
 bd10-20020a05600c1f0a00b00394538d039esm1123512wmb.6.2022.05.17.00.10.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 00:10:14 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Lieven <pl@kamp.de>, Ilya Dryomov <idryomov@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Tingting Mao <timao@redhat.com>, qemu-block@nongnu.org,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v2] block/rbd: report a better error when namespace does not
 exist
Date: Tue, 17 May 2022 09:10:12 +0200
Message-Id: <20220517071012.6120-1-sgarzare@redhat.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

If the namespace does not exist, rbd_create() fails with -ENOENT and
QEMU reports a generic "error rbd create: No such file or directory":

    $ qemu-img create rbd:rbd/namespace/image 1M
    Formatting 'rbd:rbd/namespace/image', fmt=raw size=1048576
    qemu-img: rbd:rbd/namespace/image: error rbd create: No such file or directory

Unfortunately rados_ioctx_set_namespace() does not fail if the namespace
does not exist, so let's use rbd_namespace_exists() in qemu_rbd_connect()
to check if the namespace exists, reporting a more understandable error:

    $ qemu-img create rbd:rbd/namespace/image 1M
    Formatting 'rbd:rbd/namespace/image', fmt=raw size=1048576
    qemu-img: rbd:rbd/namespace/image: namespace 'namespace' does not exist

Reported-by: Tingting Mao <timao@redhat.com>
Reviewed-by: Ilya Dryomov <idryomov@gmail.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v2:
- check r < 0 for consistency (librbd errors are always negative) [Ilya]
---
 meson.build |  6 ++++++
 block/rbd.c | 24 ++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/meson.build b/meson.build
index 9b20dcd143..e6c0afd62b 100644
--- a/meson.build
+++ b/meson.build
@@ -1828,6 +1828,12 @@ config_host_data.set('HAVE_GETIFADDRS', cc.has_function('getifaddrs'))
 config_host_data.set('HAVE_OPENPTY', cc.has_function('openpty', dependencies: util))
 config_host_data.set('HAVE_STRCHRNUL', cc.has_function('strchrnul'))
 config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))
+if rbd.found()
+  config_host_data.set('HAVE_RBD_NAMESPACE_EXISTS',
+                       cc.has_function('rbd_namespace_exists',
+                                       dependencies: rbd,
+                                       prefix: '#include <rbd/librbd.h>'))
+endif
 if rdma.found()
   config_host_data.set('HAVE_IBV_ADVISE_MR',
                        cc.has_function('ibv_advise_mr',
diff --git a/block/rbd.c b/block/rbd.c
index 6caf35cbba..f826410f40 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -831,6 +831,26 @@ static int qemu_rbd_connect(rados_t *cluster, rados_ioctx_t *io_ctx,
         error_setg_errno(errp, -r, "error opening pool %s", opts->pool);
         goto failed_shutdown;
     }
+
+#ifdef HAVE_RBD_NAMESPACE_EXISTS
+    if (opts->has_q_namespace && strlen(opts->q_namespace) > 0) {
+        bool exists;
+
+        r = rbd_namespace_exists(*io_ctx, opts->q_namespace, &exists);
+        if (r < 0) {
+            error_setg_errno(errp, -r, "error checking namespace");
+            goto failed_ioctx_destroy;
+        }
+
+        if (!exists) {
+            error_setg(errp, "namespace '%s' does not exist",
+                       opts->q_namespace);
+            r = -ENOENT;
+            goto failed_ioctx_destroy;
+        }
+    }
+#endif
+
     /*
      * Set the namespace after opening the io context on the pool,
      * if nspace == NULL or if nspace == "", it is just as we did nothing
@@ -840,6 +860,10 @@ static int qemu_rbd_connect(rados_t *cluster, rados_ioctx_t *io_ctx,
     r = 0;
     goto out;
 
+#ifdef HAVE_RBD_NAMESPACE_EXISTS
+failed_ioctx_destroy:
+    rados_ioctx_destroy(*io_ctx);
+#endif
 failed_shutdown:
     rados_shutdown(*cluster);
 out:
-- 
2.35.3


