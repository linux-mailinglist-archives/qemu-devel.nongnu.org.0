Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB3444AFDB
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 15:58:19 +0100 (CET)
Received: from localhost ([::1]:51710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkSZm-0006Iq-7z
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 09:58:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mkSXk-00056S-Ql
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 09:56:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mkSXh-0006b1-3b
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 09:56:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636469768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7i99KTWpDNfnzH7BbyOVHQaN5Pm+MSYuYIskhb1p7sI=;
 b=TByOj7dHJGnRa67JhLlMvzY79fTl66ytOpL7o9kvsb4Zy0sghs03tntXiWmctc5K7wSxi+
 xe7OxCebdJOfbYHnxzV0KPyJ15BU36pWuidyY9KkVZUnUyPUrBf3d0kkKQjpT67WbITJTv
 CuKY4jd5XgUwBibGv7lYk7h2KIhJ4n4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-nbSF466oOViGHGRtVzbtvg-1; Tue, 09 Nov 2021 09:56:04 -0500
X-MC-Unique: nbSF466oOViGHGRtVzbtvg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C09F810144E3;
 Tue,  9 Nov 2021 14:56:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E094757CB9;
 Tue,  9 Nov 2021 14:56:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 89BE211380A7; Tue,  9 Nov 2021 15:55:59 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qapi: Belatedly mark unstable QMP parts with feature
 'unstable'
Date: Tue,  9 Nov 2021 15:55:59 +0100
Message-Id: <20211109145559.2122827-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: eblake@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The work in merge commit e86e00a2493 lacks special feature flag
'unstable', because it raced with it.  Add it where it's missing.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/machine.json | 54 +++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 45 insertions(+), 9 deletions(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index 17794ef681..067e3f5378 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1417,107 +1417,143 @@
 #
 # Query interrupt statistics
 #
+# Features:
+# @unstable: This command is meant for debugging.
+#
 # Returns: interrupt statistics
 #
 # Since: 6.2
 ##
 { 'command': 'x-query-irq',
-  'returns': 'HumanReadableText' }
+  'returns': 'HumanReadableText',
+  'features': [ 'unstable' ] }
 
 ##
 # @x-query-jit:
 #
 # Query TCG compiler statistics
 #
+# Features:
+# @unstable: This command is meant for debugging.
+#
 # Returns: TCG compiler statistics
 #
 # Since: 6.2
 ##
 { 'command': 'x-query-jit',
   'returns': 'HumanReadableText',
-  'if': 'CONFIG_TCG' }
+  'if': 'CONFIG_TCG',
+  'features': [ 'unstable' ] }
 
 ##
 # @x-query-numa:
 #
 # Query NUMA topology information
 #
+# Features:
+# @unstable: This command is meant for debugging.
+#
 # Returns: topology information
 #
 # Since: 6.2
 ##
 { 'command': 'x-query-numa',
-  'returns': 'HumanReadableText' }
+  'returns': 'HumanReadableText',
+  'features': [ 'unstable' ] }
 
 ##
 # @x-query-opcount:
 #
 # Query TCG opcode counters
 #
+# Features:
+# @unstable: This command is meant for debugging.
+#
 # Returns: TCG opcode counters
 #
 # Since: 6.2
 ##
 { 'command': 'x-query-opcount',
   'returns': 'HumanReadableText',
-  'if': 'CONFIG_TCG' }
+  'if': 'CONFIG_TCG',
+  'features': [ 'unstable' ] }
 
 ##
 # @x-query-profile:
 #
 # Query TCG profiling information
 #
+# Features:
+# @unstable: This command is meant for debugging.
+#
 # Returns: profile information
 #
 # Since: 6.2
 ##
 { 'command': 'x-query-profile',
-  'returns': 'HumanReadableText' }
+  'returns': 'HumanReadableText',
+  'features': [ 'unstable' ] }
 
 ##
 # @x-query-ramblock:
 #
 # Query system ramblock information
 #
+# Features:
+# @unstable: This command is meant for debugging.
+#
 # Returns: system ramblock information
 #
 # Since: 6.2
 ##
 { 'command': 'x-query-ramblock',
-  'returns': 'HumanReadableText' }
+  'returns': 'HumanReadableText',
+  'features': [ 'unstable' ] }
 
 ##
 # @x-query-rdma:
 #
 # Query RDMA state
 #
+# Features:
+# @unstable: This command is meant for debugging.
+#
 # Returns: RDMA state
 #
 # Since: 6.2
 ##
 { 'command': 'x-query-rdma',
-  'returns': 'HumanReadableText' }
+  'returns': 'HumanReadableText',
+  'features': [ 'unstable' ] }
 
 ##
 # @x-query-roms:
 #
 # Query information on the registered ROMS
 #
+# Features:
+# @unstable: This command is meant for debugging.
+#
 # Returns: registered ROMs
 #
 # Since: 6.2
 ##
 { 'command': 'x-query-roms',
-  'returns': 'HumanReadableText' }
+  'returns': 'HumanReadableText',
+  'features': [ 'unstable' ] }
 
 ##
 # @x-query-usb:
 #
 # Query information on the USB devices
 #
+# Features:
+# @unstable: This command is meant for debugging.
+#
 # Returns: USB device information
 #
 # Since: 6.2
 ##
 { 'command': 'x-query-usb',
-  'returns': 'HumanReadableText' }
+  'returns': 'HumanReadableText',
+  'features': [ 'unstable' ] }
-- 
2.31.1


