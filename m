Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A76331411
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 18:05:39 +0100 (CET)
Received: from localhost ([::1]:44164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJJK5-0003lO-Fj
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 12:05:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJJAL-0003NN-H4
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:55:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJJAJ-00084w-J4
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:55:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615222530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4fKrSoN5LQPGwgzDOQHNyExlWDQc6c4cs2ig5IKjOWU=;
 b=bkXwk/P3GKaa4Sygk1v5USs5o28sfjw6FEfknrhAnn7SJAGZoSJ3p/iKN6BUFIoQH/YoJg
 aLM+vZe3UtXR6JdAhpIaX0lU3T93CDN2/dtI6jjo1kd/+OtG7XqkX4Kb3k21J2scaj7Qq6
 j4dHLeLAbc1UWuSPGU6eAKd8bRl+VsE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-0OybWU4sNfSrFDJOuVKHTQ-1; Mon, 08 Mar 2021 11:55:29 -0500
X-MC-Unique: 0OybWU4sNfSrFDJOuVKHTQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00626881281;
 Mon,  8 Mar 2021 16:55:28 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-100.ams2.redhat.com [10.36.112.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 34B715D9E3;
 Mon,  8 Mar 2021 16:55:15 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/30] qapi/qom: Add ObjectOptions for authz-*
Date: Mon,  8 Mar 2021 17:54:13 +0100
Message-Id: <20210308165440.386489-4-kwolf@redhat.com>
In-Reply-To: <20210308165440.386489-1-kwolf@redhat.com>
References: <20210308165440.386489-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Acked-by: Peter Krempa <pkrempa@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 qapi/authz.json                      | 61 +++++++++++++++++++++++++---
 qapi/qom.json                        | 10 +++++
 storage-daemon/qapi/qapi-schema.json |  1 +
 3 files changed, 67 insertions(+), 5 deletions(-)

diff --git a/qapi/authz.json b/qapi/authz.json
index 42afe752d1..51845e37cc 100644
--- a/qapi/authz.json
+++ b/qapi/authz.json
@@ -50,12 +50,63 @@
            '*format': 'QAuthZListFormat'}}
 
 ##
-# @QAuthZListRuleListHack:
+# @AuthZListProperties:
 #
-# Not exposed via QMP; hack to generate QAuthZListRuleList
-# for use internally by the code.
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
 #
 # Since: 4.0
 ##
-{ 'struct': 'QAuthZListRuleListHack',
-  'data': { 'unused': ['QAuthZListRule'] } }
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


