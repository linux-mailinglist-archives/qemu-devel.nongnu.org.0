Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1C72C8485
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 13:57:43 +0100 (CET)
Received: from localhost ([::1]:42562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjikQ-0002OZ-F8
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 07:57:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjiI8-0002xA-1h
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:28:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjiI6-00031k-9h
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:28:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606739305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ptVOkccVu9/1Wdb8weQjXW1L/TVEkPCZWcFmdUING5k=;
 b=aKnFsicB6egbiK0YnB+MqfJXDWouGrfhvb7q1a9Wgz6n5AQbE+UyIX1IIReEXQM5Wh9KiZ
 YWAuHJk4nst60nIptuoTN6bSjAOp+W+pb8O9Z0mUsatTm/lBZpPB52vZdUkBiNrSCyFwAP
 hLpXhmcaCnYbj4w62YZ83IcbNxINWJk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-Zuo6GYXGP1moqO4HzlGtFA-1; Mon, 30 Nov 2020 07:28:23 -0500
X-MC-Unique: Zuo6GYXGP1moqO4HzlGtFA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E09D9A252;
 Mon, 30 Nov 2020 12:28:22 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-117.ams2.redhat.com [10.36.114.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 52F1827CBB;
 Mon, 30 Nov 2020 12:28:07 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/18] qapi/qom: Add ObjectOptions for sev-guest
Date: Mon, 30 Nov 2020 13:25:34 +0100
Message-Id: <20201130122538.27674-15-kwolf@redhat.com>
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

This adds a QAPI schema for the properties of the sev-guest object.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/qom.json | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/qapi/qom.json b/qapi/qom.json
index 24bfa83af5..43d081cb42 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -621,6 +621,38 @@
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
+# Since: 6.0
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
@@ -655,6 +687,7 @@
     'rng-random',
     'secret',
     'secret_keyring',
+    {'name': 'sev-guest', 'if': 'defined(CONFIG_SEV)' },
     'throttle-group',
     'tls-creds-anon',
     'tls-creds-psk',
@@ -704,6 +737,8 @@
       'rng-random':                 'RngRandomProperties',
       'secret':                     'SecretProperties',
       'secret_keyring':             'SecretKeyringProperties',
+      'sev-guest':                  { 'type': 'SevGuestProperties',
+                                      'if': 'defined(CONFIG_SEV)' },
       'throttle-group':             'ThrottleGroupProperties',
       'tls-creds-anon':             'TlsCredsAnonProperties',
       'tls-creds-psk':              'TlsCredsPskProperties',
-- 
2.28.0


