Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CB13A17D7
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 16:49:09 +0200 (CEST)
Received: from localhost ([::1]:48418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqzW0-00021k-7R
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 10:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lqzSb-0002bY-Hv
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:45:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lqzSY-0005H9-PW
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:45:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623249934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EAdWutYFecSrmFMdsO/OYCch+zESWDMKrKbxcYyedNg=;
 b=Z0hmwF0nmBo/h13AeD7PsUdrN8K5t4qiVz2mnbsw+3bGWY1lrJqyaE5oV7BJm9VQo8hA7u
 fO4XHadrTHlZOl3Cu0FNLYgYoMuU6FNK3k5NCR/Be8OVI3B4s1OIxBUP55uW2MMj2j4TxL
 j9sBOOFSvukMJjGQh++rpTAqkRmKNyE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-7YCbl7G_OHqEbjNQqj42uw-1; Wed, 09 Jun 2021 10:45:30 -0400
X-MC-Unique: 7YCbl7G_OHqEbjNQqj42uw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A9C5C7403;
 Wed,  9 Jun 2021 14:45:29 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-113-168.ams2.redhat.com
 [10.36.113.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F17910023B5;
 Wed,  9 Jun 2021 14:45:25 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, huangy81@chinatelecom.cn, peterx@redhat.com,
 lizhijian@cn.fujitsu.com, leobras.c@gmail.com, pabeni@redhat.com
Subject: [PULL 3/9] channel-socket: Only set CLOEXEC if we have space for fds
Date: Wed,  9 Jun 2021 15:45:06 +0100
Message-Id: <20210609144512.211746-4-dgilbert@redhat.com>
In-Reply-To: <20210609144512.211746-1-dgilbert@redhat.com>
References: <20210609144512.211746-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

MSG_CMSG_CLOEXEC cleans up received fd's; it's really only for Unix
sockets, but currently we enable it for everything; some socket types
(IP_MPTCP) don't like this.

Only enable it when we're giving the recvmsg room to receive fd's
anyway.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210421112834.107651-2-dgilbert@redhat.com>
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


