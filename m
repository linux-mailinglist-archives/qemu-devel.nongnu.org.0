Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6274288EDE
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Oct 2020 18:29:31 +0200 (CEST)
Received: from localhost ([::1]:39096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQvGs-0002y8-VI
	for lists+qemu-devel@lfdr.de; Fri, 09 Oct 2020 12:29:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kQv4M-0004FB-6L
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 12:16:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kQv4G-0003I7-O1
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 12:16:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602260187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Fn4rIHXn3Ht1c7QtZt675CfXyCqWkqF59QFD/ZJ1fw=;
 b=CHWW78L2yVRKyyERs3DEdWk8zBKZ0nolDJn79Ea+N4zgnjRNSGCkHlBslo4SMtaTdo470k
 JtQ++UMX6B7PqdUpigt0E+NAtUvATj0eVxVYoGyxkXF8HFD8yA83iLRJVGWc5q3Dc2WDY7
 1oBa8KXY7JsZVjRTCRvyvzguLVv56BM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-bFpI92mBPmyIy1C6_AxBNw-1; Fri, 09 Oct 2020 12:16:26 -0400
X-MC-Unique: bFpI92mBPmyIy1C6_AxBNw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D6B91074641;
 Fri,  9 Oct 2020 16:16:25 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-203.rdu2.redhat.com [10.10.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C43441A92D;
 Fri,  9 Oct 2020 16:16:23 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 18/36] qapi: establish mypy type-checking baseline
Date: Fri,  9 Oct 2020 12:15:40 -0400
Message-Id: <20201009161558.107041-19-jsnow@redhat.com>
In-Reply-To: <20201009161558.107041-1-jsnow@redhat.com>
References: <20201009161558.107041-1-jsnow@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/09 02:34:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix a minor typing issue, and then establish a mypy type-checking
baseline.

Like pylint, this should be run from the folder above:

 > mypy --config-file=qapi/mypy.ini qapi/

This is designed and tested for mypy 0.770 or greater.

Signed-off-by: John Snow <jsnow@redhat.com>
Tested-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>
---
 scripts/qapi/mypy.ini  | 60 ++++++++++++++++++++++++++++++++++++++++++
 scripts/qapi/schema.py |  3 ++-
 2 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 scripts/qapi/mypy.ini

diff --git a/scripts/qapi/mypy.ini b/scripts/qapi/mypy.ini
new file mode 100644
index 00000000000..00fac15dc6e
--- /dev/null
+++ b/scripts/qapi/mypy.ini
@@ -0,0 +1,60 @@
+[mypy]
+strict = True
+strict_optional = False
+disallow_untyped_calls = False
+python_version = 3.6
+
+[mypy-qapi.commands]
+disallow_untyped_defs = False
+disallow_incomplete_defs = False
+check_untyped_defs = False
+
+[mypy-qapi.error]
+disallow_untyped_defs = False
+disallow_incomplete_defs = False
+check_untyped_defs = False
+
+[mypy-qapi.events]
+disallow_untyped_defs = False
+disallow_incomplete_defs = False
+check_untyped_defs = False
+
+[mypy-qapi.expr]
+disallow_untyped_defs = False
+disallow_incomplete_defs = False
+check_untyped_defs = False
+
+[mypy-qapi.gen]
+disallow_untyped_defs = False
+disallow_incomplete_defs = False
+check_untyped_defs = False
+
+[mypy-qapi.introspect]
+disallow_untyped_defs = False
+disallow_incomplete_defs = False
+check_untyped_defs = False
+
+[mypy-qapi.parser]
+disallow_untyped_defs = False
+disallow_incomplete_defs = False
+check_untyped_defs = False
+
+[mypy-qapi.schema]
+disallow_untyped_defs = False
+disallow_incomplete_defs = False
+check_untyped_defs = False
+
+[mypy-qapi.source]
+disallow_untyped_defs = False
+disallow_incomplete_defs = False
+check_untyped_defs = False
+
+[mypy-qapi.types]
+disallow_untyped_defs = False
+disallow_incomplete_defs = False
+check_untyped_defs = False
+
+[mypy-qapi.visit]
+disallow_untyped_defs = False
+disallow_incomplete_defs = False
+check_untyped_defs = False
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 7c015929569..720449feee4 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -17,6 +17,7 @@
 from collections import OrderedDict
 import os
 import re
+from typing import Optional
 
 from .common import POINTER_SUFFIX, c_name
 from .error import QAPIError, QAPISemError
@@ -25,7 +26,7 @@
 
 
 class QAPISchemaEntity:
-    meta = None
+    meta: Optional[str] = None
 
     def __init__(self, name, info, doc, ifcond=None, features=None):
         assert name is None or isinstance(name, str)
-- 
2.26.2


