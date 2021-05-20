Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9509638B5A5
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 19:58:42 +0200 (CEST)
Received: from localhost ([::1]:51008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljmwT-00034P-Mi
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 13:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljmrQ-0002pQ-GZ
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:53:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljmr1-0006aO-AV
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:53:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621533181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TTSBUHyyZ4C9VH87or9MiGZwdNubQ0xMg/dYqRxpjps=;
 b=AhbSqaqO1DTg3zOWc4Zl0eNyfru10Jfi+YJ8mnW0MUGOpoqPcwGvUVS9UevcTWotl6T09l
 9X11tNekbv8/+d/ROnnd7Era5Uilvlqo1qw+KqS224wq8QTFgMUUVIinfWVp/+rDhNHrYu
 1ZvL4SVTSOAQ8Sfajr6wIChKm6pg2UI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-hG6Mie6FPG2dMtuhmEajYw-1; Thu, 20 May 2021 13:52:58 -0400
X-MC-Unique: hG6Mie6FPG2dMtuhmEajYw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB74F800D62;
 Thu, 20 May 2021 17:52:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A9A219C59;
 Thu, 20 May 2021 17:52:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3BA101138529; Thu, 20 May 2021 19:52:56 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/15] qapi: Add test for nonexistent schema file
Date: Thu, 20 May 2021 19:52:43 +0200
Message-Id: <20210520175256.1119684-3-armbru@redhat.com>
In-Reply-To: <20210520175256.1119684-1-armbru@redhat.com>
References: <20210520175256.1119684-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

This tests the error-return pathway introduced in the previous commit.
(Thanks to Paolo for the help with the Meson magic.)

Signed-off-by: John Snow <jsnow@redhat.com>

Message-Id: <20210519183951.3946870-3-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 tests/qapi-schema/meson.build        | 7 ++++++-
 tests/qapi-schema/missing-schema.err | 1 +
 tests/qapi-schema/missing-schema.out | 0
 3 files changed, 7 insertions(+), 1 deletion(-)
 create mode 100644 tests/qapi-schema/missing-schema.err
 create mode 100644 tests/qapi-schema/missing-schema.out

diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index d7163e6601..dc448e8f74 100644
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
index 0000000000..b4d9ff1fb2
--- /dev/null
+++ b/tests/qapi-schema/missing-schema.err
@@ -0,0 +1 @@
+can't read schema file 'missing-schema.json': No such file or directory
diff --git a/tests/qapi-schema/missing-schema.out b/tests/qapi-schema/missing-schema.out
new file mode 100644
index 0000000000..e69de29bb2
-- 
2.26.3


