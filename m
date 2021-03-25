Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC773488E0
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 07:18:01 +0100 (CET)
Received: from localhost ([::1]:51012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPJJg-0002bC-BE
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 02:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPJ6M-0002Dd-Mr
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 02:04:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPJ6K-0008QT-Ud
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 02:04:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616652252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8SNUZmla9aQCG2+1/B1ldVak0N1SDNJTYTjIkq5pNrM=;
 b=eZLs4i8xIQnh2u+1ueqAwdeMzFJl8glTs3SNSyNY/5TDmLuXygeVdkDP6dkk3jt83DpBDb
 35NuIObMwtGz/LOj5u1s30cqT+BWGs6cYTkwVigHSiQMqSDDR60T/B+w2zgUqDCtAyu+YF
 enc106IFlABv9oDW82IvC3Iva34Z5Q4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-kuDvg5fjM0afaHHflBEjBw-1; Thu, 25 Mar 2021 02:04:10 -0400
X-MC-Unique: kuDvg5fjM0afaHHflBEjBw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F1F9190B2A1;
 Thu, 25 Mar 2021 06:04:09 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89E76866C7;
 Thu, 25 Mar 2021 06:04:06 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v4 08/19] qapi: add tests for invalid 'data' field type
Date: Thu, 25 Mar 2021 02:03:45 -0400
Message-Id: <20210325060356.4040114-9-jsnow@redhat.com>
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

It needs to be an object (dict), not anything else.

Signed-off-by: John Snow <jsnow@redhat.com>

---

Note: this actually doesn't ... work, but on-list, we discussed wanting
tests first, then the fix. That can't happen here, because QAPI crashes
at runtime. So uh, just squash this into the following patch, I guess?

I tried.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qapi-schema/alternate-invalid-data-type.err  |  0
 tests/qapi-schema/alternate-invalid-data-type.json |  4 ++++
 tests/qapi-schema/alternate-invalid-data-type.out  |  0
 tests/qapi-schema/meson.build                      |  2 ++
 tests/qapi-schema/union-invalid-data-type.err      |  0
 tests/qapi-schema/union-invalid-data-type.json     | 13 +++++++++++++
 tests/qapi-schema/union-invalid-data-type.out      |  0
 7 files changed, 19 insertions(+)
 create mode 100644 tests/qapi-schema/alternate-invalid-data-type.err
 create mode 100644 tests/qapi-schema/alternate-invalid-data-type.json
 create mode 100644 tests/qapi-schema/alternate-invalid-data-type.out
 create mode 100644 tests/qapi-schema/union-invalid-data-type.err
 create mode 100644 tests/qapi-schema/union-invalid-data-type.json
 create mode 100644 tests/qapi-schema/union-invalid-data-type.out

diff --git a/tests/qapi-schema/alternate-invalid-data-type.err b/tests/qapi-schema/alternate-invalid-data-type.err
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/alternate-invalid-data-type.json b/tests/qapi-schema/alternate-invalid-data-type.json
new file mode 100644
index 0000000000..7d5d905581
--- /dev/null
+++ b/tests/qapi-schema/alternate-invalid-data-type.json
@@ -0,0 +1,4 @@
+# Alternate type requires an object for 'data'
+{ 'alternate': 'Alt',
+  'data': ['rubbish', 'nonsense']
+}
diff --git a/tests/qapi-schema/alternate-invalid-data-type.out b/tests/qapi-schema/alternate-invalid-data-type.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index 8ba6917132..cc5b136cfb 100644
--- a/tests/qapi-schema/meson.build
+++ b/tests/qapi-schema/meson.build
@@ -15,6 +15,7 @@ schemas = [
   'alternate-conflict-bool-string.json',
   'alternate-conflict-num-string.json',
   'alternate-empty.json',
+  'alternate-invalid-data-type.json',
   'alternate-invalid-dict.json',
   'alternate-nested.json',
   'alternate-unknown.json',
@@ -192,6 +193,7 @@ schemas = [
   'union-clash-branches.json',
   'union-empty.json',
   'union-invalid-base.json',
+  'union-invalid-data-type.json',
   'union-optional-branch.json',
   'union-unknown.json',
   'unknown-escape.json',
diff --git a/tests/qapi-schema/union-invalid-data-type.err b/tests/qapi-schema/union-invalid-data-type.err
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/union-invalid-data-type.json b/tests/qapi-schema/union-invalid-data-type.json
new file mode 100644
index 0000000000..5a32d267bf
--- /dev/null
+++ b/tests/qapi-schema/union-invalid-data-type.json
@@ -0,0 +1,13 @@
+# the union data type must be an object.
+
+{ 'struct': 'TestTypeA',
+  'data': { 'string': 'str' } }
+
+{ 'struct': 'TestTypeB',
+  'data': { 'integer': 'int' } }
+
+{ 'union': 'TestUnion',
+  'base': 'int',
+  'discriminator': 'int',
+  'data': ['TestTypeA', 'TestTypeB']
+}
diff --git a/tests/qapi-schema/union-invalid-data-type.out b/tests/qapi-schema/union-invalid-data-type.out
new file mode 100644
index 0000000000..e69de29bb2
-- 
2.30.2


