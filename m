Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0611FF34D
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jun 2020 15:39:26 +0200 (CEST)
Received: from localhost ([::1]:42144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlulJ-0002ZL-2Y
	for lists+qemu-devel@lfdr.de; Thu, 18 Jun 2020 09:39:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jluW5-0000CL-Bg
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 09:23:41 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50515
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jluW2-0005uj-F2
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 09:23:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592486617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=vG0s1oHZ1P8zXtguCxiLEMRTZ70YOVVV1rooYTo+RUA=;
 b=Bm3GksjfGzVeSNHhzfLp3W075YsqlhiwjLBYzELyylMy4jJZmkmKzWaNS3d4T+69On7nlQ
 OdXyecbeHtBkuKgFynU/JQopJgVmjZ0U5trjOWQqlWrknZBFL+lGzOyJ1uCDkQmO2iSi4y
 dl8bowdqtnYgfGqUy6YzAsztpBUmkWI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-nEMH0YUDORmK_qOUT7HGqw-1; Thu, 18 Jun 2020 09:23:34 -0400
X-MC-Unique: nEMH0YUDORmK_qOUT7HGqw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28F8110CE780;
 Thu, 18 Jun 2020 13:23:33 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-109.pek2.redhat.com
 [10.72.12.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A19E5BAC1;
 Thu, 18 Jun 2020 13:23:30 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL V2 32/33] net: Drop the legacy "name" parameter from the -net
 option
Date: Thu, 18 Jun 2020 21:21:47 +0800
Message-Id: <1592486508-6135-33-git-send-email-jasowang@redhat.com>
In-Reply-To: <1592486508-6135-1-git-send-email-jasowang@redhat.com>
References: <1592486508-6135-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.120; envelope-from=jasowang@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/18 01:21:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Thomas Huth <thuth@redhat.com>, Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

It's been deprecated since QEMU v3.1, so it's time to finally
remove it. The "id" parameter can simply be used instead.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 docs/system/deprecated.rst | 15 +++++++++------
 net/net.c                  | 10 +---------
 qapi/net.json              |  3 ---
 3 files changed, 10 insertions(+), 18 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 544ece0..3a25559 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -47,12 +47,6 @@ The 'file' driver for drives is no longer appropriate for character or host
 devices and will only accept regular files (S_IFREG). The correct driver
 for these file types is 'host_cdrom' or 'host_device' as appropriate.
 
-``-net ...,name=``\ *name* (since 3.1)
-''''''''''''''''''''''''''''''''''''''
-
-The ``name`` parameter of the ``-net`` option is a synonym
-for the ``id`` parameter, which should now be used instead.
-
 ``-smp`` (invalid topologies) (since 3.1)
 '''''''''''''''''''''''''''''''''''''''''
 
@@ -441,6 +435,15 @@ What follows is a record of recently removed, formerly deprecated
 features that serves as a record for users who have encountered
 trouble after a recent upgrade.
 
+System emulator command line arguments
+--------------------------------------
+
+``-net ...,name=``\ *name* (removed in 5.1)
+'''''''''''''''''''''''''''''''''''''''''''
+
+The ``name`` parameter of the ``-net`` option was a synonym
+for the ``id`` parameter, which should now be used instead.
+
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
 
diff --git a/net/net.c b/net/net.c
index 4c62b10..e55d357 100644
--- a/net/net.c
+++ b/net/net.c
@@ -969,12 +969,10 @@ static int net_client_init1(const void *object, bool is_netdev, Error **errp)
 {
     Netdev legacy = {0};
     const Netdev *netdev;
-    const char *name;
     NetClientState *peer = NULL;
 
     if (is_netdev) {
         netdev = object;
-        name = netdev->id;
 
         if (netdev->type == NET_CLIENT_DRIVER_NIC ||
             !net_client_init_fun[netdev->type]) {
@@ -987,12 +985,6 @@ static int net_client_init1(const void *object, bool is_netdev, Error **errp)
         const NetLegacyOptions *opts = net->opts;
         legacy.id = net->id;
         netdev = &legacy;
-        /* missing optional values have been initialized to "all bits zero" */
-        name = net->has_id ? net->id : net->name;
-
-        if (net->has_name) {
-            warn_report("The 'name' parameter is deprecated, use 'id' instead");
-        }
 
         /* Map the old options to the new flat type */
         switch (opts->type) {
@@ -1052,7 +1044,7 @@ static int net_client_init1(const void *object, bool is_netdev, Error **errp)
         }
     }
 
-    if (net_client_init_fun[netdev->type](netdev, name, peer, errp) < 0) {
+    if (net_client_init_fun[netdev->type](netdev, netdev->id, peer, errp) < 0) {
         /* FIXME drop when all init functions store an Error */
         if (errp && !*errp) {
             error_setg(errp, QERR_DEVICE_INIT_FAILED,
diff --git a/qapi/net.json b/qapi/net.json
index cebb1b5..fc7c95f 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -474,8 +474,6 @@
 #
 # @id: identifier for monitor commands
 #
-# @name: identifier for monitor commands, ignored if @id is present
-#
 # @opts: device type specific properties (legacy)
 #
 # Since: 1.2
@@ -483,7 +481,6 @@
 { 'struct': 'NetLegacy',
   'data': {
     '*id':   'str',
-    '*name': 'str',
     'opts':  'NetLegacyOptions' } }
 
 ##
-- 
2.5.0


