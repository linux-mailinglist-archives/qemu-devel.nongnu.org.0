Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F491402915
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 14:40:31 +0200 (CEST)
Received: from localhost ([::1]:41948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNaOs-00084r-0M
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 08:40:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa8v-000600-2b
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:24:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa8t-00083s-9b
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:24:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631017438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BLGXwvn9DS32kuAfVmPg9C/bCP9HyGaJIFcU+wIqyH0=;
 b=dFXM1Ry1ck4uI4wkdCIoOiF0KdrT3ShQ2WdlFxec9rp9uZVDTUBISYb96tScIEhvAIDkj4
 1GXTjxVH5nx2uxMHtttMWhCzBqmetDuKhrS670BxSOFQm86AUuNq1Kx4sxr4hu69w331XW
 c337cmPu3Uj1WBh6jzuV0AnVVJg8PVA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-HrnmVpIOMxm5LR4uwENq1g-1; Tue, 07 Sep 2021 08:23:56 -0400
X-MC-Unique: HrnmVpIOMxm5LR4uwENq1g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 888426D582
 for <qemu-devel@nongnu.org>; Tue,  7 Sep 2021 12:23:55 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3557E6C8D4;
 Tue,  7 Sep 2021 12:23:39 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [RFC v3 18/32] tests: generate Rust bindings
Date: Tue,  7 Sep 2021 16:19:29 +0400
Message-Id: <20210907121943.3498701-19-marcandre.lureau@redhat.com>
In-Reply-To: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.391, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 stefanha@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 tests/meson.build | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/tests/meson.build b/tests/meson.build
index be95223d62..7292fe20df 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -31,15 +31,29 @@ test_qapi_outputs = [
   'test-qapi-visit.h',
 ]
 
+test_qapi_inputs = files(
+  'qapi-schema/qapi-schema-test.json',
+  'qapi-schema/include/sub-module.json',
+  'qapi-schema/sub-sub-module.json'
+)
+
 test_qapi_files = custom_target('Test QAPI files',
                                 output: test_qapi_outputs,
-                                input: files('qapi-schema/qapi-schema-test.json',
-                                             'qapi-schema/include/sub-module.json',
-                                             'qapi-schema/sub-sub-module.json'),
+                                input: test_qapi_inputs,
                                 command: [ qapi_gen, '-o', meson.current_build_dir(),
                                            '-b', '-p', 'test-', '@INPUT0@' ],
                                 depend_files: qapi_gen_depends)
 
+if with_rust
+  test_qapi_rs_outputs = ['test-qapi-ffi-types.rs']
+  test_qapi_rs = custom_target('Test QAPI Rust binding',
+                               output: test_qapi_rs_outputs,
+                               input: test_qapi_inputs,
+                               command: [ qapi_gen, '-o', meson.current_build_dir(),
+                                          '-r', '-b', '-p', 'test-', '@INPUT0@' ],
+                               depend_files: qapi_gen_depends)
+endif
+
 # meson doesn't like generated output in other directories
 # perhaps change qapi_gen to replace / with _, like Meson itself does?
 subdir('include')
-- 
2.33.0.113.g6c40894d24


