Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC6644E1A2
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 06:43:27 +0100 (CET)
Received: from localhost ([::1]:48546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlPLS-0000hO-S1
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 00:43:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mlPHc-00069T-NK
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 00:39:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mlPHX-0005OL-Cx
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 00:39:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636695562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bjrh0f64PpUFOitgFXl5DU47FbzO9rtRnmHn46eI6S8=;
 b=NCD4wOq4FFTdSYgoCIFWEkFEsV0Dv1LIa9BF7CY8ikH0isD+xrIy4FNw3oIdc+BQ62rh2q
 sN98pVqZ36O2RsT1kSQL31nTFbfAslRxZ2Ywkeo4I9Aoar91ypf0tJEdr/zpl0kCymeKqH
 k8nu2nKor43Zj9Pe016w9hy9RUTyLfA=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-bz-Hu6XrOG6MnI7cgiKLIQ-1; Fri, 12 Nov 2021 00:39:21 -0500
X-MC-Unique: bz-Hu6XrOG6MnI7cgiKLIQ-1
Received: by mail-vk1-f199.google.com with SMTP id
 y15-20020a1f7d0f000000b002f244d4c479so3843761vkc.9
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 21:39:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bjrh0f64PpUFOitgFXl5DU47FbzO9rtRnmHn46eI6S8=;
 b=NOKjTPYSmD90FaVovjcyNGVLFRby1OVRe71o3fAVydtiS5gzywyMLqSHqCjxqDmR74
 mprKqvAW5NpSakwdCC8jHpMZFrNq+/WzK6UvXN1QkW8kO8/o2dpC3E88FGigXXv/HJvq
 fnLkhZRvoLwHQtYnvTgGgWZ6OCmbku6bUvX86Qqsdpc6lx0YElouy81mbxq+yHlsSqDD
 qwcdJLqETIfcLdg50cbC/HF11CVboaJpnCha8VCENJdCam476pIdbJ3DqlCGXLPR2/dD
 UYFV6ViNl0A9jvMhGHH0PWYP1GpiLHAa+mcBxQiKJUJHawfOF0Lb/LCC7U1Zp+x5RSaY
 p3sA==
X-Gm-Message-State: AOAM533ZGUKW9sOS5UGNpe1fi2/pnA2JZQDCfKzBNS+A5hCnMRXYAJ66
 frY5g6ywFJ1fqt3r7NK3rKbdzIYc4t3uGBGCggm8NMLArTWJ2FlvWrwLw2mYL3eglBy1pmVmw+0
 kdw/iv3NatYaJa3w=
X-Received: by 2002:ab0:35cd:: with SMTP id x13mr12718305uat.46.1636695560879; 
 Thu, 11 Nov 2021 21:39:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx87JJEKafitmpodLYDyDNm1IO66kUATrg8sRtsSDKch3tKyOdtwYznZCQ846VyV493eP+s+A==
X-Received: by 2002:ab0:35cd:: with SMTP id x13mr12718272uat.46.1636695560699; 
 Thu, 11 Nov 2021 21:39:20 -0800 (PST)
Received: from LeoBras.redhat.com ([2804:431:c7f0:7e14:3b94:fb27:f0ad:a824])
 by smtp.gmail.com with ESMTPSA id r2sm1465280vsk.28.2021.11.11.21.39.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 21:39:20 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v5 2/6] QIOChannelSocket: Add flags parameter for writing
Date: Fri, 12 Nov 2021 02:10:37 -0300
Message-Id: <20211112051040.923746-3-leobras@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112051040.923746-1-leobras@redhat.com>
References: <20211112051040.923746-1-leobras@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=leobras@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Change qio_channel_socket_writev() in order to accept flags, so its possible
to selectively make use of sendmsg() flags.

qio_channel_socket_writev() contents were moved to a helper function
qio_channel_socket_writev_flags() which accepts an extra argument for flags.
(This argument is passed directly to sendmsg().

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 io/channel-socket.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/io/channel-socket.c b/io/channel-socket.c
index 606ec97cf7..b57a27bf91 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -520,12 +520,13 @@ static ssize_t qio_channel_socket_readv(QIOChannel *ioc,
     return ret;
 }
 
-static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
-                                         const struct iovec *iov,
-                                         size_t niov,
-                                         int *fds,
-                                         size_t nfds,
-                                         Error **errp)
+static ssize_t qio_channel_socket_writev_flags(QIOChannel *ioc,
+                                               const struct iovec *iov,
+                                               size_t niov,
+                                               int *fds,
+                                               size_t nfds,
+                                               int flags,
+                                               Error **errp)
 {
     QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
     ssize_t ret;
@@ -558,7 +559,7 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
     }
 
  retry:
-    ret = sendmsg(sioc->fd, &msg, 0);
+    ret = sendmsg(sioc->fd, &msg, flags);
     if (ret <= 0) {
         if (errno == EAGAIN) {
             return QIO_CHANNEL_ERR_BLOCK;
@@ -572,6 +573,17 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
     }
     return ret;
 }
+
+static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
+                                         const struct iovec *iov,
+                                         size_t niov,
+                                         int *fds,
+                                         size_t nfds,
+                                         Error **errp)
+{
+    return qio_channel_socket_writev_flags(ioc, iov, niov, fds, nfds, 0, errp);
+}
+
 #else /* WIN32 */
 static ssize_t qio_channel_socket_readv(QIOChannel *ioc,
                                         const struct iovec *iov,
-- 
2.33.1


