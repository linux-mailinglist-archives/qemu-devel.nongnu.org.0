Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4140408CA9
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 15:20:03 +0200 (CEST)
Received: from localhost ([::1]:44968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPlsQ-0006T3-L0
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 09:20:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mPlFV-0000HF-UA
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:39:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mPlFP-0000gV-QD
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:39:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631536783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dUjvvHUOALsBjzM+6DLoOne/rxeDCc8KkvTAsYVKpnE=;
 b=XKDUFa1xhU+5y4HUKNxGe4XorTglSnkxh4vflCmsV0+tlBtNQ6VUJsCKzUHv7mfaYRjdIO
 fS68ZhRkUdi+60RHxAc1iF5QIcgBRZI+32bOKXg3znAbMRhmpXUGtLq2n+EwKpqxlHjOW3
 oQzPujxXXEZpiLJv74JGBGkSSnaDs8U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-HXWr_DzeNae0e9KUCy7RjQ-1; Mon, 13 Sep 2021 08:39:42 -0400
X-MC-Unique: HXWr_DzeNae0e9KUCy7RjQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8271819200C0
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 12:39:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 835B45C25A;
 Mon, 13 Sep 2021 12:39:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 186361138526; Mon, 13 Sep 2021 14:39:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/22] qapi: Convert simple union InputEvent to flat one
Date: Mon, 13 Sep 2021 14:39:14 +0200
Message-Id: <20210913123932.3306639-5-armbru@redhat.com>
In-Reply-To: <20210913123932.3306639-1-armbru@redhat.com>
References: <20210913123932.3306639-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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
Cc: jsnow@redhat.com, eblake@redhat.com, Gerd Hoffmann <kraxel@redhat.com>,
 marcandre.lureau@redhat.com
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
---
 qapi/ui.json | 42 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 38 insertions(+), 4 deletions(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index a6b0dce876..fe10d69431 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -960,6 +960,38 @@
   'data'  : { 'axis'    : 'InputAxis',
               'value'   : 'int' } }
 
+##
+# @InputEventKind:
+#
+# Since: 6.1
+##
+{ 'enum': 'InputEventKind',
+  'data': [ 'key', 'btn', 'rel', 'abs' ] }
+
+##
+# @InputKeyEventWrapper:
+#
+# Since: 6.1
+##
+{ 'struct': 'InputKeyEventWrapper',
+  'data': { 'data': 'InputKeyEvent' } }
+
+##
+# @InputBtnEventWrapper:
+#
+# Since: 6.1
+##
+{ 'struct': 'InputBtnEventWrapper',
+  'data': { 'data': 'InputBtnEvent' } }
+
+##
+# @InputMoveEventWrapper:
+#
+# Since: 6.1
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


