Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAE2409724
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 17:21:55 +0200 (CEST)
Received: from localhost ([::1]:42534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPnmM-0001qX-Sa
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 11:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mPnkI-0000er-7H
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 11:19:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mPnkG-0004z8-P2
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 11:19:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631546383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rTx52UEpQEZ7z0Zyye7jFpuF4veWXBbRmqZRvu9XL+0=;
 b=XG69DDWj1/swgXGiyhp+RVMkhfeSKZ+A92jVCW0psppSHWvxbT94H9/frEmlSM3+ci1+IO
 6KP8p9r9LkRzuMhX0ni3002Hju+G40Y08WELhjhtFPG5orCmYnYZCuApaud2vmPohPYdvH
 blIY61w1MAXvuGNneIGi4g5gHXascaE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-Hp2drnqVNKiXzK6q2exLjw-1; Mon, 13 Sep 2021 11:19:40 -0400
X-MC-Unique: Hp2drnqVNKiXzK6q2exLjw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2988D835DE2;
 Mon, 13 Sep 2021 15:19:39 +0000 (UTC)
Received: from pick.home.annexia.org (unknown [10.39.192.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1498E5C23A;
 Mon, 13 Sep 2021 15:19:37 +0000 (UTC)
From: "Richard W.M. Jones" <rjones@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2] nbd/server: Suppress Broken pipe errors on abrupt
 disconnection
Date: Mon, 13 Sep 2021 16:19:36 +0100
Message-Id: <20210913151936.392705-1-rjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, eblake@redhat.com,
 qemu-devel@nongnu.org
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
 nbd/server.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/nbd/server.c b/nbd/server.c
index 3927f7789d..e0a43802b2 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -2669,7 +2669,12 @@ static coroutine_fn void nbd_trip(void *opaque)
         ret = nbd_handle_request(client, &request, req->data, &local_err);
     }
     if (ret < 0) {
-        error_prepend(&local_err, "Failed to send reply: ");
+        if (errno != EPIPE) {
+            error_prepend(&local_err, "Failed to send reply: ");
+        } else {
+            error_free(local_err);
+            local_err = NULL;
+        }
         goto disconnect;
     }
 
-- 
2.32.0


