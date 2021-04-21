Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6378B3672A8
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 20:36:23 +0200 (CEST)
Received: from localhost ([::1]:43216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZHi2-0006FB-9v
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 14:36:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZHTJ-0002hJ-4u
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 14:21:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZHT7-0003jY-00
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 14:21:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619029255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lAZJWjn6qIiJlGU42F4AjtMi1UkABtd+1JMLsAvxGYc=;
 b=RLZiXJFzlvWSDhLh8eQ7ceEg0ezesRoCboFD1d3F9AW1Aq3vjEfJXeRr3SDToeiyzNlBFq
 aVPdhro95BNegfjv2sUa+ar+l9ggiItPCfq+95EDgK2sG9VZMDR4l9SllNCvzCZ/pT+9ap
 1c6Oso1VcecNDCg1EWaQ7O6cwJW79uU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-hxQp30x5MhOBAmpXnUAbmw-1; Wed, 21 Apr 2021 14:20:54 -0400
X-MC-Unique: hxQp30x5MhOBAmpXnUAbmw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D55718B613D;
 Wed, 21 Apr 2021 18:20:53 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-152.rdu2.redhat.com [10.10.118.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4FDBA19702;
 Wed, 21 Apr 2021 18:20:52 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v5 14/17] qapi/expr: Only explicitly prohibit 'Kind' nor
 'List' for type names
Date: Wed, 21 Apr 2021 14:20:29 -0400
Message-Id: <20210421182032.3521476-15-jsnow@redhat.com>
In-Reply-To: <20210421182032.3521476-1-jsnow@redhat.com>
References: <20210421182032.3521476-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per list review: qapi-code-gen.txt reserves suffixes Kind and
List only for type names, but the code rejects them for events and
commands, too.

It turns out we reject them earlier anyway: In check_name_upper() for
event names, and in check_name_lower() for command names.

Still, adjust the code for clarity over what precisely we are guarding
against.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/expr.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 5e4d5f80aa7..c33caf00d91 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -95,9 +95,9 @@ def check_defn_name_str(name: str, info: QAPISourceInfo, meta: str) -> None:
             permit_underscore=name in info.pragma.command_name_exceptions)
     else:
         check_name_camel(name, info, meta)
-    if name.endswith('Kind') or name.endswith('List'):
-        raise QAPISemError(
-            info, "%s name should not end in '%s'" % (meta, name[-4:]))
+        if name.endswith('Kind') or name.endswith('List'):
+            raise QAPISemError(
+                info, "%s name should not end in '%s'" % (meta, name[-4:]))
 
 
 def check_keys(value: _JSONObject,
-- 
2.30.2


