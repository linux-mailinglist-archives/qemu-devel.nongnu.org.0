Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 598B73377B7
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:30:11 +0100 (CET)
Received: from localhost ([::1]:36550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKNGM-0007rw-2W
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:30:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKMc5-0004pN-1q
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:48:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKMc2-0002nE-3I
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:48:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615474109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=etyTY3fKwJy3x6FugYs1IuvelQvUX2nVDOJIoEFKQd0=;
 b=hFmW/x8VMdBeyl45WfpCs8goy+NP+yYxFHI09rcDV5NyX8ck+b8qz5eViO2gljYGjC39kI
 dqb0ZauqPBcGTfsrNcK/WSzIRBlMeaVudnoGVqnL89MFTQ+HF9JuOhq+skgHqzFmmujx2k
 Dv1cmkja0KnJKajGS1lnJHY2rS+xjwc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-nhFAr8JxMv2HcfmNC2EL2A-1; Thu, 11 Mar 2021 09:48:25 -0500
X-MC-Unique: nhFAr8JxMv2HcfmNC2EL2A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 607738030DD;
 Thu, 11 Mar 2021 14:48:24 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-112.ams2.redhat.com [10.36.114.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 59EA75DDAD;
 Thu, 11 Mar 2021 14:48:23 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 04/38] curl: Store BDRVCURLState pointer in CURLSocket
Date: Thu, 11 Mar 2021 15:47:37 +0100
Message-Id: <20210311144811.313451-5-kwolf@redhat.com>
In-Reply-To: <20210311144811.313451-1-kwolf@redhat.com>
References: <20210311144811.313451-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

A socket does not really belong to any specific state.  We do not need
to store a pointer to "its" state in it, a pointer to the common
BDRVCURLState is sufficient.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210309130541.37540-2-mreitz@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/curl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/block/curl.c b/block/curl.c
index 4ff895df8f..43c79bcf36 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -78,7 +78,7 @@ typedef struct CURLAIOCB {
 
 typedef struct CURLSocket {
     int fd;
-    struct CURLState *state;
+    struct BDRVCURLState *s;
     QLIST_ENTRY(CURLSocket) next;
 } CURLSocket;
 
@@ -155,7 +155,7 @@ static int curl_sock_cb(CURL *curl, curl_socket_t fd, int action,
     if (!socket) {
         socket = g_new0(CURLSocket, 1);
         socket->fd = fd;
-        socket->state = state;
+        socket->s = s;
         QLIST_INSERT_HEAD(&state->sockets, socket, next);
     }
 
@@ -385,7 +385,7 @@ static void curl_multi_check_completion(BDRVCURLState *s)
 /* Called with s->mutex held.  */
 static void curl_multi_do_locked(CURLSocket *socket)
 {
-    BDRVCURLState *s = socket->state->s;
+    BDRVCURLState *s = socket->s;
     int running;
     int r;
 
@@ -401,7 +401,7 @@ static void curl_multi_do_locked(CURLSocket *socket)
 static void curl_multi_do(void *arg)
 {
     CURLSocket *socket = arg;
-    BDRVCURLState *s = socket->state->s;
+    BDRVCURLState *s = socket->s;
 
     qemu_mutex_lock(&s->mutex);
     curl_multi_do_locked(socket);
-- 
2.29.2


