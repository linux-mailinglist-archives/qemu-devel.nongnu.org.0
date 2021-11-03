Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 151DB444736
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 18:33:15 +0100 (CET)
Received: from localhost ([::1]:39736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miK8P-0004Iw-5P
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 13:33:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1miK6F-0001Q6-V5
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:31:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1miK6E-0001Yn-DC
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:30:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635960657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SDtvmRKU5xyJhjzgQFrXlFks4jjBeGlE1v0HtMmk894=;
 b=R+t8SBwoLxIaQIfKM5Bzn5JIndMu165Kg1/VlVytRTt8jvXdLwkE5L4zwm2JJfkzCDz0hU
 h1ilkys8R+RKnYakxf86ICtgDiHEUP51HY5qG9+m7COPztcafVjRIgv8DLmy2nYczU4mz4
 irrhcWZirXVykJP5nFFLf8w3qKaJZHc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-S429TtoRMVSqo0NEkRkRhA-1; Wed, 03 Nov 2021 13:30:54 -0400
X-MC-Unique: S429TtoRMVSqo0NEkRkRhA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 820398C7096
 for <qemu-devel@nongnu.org>; Wed,  3 Nov 2021 17:30:29 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04EBF76608;
 Wed,  3 Nov 2021 17:30:27 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 09/12] qapi/qom: Convert rng-backend/random to class
Date: Wed,  3 Nov 2021 18:29:59 +0100
Message-Id: <20211103173002.209906-10-kwolf@redhat.com>
In-Reply-To: <20211103173002.209906-1-kwolf@redhat.com>
References: <20211103173002.209906-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 armbru@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/qom.json | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index ccd1167808..a167e91f67 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -721,6 +721,16 @@
 { 'struct': 'RngProperties',
   'data': { '*opened': { 'type': 'bool', 'features': ['deprecated'] } } }
 
+##
+# @rng-backend:
+#
+# Base class for random number generator backends
+#
+# Since: 1.3
+##
+{ 'class': 'rng-backend',
+  'config': 'RngProperties' }
+
 ##
 # @RngEgdProperties:
 #
@@ -736,18 +746,18 @@
   'data': { 'chardev': 'str' } }
 
 ##
-# @RngRandomProperties:
+# @rng-random:
 #
-# Properties for rng-random objects.
+# Random number generator backend using a host random number device
 #
 # @filename: the filename of the device on the host to obtain entropy from
 #            (default: "/dev/urandom")
 #
 # Since: 1.3
 ##
-{ 'struct': 'RngRandomProperties',
-  'base': 'RngProperties',
-  'data': { '*filename': 'str' } }
+{ 'class': 'rng-random',
+  'parent': 'rng-backend',
+  'config': { '*filename': 'str' } }
 
 ##
 # @SevGuestProperties:
@@ -889,7 +899,7 @@
       'qtest':                      'QtestProperties',
       'rng-builtin':                'RngProperties',
       'rng-egd':                    'RngEgdProperties',
-      'rng-random':                 { 'type': 'RngRandomProperties',
+      'rng-random':                 { 'type': 'qom-config:rng-random',
                                       'if': 'CONFIG_POSIX' },
       'secret':                     'SecretProperties',
       'secret_keyring':             { 'type': 'SecretKeyringProperties',
-- 
2.31.1


