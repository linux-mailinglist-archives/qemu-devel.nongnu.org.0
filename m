Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D7C30CFB2
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 00:10:10 +0100 (CET)
Received: from localhost ([::1]:50204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l74o8-0001bN-6A
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 18:10:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l74R1-0007md-Pc
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:46:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l74Qm-000635-1e
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:46:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612305955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xXhQmOU+ikfahQNam6ErItlekmPw+N6cXoaZ0kI8A1A=;
 b=Zw/9QSCEyB/xAOzU574IyjW6W8VNZZa3psv6KxwqefMe0J81tvGXEY/0ZHUfAj935VLuF6
 aTcz/sYSx3RqOec7N5fIlxIwKXC+GEdEbz6t9WcS0P5cAdxwnS6Hf2w+MEwDNCpWuZe3em
 3Zpah1vOzYtS++e/u9xfIe9mjS0Z6SU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-oXeLeISINQ-bwd7g2h1opg-1; Tue, 02 Feb 2021 17:45:52 -0500
X-MC-Unique: oXeLeISINQ-bwd7g2h1opg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7499801AC1;
 Tue,  2 Feb 2021 22:45:50 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27D8010016FD;
 Tue,  2 Feb 2021 22:45:50 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/20] nbd: make nbd_read* return -EIO on error
Date: Tue,  2 Feb 2021 16:45:29 -0600
Message-Id: <20210202224529.642055-21-eblake@redhat.com>
In-Reply-To: <20210202224529.642055-1-eblake@redhat.com>
References: <20210202224529.642055-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Roman Kagan <rvkagan@yandex-team.ru>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Roman Kagan <rvkagan@yandex-team.ru>

NBD reconnect logic considers the error code from the functions that
read NBD messages to tell if reconnect should be attempted or not: it is
attempted on -EIO, otherwise the client transitions to NBD_CLIENT_QUIT
state (see nbd_channel_error).  This error code is propagated from the
primitives like nbd_read.

The problem, however, is that nbd_read itself turns every error into -1
rather than -EIO.  As a result, if the NBD server happens to die while
sending the message, the client in QEMU receives less data than it
expects, considers it as a fatal error, and wouldn't attempt
reestablishing the connection.

Fix it by turning every negative return from qio_channel_read_all into
-EIO returned from nbd_read.  Apparently that was the original behavior,
but got broken later.  Also adjust nbd_readXX to follow.

Fixes: e6798f06a6 ("nbd: generalize usage of nbd_read")
Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210129073859.683063-4-rvkagan@yandex-team.ru>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/block/nbd.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/block/nbd.h b/include/block/nbd.h
index 4a52a43ef598..5f34d23bb037 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -364,7 +364,7 @@ static inline int nbd_read(QIOChannel *ioc, void *buffer, size_t size,
         if (desc) {
             error_prepend(errp, "Failed to read %s: ", desc);
         }
-        return -1;
+        return ret;
     }

     return 0;
@@ -375,8 +375,9 @@ static inline int nbd_read##bits(QIOChannel *ioc,                       \
                                  uint##bits##_t *val,                   \
                                  const char *desc, Error **errp)        \
 {                                                                       \
-    if (nbd_read(ioc, val, sizeof(*val), desc, errp) < 0) {             \
-        return -1;                                                      \
+    int ret = nbd_read(ioc, val, sizeof(*val), desc, errp);             \
+    if (ret < 0) {                                                      \
+        return ret;                                                     \
     }                                                                   \
     *val = be##bits##_to_cpu(*val);                                     \
     return 0;                                                           \
-- 
2.30.0


