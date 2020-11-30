Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F04892C841A
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 13:29:26 +0100 (CET)
Received: from localhost ([::1]:43558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjiJ3-0002OF-8D
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 07:29:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjiG0-0000TT-3Q
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:26:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjiFy-0002O7-4W
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:26:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606739172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jVCLV9ZVqyGdUrfvyTCsEggWX52tNivM5QmEoFp5h1A=;
 b=hlfvJezElG5XjSCREOSUUZoDXNKS5MX4jtNlbQysz52ZSm8wsZxO/qwR1KKADi6yCwXXEs
 aKeOuRkkkbLHUfGB0CCQg22KWB9WZw2ZvRqKwP1lXlgI+XvYHK+xALbsV3Eu2tMg0uHP9h
 Dm9bvR2US1cOVqXy/3PTTWaD0UW7MyE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-2XHtmf2VOzy2BjJX6A9QPA-1; Mon, 30 Nov 2020 07:26:11 -0500
X-MC-Unique: 2XHtmf2VOzy2BjJX6A9QPA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0AB22100C604;
 Mon, 30 Nov 2020 12:26:10 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-117.ams2.redhat.com [10.36.114.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0ECC019C71;
 Mon, 30 Nov 2020 12:26:03 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/18] qapi/qom: Add ObjectOptions for authz-*
Date: Mon, 30 Nov 2020 13:25:22 +0100
Message-Id: <20201130122538.27674-3-kwolf@redhat.com>
In-Reply-To: <20201130122538.27674-1-kwolf@redhat.com>
References: <20201130122538.27674-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, armbru@redhat.com,
 mreitz@redhat.com, kraxel@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds a QAPI schema for the properties of the authz-* objects.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/authz.json                      | 62 ++++++++++++++++++++++++++++
 qapi/qom.json                        | 10 +++++
 storage-daemon/qapi/qapi-schema.json |  1 +
 3 files changed, 73 insertions(+)

diff --git a/qapi/authz.json b/qapi/authz.json
index 42afe752d1..ac72ad5c9e 100644
--- a/qapi/authz.json
+++ b/qapi/authz.json
@@ -59,3 +59,65 @@
 ##
 { 'struct': 'QAuthZListRuleListHack',
   'data': { 'unused': ['QAuthZListRule'] } }
+
+##
+# @AuthZListProperties:
+#
+# Properties for authz-list objects.
+#
+# @policy: Default policy to apply when no rule matches (default: deny)
+#
+# @rules: Authorization rules based on matching user
+#
+# Since: 6.0
+##
+{ 'struct': 'AuthZListProperties',
+  'data': { '*policy': 'QAuthZListPolicy',
+            '*rules': ['QAuthZListRule'] } }
+
+##
+# @AuthZListFileProperties:
+#
+# Properties for authz-listfile objects.
+#
+# @filename: File name to load the configuration from. The file must
+#            contain valid JSON for AuthZListProperties.
+#
+# @refresh: If true, inotify is used to monitor the file, automatically
+#           reloading changes. If an error occurs during reloading, all
+#           authorizations will fail until the file is next successfully
+#           loaded. (default: true if the binary was built with
+#           CONFIG_INOTIFY1, false otherwise)
+#
+# Since: 6.0
+##
+{ 'struct': 'AuthZListFileProperties',
+  'data': { 'filename': 'str',
+            '*refresh': 'bool' } }
+
+##
+# @AuthZPAMProperties:
+#
+# Properties for authz-pam objects.
+#
+# @service: PAM service name to use for authorization
+#
+# Since: 6.0
+##
+{ 'struct': 'AuthZPAMProperties',
+  'data': { 'service': 'str' } }
+
+##
+# @AuthZSimpleProperties:
+#
+# Properties for authz-simple objects.
+#
+# @identity: Identifies the allowed user. Its format depends on the network
+#            service that authorization object is associated with. For
+#            authorizing based on TLS x509 certificates, the identity must be
+#            the x509 distinguished name.
+#
+# Since: 6.0
+##
+{ 'struct': 'AuthZSimpleProperties',
+  'data': { 'identity': 'str' } }
diff --git a/qapi/qom.json b/qapi/qom.json
index 57d1386758..0ac4b1c9fb 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -4,6 +4,8 @@
 # This work is licensed under the terms of the GNU GPL, version 2 or later.
 # See the COPYING file in the top-level directory.
 
+{ 'include': 'authz.json' }
+
 ##
 # = QEMU Object Model (QOM)
 ##
@@ -233,6 +235,10 @@
 ##
 { 'enum': 'ObjectType',
   'data': [
+    'authz-list',
+    'authz-listfile',
+    'authz-pam',
+    'authz-simple',
     'iothread'
   ] }
 
@@ -252,6 +258,10 @@
             'id': 'str' },
   'discriminator': 'qom-type',
   'data': {
+      'authz-list':                 'AuthZListProperties',
+      'authz-listfile':             'AuthZListFileProperties',
+      'authz-pam':                  'AuthZPAMProperties',
+      'authz-simple':               'AuthZSimpleProperties',
       'iothread':                   'IothreadProperties'
   } }
 
diff --git a/storage-daemon/qapi/qapi-schema.json b/storage-daemon/qapi/qapi-schema.json
index c6ad5ae1e3..39982d8cac 100644
--- a/storage-daemon/qapi/qapi-schema.json
+++ b/storage-daemon/qapi/qapi-schema.json
@@ -23,6 +23,7 @@
 { 'include': '../../qapi/crypto.json' }
 { 'include': '../../qapi/introspect.json' }
 { 'include': '../../qapi/job.json' }
+{ 'include': '../../qapi/authz.json' }
 { 'include': '../../qapi/qom.json' }
 { 'include': '../../qapi/sockets.json' }
 { 'include': '../../qapi/transaction.json' }
-- 
2.28.0


