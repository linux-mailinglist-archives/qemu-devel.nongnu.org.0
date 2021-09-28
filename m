Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 824E241B38A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 18:07:11 +0200 (CEST)
Received: from localhost ([::1]:53774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVFdK-0005cx-19
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 12:07:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mVFZM-0002FS-4g
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 12:03:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mVFZJ-0003Jr-8r
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 12:02:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632844973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9cXZ9scr8RHVthrJF6JFj+A5upOHgJ62hoRrZTyV51c=;
 b=PvFeuWxtuHjdwVLPf1lwJ5QgHZXvi0/08HS11HjiHe1/Rc6WtiIlD/9D4iNqOyfmwUczIV
 Hw5kDgTCZHa1jShL5Wq6fssY+qziK655nMHV7+gyt7AEOT/otR+d8T+kdkYzmAzGdlrT65
 beQil0XPK+SYJFQi87C00odauhb3wLg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-N4RKtq4eMkyzxVJjZVf2Ag-1; Tue, 28 Sep 2021 12:02:49 -0400
X-MC-Unique: N4RKtq4eMkyzxVJjZVf2Ag-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCBFA1084681
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 16:02:48 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6FE7419C79;
 Tue, 28 Sep 2021 16:02:35 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>
Subject: [PATCH] qapi: Make some ObjectTypes depend on the build settings
Date: Tue, 28 Sep 2021 18:02:32 +0200
Message-Id: <20210928160232.432980-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some of the ObjectType entries already depend on CONFIG_* switches.
Some others also only make sense with certain configurations, but
are currently always listed in the ObjectType enum. Let's make them
depend on the correpsonding CONFIG_* switches, too, so that upper
layers (like libvirt) have a better way to determine which features
are available in QEMU.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qapi/qom.json | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index a25616bc7a..78b60433a9 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -777,7 +777,8 @@
     'authz-pam',
     'authz-simple',
     'can-bus',
-    'can-host-socketcan',
+    { 'name': 'can-host-socketcan',
+      'if': 'CONFIG_LINUX' },
     'colo-compare',
     'cryptodev-backend',
     'cryptodev-backend-builtin',
@@ -791,20 +792,24 @@
     'filter-replay',
     'filter-rewriter',
     'input-barrier',
-    'input-linux',
+    { 'name': 'input-linux',
+      'if': 'CONFIG_LINUX' },
     'iothread',
     'memory-backend-file',
     { 'name': 'memory-backend-memfd',
       'if': 'CONFIG_LINUX' },
     'memory-backend-ram',
     'pef-guest',
-    'pr-manager-helper',
+    { 'name': 'pr-manager-helper',
+      'if': 'CONFIG_LINUX' },
     'qtest',
     'rng-builtin',
     'rng-egd',
-    'rng-random',
+    { 'name': 'rng-random',
+      'if': 'CONFIG_POSIX' },
     'secret',
-    'secret_keyring',
+    { 'name': 'secret_keyring',
+      'if': 'CONFIG_SECRET_KEYRING' },
     'sev-guest',
     's390-pv-guest',
     'throttle-group',
@@ -835,7 +840,8 @@
       'authz-listfile':             'AuthZListFileProperties',
       'authz-pam':                  'AuthZPAMProperties',
       'authz-simple':               'AuthZSimpleProperties',
-      'can-host-socketcan':         'CanHostSocketcanProperties',
+      'can-host-socketcan':         { 'type': 'CanHostSocketcanProperties',
+                                      'if': 'CONFIG_LINUX' },
       'colo-compare':               'ColoCompareProperties',
       'cryptodev-backend':          'CryptodevBackendProperties',
       'cryptodev-backend-builtin':  'CryptodevBackendProperties',
@@ -849,19 +855,23 @@
       'filter-replay':              'NetfilterProperties',
       'filter-rewriter':            'FilterRewriterProperties',
       'input-barrier':              'InputBarrierProperties',
-      'input-linux':                'InputLinuxProperties',
+      'input-linux':                { 'type': 'InputLinuxProperties',
+                                      'if': 'CONFIG_LINUX' },
       'iothread':                   'IothreadProperties',
       'memory-backend-file':        'MemoryBackendFileProperties',
       'memory-backend-memfd':       { 'type': 'MemoryBackendMemfdProperties',
                                       'if': 'CONFIG_LINUX' },
       'memory-backend-ram':         'MemoryBackendProperties',
-      'pr-manager-helper':          'PrManagerHelperProperties',
+      'pr-manager-helper':          { 'type': 'PrManagerHelperProperties',
+                                      'if': 'CONFIG_LINUX' },
       'qtest':                      'QtestProperties',
       'rng-builtin':                'RngProperties',
       'rng-egd':                    'RngEgdProperties',
-      'rng-random':                 'RngRandomProperties',
+      'rng-random':                 { 'type': 'RngRandomProperties',
+                                      'if': 'CONFIG_POSIX' },
       'secret':                     'SecretProperties',
-      'secret_keyring':             'SecretKeyringProperties',
+      'secret_keyring':             { 'type': 'SecretKeyringProperties',
+                                      'if': 'CONFIG_SECRET_KEYRING' },
       'sev-guest':                  'SevGuestProperties',
       'throttle-group':             'ThrottleGroupProperties',
       'tls-creds-anon':             'TlsCredsAnonProperties',
-- 
2.27.0


