Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D9E2B39F4
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 23:42:33 +0100 (CET)
Received: from localhost ([::1]:57858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keQj2-0004rk-Qz
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 17:42:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1keQUw-0000Tb-Ph
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 17:27:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1keQUu-0001ZS-ES
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 17:27:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605479267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G6ydD8nywIYgDA5NaMvjnA+TxKcYXavN/x/Q6gxOBVg=;
 b=OBArtDCuP5T+rhcy2hu5aMRH3cG811mD94i3QWSfh9YwoUK1zCUAPd6JJSnPMaABqtPgQ/
 vicU4vOipbR5QOejukR6yNXakjaYLLWL5lbUFRFs1dxjhb2hVDWZI/+nL5Yi5J7iINLHZW
 NyZGt6cx95GMcXqB+5dIrbSHgsiafEw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-bGWS2gEDP9KvQJRCWttEMA-1; Sun, 15 Nov 2020 17:27:45 -0500
X-MC-Unique: bGWS2gEDP9KvQJRCWttEMA-1
Received: by mail-wm1-f70.google.com with SMTP id h9so7810298wmf.8
 for <qemu-devel@nongnu.org>; Sun, 15 Nov 2020 14:27:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=G6ydD8nywIYgDA5NaMvjnA+TxKcYXavN/x/Q6gxOBVg=;
 b=c7oQN7ng6WVux/qdybZUgm5VbKZE52wnNBWcMxb2oTdN0NQWcFeNwrgF1uSNZ0qB35
 NXvZZ8c6/J30MyjEtwXNgrOk7QRoHILGKdDlN0zxaNBToLU5NaJju+4vPvQMyFLTXhZD
 n0IQQLdzOY3YHOYNW3FiO0s2lt5U4c09cagDYy7z31T5uiPqdZZ4IngLf7q/szFgmN9i
 3BKiwO4L5zE4W1jPQ885ULJFgrP0N6CSnQ9saCQZ/ptgPtpYymbuxWqh2qEpQ4ajKS7z
 5zsn3yBllf3M6I8Bqrp47hw2P/toICBcZwojAfXrhFQub7P9xZouM3orJ/laZJjaP0uj
 Hi4A==
X-Gm-Message-State: AOAM531fJkH83LuTo2dykhCHoUb/aJCEnivfymZg/gUW/GF7Afoi2uRP
 pxd83+uZPZB+sewJq9wCT6CF6slzYArujI+TBiS1IeXOkkOgnG7GQYvhFAOYg3kvjIoofgW2LLk
 dIjUVvEAhbvZHSfOGb2tG7TSeK8/6FurfbyRMbIdLvKdXEeDboUxQWeZjP+Pz
X-Received: by 2002:a5d:4f12:: with SMTP id c18mr16007724wru.304.1605479264570; 
 Sun, 15 Nov 2020 14:27:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwS3CE1e8KxIsnbH1qUfcogx8I+53eDx83qrPFJKSUlb918vML+74YNmn9LOcL3uINcY8JY/g==
X-Received: by 2002:a5d:4f12:: with SMTP id c18mr16007712wru.304.1605479264413; 
 Sun, 15 Nov 2020 14:27:44 -0800 (PST)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id j4sm19713228wrn.83.2020.11.15.14.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 14:27:43 -0800 (PST)
Date: Sun, 15 Nov 2020 17:27:42 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/17] vhost-user-blk-test: fix races by using fd passing
Message-ID: <20201115220740.488850-13-mst@redhat.com>
References: <20201115220740.488850-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201115220740.488850-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 16:39:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Pass the QMP and vhost-user-blk server sockets as file descriptors. That
way the sockets are already open and in a listen state when the QEMU
process is launched.

This solves the race with qemu-storage-daemon startup where the UNIX
domain sockets may not be ready yet when QEMU attempts to connect. It
also saves us sleeping for 1 second if the qemu-storage-daemon QMP
socket is not ready yet.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20201111124331.1393747-8-stefanha@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/vhost-user-blk-test.c | 42 +++++++++++++++++++------------
 1 file changed, 26 insertions(+), 16 deletions(-)

diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk-test.c
index c5ff610d7a..e52340cffb 100644
--- a/tests/qtest/vhost-user-blk-test.c
+++ b/tests/qtest/vhost-user-blk-test.c
@@ -683,8 +683,22 @@ static char *drive_create(void)
     return t_path;
 }
 
-static char sock_path_tempate[] = "/tmp/qtest.vhost_user_blk.XXXXXX";
-static char qmp_sock_path_tempate[] = "/tmp/qtest.vhost_user_blk.qmp.XXXXXX";
+static char *create_listen_socket(int *fd)
+{
+    int tmp_fd;
+    char *path;
+
+    /* No race because our pid makes the path unique */
+    path = g_strdup_printf("/tmp/qtest-%d-sock.XXXXXX", getpid());
+    tmp_fd = mkstemp(path);
+    g_assert_cmpint(tmp_fd, >=, 0);
+    close(tmp_fd);
+    unlink(path);
+
+    *fd = qtest_socket_server(path);
+    g_test_queue_destroy(destroy_file, path);
+    return path;
+}
 
 static void quit_storage_daemon(void *qmp_test_state)
 {
@@ -709,37 +723,33 @@ static void start_vhost_user_blk(GString *cmd_line, int vus_instances,
                                  int num_queues)
 {
     const char *vhost_user_blk_bin = qtest_qemu_storage_daemon_binary();
-    int fd, qmp_fd, i;
+    int qmp_fd, i;
     QTestState *qmp_test_state;
     gchar *img_path;
-    char *sock_path = NULL;
-    char *qmp_sock_path = g_strdup(qmp_sock_path_tempate);
+    char *qmp_sock_path;
     GString *storage_daemon_command = g_string_new(NULL);
 
-    qmp_fd = mkstemp(qmp_sock_path);
-    g_assert_cmpint(qmp_fd, >=, 0);
-    g_test_queue_destroy(destroy_file, qmp_sock_path);
+    qmp_sock_path = create_listen_socket(&qmp_fd);
 
     g_string_append_printf(storage_daemon_command,
             "exec %s "
-            "--chardev socket,id=qmp,path=%s,server,nowait --monitor chardev=qmp ",
-            vhost_user_blk_bin, qmp_sock_path);
+            "--chardev socket,id=qmp,fd=%d,server,nowait --monitor chardev=qmp ",
+            vhost_user_blk_bin, qmp_fd);
 
     g_string_append_printf(cmd_line,
             " -object memory-backend-memfd,id=mem,size=256M,share=on -M memory-backend=mem ");
 
     for (i = 0; i < vus_instances; i++) {
-        sock_path = g_strdup(sock_path_tempate);
-        fd = mkstemp(sock_path);
-        g_assert_cmpint(fd, >=, 0);
-        g_test_queue_destroy(drive_file, sock_path);
+        int fd;
+        char *sock_path = create_listen_socket(&fd);
+
         /* create image file */
         img_path = drive_create();
         g_string_append_printf(storage_daemon_command,
             "--blockdev driver=file,node-name=disk%d,filename=%s "
-            "--export type=vhost-user-blk,id=disk%d,addr.type=unix,addr.path=%s,"
+            "--export type=vhost-user-blk,id=disk%d,addr.type=fd,addr.str=%d,"
             "node-name=disk%i,writable=on,num-queues=%d ",
-            i, img_path, i, sock_path, i, num_queues);
+            i, img_path, i, fd, i, num_queues);
 
         g_string_append_printf(cmd_line, "-chardev socket,id=char%d,path=%s ",
                                i + 1, sock_path);
-- 
MST


