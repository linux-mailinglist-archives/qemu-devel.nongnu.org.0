Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D24AC3D2243
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 12:47:39 +0200 (CEST)
Received: from localhost ([::1]:51274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6WEs-00045o-TC
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 06:47:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1m6WDM-0002FL-BQ
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 06:46:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1m6WDK-0002J5-OW
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 06:46:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626950761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N++8fijF8K99K5wsOfW/EPJMnZKaQo0x4Cab85dUPVI=;
 b=E2kTNcyjf+X6ZYGcazODge3xqABAAG8CtXCPJPFtw/tRvtW55KnJAScV9Pv6/R8cUjqxpv
 v05ggN+1OiqIEbMxj8EBaMngERIBwcQ41gh8KBvydAt2T1uvPa370Tf/SfoUydhLiHu7CX
 H5CxhDcSIT41hcETs5YZj/hG6vKjlpo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-jWF9kO7wMzykQnKswdy-Ow-1; Thu, 22 Jul 2021 06:45:58 -0400
X-MC-Unique: jWF9kO7wMzykQnKswdy-Ow-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9DB2C73A0;
 Thu, 22 Jul 2021 10:45:56 +0000 (UTC)
Received: from pick.home.annexia.org (ovpn-114-133.ams2.redhat.com
 [10.36.114.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE90860BD8;
 Thu, 22 Jul 2021 10:45:55 +0000 (UTC)
From: "Richard W.M. Jones" <rjones@redhat.com>
To: vsementsov@virtuozzo.com
Subject: [PATCH] nbd/server: Suppress Broken pipe errors on abrupt
 disconnection
Date: Thu, 22 Jul 2021 11:45:52 +0100
Message-Id: <20210722104552.2351167-2-rjones@redhat.com>
In-Reply-To: <20210722104552.2351167-1-rjones@redhat.com>
References: <20210722104552.2351167-1-rjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: eblake@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

$ rm -f /tmp/sock /tmp/pid
$ qemu-img create -f qcow2 /tmp/disk.qcow2 1M
$ qemu-nbd -t --format=qcow2 --socket=/tmp/sock --pid-file=/tmp/pid /tmp/disk.qcow2 &
$ nbdsh -u 'nbd+unix:///?socket=/tmp/sock' -c 'h.get_size()'
qemu-nbd: Disconnect client, due to: Failed to send reply: Unable to write to socket: Broken pipe
$ killall qemu-nbd

nbdsh is abruptly dropping the NBD connection here which is a valid
way to close the connection.  It seems unnecessary to print an error
in this case so this commit suppresses it.

Note that if you call the nbdsh h.shutdown() method then the message
was not printed:

$ nbdsh -u 'nbd+unix:///?socket=/tmp/sock' -c 'h.get_size()' -c 'h.shutdown()'

Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
---
 nbd/server.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/nbd/server.c b/nbd/server.c
index b60ebc3ab6..0f86535b88 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -2668,7 +2668,11 @@ static coroutine_fn void nbd_trip(void *opaque)
         ret = nbd_handle_request(client, &request, req->data, &local_err);
     }
     if (ret < 0) {
-        error_prepend(&local_err, "Failed to send reply: ");
+        if (errno != EPIPE) {
+            error_prepend(&local_err, "Failed to send reply: ");
+        } else {
+            local_err = NULL;
+        }
         goto disconnect;
     }
 
-- 
2.32.0


