Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB0731A5F1
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 21:22:07 +0100 (CET)
Received: from localhost ([::1]:53958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAex4-0001Ds-JU
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 15:22:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAerk-0004A0-2u
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 15:16:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAere-0003rh-A5
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 15:16:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613160989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w7KSEOkdVjlNJs/Mr1z2NbCT8l71Fw7ARyPGR8CPT9Y=;
 b=P1iSvTWHqRL6ghhBQbBUhGh4GU4hz7FsgMGE1M2OH6KCOyLow2lz4gK4GFze/rrvxhCDD9
 7uU7rzHxz0rCtYDRYmTpPy3NPCs3zi2U7wM9YMmHPtmjo1+qG31rSDInqVv2x7EmKtmvsA
 mWtgcEWBEEKX9wx4zD7TCAikq2TkhVc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-gjcaCjeEPUmNeq-w5kql3w-1; Fri, 12 Feb 2021 15:16:27 -0500
X-MC-Unique: gjcaCjeEPUmNeq-w5kql3w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B4F9107ACE3;
 Fri, 12 Feb 2021 20:16:23 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1C756E51F;
 Fri, 12 Feb 2021 20:16:22 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/14] qemu-nbd: Permit --shared=0 for unlimited clients
Date: Fri, 12 Feb 2021 14:16:07 -0600
Message-Id: <20210212201619.1388255-3-eblake@redhat.com>
In-Reply-To: <20210212201619.1388255-1-eblake@redhat.com>
References: <20210212201619.1388255-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This gives us better feature parity with QMP nbd-server-start, where
max-connections defaults to 0 for unlimited.

Signed-off-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210209152759.209074-3-eblake@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/tools/qemu-nbd.rst | 4 ++--
 qemu-nbd.c              | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

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
index 1a340ea4858d..b1b9430a8f54 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -328,7 +328,7 @@ static void *nbd_client_thread(void *arg)

 static int nbd_can_accept(void)
 {
-    return state == RUNNING && nb_fds < shared;
+    return state == RUNNING && (shared == 0 || nb_fds < shared);
 }

 static void nbd_update_server_watch(void);
@@ -707,7 +707,7 @@ int main(int argc, char **argv)
             break;
         case 'e':
             if (qemu_strtoi(optarg, NULL, 0, &shared) < 0 ||
-                shared < 1) {
+                shared < 0) {
                 error_report("Invalid shared device number '%s'", optarg);
                 exit(EXIT_FAILURE);
             }
@@ -966,7 +966,7 @@ int main(int argc, char **argv)
     if (socket_activation == 0) {
         int backlog;

-        if (persistent) {
+        if (persistent || shared == 0) {
             backlog = SOMAXCONN;
         } else {
             backlog = MIN(shared, SOMAXCONN);
-- 
2.30.1


