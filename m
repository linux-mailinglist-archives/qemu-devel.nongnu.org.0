Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01727631C1D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 09:54:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox2WE-0003Rz-J0; Mon, 21 Nov 2022 03:51:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ox2WC-0003RE-Ip
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 03:51:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ox2WA-00018u-2Y
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 03:51:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669020665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bT4LKlTlWOK0FhC8/IHmyYDWCV9pXXCqCFGyR+rQjZ8=;
 b=Hl5zMjk3ZJc2G1VX1bvnDPGnbKBMouW0wN7qvxEaNLqkIKg0lSVyb8LU4QuADMM/bnRN7g
 hxGJkJtV9gtVqQmKKbC0o3qgoApMPk4c6HTrk/yLmypCqaWD+Y/EK5qu3awmfpct7Xok1Z
 gQr4TPQA8t/hEtaMF2E5/Yw+yZHfJLQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-oKLJT87sMWynqu50sFYINw-1; Mon, 21 Nov 2022 03:51:01 -0500
X-MC-Unique: oKLJT87sMWynqu50sFYINw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E39B4185A792;
 Mon, 21 Nov 2022 08:51:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BFEB3492B06;
 Mon, 21 Nov 2022 08:51:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 631AC21E66FD; Mon, 21 Nov 2022 09:50:54 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: eblake@redhat.com,
	vsementsov@yandex-team.ru
Subject: [PATCH 08/10] sockets: Use ERRP_GUARD() where obviously appropriate
Date: Mon, 21 Nov 2022 09:50:52 +0100
Message-Id: <20221121085054.683122-9-armbru@redhat.com>
In-Reply-To: <20221121085054.683122-1-armbru@redhat.com>
References: <20221121085054.683122-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 util/qemu-sockets.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index d185245023..6538859b87 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -210,7 +210,8 @@ static int inet_listen_saddr(InetSocketAddress *saddr,
                              int num,
                              Error **errp)
 {
-    struct addrinfo ai,*res,*e;
+    ERRP_GUARD();
+    struct addrinfo ai, *res, *e;
     char port[33];
     char uaddr[INET6_ADDRSTRLEN+1];
     char uport[33];
@@ -218,7 +219,6 @@ static int inet_listen_saddr(InetSocketAddress *saddr,
     int slisten = -1;
     int saved_errno = 0;
     bool socket_created = false;
-    Error *err = NULL;
 
     if (saddr->keep_alive) {
         error_setg(errp, "keep-alive option is not supported for passive "
@@ -231,11 +231,9 @@ static int inet_listen_saddr(InetSocketAddress *saddr,
     if (saddr->has_numeric && saddr->numeric) {
         ai.ai_flags |= AI_NUMERICHOST | AI_NUMERICSERV;
     }
-    ai.ai_family = inet_ai_family_from_address(saddr, &err);
     ai.ai_socktype = SOCK_STREAM;
-
-    if (err) {
-        error_propagate(errp, err);
+    ai.ai_family = inet_ai_family_from_address(saddr, errp);
+    if (*errp) {
         return -1;
     }
 
@@ -392,9 +390,9 @@ static int inet_connect_addr(const InetSocketAddress *saddr,
 static struct addrinfo *inet_parse_connect_saddr(InetSocketAddress *saddr,
                                                  Error **errp)
 {
+    ERRP_GUARD();
     struct addrinfo ai, *res;
     int rc;
-    Error *err = NULL;
     static int useV4Mapped = 1;
 
     memset(&ai, 0, sizeof(ai));
@@ -403,11 +401,9 @@ static struct addrinfo *inet_parse_connect_saddr(InetSocketAddress *saddr,
     if (qatomic_read(&useV4Mapped)) {
         ai.ai_flags |= AI_V4MAPPED;
     }
-    ai.ai_family = inet_ai_family_from_address(saddr, &err);
     ai.ai_socktype = SOCK_STREAM;
-
-    if (err) {
-        error_propagate(errp, err);
+    ai.ai_family = inet_ai_family_from_address(saddr, errp);
+    if (*errp) {
         return NULL;
     }
 
@@ -499,20 +495,18 @@ static int inet_dgram_saddr(InetSocketAddress *sraddr,
                             InetSocketAddress *sladdr,
                             Error **errp)
 {
+    ERRP_GUARD();
     struct addrinfo ai, *peer = NULL, *local = NULL;
     const char *addr;
     const char *port;
     int sock = -1, rc;
-    Error *err = NULL;
 
     /* lookup peer addr */
     memset(&ai,0, sizeof(ai));
     ai.ai_flags = AI_CANONNAME | AI_V4MAPPED | AI_ADDRCONFIG;
-    ai.ai_family = inet_ai_family_from_address(sraddr, &err);
     ai.ai_socktype = SOCK_DGRAM;
-
-    if (err) {
-        error_propagate(errp, err);
+    ai.ai_family = inet_ai_family_from_address(sraddr, errp);
+    if (*errp) {
         goto err;
     }
 
-- 
2.37.3


