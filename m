Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74487274D1B
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Sep 2020 01:09:04 +0200 (CEST)
Received: from localhost ([::1]:39220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKrPD-0002nV-IG
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 19:09:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKr2X-00029L-Mn
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 18:45:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKr2F-0000Nq-PI
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 18:45:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600814718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m2wnSuF5Yn/tNOD4ZWZZRfLcSn4kOF5IO4Vklwawc9Q=;
 b=dpfEoXGXweVC930pdCvtswjILO0lDv3ZE++GUY1F6B0gjG7x0ynvjINSYNNZQDwrEShlWK
 sliIKk3ANrSIQx6ACm5BNqPisMbr8uPMoDu1a0+hK7DQM5LwZTIhhh8ZeXNdmudWOkAKii
 PY6zHcNw4xfAhajDAhqva4BzJt0TAgk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-MS1xf-0WPBOleLBo9njFpg-1; Tue, 22 Sep 2020 18:45:17 -0400
X-MC-Unique: MS1xf-0WPBOleLBo9njFpg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 328801074643;
 Tue, 22 Sep 2020 22:45:16 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 63ED55C1A3;
 Tue, 22 Sep 2020 22:45:15 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 08/25] qapi/schema.py: Allow alternate_type to assert
Date: Tue, 22 Sep 2020 18:44:44 -0400
Message-Id: <20200922224501.4087749-9-jsnow@redhat.com>
In-Reply-To: <20200922224501.4087749-1-jsnow@redhat.com>
References: <20200922224501.4087749-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 02:07:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is generally nicer to just let things fail, because it makes the
static type hints less infected with Optional[T], where a future
programmer using the library has to wonder what that means.

Let errors be errors.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/schema.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 15ff441660..a84d8549a4 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -199,7 +199,7 @@ def alternate_qtype(self):
             'boolean': 'QTYPE_QBOOL',
             'object':  'QTYPE_QDICT'
         }
-        return json2qtype.get(self.json_type())
+        return json2qtype[self.json_type()]
 
     def doc_type(self):
         if self.is_implicit():
@@ -480,8 +480,9 @@ def check(self, schema):
         types_seen = {}
         for v in self.variants.variants:
             v.check_clash(self.info, seen)
-            qtype = v.type.alternate_qtype()
-            if not qtype:
+            try:
+                qtype = v.type.alternate_qtype()
+            except KeyError:
                 raise QAPISemError(
                     self.info,
                     "%s cannot use %s"
-- 
2.26.2


