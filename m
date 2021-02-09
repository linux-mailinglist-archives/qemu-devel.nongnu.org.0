Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 003433152DB
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 16:31:50 +0100 (CET)
Received: from localhost ([::1]:37792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9UzW-0007A3-2S
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 10:31:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l9Uw0-0005Pu-B2
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 10:28:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l9Uvx-0003rb-KN
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 10:28:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612884489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qPYHZIKTjp0F6PV0mXe+JBNSwQCJy3TRM4fJ22nMm0s=;
 b=OH7jRoGvCnWlPwQAnArvmJh8ocbcUgGHrQD9/BfDRDRNrsVEyY3DcFtrv1wCMVyVrts3Sf
 33ZRlj3GSLo6q7lvbbl06p+yZAuGcjw1MUbmyguf588l8WKHlv6TgMnoz9RAHcIvwcUF+z
 MXV2Zlwrjg2kahUXbUL5FL1RBDSv3mA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-TopCDnMLOv2PyykPnOnnHQ-1; Tue, 09 Feb 2021 10:28:06 -0500
X-MC-Unique: TopCDnMLOv2PyykPnOnnHQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 875A9192AB7B;
 Tue,  9 Feb 2021 15:28:05 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A8A75D747;
 Tue,  9 Feb 2021 15:28:05 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/2] qemu-nbd: Permit --shared=0 for unlimited clients
Date: Tue,  9 Feb 2021 09:27:59 -0600
Message-Id: <20210209152759.209074-3-eblake@redhat.com>
In-Reply-To: <20210209152759.209074-1-eblake@redhat.com>
References: <20210209152759.209074-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: nsoffer@redhat.com, berrange@redhat.com, rjones@redhat.com,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This gives us better feature parity with QMP nbd-server-start, where
max-connections defaults to 0 for unlimited.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 docs/tools/qemu-nbd.rst | 4 ++--
 qemu-nbd.c              | 7 +++----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/docs/tools/qemu-nbd.rst b/docs/tools/qemu-nbd.rst
index fe41336dc550..ee862fa0bc02 100644
--- a/docs/tools/qemu-nbd.rst
+++ b/docs/tools/qemu-nbd.rst
@@ -136,8 +136,8 @@ driver options if ``--image-opts`` is specified.
 .. option:: -e, --shared=NUM

   Allow up to *NUM* clients to share the device (default
-  ``1``). Safe for readers, but for now, consistency is not
-  guaranteed between multiple writers.
+  ``1``), 0 for unlimited. Safe for readers, but for now,
+  consistency is not guaranteed between multiple writers.

 .. option:: -t, --persistent

diff --git a/qemu-nbd.c b/qemu-nbd.c
index 1a340ea4858d..5416509ece18 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -328,7 +328,7 @@ static void *nbd_client_thread(void *arg)

 static int nbd_can_accept(void)
 {
-    return state == RUNNING && nb_fds < shared;
+    return state == RUNNING && (shared == 0 || nb_fds < shared);
 }

 static void nbd_update_server_watch(void);
@@ -706,8 +706,8 @@ int main(int argc, char **argv)
             device = optarg;
             break;
         case 'e':
             if (qemu_strtoi(optarg, NULL, 0, &shared) < 0 ||
-                shared < 1) {
+                shared < 0) {
                 error_report("Invalid shared device number '%s'", optarg);
                 exit(EXIT_FAILURE);
             }
@@ -966,7 +965,7 @@ int main(int argc, char **argv)
     if (socket_activation == 0) {
         int backlog;

-        if (persistent) {
+        if (persistent || shared == 0) {
             backlog = SOMAXCONN;
         } else {
             backlog = MIN(shared, SOMAXCONN);
-- 
2.30.0


