Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 037A850A728
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 19:31:20 +0200 (CEST)
Received: from localhost ([::1]:42924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhaeF-0006Mz-4a
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 13:31:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmueller@suse.de>)
 id 1nha1L-0006OX-DJ; Thu, 21 Apr 2022 12:51:07 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:33248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmueller@suse.de>)
 id 1nha1C-0004zW-K2; Thu, 21 Apr 2022 12:51:05 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8256D1F388;
 Thu, 21 Apr 2022 16:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650559852; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zQEt9Lf5UPucgN/GL4lCXz3qWQLVrJ/4LDZP+cl/qNc=;
 b=qD+BycnrildN10YkzpIvoEwFpa96jPwUsi8X7WeYAUhbY+FjzD34uAAhH9YmbAUqLg2h8l
 8KDMhNl0/Ds3KOygzdzFWCTe+4+N6+wHGrabZva4ALKTADU0/iGwcefvJWtGu0fVxpNzXj
 hGJx23jqQDaa4P7R6uRW8m5mcCtwnMk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650559852;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zQEt9Lf5UPucgN/GL4lCXz3qWQLVrJ/4LDZP+cl/qNc=;
 b=sah6BnKjwd3TUEMBSpAYJXQYe6dWN8QTK9iEK9u8MmhP12CJ/3KvO7IBUAut50ZwXAi/vD
 kZLEhkid9KxqYoCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 611B013A84;
 Thu, 21 Apr 2022 16:50:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZjyqFmyLYWJvAgAAMHmgww
 (envelope-from <dmueller@suse.de>); Thu, 21 Apr 2022 16:50:52 +0000
From: =?UTF-8?q?Dirk=20M=C3=BCller?= <dmueller@suse.de>
To: qemu-block@nongnu.org
Subject: [PATCH v2] Only advertise aio=io_uring if support is actually
 available
Date: Thu, 21 Apr 2022 18:50:48 +0200
Message-Id: <20220421165048.12608-1-dmueller@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=dmueller@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eblake@redhat.com, berrange@redhat.com, qemu-devel@nongnu.org,
 =?UTF-8?q?Dirk=20M=C3=BCller?= <dmueller@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Change --help output for aio option to only list the aio backend options that
are actually available. io_uring is an optional, linux only backend
option so hide it for cases where it isn't there.

Reviewed-by: Eric Blake <eblake@redhat.com>
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


