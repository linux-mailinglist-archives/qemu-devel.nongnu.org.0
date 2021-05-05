Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D28CA373B01
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 14:20:40 +0200 (CEST)
Received: from localhost ([::1]:44926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leGW7-0000b6-Rj
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 08:20:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1leGOY-0004n2-5s
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:12:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1leGOT-0003eq-Kz
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:12:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620216764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GoWRAWw0AEhd8kSh1vKY8L/LJxyFsorXbJJD45+U+IE=;
 b=VYYTfZ73qAZVoNkSVxKONyCfcuzFcmPq4EgUAuQoG2scTvKKJulHEbGJL/VeRQSz/Fj+mB
 iPdzUQ4GROMYK9djD3EO9vu6WIZg4FrhPgI2pdxNsp3SnZFciLYlpslDXM8oRzWBzk0pSI
 +7R05GonQ4EfPmRrXbqTgGXfRKrCwy4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-hGW_VI7-OwiH9Wynn7BRbA-1; Wed, 05 May 2021 08:12:42 -0400
X-MC-Unique: hGW_VI7-OwiH9Wynn7BRbA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33E17108BC56
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 12:12:41 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-253.ams2.redhat.com
 [10.36.114.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 18669620DE;
 Wed,  5 May 2021 12:12:39 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] net/tap: fix error reporting when bridge helper forgets
 to send an FD
Date: Wed,  5 May 2021 13:12:36 +0100
Message-Id: <20210505121236.532755-3-berrange@redhat.com>
In-Reply-To: <20210505121236.532755-1-berrange@redhat.com>
References: <20210505121236.532755-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The recv_fd() method returns -1 on error, 0 on end of file, or an FD
number on success.

Technically 0 is also a valid FD number, so the return value is
ambiguous.

The caller doesn't even consider the possibility of 0 meaning end
of file, so just blindly assume it is a valid FD.

IOW if the bridge helper exits with 0 status code and forgets to
send an FD, QEMU will accidentally try to use STDIN as a TAP FD.

Fortunately we get an error shortly thereafter

 $ qemu-system-x86_64 -netdev bridge,br=br99,helper=/bin/true,id=ns0
 qemu-system-x86_64: -netdev bridge,br=br99,helper=/bin/true,id=ns0:
   Unable to query TUNGETIFF on FD 0: Inappropriate ioctl for device

It is better if we correctly diagnose this broken bridge helper
though. To do this we need to return the FD in an output parameter
to remove the ambiguity and then fix the caller to check for the
end of file condition. With this done we now get

  $ qemu-system-x86_64 -netdev bridge,br=br99,helper=/bin/true,id=ns0
  qemu-system-x86_64: -netdev bridge,br=br99,helper=/bin/true,id=ns0:
    bridge helper did not send a file descriptor

Fixes: https://gitlab.com/qemu-project/qemu/-/issues/166
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 net/tap.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/net/tap.c b/net/tap.c
index 276a9077fc..02046c9fd2 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -450,9 +450,11 @@ static void launch_script(const char *setup_script, const char *ifname,
     }
 }
 
-static int recv_fd(int c)
+/*
+ * Returns: -1 on error, 0 on end of file, 1 if an FD was received
+ */
+static int recv_fd(int c, int *fd)
 {
-    int fd;
     uint8_t msgbuf[CMSG_SPACE(sizeof(fd))];
     struct msghdr msg = {
         .msg_control = msgbuf,
@@ -476,12 +478,12 @@ static int recv_fd(int c)
     msg.msg_iovlen = 1;
 
     len = recvmsg(c, &msg, 0);
-    if (len > 0) {
-        memcpy(&fd, CMSG_DATA(cmsg), sizeof(fd));
-        return fd;
+    if (len <= 0) {
+        return len;
     }
 
-    return len;
+    memcpy(fd, CMSG_DATA(cmsg), sizeof(*fd));
+    return 1;
 }
 
 static int net_bridge_run_helper(const char *helper, const char *bridge,
@@ -564,14 +566,15 @@ static int net_bridge_run_helper(const char *helper, const char *bridge,
         _exit(1);
 
     } else {
-        int fd;
+        int ret;
+        int fd = -1;
         int saved_errno;
 
         close(sv[1]);
 
         do {
-            fd = recv_fd(sv[0]);
-        } while (fd == -1 && errno == EINTR);
+            ret = recv_fd(sv[0], &fd);
+        } while (ret == -1 && errno == EINTR);
         saved_errno = errno;
 
         close(sv[0]);
@@ -580,7 +583,7 @@ static int net_bridge_run_helper(const char *helper, const char *bridge,
             /* loop */
         }
         sigprocmask(SIG_SETMASK, &oldmask, NULL);
-        if (fd < 0) {
+        if (ret < 0) {
             error_setg_errno(errp, saved_errno,
                              "failed to recv file descriptor");
             return -1;
@@ -589,6 +592,15 @@ static int net_bridge_run_helper(const char *helper, const char *bridge,
             error_setg(errp, "bridge helper failed");
             return -1;
         }
+
+        /*
+         * ret == 0 means EOF, and if status == 0 then helper
+         * exited cleanly but forgot to send us an FD. Opps...
+         */
+        if (ret == 0) {
+            error_setg(errp, "bridge helper did not send a file descriptor");
+            return -1;
+        }
         return fd;
     }
 }
-- 
2.31.1


