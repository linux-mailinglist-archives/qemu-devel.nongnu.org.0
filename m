Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0793669EF
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 13:31:55 +0200 (CEST)
Received: from localhost ([::1]:44374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZB5G-0005J2-Rf
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 07:31:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lZB2h-0004As-CM
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 07:29:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lZB2e-0000N4-Jp
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 07:29:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619004552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tq8tauyRARF498O0IZpeR9xfKrbqjlQeEsGQ9JIUkXI=;
 b=B7mnRZxPRVsneHl2hwy1rr+s2gSdFQky4dOxhGQxuj1WmOXB+fcBB2zfNBkLeWZR4srGZX
 LSdv7N09jR7qy8YKO/KxUoBhewIlW1gKZx6JvyGgWmiSK+sx9jO1qVtX8uaqheKQCKePgP
 CEEeO7/8IqbFUZ9mA1Pyku0/cf+GP7w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-ifiwEpT5NZCNTXpzWqGfJA-1; Wed, 21 Apr 2021 07:29:10 -0400
X-MC-Unique: ifiwEpT5NZCNTXpzWqGfJA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 394461008304
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 11:28:41 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-29.ams2.redhat.com
 [10.36.114.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 724D76268F;
 Wed, 21 Apr 2021 11:28:39 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, kraxel@redhat.com,
 eblake@redhat.com, armbru@redhat.com, pabeni@redhat.com
Subject: [PATCH v2 1/5] channel-socket: Only set CLOEXEC if we have space for
 fds
Date: Wed, 21 Apr 2021 12:28:30 +0100
Message-Id: <20210421112834.107651-2-dgilbert@redhat.com>
In-Reply-To: <20210421112834.107651-1-dgilbert@redhat.com>
References: <20210421112834.107651-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
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
Cc: peterx@redhat.com, quintela@redhat.com
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


