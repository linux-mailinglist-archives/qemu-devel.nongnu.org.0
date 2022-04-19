Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E13C950769E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 19:33:39 +0200 (CEST)
Received: from localhost ([::1]:41812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngrjN-0003Rh-37
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 13:33:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmueller@suse.de>)
 id 1ngrVv-0002tt-7w; Tue, 19 Apr 2022 13:19:44 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:46816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmueller@suse.de>)
 id 1ngrVt-0006EJ-LW; Tue, 19 Apr 2022 13:19:42 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AF2DD1F746;
 Tue, 19 Apr 2022 17:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650388778; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+WcqpviF2uafczEsbloBwil9ky/sjFJ4ViC2Q6a99rw=;
 b=MB2N/OQSBm8G0JI5wQbZ7xw1bcPvJRFt2Bjy5+x3RvmKcdV6RH/yyALyOylDL3H2HM7p2W
 ahdunl7WTn8JsKy7tNI5z+oBxvh9ko+bCBJGV5EJOZjtp/+aL8bRELczoZo12jzp9pTasG
 yGFbgSXj9Pen+8b9IbvqzxXpadG27cE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650388778;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+WcqpviF2uafczEsbloBwil9ky/sjFJ4ViC2Q6a99rw=;
 b=gAIM0bCm7bH2xGRQhXINsP1W/eoqIzIh/kqR1svmd86RUR48eHzemECyF7ZRgWBU6DOw7y
 /IoeizePdrWkO/BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 92E78139BE;
 Tue, 19 Apr 2022 17:19:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EhznIirvXmLYZgAAMHmgww
 (envelope-from <dmueller@suse.de>); Tue, 19 Apr 2022 17:19:38 +0000
From: =?UTF-8?q?Dirk=20M=C3=BCller?= <dmueller@suse.de>
To: qemu-block@nongnu.org
Subject: [PATCH] Only advertise aio=io_uring if support is actually available
Date: Tue, 19 Apr 2022 19:19:31 +0200
Message-Id: <20220419171931.26192-1-dmueller@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=dmueller@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 19 Apr 2022 13:32:04 -0400
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
Cc: eblake@redhat.com, qemu-devel@nongnu.org,
 =?UTF-8?q?Dirk=20M=C3=BCller?= <dmueller@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows $qemu --help runtime configure checks for detecting
the host support.

Signed-off-by: Dirk Müller <dmueller@suse.de>
---
 block/file-posix.c | 4 ++++
 qemu-nbd.c         | 4 ++++
 qemu-options.hx    | 6 +++++-
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 39a3d6dbe6..aec4763862 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -544,7 +544,11 @@ static QemuOptsList raw_runtime_opts = {
         {
             .name = "aio",
             .type = QEMU_OPT_STRING,
+#ifdef CONFIG_LINUX_IO_URING
             .help = "host AIO implementation (threads, native, io_uring)",
+#else
+            .help = "host AIO implementation (threads, native)",
+#endif
         },
         {
             .name = "aio-max-batch",
diff --git a/qemu-nbd.c b/qemu-nbd.c
index 713e7557a9..4634a0fc42 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -147,7 +147,11 @@ static void usage(const char *name)
 "      --cache=MODE          set cache mode used to access the disk image, the\n"
 "                            valid options are: 'none', 'writeback' (default),\n"
 "                            'writethrough', 'directsync' and 'unsafe'\n"
+#ifdef CONFIG_LINUX_IO_URING
 "      --aio=MODE            set AIO mode (native, io_uring or threads)\n"
+#else
+"      --aio=MODE            set AIO mode (native or threads)\n"
+#endif
 "      --discard=MODE        set discard mode (ignore, unmap)\n"
 "      --detect-zeroes=MODE  set detect-zeroes mode (off, on, unmap)\n"
 "      --image-opts          treat FILE as a full set of image options\n"
diff --git a/qemu-options.hx b/qemu-options.hx
index 34e9b32a5c..973125cfca 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1338,7 +1338,11 @@ DEF("drive", HAS_ARG, QEMU_OPTION_drive,
     "       [,cache=writethrough|writeback|none|directsync|unsafe][,format=f]\n"
     "       [,snapshot=on|off][,rerror=ignore|stop|report]\n"
     "       [,werror=ignore|stop|report|enospc][,id=name]\n"
-    "       [,aio=threads|native|io_uring]\n"
+    "       [,aio=threads|native"
+#if defined(CONFIG_LINUX_IO_URING)
+    "|io_uring"
+#endif
+    "]\n"
     "       [,readonly=on|off][,copy-on-read=on|off]\n"
     "       [,discard=ignore|unmap][,detect-zeroes=on|off|unmap]\n"
     "       [[,bps=b]|[[,bps_rd=r][,bps_wr=w]]]\n"
-- 
2.35.3


