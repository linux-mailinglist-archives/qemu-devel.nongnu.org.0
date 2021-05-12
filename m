Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C62B37C595
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 17:40:51 +0200 (CEST)
Received: from localhost ([::1]:52246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgqyg-0003Wr-Iq
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 11:40:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgqv2-0006Q1-FY
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:37:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgqv0-0003Zp-L7
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:37:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620833822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1n3KODK3Ybt7IqzNcGCAD2DSDPe/IpshwjtaaPsS4XY=;
 b=YdUTUK2ezH3gAFuvF4tNmhfVqGwp7gWBtB5jF5PNSEaesn0Ci76Wqx+ZsBe8vW9X+h4v/p
 UrNqgdmnaSQyKsBskRXbtXSxc47kfTJkAxMDsTdJlro86Jmij6u8D+yZPULxKxyiqsosQo
 tzM0LctaU9IjKHRVpA8zIst755gA3tw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-mburayS6Mja7J-1V5CqRew-1; Wed, 12 May 2021 11:37:00 -0400
X-MC-Unique: mburayS6Mja7J-1V5CqRew-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9B6B189C44A
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 15:36:59 +0000 (UTC)
Received: from localhost.redhat.com (ovpn-114-167.ams2.redhat.com
 [10.36.114.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 492CB6EF48;
 Wed, 12 May 2021 15:36:58 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] net/tap: fix error reporting when bridge helper
 forgets to send an FD
Date: Wed, 12 May 2021 16:36:54 +0100
Message-Id: <20210512153654.1178035-3-berrange@redhat.com>
In-Reply-To: <20210512153654.1178035-1-berrange@redhat.com>
References: <20210512153654.1178035-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 net/tap.c | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/net/tap.c b/net/tap.c
index 276a9077fc..92761546b7 100644
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
@@ -589,6 +592,17 @@ static int net_bridge_run_helper(const char *helper, const char *bridge,
             error_setg(errp, "bridge helper failed");
             return -1;
         }
+
+        /*
+         * ret == 0 means EOF, and if status == 0 then helper
+         * exited cleanly but forgot to send us an FD. Oops...
+         */
+        if (ret == 0) {
+            error_setg(errp,
+                       "bridge helper '%s' did not send a file descriptor",
+                       helper);
+            return -1;
+        }
         return fd;
     }
 }
-- 
2.31.1


