Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 448DF274B4A
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 23:42:35 +0200 (CEST)
Received: from localhost ([::1]:39830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKq3W-0004iB-9D
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 17:42:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKpbM-0000wc-NI
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 17:13:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKpbK-00062b-Tt
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 17:13:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600809206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IaMLC8He4A5gFWw6a7qBuxIZ30CJpWYe7mjR0+qBNoE=;
 b=PexYHCGKF1Y3oiJPkneztscLoN2GBvOwV/+wx2/joqA8NfzZ4c/18T9Xs1CVfXMPUkwmGK
 s/ebqiwxfjVpZ7Y+hI1JmMhPoI6bHe1grRcJ3FifDq2PS+I1VoD+P7cwI/SupaLZ6B3q4y
 RZDh3RpcjBA7zSu2HCzZCKlm8sZ7fk8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-RcmKZ5txMiuEt9i31lVobQ-1; Tue, 22 Sep 2020 17:13:24 -0400
X-MC-Unique: RcmKZ5txMiuEt9i31lVobQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D44810BBECA;
 Tue, 22 Sep 2020 21:13:23 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A0518614F5;
 Tue, 22 Sep 2020 21:13:22 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 07/16] qapi/expr.py: Add casts in a few select cases
Date: Tue, 22 Sep 2020 17:13:04 -0400
Message-Id: <20200922211313.4082880-8-jsnow@redhat.com>
In-Reply-To: <20200922211313.4082880-1-jsnow@redhat.com>
References: <20200922211313.4082880-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 15:47:47
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
Cc: Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Casts are instructions to the type checker only, they aren't "safe" and
should probably be avoided in general. In this case, when we perform
type checking on a nested structure, the type of each field does not
"stick".

We don't need to assert that something is a str if we've already checked
that it is -- use a cast instead for these cases.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/expr.py | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 633f9b9172..4a3352a2bd 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -15,7 +15,11 @@
 # See the COPYING file in the top-level directory.
 
 import re
-from typing import MutableMapping, Optional
+from typing import (
+    MutableMapping,
+    Optional,
+    cast,
+)
 
 from .common import c_name
 from .error import QAPISemError
@@ -225,7 +229,7 @@ def check_enum(expr, info):
 
 
 def check_struct(expr, info):
-    name = expr['struct']
+    name = cast(str, expr['struct'])  # Asserted in check_exprs
     members = expr['data']
 
     check_type(members, info, "'data'", allow_dict=name)
@@ -233,7 +237,7 @@ def check_struct(expr, info):
 
 
 def check_union(expr, info):
-    name = expr['union']
+    name = cast(str, expr['union'])  # Asserted in check_exprs
     base = expr.get('base')
     discriminator = expr.get('discriminator')
     members = expr['data']
@@ -330,7 +334,7 @@ def check_exprs(exprs):
         else:
             raise QAPISemError(info, "expression is missing metatype")
 
-        name = expr[meta]
+        name = cast(str, expr[meta])  # asserted right below:
         check_name_is_str(name, info, "'%s'" % meta)
         info.set_defn(meta, name)
         check_defn_name_str(name, info, meta)
-- 
2.26.2


