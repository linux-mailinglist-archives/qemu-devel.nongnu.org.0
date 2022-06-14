Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A3C54AF52
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 13:30:29 +0200 (CEST)
Received: from localhost ([::1]:58942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o14ke-0007HK-5k
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 07:30:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arbn@yandex-team.com>)
 id 1o14hq-0004UC-Ni
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 07:27:35 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:58412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arbn@yandex-team.com>)
 id 1o14hm-0004QD-1A
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 07:27:31 -0400
Received: from myt5-4c5921969858.qloud-c.yandex.net
 (myt5-4c5921969858.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3b1a:0:640:4c59:2196])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 99E412E0F79;
 Tue, 14 Jun 2022 14:18:12 +0300 (MSK)
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net [2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by myt5-4c5921969858.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 dzp2u22e61-IBJCGU7Y; Tue, 14 Jun 2022 14:18:12 +0300
X-Yandex-Fwd: 2
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.com;
 s=default; 
 t=1655205492; bh=lVyPOTP/ffkTfXHFBEs6gknVQySoZXVbLNXlA7SyL1w=;
 h=Message-Id:References:Date:Subject:In-Reply-To:Cc:To:From;
 b=nsjqKLSe8Ssd/Xg4lq1287s9x3CxrcAxJw+/ecWOFScJI+Os2gMwQ8Q4d8FmA+i/k
 Ec5RRKwOCtvurCGUwZq+94ngl/hLMC37hPUPfpQkCVKF2ImxYVxbvsTJ1nQNuSPHUQ
 yIF75hggJa8sMYLW5x6IQFn4yxSEqGEnjAWsGUXM=
Authentication-Results: myt5-4c5921969858.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.com
Received: from dellarbn.yandex.net (unknown [2a02:6b8:b081:32::1:13])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 ctCbEGGKR4-I6MaKc7I; Tue, 14 Jun 2022 14:18:11 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Andrey Ryabinin <arbn@yandex-team.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, yc-core@yandex-team.ru,
 Andrey Ryabinin <arbn@yandex-team.com>
Subject: [PATCH 1/2] chardev: don't set O_NONBLOCK on SCM_RIGHTS file
 descriptors.
Date: Tue, 14 Jun 2022 14:18:42 +0300
Message-Id: <20220614111843.24960-2-arbn@yandex-team.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220614111843.24960-1-arbn@yandex-team.com>
References: <20220614111843.24960-1-arbn@yandex-team.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=95.108.205.193; envelope-from=arbn@yandex-team.com;
 helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

This reverts commit 9b938c7262e4 ("chardev: clear O_NONBLOCK on SCM_RIGHTS file descriptors").
File descriptor passed to QEMU via 'getfd' QMP command always
changed to blocking mode. Instead of that, change blocking mode by QEMU
file descriptors users when necessary, e.g. like migration.

We need to preserve the state of the file descriptor in case it's still
used by an external process and before the QEMU itself started
using it.

E.g. our local migration scenario with TAP networking looks like this:
 1. Create TAP devices and pass file descriptors to source QEMU
 2. Launch destination QEMU (-incoming defer) and pass same descriptors to it.
 3. Start migration

In such scenario setting blocking state at stage (2) will hang source QEMU
since TAP fd suddenly become blocking.

Signed-off-by: Andrey Ryabinin <arbn@yandex-team.com>
---
 chardev/char-socket.c | 3 ---
 io/channel-socket.c   | 3 ---
 migration/fd.c        | 2 ++
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index dc4e218eeb6..c9592fb5836 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -310,9 +310,6 @@ static ssize_t tcp_chr_recv(Chardev *chr, char *buf, size_t len)
             continue;
         }
 
-        /* O_NONBLOCK is preserved across SCM_RIGHTS so reset it */
-        qemu_socket_set_block(fd);
-
 #ifndef MSG_CMSG_CLOEXEC
         qemu_set_cloexec(fd);
 #endif
diff --git a/io/channel-socket.c b/io/channel-socket.c
index dc9c165de11..8b9679460dc 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -479,9 +479,6 @@ static void qio_channel_socket_copy_fds(struct msghdr *msg,
                 continue;
             }
 
-            /* O_NONBLOCK is preserved across SCM_RIGHTS so reset it */
-            qemu_socket_set_block(fd);
-
 #ifndef MSG_CMSG_CLOEXEC
             qemu_set_cloexec(fd);
 #endif
diff --git a/migration/fd.c b/migration/fd.c
index 6f2f50475f4..793fffeb169 100644
--- a/migration/fd.c
+++ b/migration/fd.c
@@ -60,6 +60,8 @@ void fd_start_incoming_migration(const char *fdname, Error **errp)
         return;
     }
 
+    qemu_socket_set_block(fd);
+
     trace_migration_fd_incoming(fd);
 
     ioc = qio_channel_new_fd(fd, errp);
-- 
2.35.1


