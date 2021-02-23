Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0C6322323
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 01:36:34 +0100 (CET)
Received: from localhost ([::1]:56016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lELgn-0001Lj-Br
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 19:36:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lELfG-00006s-0F
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 19:34:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lELea-0005Lz-NG
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 19:34:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614040453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sKZiJW6GuHyZD8p1WWoYBotzIQzpfojZ9d8hks1jFBM=;
 b=Kz8t4YGOFzK8gZZjz4nwohVG/31chRIkd9n7IZieCuaccrZOUnJ5ELpxoLE6SBuSaeGBOt
 4KKZUA+dHO4KVQ03Zl7668Lu66S0IgtQlRS2Z0y8e8AcHVtKH7ezU22OY2qhXz3mi6awuZ
 gD/cnuT0ONx7I2jrnZf+oimSz1f+Af0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-eVrn8c4ZP9-xoxgTXdwqcA-1; Mon, 22 Feb 2021 19:34:11 -0500
X-MC-Unique: eVrn8c4ZP9-xoxgTXdwqcA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63C46107ACE3;
 Tue, 23 Feb 2021 00:34:10 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A7DA85D6D5;
 Tue, 23 Feb 2021 00:34:09 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v3 01/16] qapi/expr.py: Remove 'info' argument from nested
 check_if_str
Date: Mon, 22 Feb 2021 19:33:53 -0500
Message-Id: <20210223003408.964543-2-jsnow@redhat.com>
In-Reply-To: <20210223003408.964543-1-jsnow@redhat.com>
References: <20210223003408.964543-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The function can just use the argument from the scope above. Otherwise,
we get shadowed argument errors because the parameter name clashes with
the name of a variable already in-scope.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
---
 scripts/qapi/expr.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 2fcaaa2497a..35695c4c653 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -104,7 +104,7 @@ def check_flags(expr, info):
 
 def check_if(expr, info, source):
 
-    def check_if_str(ifcond, info):
+    def check_if_str(ifcond):
         if not isinstance(ifcond, str):
             raise QAPISemError(
                 info,
@@ -124,9 +124,9 @@ def check_if_str(ifcond, info):
             raise QAPISemError(
                 info, "'if' condition [] of %s is useless" % source)
         for elt in ifcond:
-            check_if_str(elt, info)
+            check_if_str(elt)
     else:
-        check_if_str(ifcond, info)
+        check_if_str(ifcond)
         expr['if'] = [ifcond]
 
 
-- 
2.29.2


