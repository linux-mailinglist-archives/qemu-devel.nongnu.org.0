Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5317930E8CF
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 01:46:30 +0100 (CET)
Received: from localhost ([::1]:33840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Smr-0005Yo-Ql
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 19:46:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l7SZP-0001EE-8q
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 19:32:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l7SZE-0000cb-Mj
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 19:32:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612398736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JxItRlDjeE03aSUCdeoWAjl1xlJSCd+Z/KaGv7sl7LY=;
 b=IQQUDS7SAZuP7PIjqluv8kuObNAliGBNAJ4G9dBdtFRZmq9AY9b3hVKBNLDg3djH8CHW7H
 yj/0gUHIt9m6C7WLF9HZJZ8Grp5/apD+AQkx3MXFFX0hyTkwoJJtwQHl7+7ZNbzMqri+zH
 SSQfLGWMHdqDDsafPRuvGwQW9KfsagI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-0CBbiY3PN_2onTNaLTfyyQ-1; Wed, 03 Feb 2021 19:32:14 -0500
X-MC-Unique: 0CBbiY3PN_2onTNaLTfyyQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC09F108C279
 for <qemu-devel@nongnu.org>; Thu,  4 Feb 2021 00:32:13 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F40E100AE4E;
 Thu,  4 Feb 2021 00:32:13 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v5 07/15] qapi/introspect.py: Always define all 'extra' dict
 keys
Date: Wed,  3 Feb 2021 19:31:59 -0500
Message-Id: <20210204003207.2856909-8-jsnow@redhat.com>
In-Reply-To: <20210204003207.2856909-1-jsnow@redhat.com>
References: <20210204003207.2856909-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This mimics how a typed object works, where 'if' and 'comment' are
always set, regardless of if they have a value set or not.

It is safe to do this because of the way that _tree_to_qlit processes
these values (using dict.get with a default of None), resulting in no
change of output from _tree_to_qlit. There are no other users of this
data.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/introspect.py | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index 1655a21f85b..45231d2abc3 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -27,11 +27,10 @@
 
 
 def _make_tree(obj, ifcond, comment=None):
-    extra = {}
-    if ifcond:
-        extra['if'] = ifcond
-    if comment:
-        extra['comment'] = comment
+    extra = {
+        'if': ifcond,
+        'comment': comment
+    }
     return (obj, extra)
 
 
-- 
2.29.2


