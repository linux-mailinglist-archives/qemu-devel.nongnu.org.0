Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE752DFC76
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 14:54:07 +0100 (CET)
Received: from localhost ([::1]:42340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krLdW-0007fv-6S
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 08:54:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxinxin.wang@huawei.com>)
 id 1krLZw-00035g-PZ
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 08:50:24 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxinxin.wang@huawei.com>)
 id 1krLZt-00059E-Ss
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 08:50:24 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4D016h2xT6zhvcg;
 Mon, 21 Dec 2020 21:49:32 +0800 (CST)
Received: from localhost (10.174.149.106) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.498.0; Mon, 21 Dec 2020
 21:49:59 +0800
From: Wang Xin <wangxinxin.wang@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH] char-socket: disable reconnect timer in the sync connect
Date: Mon, 21 Dec 2020 21:49:57 +0800
Message-ID: <20201221134957.1353-1-wangxinxin.wang@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.149.106]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=wangxinxin.wang@huawei.com; helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: suruifeng <suruifeng@huawei.com>, marcandre.lureau@redhat.com,
 Wang Xin <wangxinxin.wang@huawei.com>, weidong.huang@huawei.com,
 lidonglin@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: suruifeng <suruifeng@huawei.com>

The qio_channel_socket_connect_sync maybe called twice if the
openvswitchd restart during we attaching a vhost-user nic.

-> call trace 1:
  net_vhost_user_init
    tcp_chr_wait_connected //loop call sync connect until socekt connected
      tcp_chr_connect_client_sync //return, but socekt state still disconnected
        qio_channel_socket_connect_sync //socket connect sucess
	  tcp_chr_new_client
	    tcp_chr_connect
	      qemu_chr_be_event
	        net_vhost_user_event //CHR_EVENT_OPENED
		  vhost_user_start
		    tcp_chr_write  //Broken Pipe, as peer restart
		      tcp_chr_disconnect_locked //disconnect & reconnect timer create

-> call trace 2:
  socket_reconnect_timeout //timeout, and the peer restart just finished
    tcp_chr_connect_client_async //concurrent with tcp_chr_connect_client_sync
       tcp_chr_connect_client_task
          qio_channel_socket_connect_sync //try connect same socket

This patch disabled tcp reconnect timer when we try to connect in synchronous mode,
it seems to work.

Signed-off-by: suruifeng <suruifeng@huawei.com>
Signed-off-by: Wang Xin <wangxinxin.wang@huawei.com>

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 213a4c8dd0..da1befca9e 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -80,6 +80,7 @@ struct SocketChardev {
 
     bool is_websock;
 
+    bool async_reconnect_disable;
     GSource *reconnect_timer;
     int64_t reconnect_time;
     bool connect_err_reported;
@@ -506,7 +507,9 @@ static void tcp_chr_disconnect_locked(Chardev *chr)
     if (emit_close) {
         qemu_chr_be_event(chr, CHR_EVENT_CLOSED);
     }
-    if (s->reconnect_time && !s->reconnect_timer) {
+    if (s->reconnect_time &&
+        !s->reconnect_timer &&
+        !s->async_reconnect_disable) {
         qemu_chr_socket_restart_timer(chr);
     }
 }
@@ -954,15 +957,23 @@ static int tcp_chr_connect_client_sync(Chardev *chr, Error **errp)
 {
     SocketChardev *s = SOCKET_CHARDEV(chr);
     QIOChannelSocket *sioc = qio_channel_socket_new();
+
+    s->async_reconnect_disable = true;
     tcp_chr_change_state(s, TCP_CHARDEV_STATE_CONNECTING);
     tcp_chr_set_client_ioc_name(chr, sioc);
     if (qio_channel_socket_connect_sync(sioc, s->addr, errp) < 0) {
         tcp_chr_change_state(s, TCP_CHARDEV_STATE_DISCONNECTED);
         object_unref(OBJECT(sioc));
+        s->async_reconnect_disable = false;
         return -1;
     }
     tcp_chr_new_client(chr, sioc);
     object_unref(OBJECT(sioc));
+    s->async_reconnect_disable = false;
+
+    if (s->state != TCP_CHARDEV_STATE_CONNECTED) {
+        return -1;
+    }
     return 0;
 }
 
-- 
2.26.0.windows.1


