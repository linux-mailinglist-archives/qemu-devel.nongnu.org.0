Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C14337866
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:46:49 +0100 (CET)
Received: from localhost ([::1]:55842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKNWS-0004Al-8g
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:46:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKMcj-0005h2-8N
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:49:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKMcT-0003A8-VO
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:49:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615474137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7SLpdWGP5b4FnWed5NCOiFywZrLZfoY1M8X6b40B7as=;
 b=cY8AEDBTL2c0t2chV6GRXoXWEfW7ODXKFzOJo3JvbN55V9uHyurkKGxs5GhDEPr2TjICGl
 +ihXlqZzdDfjbR2bAdkf2fd745qaNflh3hq2G9SPfUmP4vwNQQ1NW0hTbByoY4fdDAcngc
 g+ZXjOPVmqkCz3PKy1N1ZAyPtMErvgo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-oA1AsZeLNjWu7tf5BkVrXQ-1; Thu, 11 Mar 2021 09:48:55 -0500
X-MC-Unique: oA1AsZeLNjWu7tf5BkVrXQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E3B6107ACCD;
 Thu, 11 Mar 2021 14:48:54 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-112.ams2.redhat.com [10.36.114.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5BF4C5D9F2;
 Thu, 11 Mar 2021 14:48:53 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 25/38] qapi/qom: Add ObjectOptions for
 confidential-guest-support
Date: Thu, 11 Mar 2021 15:47:58 +0100
Message-Id: <20210311144811.313451-26-kwolf@redhat.com>
In-Reply-To: <20210311144811.313451-1-kwolf@redhat.com>
References: <20210311144811.313451-1-kwolf@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds a QAPI schema for the properties of the objects implementing
the confidential-guest-support interface.

pef-guest and s390x-pv-guest don't have any properties, so they only
need to be added to the ObjectType enum without adding a new branch to
ObjectOptions.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Acked-by: Peter Krempa <pkrempa@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 qapi/qom.json | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/qapi/qom.json b/qapi/qom.json
index d77e13cf53..8022367269 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -635,6 +635,38 @@
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
@@ -665,12 +697,15 @@
     { 'name': 'memory-backend-memfd',
       'if': 'defined(CONFIG_LINUX)' },
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
@@ -722,6 +757,8 @@
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


