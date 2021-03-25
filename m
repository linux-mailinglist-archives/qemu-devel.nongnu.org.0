Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0EE3488DE
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 07:17:50 +0100 (CET)
Received: from localhost ([::1]:50374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPJJV-0002LH-3E
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 02:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPJ6N-0002FO-KI
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 02:04:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPJ6L-0008Qf-UF
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 02:04:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616652253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MTcs+o8bFClbnyDq0anB2OcQJj/dqwkc6Wzwv++081A=;
 b=g6ldBjEgCAL9LHbST7HNtCUfWoTtE2mjmoSnucANjpo9jNSkXfKCOHY6VikHPGTYj71nub
 RAYOAdDRYsq7BjiX0huI5f443PBEy4qbuz8Ry4ikEPe/CviT5BbEEYfvpiNlJmTndbUhLt
 DGJBUMqw2s1+PGR0noJLrULxPni/BjM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-cJUYkuoOOgasalC0RLjIVw-1; Thu, 25 Mar 2021 02:04:10 -0400
X-MC-Unique: cJUYkuoOOgasalC0RLjIVw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05C5085EE8B;
 Thu, 25 Mar 2021 06:04:10 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 60967866C7;
 Thu, 25 Mar 2021 06:04:09 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v4 09/19] qapi/expr.py: Check type of 'data' member
Date: Thu, 25 Mar 2021 02:03:46 -0400
Message-Id: <20210325060356.4040114-10-jsnow@redhat.com>
In-Reply-To: <20210325060356.4040114-1-jsnow@redhat.com>
References: <20210325060356.4040114-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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

We don't actually check, so the user can get some unpleasant stacktraces.
Formalize it.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/expr.py                              | 7 +++++++
 tests/qapi-schema/alternate-invalid-data-type.err | 2 ++
 tests/qapi-schema/union-invalid-data-type.err     | 2 ++
 3 files changed, 11 insertions(+)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 73e7d8cb0d..ca5ab7bfda 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -281,6 +281,9 @@ def check_union(expr, info):
             raise QAPISemError(info, "'discriminator' requires 'base'")
         check_name_is_str(discriminator, info, "'discriminator'")
 
+    if not isinstance(members, dict):
+        raise QAPISemError(info, "'data' must be an object")
+
     for (key, value) in members.items():
         source = "'data' member '%s'" % key
         if discriminator is None:
@@ -296,6 +299,10 @@ def check_alternate(expr, info):
 
     if not members:
         raise QAPISemError(info, "'data' must not be empty")
+
+    if not isinstance(members, dict):
+        raise QAPISemError(info, "'data' must be an object")
+
     for (key, value) in members.items():
         source = "'data' member '%s'" % key
         check_name_lower(key, info, source)
diff --git a/tests/qapi-schema/alternate-invalid-data-type.err b/tests/qapi-schema/alternate-invalid-data-type.err
index e69de29bb2..c7301ccb00 100644
--- a/tests/qapi-schema/alternate-invalid-data-type.err
+++ b/tests/qapi-schema/alternate-invalid-data-type.err
@@ -0,0 +1,2 @@
+alternate-invalid-data-type.json: In alternate 'Alt':
+alternate-invalid-data-type.json:2: 'data' must be an object
diff --git a/tests/qapi-schema/union-invalid-data-type.err b/tests/qapi-schema/union-invalid-data-type.err
index e69de29bb2..b71c3400c5 100644
--- a/tests/qapi-schema/union-invalid-data-type.err
+++ b/tests/qapi-schema/union-invalid-data-type.err
@@ -0,0 +1,2 @@
+union-invalid-data-type.json: In union 'TestUnion':
+union-invalid-data-type.json:9: 'data' must be an object
-- 
2.30.2


