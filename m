Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EAF623F84
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 11:10:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot4Sp-00033Y-NP; Thu, 10 Nov 2022 05:07:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot4SR-0002uT-FQ
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 05:06:51 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot4SP-0006Tx-Ki
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 05:06:50 -0500
Received: by mail-pj1-x1035.google.com with SMTP id h14so1167374pjv.4
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 02:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=imXo2IRrILpkxUDOjeir+V07IKls1TLJKB9c8zb1QFc=;
 b=E1eH7mWxHxGtrAi+1MZK3g1NO4ryWeGfM6vWfMWFL+lnclWVy9kzheOHbv7btPtHVJ
 orfS8OJ9GTqNF9VJswuGFpYebB1KXmdOKVdz4RETBKGQO6XIbP9vAUyN2tGT2e93vPqO
 UoliTi1DUwqTZFGWYxLvZnWGY079P2MIxrO8ktv8qGuR7Te/eTRuY71Q8cgw3GApQ4pa
 1BFFmqawK6q7hPmCLK3XwW4E1ltPdD4mL/CIFa3Z7cNOwBlH35zP1OK5H5AACYcmXU3b
 0oCK5NeDjhZRhWKAbrwIbqa+6cHeH3NaDfk6B+DWqIwPlflpNGzZ/u1+Q9Mzjj4w2EAR
 MYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=imXo2IRrILpkxUDOjeir+V07IKls1TLJKB9c8zb1QFc=;
 b=BOnZ5VPtOpS2qM+MTaj8BfE014Moua2xd4OqHRU0DZlBZubocRgHGAg1BJye7UER5d
 JNkEVzS2DkldV6QPXbHNV4svsTEjiPD9XuLiok6hDjSPqvP8dsBjeHZm6R/ndmRkHtlP
 82q2bDjQF66Z/PHGlQZUSvqzxJgDupL7I69/PhNjpZtOTuLIY9qGwK1MPmqYXK9SkpB0
 2VPCYoeY9XqGa84uAe7IrVkgVBJH7sq06eC+J+KkRsd7LJQon6lWmC1ZIIDZUIrXT6bq
 qV2RaUVRuUhhbTmfnFacNAz0P7outcd2EUVf4PEuCAE95m+JlqK+0dhqqk+j3yJXPhSd
 tKmw==
X-Gm-Message-State: ACrzQf2I7TmTEw9Cd/PzN6o5ts1yoNfjuyFaj817gXoaHb8g9UnSYLXZ
 ifhmhQfOfpOOzGzuz2kEyZCArfqxWeoJYNZi
X-Google-Smtp-Source: AMsMyM6b8+nO/lNb+MDQrUo1CQYcZsxEQPMP81P5QnjmevF2XfIM2KvlKByg5LA2r8trtdjHJu8H7g==
X-Received: by 2002:a17:90b:3ec2:b0:215:db2e:b23d with SMTP id
 rm2-20020a17090b3ec200b00215db2eb23dmr40132374pjb.187.1668074807148; 
 Thu, 10 Nov 2022 02:06:47 -0800 (PST)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a1709027e4900b001714e7608fdsm10730780pln.256.2022.11.10.02.06.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 02:06:46 -0800 (PST)
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
Subject: [PATCH v2 03/10] ivshmem-server: Use qemu_get_runtime_dir()
Date: Thu, 10 Nov 2022 19:06:22 +0900
Message-Id: <20221110100629.61496-4-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221110100629.61496-1-akihiko.odaki@daynix.com>
References: <20221110100629.61496-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1035;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1035.google.com
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

qemu_get_runtime_dir() is used to construct the default PID file path.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 contrib/ivshmem-server/main.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/contrib/ivshmem-server/main.c b/contrib/ivshmem-server/main.c
index 224dbeb547..16abbe2f5a 100644
--- a/contrib/ivshmem-server/main.c
+++ b/contrib/ivshmem-server/main.c
@@ -14,7 +14,6 @@
 
 #define IVSHMEM_SERVER_DEFAULT_VERBOSE        0
 #define IVSHMEM_SERVER_DEFAULT_FOREGROUND     0
-#define IVSHMEM_SERVER_DEFAULT_PID_FILE       "/var/run/ivshmem-server.pid"
 #define IVSHMEM_SERVER_DEFAULT_UNIX_SOCK_PATH "/tmp/ivshmem_socket"
 #define IVSHMEM_SERVER_DEFAULT_SHM_PATH       "ivshmem"
 #define IVSHMEM_SERVER_DEFAULT_SHM_SIZE       (4 * 1024 * 1024)
@@ -35,15 +34,23 @@ typedef struct IvshmemServerArgs {
     unsigned n_vectors;
 } IvshmemServerArgs;
 
+static char *ivshmem_server_get_default_pid_file(void)
+{
+    g_autofree char *run = qemu_get_runtime_dir();
+    return g_build_filename(run, "ivshmem-server.pid", NULL);
+}
+
 static void
 ivshmem_server_usage(const char *progname)
 {
+    g_autofree char *pid_file = ivshmem_server_get_default_pid_file();
+
     printf("Usage: %s [OPTION]...\n"
            "  -h: show this help\n"
            "  -v: verbose mode\n"
            "  -F: foreground mode (default is to daemonize)\n"
            "  -p <pid-file>: path to the PID file (used in daemon mode only)\n"
-           "     default " IVSHMEM_SERVER_DEFAULT_PID_FILE "\n"
+           "     default %s\n"
            "  -S <unix-socket-path>: path to the unix socket to listen to\n"
            "     default " IVSHMEM_SERVER_DEFAULT_UNIX_SOCK_PATH "\n"
            "  -M <shm-name>: POSIX shared memory object to use\n"
@@ -54,7 +61,7 @@ ivshmem_server_usage(const char *progname)
            "     default %u\n"
            "  -n <nvectors>: number of vectors\n"
            "     default %u\n",
-           progname, IVSHMEM_SERVER_DEFAULT_SHM_SIZE,
+           progname, pid_file, IVSHMEM_SERVER_DEFAULT_SHM_SIZE,
            IVSHMEM_SERVER_DEFAULT_N_VECTORS);
 }
 
@@ -189,10 +196,10 @@ main(int argc, char *argv[])
 {
     IvshmemServer server;
     struct sigaction sa, sa_quit;
+    g_autofree char *default_pid_file = NULL;
     IvshmemServerArgs args = {
         .verbose = IVSHMEM_SERVER_DEFAULT_VERBOSE,
         .foreground = IVSHMEM_SERVER_DEFAULT_FOREGROUND,
-        .pid_file = IVSHMEM_SERVER_DEFAULT_PID_FILE,
         .unix_socket_path = IVSHMEM_SERVER_DEFAULT_UNIX_SOCK_PATH,
         .shm_path = IVSHMEM_SERVER_DEFAULT_SHM_PATH,
         .use_shm_open = true,
@@ -207,6 +214,11 @@ main(int argc, char *argv[])
      */
     printf("*** Example code, do not use in production ***\n");
 
+    qemu_init_exec_dir(argv[0]);
+
+    default_pid_file = ivshmem_server_get_default_pid_file();
+    args.pid_file = default_pid_file;
+
     /* parse arguments, will exit on error */
     ivshmem_server_parse_args(&args, argc, argv);
 
-- 
2.38.1


