Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B41F42DE3C3
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 15:14:57 +0100 (CET)
Received: from localhost ([::1]:54788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqGX2-0004Di-Qx
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 09:14:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kqGGR-0007D0-MV
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 08:57:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kqGGL-0004AJ-NO
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 08:57:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608299859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AqKlv6obtKli2f52x8wHcHHRTOMlrNYFDZAyxa/F12g=;
 b=NF4GLYl2T7qbXfrra48iFxVVxY7ZabhLkSLpiQYoVTVEUnYpbnIy5ycVmJXDD0wBj4zCn2
 NRX4EsurfWJ/tUFYvVrxexb28rqslu4xWcl4R28up52XrQOlCuecVLpRxWZKOCNoJsBa4o
 14QB1MCvEUGRtfYcmPkKghecVOEiEmU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-lQTo8xhPN8KIp7IX4J8tjA-1; Fri, 18 Dec 2020 08:57:36 -0500
X-MC-Unique: lQTo8xhPN8KIp7IX4J8tjA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0B86106F8ED
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 13:57:23 +0000 (UTC)
Received: from localhost (unknown [10.36.110.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A55F65C233;
 Fri, 18 Dec 2020 13:57:22 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] win32: make qemu_fd_register() specific to windows
Date: Fri, 18 Dec 2020 17:57:12 +0400
Message-Id: <20201218135712.674094-2-marcandre.lureau@redhat.com>
In-Reply-To: <20201218135712.674094-1-marcandre.lureau@redhat.com>
References: <20201218135712.674094-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Move the declaration of the function to a windows-specific header.

The only user left now is SLIRP, which needs special treatement since
it doesn't provide event objects itself for the socket/fds.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qemu/main-loop.h  | 2 --
 include/sysemu/os-win32.h | 2 ++
 net/slirp.c               | 2 ++
 util/main-loop.c          | 4 ----
 4 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
index d6892fd208..bf93fd691d 100644
--- a/include/qemu/main-loop.h
+++ b/include/qemu/main-loop.h
@@ -310,8 +310,6 @@ void qemu_cond_timedwait_iothread(QemuCond *cond, int ms);
 
 /* internal interfaces */
 
-void qemu_fd_register(int fd);
-
 QEMUBH *qemu_bh_new(QEMUBHFunc *cb, void *opaque);
 void qemu_bh_schedule_idle(QEMUBH *bh);
 
diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
index 5346d51e89..aa462e3ef6 100644
--- a/include/sysemu/os-win32.h
+++ b/include/sysemu/os-win32.h
@@ -117,6 +117,8 @@ static inline void qemu_funlockfile(FILE *f)
 {
 }
 
+void qemu_fd_register(int fd);
+
 /* We wrap all the sockets functions so that we can
  * set errno based on WSAGetLastError()
  */
diff --git a/net/slirp.c b/net/slirp.c
index 77042e6df7..b54c2882dc 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -196,7 +196,9 @@ static void net_slirp_timer_mod(void *timer, int64_t expire_timer,
 
 static void net_slirp_register_poll_fd(int fd, void *opaque)
 {
+#ifdef WIN32
     qemu_fd_register(fd);
+#endif
 }
 
 static void net_slirp_unregister_poll_fd(int fd, void *opaque)
diff --git a/util/main-loop.c b/util/main-loop.c
index 6470f8eae3..744b42fc54 100644
--- a/util/main-loop.c
+++ b/util/main-loop.c
@@ -179,10 +179,6 @@ static int max_priority;
 static int glib_pollfds_idx;
 static int glib_n_poll_fds;
 
-void qemu_fd_register(int fd)
-{
-}
-
 static void glib_pollfds_fill(int64_t *cur_timeout)
 {
     GMainContext *context = g_main_context_default();
-- 
2.29.0


