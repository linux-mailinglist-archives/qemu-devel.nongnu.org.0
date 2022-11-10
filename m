Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 188B8623F7E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 11:08:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot4St-000378-0K; Thu, 10 Nov 2022 05:07:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot4SV-0002vR-6K
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 05:06:55 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot4ST-0006Ua-Fr
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 05:06:54 -0500
Received: by mail-pf1-x430.google.com with SMTP id g62so1519313pfb.10
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 02:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dOiLOlAfXAvpXv8rTJ4eJkIEKy86OcSDloeAyKUiv/M=;
 b=qTJRLTkHpKkZGuXif/Gqxuva0enYUvkIRnxWDdf/c/GWti7/xcH7ZQaSQRtk/cJ6y0
 4WjLmalR7AUJRoFkAazSCuYQUMpEv298dVgLNowKIXGWmNaX2G8W5r1z5t63MMjIvvsJ
 xF+Of+G9VN8f2sdd+BB0e8VPC7sUvPF0v/Zyr/OjjGmZuI1CsaMxQIb88TQcUDJD7nu8
 enpPgyJd7rA2xDRCIOsLhA1miMsLP0uLugu0PEsx3FYZ0TQM2sSBgEL4tAMaOKUmCrOM
 7MyMwHuGaIRtq8l5qBYENIlvgSYMbR7+NV6d8+kflYbg3M6gXYKqwFeQvdxf6IJWmK2I
 kDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dOiLOlAfXAvpXv8rTJ4eJkIEKy86OcSDloeAyKUiv/M=;
 b=1HtXw/istzZO3fcT+h34YMlDz3yLpCrLVXTRh8nZtJtmQQnRIfiaZoSXy5cmiB0Mok
 uRrtXjFhQhgDelAu1bD6GKf04gRTVzBUiVb3uWANTmAym/JAvT7D8jkD2WSg6RaZHDzV
 Ygj/KIkNtCEKSORrZdCPNzlE44DxFhaOaSu+26z1FbltXO6LaWfH6QiKk619qBHAjR3V
 dRJNqEQtQdu5Apsiv2ZzSXzYLfr2CU1ZOSvuiKSnt6XwOlVbSNiBEUCT22zFHUQpb3Ia
 VQO553VmsAODyNRcffk0wmhOmjO1Vruc6S4P9KmmNvwfHjBuPP7bkPXs3YyEKeBNqdN6
 PMlg==
X-Gm-Message-State: ACrzQf1e9F055w2ervDc+4uZ3SP2OtG0qIOWVZm+eoOd1y+kVI8ayMCq
 r5ufWFiBZoj5gDD4Hpz2gI4UNLe0rAgL+Vrx
X-Google-Smtp-Source: AMsMyM7ifZ2ni8hXBhmAqF4AllqhOXtTdBvxyJ3U4/RfwZA4ZTaESRvyDU0Kyv0eCIY4/iz4WbORrA==
X-Received: by 2002:a63:cf11:0:b0:44a:2a6a:bb90 with SMTP id
 j17-20020a63cf11000000b0044a2a6abb90mr2240798pgg.314.1668074810612; 
 Thu, 10 Nov 2022 02:06:50 -0800 (PST)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a1709027e4900b001714e7608fdsm10730780pln.256.2022.11.10.02.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 02:06:50 -0800 (PST)
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
Subject: [PATCH v2 04/10] contrib/rdmacm-mux: Use qemu_get_runtime_dir()
Date: Thu, 10 Nov 2022 19:06:23 +0900
Message-Id: <20221110100629.61496-5-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221110100629.61496-1-akihiko.odaki@daynix.com>
References: <20221110100629.61496-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::430;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x430.google.com
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


