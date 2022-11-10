Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D408F623BD6
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 07:29:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot10R-000211-5Q; Thu, 10 Nov 2022 01:25:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot10N-0001uP-LH
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 01:25:39 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot10M-00071M-29
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 01:25:39 -0500
Received: by mail-pf1-x42e.google.com with SMTP id m6so1064942pfb.0
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 22:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dOiLOlAfXAvpXv8rTJ4eJkIEKy86OcSDloeAyKUiv/M=;
 b=p4O24nTxoZ3CUUSHTcoAO0Xc0JFtRN2ngOvoC8pJ2mXgk9QB3Yt/2TTTrfnQJMrarD
 stODQumgHD+q1i3wWdz+iychQ3TxTqT4h0T8b0nqo/4L/TBjcl6c6fNmCNXJl51zGaRD
 3QDlaq7UfRWnH8UjtfLts9YldBsw5TzqumPHRULhZkyItw0A+Z21+yFiXXHR2jVH6o7d
 YhLwKcFydCyMBPypBBnumrUOmpoq62E3T+7QcjxCupf9+vlY2fVx2IZGl07S8GMSOF7w
 IXCHJUIjSG8+1qHjl78GBHw9pDDKwcuci2ZB1YaWMj3HmzW0GEdDFzh87BLdxw9o+IYv
 QtYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dOiLOlAfXAvpXv8rTJ4eJkIEKy86OcSDloeAyKUiv/M=;
 b=SPD/CqlazErQAzAJklCbHLQC1Xdp3PmNruZ3PzIsZC0TjOiz3w4u4hkiqp2raKvIF5
 wFQKktbBGoempVr2AlYzS7Km5lw7mLbfVvllHnd3BH0OFOOs5GajDl1gjVtY4AOvVCnU
 aauCYv1syxORf0pVEsrhIRZqsQeiA9BLiu6gUgTiU2w9OdhnQ6n7CMS1z7jfzNAM09b4
 Q30ViAxXXnlTOLJ5bRnbtxaBGorAsHYmcobiBLUYu38AW+OEptEDQL1V38lkAu1MW7dM
 IvgsqTF+GaWHL3a26SV7o+6eIWQZY2A8gYzGQp40i9f7wdARupo4SQhtbTw579OWROs6
 u+NA==
X-Gm-Message-State: ACrzQf2yRPN+SA+JV4pIArilRUL65ODbWh43hIcq4Ic3Sy5NkMH+prZO
 HPUCdmHPqvzKzp0cBUicrMogJDJZu6aKW03g
X-Google-Smtp-Source: AMsMyM6YS+n7AMhBGguKIGqx7NRKI+u60HEIlLC9rV7yMHWX96Q68/u5z5tZffEV21NwZ+dQCmiFgg==
X-Received: by 2002:a63:1765:0:b0:457:8091:1b6c with SMTP id
 37-20020a631765000000b0045780911b6cmr53368587pgx.208.1668061536831; 
 Wed, 09 Nov 2022 22:25:36 -0800 (PST)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a17090ade0400b002108cabbe31sm2289003pjv.9.2022.11.09.22.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 22:25:36 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, virtio-fs@redhat.com,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Yan Vugenfirer <yan@daynix.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 04/10] contrib/rdmacm-mux: Use qemu_get_runtime_dir()
Date: Thu, 10 Nov 2022 15:23:23 +0900
Message-Id: <20221110062329.13363-5-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221110062329.13363-1-akihiko.odaki@daynix.com>
References: <20221110062329.13363-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

qemu_get_runtime_dir() is used to construct the default Unix socket
path.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 contrib/rdmacm-mux/main.c      | 22 ++++++++++++++--------
 contrib/rdmacm-mux/meson.build |  2 +-
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/contrib/rdmacm-mux/main.c b/contrib/rdmacm-mux/main.c
index 771ca01e03..00c14031ca 100644
--- a/contrib/rdmacm-mux/main.c
+++ b/contrib/rdmacm-mux/main.c
@@ -14,6 +14,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/cutils.h"
 #include <sys/poll.h>
 #include <sys/ioctl.h>
 #include <pthread.h>
@@ -40,8 +41,6 @@
 #define CM_REQ_DGID_POS      80
 #define CM_SIDR_REQ_DGID_POS 44
 
-/* The below can be override by command line parameter */
-#define UNIX_SOCKET_PATH "/var/run/rdmacm-mux"
 /* Has format %s-%s-%d" <path>-<rdma-dev--name>-<port> */
 #define SOCKET_PATH_MAX (PATH_MAX - NAME_MAX - sizeof(int) - 2)
 #define RDMA_PORT_NUM 1
@@ -77,7 +76,13 @@ typedef struct RdmaCmServer {
 
 static RdmaCMServer server = {0};
 
-static void usage(const char *progname)
+static char *get_default_unix_socket_path(void)
+{
+    g_autofree char *run = qemu_get_runtime_dir();
+    return g_build_filename(run, "rdmacm-mux", NULL);
+}
+
+static void usage(const char *progname, const char *default_unix_socket_path)
 {
     printf("Usage: %s [OPTION]...\n"
            "Start a RDMA-CM multiplexer\n"
@@ -86,7 +91,7 @@ static void usage(const char *progname)
            "\t-d rdma-device-name   Name of RDMA device to register with\n"
            "\t-s unix-socket-path   Path to unix socket to listen on (default %s)\n"
            "\t-p rdma-device-port   Port number of RDMA device to register with (default %d)\n",
-           progname, UNIX_SOCKET_PATH, RDMA_PORT_NUM);
+           progname, default_unix_socket_path, RDMA_PORT_NUM);
 }
 
 static void help(const char *progname)
@@ -97,16 +102,16 @@ static void help(const char *progname)
 static void parse_args(int argc, char *argv[])
 {
     int c;
-    char unix_socket_path[SOCKET_PATH_MAX];
+    g_autofree char *default_unix_socket_path = get_default_unix_socket_path();
+    char *unix_socket_path = default_unix_socket_path;
 
     strcpy(server.args.rdma_dev_name, "");
-    strcpy(unix_socket_path, UNIX_SOCKET_PATH);
     server.args.rdma_port_num = RDMA_PORT_NUM;
 
     while ((c = getopt(argc, argv, "hs:d:p:")) != -1) {
         switch (c) {
         case 'h':
-            usage(argv[0]);
+            usage(argv[0], default_unix_socket_path);
             exit(0);
 
         case 'd':
@@ -115,7 +120,7 @@ static void parse_args(int argc, char *argv[])
 
         case 's':
             /* This is temporary, final name will build below */
-            strncpy(unix_socket_path, optarg, SOCKET_PATH_MAX - 1);
+            unix_socket_path = optarg;
             break;
 
         case 'p':
@@ -811,6 +816,7 @@ int main(int argc, char *argv[])
 {
     int rc;
 
+    qemu_init_exec_dir(argv[0]);
     memset(&server, 0, sizeof(server));
 
     parse_args(argc, argv);
diff --git a/contrib/rdmacm-mux/meson.build b/contrib/rdmacm-mux/meson.build
index 36c9c89630..59f60f9cac 100644
--- a/contrib/rdmacm-mux/meson.build
+++ b/contrib/rdmacm-mux/meson.build
@@ -1,7 +1,7 @@
 if have_pvrdma
   # FIXME: broken on big endian architectures
   executable('rdmacm-mux', files('main.c'), genh,
-             dependencies: [glib, libumad],
+             dependencies: [glib, libumad, qemuutil],
              build_by_default: false,
              install: false)
 endif
-- 
2.38.1


