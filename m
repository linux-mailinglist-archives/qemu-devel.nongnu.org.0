Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA44C284040
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Oct 2020 22:04:55 +0200 (CEST)
Received: from localhost ([::1]:43100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPWj8-0007qh-WF
	for lists+qemu-devel@lfdr.de; Mon, 05 Oct 2020 16:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kPWXA-0000Ye-Mm
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 15:52:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kPWX8-0007Ag-RF
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 15:52:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601927550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J9cFIk+Ls3+vEaGiGFoJTX4+qIHDM8/wuHqGa3n35Sg=;
 b=Wehg29aU0eLyBnBH4jYIuQKTEbZTnNFf1FK0BoELluSB0R5OgsKiLkfBfjgY0NiMM1yGYi
 fyZwTGtfJLzwFTsiR0zFjdbRIXbx5z9zKZWmY7vyysppdX4LxOPmP4Ww4PcVErb8qyxNRV
 /YwH+0YpUFOswp0O/+NCceh5ZGIiKqI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-lDCc4sshPlCrBfqVtnoE-g-1; Mon, 05 Oct 2020 15:52:27 -0400
X-MC-Unique: lDCc4sshPlCrBfqVtnoE-g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D922018A8231
 for <qemu-devel@nongnu.org>; Mon,  5 Oct 2020 19:52:26 +0000 (UTC)
Received: from scv.redhat.com (ovpn-120-38.rdu2.redhat.com [10.10.120.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4CF2C5C221;
 Mon,  5 Oct 2020 19:52:26 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 18/36] qapi: establish mypy type-checking baseline
Date: Mon,  5 Oct 2020 15:51:40 -0400
Message-Id: <20201005195158.2348217-19-jsnow@redhat.com>
In-Reply-To: <20201005195158.2348217-1-jsnow@redhat.com>
References: <20201005195158.2348217-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/05 02:11:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
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
Cc: Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix two very minor issues, and then establish a mypy type-checking
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
index 74c6b96d391..483b4b68dff 100644
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


