Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D31E323F63
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 16:11:45 +0100 (CET)
Received: from localhost ([::1]:41812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEvpH-0006W7-SB
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 10:11:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEvR3-0002X3-8j
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:46:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEvR1-0003mn-EZ
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:46:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614177998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OQ0hQfVXRh/zZy/IvT6Jo23KOroe0Xl5Gi7Nbj/e8Hc=;
 b=ORP/nYIA04XVrL0lqiMHGJxAfROXBHcw20hs9ydRY4uZJbrlqnZqgxHF/IuKeKvQeWBeiO
 kKBK2O5a3gQ3gVmLy/Pa5Q5Znya1bY3sOn2CjCS6eNtTJDvUxiszHuFw5271OMi10E4pBU
 gE6fBc/lU09ZPWYp4xsP4migNd23wdg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-SEmdgeXVNim8mg1mgrbUBg-1; Wed, 24 Feb 2021 09:45:20 -0500
X-MC-Unique: SEmdgeXVNim8mg1mgrbUBg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BAD718E3A83;
 Wed, 24 Feb 2021 13:53:31 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-142.ams2.redhat.com [10.36.114.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7DAF5D6D3;
 Wed, 24 Feb 2021 13:53:21 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/31] qapi/qom: Add ObjectOptions for authz-*
Date: Wed, 24 Feb 2021 14:52:28 +0100
Message-Id: <20210224135255.253837-5-kwolf@redhat.com>
In-Reply-To: <20210224135255.253837-1-kwolf@redhat.com>
References: <20210224135255.253837-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf@redhat.com, lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, armbru@redhat.com,
 mreitz@redhat.com, kraxel@redhat.com, pbonzini@redhat.com, dgilbert@redhat.com
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
index 42afe752d1..99d49aa563 100644
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
+# Since: 4.0
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
+# Since: 4.0
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
+# Since: 4.0
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
+# Since: 4.0
+##
+{ 'struct': 'AuthZSimpleProperties',
+  'data': { 'identity': 'str' } }
diff --git a/qapi/qom.json b/qapi/qom.json
index bf2ecb34be..30ed179bc1 100644
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
index 28117c3aac..67749d1101 100644
--- a/storage-daemon/qapi/qapi-schema.json
+++ b/storage-daemon/qapi/qapi-schema.json
@@ -26,6 +26,7 @@
 { 'include': '../../qapi/crypto.json' }
 { 'include': '../../qapi/introspect.json' }
 { 'include': '../../qapi/job.json' }
+{ 'include': '../../qapi/authz.json' }
 { 'include': '../../qapi/qom.json' }
 { 'include': '../../qapi/sockets.json' }
 { 'include': '../../qapi/transaction.json' }
-- 
2.29.2


