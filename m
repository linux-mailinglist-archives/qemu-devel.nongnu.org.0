Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A84358DFD
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 22:02:41 +0200 (CEST)
Received: from localhost ([::1]:44066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUarQ-0007U1-9O
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 16:02:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lUanL-0004Dg-Of
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 15:58:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lUanJ-0000Rl-VA
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 15:58:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617911903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HgRhmUllvKBcH+CXsDN0tdx3CaXLmi88a6aEQbJyhDY=;
 b=d6qoevzqVX1oCqVsfYavrVRzg1H0pwYaq7pT+OTTUeMNgQ24JGRjfLjzvI0hxUcdY4gdkr
 9XsvrDiBns+kEMoG1+iY+fQDS87plttbgR6Gywbj4r2lDC99JdgpkjyMtTXmIg8z+8NiIZ
 l0tJHwfHLAM4lR5TTZNFMy8YHKImwIE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-v8CGXjpcNKuX6VjZIgpnNQ-1; Thu, 08 Apr 2021 15:58:22 -0400
X-MC-Unique: v8CGXjpcNKuX6VjZIgpnNQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8688C1975B84
 for <qemu-devel@nongnu.org>; Thu,  8 Apr 2021 19:12:13 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-38.ams2.redhat.com
 [10.36.115.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA4595D9E3;
 Thu,  8 Apr 2021 19:12:09 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, kraxel@redhat.com,
 eblake@redhat.com, armbru@redhat.com, pabeni@redhat.com
Subject: [RFC PATCH 1/5] channel-socket: Only set CLOEXEC if we have space for
 fds
Date: Thu,  8 Apr 2021 20:11:55 +0100
Message-Id: <20210408191159.133644-2-dgilbert@redhat.com>
In-Reply-To: <20210408191159.133644-1-dgilbert@redhat.com>
References: <20210408191159.133644-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

MSG_CMSG_CLOEXEC cleans up received fd's; it's really only for Unix
sockets, but currently we enable it for everything; some socket types
(IP_MPTCP) don't like this.

Only enable it when we're giving the recvmsg room to receive fd's
anyway.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 io/channel-socket.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/io/channel-socket.c b/io/channel-socket.c
index de259f7eed..606ec97cf7 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -487,15 +487,15 @@ static ssize_t qio_channel_socket_readv(QIOChannel *ioc,
 
     memset(control, 0, CMSG_SPACE(sizeof(int) * SOCKET_MAX_FDS));
 
-#ifdef MSG_CMSG_CLOEXEC
-    sflags |= MSG_CMSG_CLOEXEC;
-#endif
-
     msg.msg_iov = (struct iovec *)iov;
     msg.msg_iovlen = niov;
     if (fds && nfds) {
         msg.msg_control = control;
         msg.msg_controllen = sizeof(control);
+#ifdef MSG_CMSG_CLOEXEC
+        sflags |= MSG_CMSG_CLOEXEC;
+#endif
+
     }
 
  retry:
-- 
2.31.1


