Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C896B0FAC
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 18:04:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZx8a-0004qW-1J; Wed, 08 Mar 2023 11:59:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx8T-0004jx-39; Wed, 08 Mar 2023 11:59:29 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx8N-00048s-W4; Wed, 08 Mar 2023 11:59:28 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id E46B14010E;
 Wed,  8 Mar 2023 19:58:57 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 9898A92;
 Wed,  8 Mar 2023 19:58:56 +0300 (MSK)
Received: (nullmailer pid 2098379 invoked by uid 1000);
 Wed, 08 Mar 2023 16:58:55 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Yajun Wu <yajunw@nvidia.com>,
 Jiri Pirko <jiri@nvidia.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 42/47] chardev/char-socket: set s->listener = NULL in
 char_socket_finalize
Date: Wed,  8 Mar 2023 19:57:45 +0300
Message-Id: <20230308165815.2098148-42-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
References: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Yajun Wu <yajunw@nvidia.com>

After live migration with virtio block device, qemu crash at:

	#0  0x000055914f46f795 in object_dynamic_cast_assert (obj=0x559151b7b090, typename=0x55914f80fbc4 "qio-channel", file=0x55914f80fb90 "/images/testvfe/sw/qemu.gerrit/include/io/channel.h", line=30, func=0x55914f80fcb8 <__func__.17257> "QIO_CHANNEL") at ../qom/object.c:872
	#1  0x000055914f480d68 in QIO_CHANNEL (obj=0x559151b7b090) at /images/testvfe/sw/qemu.gerrit/include/io/channel.h:29
	#2  0x000055914f4812f8 in qio_net_listener_set_client_func_full (listener=0x559151b7a720, func=0x55914f580b97 <tcp_chr_accept>, data=0x5591519f4ea0, notify=0x0, context=0x0) at ../io/net-listener.c:166
	#3  0x000055914f580059 in tcp_chr_update_read_handler (chr=0x5591519f4ea0) at ../chardev/char-socket.c:637
	#4  0x000055914f583dca in qemu_chr_be_update_read_handlers (s=0x5591519f4ea0, context=0x0) at ../chardev/char.c:226
	#5  0x000055914f57b7c9 in qemu_chr_fe_set_handlers_full (b=0x559152bf23a0, fd_can_read=0x0, fd_read=0x0, fd_event=0x0, be_change=0x0, opaque=0x0, context=0x0, set_open=false, sync_state=true) at ../chardev/char-fe.c:279
	#6  0x000055914f57b86d in qemu_chr_fe_set_handlers (b=0x559152bf23a0, fd_can_read=0x0, fd_read=0x0, fd_event=0x0, be_change=0x0, opaque=0x0, context=0x0, set_open=false) at ../chardev/char-fe.c:304
	#7  0x000055914f378caf in vhost_user_async_close (d=0x559152bf21a0, chardev=0x559152bf23a0, vhost=0x559152bf2420, cb=0x55914f2fb8c1 <vhost_user_blk_disconnect>) at ../hw/virtio/vhost-user.c:2725
	#8  0x000055914f2fba40 in vhost_user_blk_event (opaque=0x559152bf21a0, event=CHR_EVENT_CLOSED) at ../hw/block/vhost-user-blk.c:395
	#9  0x000055914f58388c in chr_be_event (s=0x5591519f4ea0, event=CHR_EVENT_CLOSED) at ../chardev/char.c:61
	#10 0x000055914f583905 in qemu_chr_be_event (s=0x5591519f4ea0, event=CHR_EVENT_CLOSED) at ../chardev/char.c:81
	#11 0x000055914f581275 in char_socket_finalize (obj=0x5591519f4ea0) at ../chardev/char-socket.c:1083
	#12 0x000055914f46f073 in object_deinit (obj=0x5591519f4ea0, type=0x5591519055c0) at ../qom/object.c:680
	#13 0x000055914f46f0e5 in object_finalize (data=0x5591519f4ea0) at ../qom/object.c:694
	#14 0x000055914f46ff06 in object_unref (objptr=0x5591519f4ea0) at ../qom/object.c:1202
	#15 0x000055914f4715a4 in object_finalize_child_property (obj=0x559151b76c50, name=0x559151b7b250 "char3", opaque=0x5591519f4ea0) at ../qom/object.c:1747
	#16 0x000055914f46ee86 in object_property_del_all (obj=0x559151b76c50) at ../qom/object.c:632
	#17 0x000055914f46f0d2 in object_finalize (data=0x559151b76c50) at ../qom/object.c:693
	#18 0x000055914f46ff06 in object_unref (objptr=0x559151b76c50) at ../qom/object.c:1202
	#19 0x000055914f4715a4 in object_finalize_child_property (obj=0x559151b6b560, name=0x559151b76630 "chardevs", opaque=0x559151b76c50) at ../qom/object.c:1747
	#20 0x000055914f46ef67 in object_property_del_child (obj=0x559151b6b560, child=0x559151b76c50) at ../qom/object.c:654
	#21 0x000055914f46f042 in object_unparent (obj=0x559151b76c50) at ../qom/object.c:673
	#22 0x000055914f58632a in qemu_chr_cleanup () at ../chardev/char.c:1189
	#23 0x000055914f16c66c in qemu_cleanup () at ../softmmu/runstate.c:830
	#24 0x000055914eee7b9e in qemu_default_main () at ../softmmu/main.c:38
	#25 0x000055914eee7bcc in main (argc=86, argv=0x7ffc97cb8d88) at ../softmmu/main.c:48

In char_socket_finalize after s->listener freed, event callback function
vhost_user_blk_event will be called to handle CHR_EVENT_CLOSED.
vhost_user_blk_event is calling qio_net_listener_set_client_func_full which
is still using s->listener.

Setting s->listener = NULL after object_unref(OBJECT(s->listener)) can
solve this issue.

Signed-off-by: Yajun Wu <yajunw@nvidia.com>
Acked-by: Jiri Pirko <jiri@nvidia.com>
Message-Id: <20230214021430.3638579-1-yajunw@nvidia.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
(cherry picked from commit b8a7f51f59e28d5a8e0c07ed3919cc9695560ed2)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 chardev/char-socket.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 879564aa8a..b00efb1482 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -1065,6 +1065,7 @@ static void char_socket_finalize(Object *obj)
         qio_net_listener_set_client_func_full(s->listener, NULL, NULL,
                                               NULL, chr->gcontext);
         object_unref(OBJECT(s->listener));
+        s->listener = NULL;
     }
     if (s->tls_creds) {
         object_unref(OBJECT(s->tls_creds));
-- 
2.30.2


