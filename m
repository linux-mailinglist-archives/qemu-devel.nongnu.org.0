Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9238D323F40
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 15:50:01 +0100 (CET)
Received: from localhost ([::1]:36116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEvUG-0005fn-Ix
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 09:50:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEvPD-0000oM-F8
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:44:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEvPA-0002ot-Vb
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:44:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614177884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GgzHlh5no6ZMEWn97BK7nA1U+RXJ0YwWh/X5BXR+pJY=;
 b=Os0A4ty/hJhft1lgwHXzuFWnlobeGle7MbbVNEiAG20JGPdkuXv4wzIx1j216TApmQaIBj
 NYca4xCg+iQifITkS/U4HvJfQp+EHUb4m/oQi1fDPJU+NpTup0kW8J1mnMqbsMSiwl9e7U
 vtpZ0csDGDy2ZevamKVOXiEEplDyCuo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-q5FnI78QOSGglbzPtb9Wlg-1; Wed, 24 Feb 2021 09:44:42 -0500
X-MC-Unique: q5FnI78QOSGglbzPtb9Wlg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6D0D1A7D16;
 Wed, 24 Feb 2021 13:54:26 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-142.ams2.redhat.com [10.36.114.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0AA355D6D3;
 Wed, 24 Feb 2021 13:54:00 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/31] qapi/qom: Add ObjectOptions for can-*
Date: Wed, 24 Feb 2021 14:52:36 +0100
Message-Id: <20210224135255.253837-13-kwolf@redhat.com>
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

This adds a QAPI schema for the properties of the can-* objects.

can-bus doesn't have any properties, so it only needs to be added to the
ObjectType enum without adding a new branch to ObjectOptions.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/qom.json | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/qapi/qom.json b/qapi/qom.json
index f22b7aa99b..4b1cd4b8dc 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -207,6 +207,21 @@
   'returns': [ 'ObjectPropertyInfo' ],
   'allow-preconfig': true }
 
+##
+# @CanHostSocketcanProperties:
+#
+# Properties for can-host-socketcan objects.
+#
+# @if: interface name of the host system CAN bus to connect to
+#
+# @canbus: object ID of the can-bus object to connect to the host interface
+#
+# Since: 2.12
+##
+{ 'struct': 'CanHostSocketcanProperties',
+  'data': { 'if': 'str',
+            'canbus': 'str' } }
+
 ##
 # @CryptodevBackendProperties:
 #
@@ -439,6 +454,8 @@
     'authz-listfile',
     'authz-pam',
     'authz-simple',
+    'can-bus',
+    'can-host-socketcan',
     'cryptodev-backend',
     'cryptodev-backend-builtin',
     'cryptodev-vhost-user',
@@ -479,6 +496,7 @@
       'authz-listfile':             'AuthZListFileProperties',
       'authz-pam':                  'AuthZPAMProperties',
       'authz-simple':               'AuthZSimpleProperties',
+      'can-host-socketcan':         'CanHostSocketcanProperties',
       'cryptodev-backend':          'CryptodevBackendProperties',
       'cryptodev-backend-builtin':  'CryptodevBackendProperties',
       'cryptodev-vhost-user':       'CryptodevVhostUserProperties',
-- 
2.29.2


