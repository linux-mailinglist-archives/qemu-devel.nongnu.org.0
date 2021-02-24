Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C31323F50
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 15:57:52 +0100 (CET)
Received: from localhost ([::1]:36352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEvbr-0000WM-Ac
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 09:57:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEvQ1-0001Zd-Kn
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:45:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEvPm-0003BU-J6
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:45:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614177921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fh4qzydDPWdbmK8J8JendkPybAKa+37bNhnHqiq3mfM=;
 b=ArGkHSyXIzsQt+RSioFh3qqAhbIXW0ncNZ4bdlDsGy6YbKERWUZX4VGWj9cceNk2Ose5iQ
 qG1zgFbtwM+i16LJK3DIULFYRPKYoCy4JAGc6aK+zQGYbKCxOJxkr+dLSDv4XwvWrqVCAW
 Aevbk2g+r0cHzT8aDD0/LslutAVvjDg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-1gXjS4OcMra0SiUC259cMw-1; Wed, 24 Feb 2021 09:45:20 -0500
X-MC-Unique: 1gXjS4OcMra0SiUC259cMw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07AD410C0582;
 Wed, 24 Feb 2021 13:54:49 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-142.ams2.redhat.com [10.36.114.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 08C8B5D74A;
 Wed, 24 Feb 2021 13:54:45 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/31] qapi/qom: Add ObjectOptions for
 confidential-guest-support
Date: Wed, 24 Feb 2021 14:52:40 +0100
Message-Id: <20210224135255.253837-17-kwolf@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This adds a QAPI schema for the properties of the objects implementing
the confidential-guest-support interface.

pef-guest and s390x-pv-guest don't have any properties, so they only
need to be added to the ObjectType enum without adding a new branch to
ObjectOptions.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/qom.json | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/qapi/qom.json b/qapi/qom.json
index e7184122e9..d5f68b5c89 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -633,6 +633,38 @@
   'base': 'RngProperties',
   'data': { '*filename': 'str' } }
 
+##
+# @SevGuestProperties:
+#
+# Properties for sev-guest objects.
+#
+# @sev-device: SEV device to use (default: "/dev/sev")
+#
+# @dh-cert-file: guest owners DH certificate (encoded with base64)
+#
+# @session-file: guest owners session parameters (encoded with base64)
+#
+# @policy: SEV policy value (default: 0x1)
+#
+# @handle: SEV firmware handle (default: 0)
+#
+# @cbitpos: C-bit location in page table entry (default: 0)
+#
+# @reduced-phys-bits: number of bits in physical addresses that become
+#                     unavailable when SEV is enabled
+#
+# Since: 2.12
+##
+{ 'struct': 'SevGuestProperties',
+  'data': { '*sev-device': 'str',
+            '*dh-cert-file': 'str',
+            '*session-file': 'str',
+            '*policy': 'uint32',
+            '*handle': 'uint32',
+            '*cbitpos': 'uint32',
+            'reduced-phys-bits': 'uint32' },
+  'if': 'defined(CONFIG_SEV)' }
+
 ##
 # @ObjectType:
 #
@@ -661,12 +693,15 @@
     'memory-backend-file',
     'memory-backend-memfd',
     'memory-backend-ram',
+    {'name': 'pef-guest', 'if': 'defined(CONFIG_PSERIES)' },
     'pr-manager-helper',
     'rng-builtin',
     'rng-egd',
     'rng-random',
     'secret',
     'secret_keyring',
+    {'name': 'sev-guest', 'if': 'defined(CONFIG_SEV)' },
+    's390-pv-guest',
     'throttle-group',
     'tls-creds-anon',
     'tls-creds-psk',
@@ -716,6 +751,8 @@
       'rng-random':                 'RngRandomProperties',
       'secret':                     'SecretProperties',
       'secret_keyring':             'SecretKeyringProperties',
+      'sev-guest':                  { 'type': 'SevGuestProperties',
+                                      'if': 'defined(CONFIG_SEV)' },
       'throttle-group':             'ThrottleGroupProperties',
       'tls-creds-anon':             'TlsCredsAnonProperties',
       'tls-creds-psk':              'TlsCredsPskProperties',
-- 
2.29.2


