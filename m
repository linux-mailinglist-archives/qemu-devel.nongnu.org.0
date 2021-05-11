Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACF637B168
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 00:10:33 +0200 (CEST)
Received: from localhost ([::1]:53362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgaaG-0007d8-6U
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 18:10:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgaW5-0007NK-UK
 for qemu-devel@nongnu.org; Tue, 11 May 2021 18:06:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgaW1-0006Nd-RB
 for qemu-devel@nongnu.org; Tue, 11 May 2021 18:06:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620770768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Zw/1IFeRgebH6yrdkTw5SelFOgt1TKw/afQTI5DhMA=;
 b=O0ksdT6xIVR9kpF+w/Nip09o9oaalyjN/GD+ajUtqGOpKf4apXH+6QK2O8MqE0U7qoJV29
 2XE4taLUNlhvbu7p8X4MOVNcyosBxDqUOJ3lwD5m8PO1GNafxOGSXtedgsf7PoNnkY+FWC
 685KvdbAlLDEKNAiBsO8NCvSiIBEqY4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-amMImJB_Nf2-hMW46Km4hA-1; Tue, 11 May 2021 18:06:05 -0400
X-MC-Unique: amMImJB_Nf2-hMW46Km4hA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26187101371D;
 Tue, 11 May 2021 22:06:04 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D46360CC9;
 Tue, 11 May 2021 22:06:03 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/21] qapi: Add test for nonexistent schema file
Date: Tue, 11 May 2021 18:05:42 -0400
Message-Id: <20210511220601.2110055-3-jsnow@redhat.com>
In-Reply-To: <20210511220601.2110055-1-jsnow@redhat.com>
References: <20210511220601.2110055-1-jsnow@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This tests the error-return pathway introduced in the previous commit.
(Thanks to Paolo for the help with the Meson magic.)

Signed-off-by: John Snow <jsnow@redhat.com>

---

This went after the previous patch instead of before because prior to
removing the sys.argv[0] bit from QAPISourceInfo, I can't filter the
test to pass the diff. Instead of writing something new to get a better
patch ordering, just add the test after.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qapi-schema/meson.build        | 7 ++++++-
 tests/qapi-schema/missing-schema.err | 1 +
 tests/qapi-schema/missing-schema.out | 0
 3 files changed, 7 insertions(+), 1 deletion(-)
 create mode 100644 tests/qapi-schema/missing-schema.err
 create mode 100644 tests/qapi-schema/missing-schema.out

diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index d7163e6601c..dc448e8f74d 100644
--- a/tests/qapi-schema/meson.build
+++ b/tests/qapi-schema/meson.build
@@ -199,11 +199,16 @@ schemas = [
   'unknown-escape.json',
   'unknown-expr-key.json',
 ]
+schemas = files(schemas)
+
+# Intentionally missing schema file test -- not passed through files():
+schemas += [meson.current_source_dir() / 'missing-schema.json']
 
 # Because people may want to use test-qapi.py from the command line, we
 # are not using the "#! /usr/bin/env python3" trick here.  See
 # docs/devel/build-system.txt
-test('QAPI schema regression tests', python, args: files('test-qapi.py', schemas),
+test('QAPI schema regression tests', python,
+     args: files('test-qapi.py') + schemas,
      env: test_env, suite: ['qapi-schema', 'qapi-frontend'])
 
 diff = find_program('diff')
diff --git a/tests/qapi-schema/missing-schema.err b/tests/qapi-schema/missing-schema.err
new file mode 100644
index 00000000000..b4d9ff1fb2b
--- /dev/null
+++ b/tests/qapi-schema/missing-schema.err
@@ -0,0 +1 @@
+can't read schema file 'missing-schema.json': No such file or directory
diff --git a/tests/qapi-schema/missing-schema.out b/tests/qapi-schema/missing-schema.out
new file mode 100644
index 00000000000..e69de29bb2d
-- 
2.30.2


