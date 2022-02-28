Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 637634C6A94
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 12:34:46 +0100 (CET)
Received: from localhost ([::1]:51586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOeIe-000437-H8
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 06:34:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nOeAe-00046C-70
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 06:26:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nOeAX-000782-P6
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 06:26:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646047580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AEciAsrZFCKw7eCLaL1HoVu8avXfMjhDXlSqnUIkgmU=;
 b=WjPBaZv9yTxd1+c8BJ+n6wL3JrpTlmLR245hs/Q4ZwmiRvT26Rekb/4oXGAj24YRNSFRYq
 dOwUBhaDM4vFjnInJ0YFBm8KWcVGCUjXmPe+V0ZCoiry8mhOYHrZPSUgyVqL78FZnp+7NC
 HmBI48c83QVqlKpY3HWUVvk0ZPCG7EQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-xDlJxPlzMsWFlenC_MhOzg-1; Mon, 28 Feb 2022 06:26:17 -0500
X-MC-Unique: xDlJxPlzMsWFlenC_MhOzg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B33E801DDB;
 Mon, 28 Feb 2022 11:26:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BAE07554E;
 Mon, 28 Feb 2022 11:26:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C6B0421E6A01; Mon, 28 Feb 2022 12:26:13 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/9] scripts/qapi: minor delinting
Date: Mon, 28 Feb 2022 12:26:05 +0100
Message-Id: <20220228112613.520040-2-armbru@redhat.com>
In-Reply-To: <20220228112613.520040-1-armbru@redhat.com>
References: <20220228112613.520040-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

Get isort and pylint tools passing again.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20220211183650.2946895-1-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
[Comment explaining good-names-rgxs tweaked]
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/commands.py |  2 +-
 scripts/qapi/pylintrc    | 16 ++++++----------
 scripts/qapi/types.py    |  6 +++++-
 scripts/qapi/visit.py    |  6 +++++-
 4 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index 869d799ed2..38ca38a7b9 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -25,8 +25,8 @@
     QAPIGenC,
     QAPISchemaModularCVisitor,
     build_params,
-    ifcontext,
     gen_special_features,
+    ifcontext,
 )
 from .schema import (
     QAPISchema,
diff --git a/scripts/qapi/pylintrc b/scripts/qapi/pylintrc
index b259531a72..a724628203 100644
--- a/scripts/qapi/pylintrc
+++ b/scripts/qapi/pylintrc
@@ -34,16 +34,12 @@ disable=fixme,
 
 [BASIC]
 
-# Good variable names which should always be accepted, separated by a comma.
-good-names=i,
-           j,
-           k,
-           ex,
-           Run,
-           _,
-           fp,  # fp = open(...)
-           fd,  # fd = os.open(...)
-           ch,
+# Good variable names regexes, separated by a comma. If names match any regex,
+# they will always be accepted.
+#
+# Suppress complaints about short names.  PEP-8 is cool with them,
+# and so are we.
+good-names-rgxs=^[_a-z][_a-z0-9]?$
 
 [VARIABLES]
 
diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
index 3013329c24..477d027001 100644
--- a/scripts/qapi/types.py
+++ b/scripts/qapi/types.py
@@ -16,7 +16,11 @@
 from typing import List, Optional
 
 from .common import c_enum_const, c_name, mcgen
-from .gen import QAPISchemaModularCVisitor, gen_special_features, ifcontext
+from .gen import (
+    QAPISchemaModularCVisitor,
+    gen_special_features,
+    ifcontext,
+)
 from .schema import (
     QAPISchema,
     QAPISchemaEnumMember,
diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
index e13bbe4292..380fa197f5 100644
--- a/scripts/qapi/visit.py
+++ b/scripts/qapi/visit.py
@@ -21,7 +21,11 @@
     indent,
     mcgen,
 )
-from .gen import QAPISchemaModularCVisitor, gen_special_features, ifcontext
+from .gen import (
+    QAPISchemaModularCVisitor,
+    gen_special_features,
+    ifcontext,
+)
 from .schema import (
     QAPISchema,
     QAPISchemaEnumMember,
-- 
2.35.1


