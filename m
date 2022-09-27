Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2EB5EBD30
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 10:24:52 +0200 (CEST)
Received: from localhost ([::1]:42844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od5tb-0005Xb-S6
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 04:24:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1od53V-000440-LR
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 03:31:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1od53T-0001l7-2M
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 03:31:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664263858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=72fe6pmcOVLG6dRHQG+0/KXd+hhvMVZPBOsQRMmfl+g=;
 b=XB6kmKls72jRjA9FKIhV8GF04sn3rgiw7ULrkYUmloV4jJZWvZW5CUNAz+lyd3nH7uk0qZ
 Qbrr8TnHUwC9Usp4jr0YSbAv5kVvsdgsN8P/zi36svpw0+PG2LWh4V+bY3Q1wRj9o/2KWR
 bmPhXxhZ02Uq8NsuzOiv1qgs+OwNcaI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-269-VUBc3d7jMxqVjuPrVf7U7w-1; Tue, 27 Sep 2022 03:30:54 -0400
X-MC-Unique: VUBc3d7jMxqVjuPrVf7U7w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 789431C0BDE8;
 Tue, 27 Sep 2022 07:30:54 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-192.pek2.redhat.com
 [10.72.13.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 661A52166B26;
 Tue, 27 Sep 2022 07:30:51 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org,
	stefanha@redhat.com
Cc: lu zhipeng <luzhipeng@cestc.cn>,
	Jason Wang <jasowang@redhat.com>
Subject: [PULL 8/8] virtio: del net client if net_init_tap_one failed
Date: Tue, 27 Sep 2022 15:30:22 +0800
Message-Id: <20220927073022.28378-9-jasowang@redhat.com>
In-Reply-To: <20220927073022.28378-1-jasowang@redhat.com>
References: <20220927073022.28378-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

From: lu zhipeng <luzhipeng@cestc.cn>

If the net tap initializes successful, but failed during
network card hot-plugging, the net-tap will remains,
so cleanup.

Signed-off-by: lu zhipeng <luzhipeng@cestc.cn>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/tap.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/net/tap.c b/net/tap.c
index b3ddfd4..e203d07 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -686,7 +686,7 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
     tap_set_sndbuf(s->fd, tap, &err);
     if (err) {
         error_propagate(errp, err);
-        return;
+        goto failed;
     }
 
     if (tap->has_fd || tap->has_fds) {
@@ -726,12 +726,12 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
                 } else {
                     warn_report_err(err);
                 }
-                return;
+                goto failed;
             }
             if (!g_unix_set_fd_nonblocking(vhostfd, true, NULL)) {
                 error_setg_errno(errp, errno, "%s: Can't use file descriptor %d",
                                  name, fd);
-                return;
+                goto failed;
             }
         } else {
             vhostfd = open("/dev/vhost-net", O_RDWR);
@@ -743,11 +743,11 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
                     warn_report("tap: open vhost char device failed: %s",
                                 strerror(errno));
                 }
-                return;
+                goto failed;
             }
             if (!g_unix_set_fd_nonblocking(vhostfd, true, NULL)) {
                 error_setg_errno(errp, errno, "Failed to set FD nonblocking");
-                return;
+                goto failed;
             }
         }
         options.opaque = (void *)(uintptr_t)vhostfd;
@@ -760,11 +760,17 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
             } else {
                 warn_report(VHOST_NET_INIT_FAILED);
             }
-            return;
+            goto failed;
         }
     } else if (vhostfdname) {
         error_setg(errp, "vhostfd(s)= is not valid without vhost");
+        goto failed;
     }
+
+    return;
+
+failed:
+    qemu_del_net_client(&s->nc);
 }
 
 static int get_fds(char *str, char *fds[], int max)
-- 
2.7.4


