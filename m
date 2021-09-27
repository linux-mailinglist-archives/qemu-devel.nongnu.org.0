Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6384194D2
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 15:09:31 +0200 (CEST)
Received: from localhost ([::1]:49528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUqNu-0005yH-Q5
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 09:09:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mUqLQ-0003DE-T9
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:06:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mUqLO-0003gd-9w
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:06:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632748012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cF+o07LRAGRRT9QN314PSLKg6YT3QVgoYN4lEKrSRHg=;
 b=Hcz+u2cUfvUNAQn3tSlBel4Nm+ix6bgMgXox/YqEhjHsuH34f/MONYPVIEtaPlFpfuvf/7
 b4fGYBuqnF26/EV7+VDi3GEQeX3TkoNMfdxCGU6MeeCfYbA8dCI2pTm1ki6sJ3veHyMC3Z
 2/ZBpzHkb0d+fQacC1G6wJEVhvMGtvE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-mJ7Jk6XHMJOBtS8a-H9oig-1; Mon, 27 Sep 2021 09:06:50 -0400
X-MC-Unique: mJ7Jk6XHMJOBtS8a-H9oig-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18BBC5074E;
 Mon, 27 Sep 2021 13:06:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC04119D9D;
 Mon, 27 Sep 2021 13:06:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 80D071138526; Mon, 27 Sep 2021 15:06:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 04/25] qapi: Convert simple union InputEvent to flat one
Date: Mon, 27 Sep 2021 15:06:26 +0200
Message-Id: <20210927130647.1271533-5-armbru@redhat.com>
In-Reply-To: <20210927130647.1271533-1-armbru@redhat.com>
References: <20210927130647.1271533-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
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
Cc: peter.maydell@linaro.org, Eric Blake <eblake@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simple unions predate flat unions.  Having both complicates the QAPI
schema language and the QAPI generator.  We haven't been using simple
unions in new code for a long time, because they are less flexible and
somewhat awkward on the wire.

To prepare for their removal, convert simple union InputEvent to an
equivalent flat one.  Adds some boilerplate to the schema, which is a
bit ugly, but a lot easier to maintain than the simple union feature.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210917143134.412106-5-armbru@redhat.com>
---
 qapi/ui.json | 42 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 38 insertions(+), 4 deletions(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index 9e04f9d65d..d7567ac866 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -960,6 +960,38 @@
   'data'  : { 'axis'    : 'InputAxis',
               'value'   : 'int' } }
 
+##
+# @InputEventKind:
+#
+# Since: 2.0
+##
+{ 'enum': 'InputEventKind',
+  'data': [ 'key', 'btn', 'rel', 'abs' ] }
+
+##
+# @InputKeyEventWrapper:
+#
+# Since: 2.0
+##
+{ 'struct': 'InputKeyEventWrapper',
+  'data': { 'data': 'InputKeyEvent' } }
+
+##
+# @InputBtnEventWrapper:
+#
+# Since: 2.0
+##
+{ 'struct': 'InputBtnEventWrapper',
+  'data': { 'data': 'InputBtnEvent' } }
+
+##
+# @InputMoveEventWrapper:
+#
+# Since: 2.0
+##
+{ 'struct': 'InputMoveEventWrapper',
+  'data': { 'data': 'InputMoveEvent' } }
+
 ##
 # @InputEvent:
 #
@@ -975,10 +1007,12 @@
 # Since: 2.0
 ##
 { 'union' : 'InputEvent',
-  'data'  : { 'key'     : 'InputKeyEvent',
-              'btn'     : 'InputBtnEvent',
-              'rel'     : 'InputMoveEvent',
-              'abs'     : 'InputMoveEvent' } }
+  'base': { 'type': 'InputEventKind' },
+  'discriminator': 'type',
+  'data'  : { 'key'     : 'InputKeyEventWrapper',
+              'btn'     : 'InputBtnEventWrapper',
+              'rel'     : 'InputMoveEventWrapper',
+              'abs'     : 'InputMoveEventWrapper' } }
 
 ##
 # @input-send-event:
-- 
2.31.1


