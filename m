Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B1743CE8F
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 18:18:09 +0200 (CEST)
Received: from localhost ([::1]:40602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mflcv-0001TE-02
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 12:18:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfl6K-000509-DZ
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:44:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfl6G-00044v-Ur
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:44:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635349464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KL956w+yp3eR386KeAsK0GFBU7bupGQLvSnSu6w2Ivw=;
 b=VISPBUHTBz65SAdCQiQ5ymus05uIzU685tVttq4UVSlLXsMN5GugJPcn+CX8RSxOQslqP1
 truS2fwQQ3nc8YkgMpmD0ya1zi73bqAA4Rno5BN9v5jC/UX4Y1S3kxnGHCsKJPDvba8yAy
 55JYumtME/HBuVzBHuwSi2JBWKgdbdk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-MRiciOYGPKOo1zh4m4nXdw-1; Wed, 27 Oct 2021 11:44:20 -0400
X-MC-Unique: MRiciOYGPKOo1zh4m4nXdw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2BC2100CCC5;
 Wed, 27 Oct 2021 15:44:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 819B26A904;
 Wed, 27 Oct 2021 15:44:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 19F9A11380AA; Wed, 27 Oct 2021 17:44:07 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/5] qapi: Improve input_type_enum()'s error message
Date: Wed, 27 Oct 2021 17:44:03 +0200
Message-Id: <20211027154407.214122-2-armbru@redhat.com>
In-Reply-To: <20211027154407.214122-1-armbru@redhat.com>
References: <20211027154407.214122-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The error message claims the parameter is invalid:

    $ qemu-system-x86_64 -object qom-type=nonexistent
    qemu-system-x86_64: -object qom-type=nonexistent: Invalid parameter 'nonexistent'

What's wrong is actually the *value* 'nonexistent'.  Improve the
message to

    qemu-system-x86_64: -object qom-type=nonexistent: Parameter 'qom-type' does not accept value 'nonexistent'

Fixes: https://gitlab.com/qemu-project/qemu/-/issues/608
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211020180231.434071-1-armbru@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/qapi-visit-core.c          | 3 ++-
 tests/unit/check-qom-proplist.c | 2 +-
 tests/qemu-iotests/049.out      | 6 +++---
 tests/qemu-iotests/206.out      | 2 +-
 tests/qemu-iotests/237.out      | 6 +++---
 tests/qemu-iotests/245          | 2 +-
 tests/qemu-iotests/287          | 2 +-
 tests/qemu-iotests/308          | 2 +-
 8 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/qapi/qapi-visit-core.c b/qapi/qapi-visit-core.c
index a641adec51..7310f0a0ca 100644
--- a/qapi/qapi-visit-core.c
+++ b/qapi/qapi-visit-core.c
@@ -392,7 +392,8 @@ static bool input_type_enum(Visitor *v, const char *name, int *obj,
 
     value = qapi_enum_parse(lookup, enum_str, -1, NULL);
     if (value < 0) {
-        error_setg(errp, QERR_INVALID_PARAMETER, enum_str);
+        error_setg(errp, "Parameter '%s' does not accept value '%s'",
+                   name ? name : "null", enum_str);
         g_free(enum_str);
         return false;
     }
diff --git a/tests/unit/check-qom-proplist.c b/tests/unit/check-qom-proplist.c
index 48503e0dff..ed341088d3 100644
--- a/tests/unit/check-qom-proplist.c
+++ b/tests/unit/check-qom-proplist.c
@@ -488,7 +488,7 @@ static void test_dummy_badenum(void)
     g_assert(dobj == NULL);
     g_assert(err != NULL);
     g_assert_cmpstr(error_get_pretty(err), ==,
-                    "Invalid parameter 'yeti'");
+                    "Parameter 'av' does not accept value 'yeti'");
 
     g_assert(object_resolve_path_component(parent, "dummy0")
              == NULL);
diff --git a/tests/qemu-iotests/049.out b/tests/qemu-iotests/049.out
index 01f7b1f240..8719c91b48 100644
--- a/tests/qemu-iotests/049.out
+++ b/tests/qemu-iotests/049.out
@@ -174,11 +174,11 @@ Formatting 'TEST_DIR/t.qcow2', fmt=qcow2 cluster_size=65536 extended_l2=off comp
 
 qemu-img create -f qcow2 -o compat=0.42 TEST_DIR/t.qcow2 64M
 Formatting 'TEST_DIR/t.qcow2', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=67108864 compat=0.42 lazy_refcounts=off refcount_bits=16
-qemu-img: TEST_DIR/t.qcow2: Invalid parameter '0.42'
+qemu-img: TEST_DIR/t.qcow2: Parameter 'version' does not accept value '0.42'
 
 qemu-img create -f qcow2 -o compat=foobar TEST_DIR/t.qcow2 64M
 Formatting 'TEST_DIR/t.qcow2', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=67108864 compat=foobar lazy_refcounts=off refcount_bits=16
-qemu-img: TEST_DIR/t.qcow2: Invalid parameter 'foobar'
+qemu-img: TEST_DIR/t.qcow2: Parameter 'version' does not accept value 'foobar'
 
 == Check preallocation option ==
 
@@ -190,7 +190,7 @@ Formatting 'TEST_DIR/t.qcow2', fmt=qcow2 cluster_size=65536 extended_l2=off prea
 
 qemu-img create -f qcow2 -o preallocation=1234 TEST_DIR/t.qcow2 64M
 Formatting 'TEST_DIR/t.qcow2', fmt=qcow2 cluster_size=65536 extended_l2=off preallocation=1234 compression_type=zlib size=67108864 lazy_refcounts=off refcount_bits=16
-qemu-img: TEST_DIR/t.qcow2: Invalid parameter '1234'
+qemu-img: TEST_DIR/t.qcow2: Parameter 'preallocation' does not accept value '1234'
 
 == Check encryption option ==
 
diff --git a/tests/qemu-iotests/206.out b/tests/qemu-iotests/206.out
index b68c443867..3593e8e9c2 100644
--- a/tests/qemu-iotests/206.out
+++ b/tests/qemu-iotests/206.out
@@ -192,7 +192,7 @@ Job failed: Could not resize image: Failed to grow the L1 table: File too large
 
 === Invalid version ===
 {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": {"driver": "qcow2", "file": "node0", "size": 67108864, "version": "v1"}}}
-{"error": {"class": "GenericError", "desc": "Invalid parameter 'v1'"}}
+{"error": {"class": "GenericError", "desc": "Parameter 'version' does not accept value 'v1'"}}
 
 {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": {"driver": "qcow2", "file": "node0", "lazy-refcounts": true, "size": 67108864, "version": "v2"}}}
 {"return": {}}
diff --git a/tests/qemu-iotests/237.out b/tests/qemu-iotests/237.out
index aa94986803..2f09ff5512 100644
--- a/tests/qemu-iotests/237.out
+++ b/tests/qemu-iotests/237.out
@@ -116,13 +116,13 @@ Job failed: Cannot find device='this doesn't exist' nor node-name='this doesn't
 == Invalid adapter types ==
 
 {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": {"adapter-type": "foo", "driver": "vmdk", "file": "node0", "size": 33554432}}}
-{"error": {"class": "GenericError", "desc": "Invalid parameter 'foo'"}}
+{"error": {"class": "GenericError", "desc": "Parameter 'adapter-type' does not accept value 'foo'"}}
 
 {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": {"adapter-type": "IDE", "driver": "vmdk", "file": "node0", "size": 33554432}}}
-{"error": {"class": "GenericError", "desc": "Invalid parameter 'IDE'"}}
+{"error": {"class": "GenericError", "desc": "Parameter 'adapter-type' does not accept value 'IDE'"}}
 
 {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": {"adapter-type": "legacyesx", "driver": "vmdk", "file": "node0", "size": 33554432}}}
-{"error": {"class": "GenericError", "desc": "Invalid parameter 'legacyesx'"}}
+{"error": {"class": "GenericError", "desc": "Parameter 'adapter-type' does not accept value 'legacyesx'"}}
 
 {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": {"adapter-type": 1, "driver": "vmdk", "file": "node0", "size": 33554432}}}
 {"error": {"class": "GenericError", "desc": "Invalid parameter type for 'options.adapter-type', expected: string"}}
diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
index 9b12b42eed..24ac43f70e 100755
--- a/tests/qemu-iotests/245
+++ b/tests/qemu-iotests/245
@@ -149,7 +149,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         self.reopen(opts, {'node-name': ''}, "Failed to find node with node-name=''")
         self.reopen(opts, {'node-name': None}, "Invalid parameter type for 'options[0].node-name', expected: string")
         self.reopen(opts, {'driver': 'raw'}, "Cannot change the option 'driver'")
-        self.reopen(opts, {'driver': ''}, "Invalid parameter ''")
+        self.reopen(opts, {'driver': ''}, "Parameter 'driver' does not accept value ''")
         self.reopen(opts, {'driver': None}, "Invalid parameter type for 'options[0].driver', expected: string")
         self.reopen(opts, {'file': 'not-found'}, "Cannot find device='' nor node-name='not-found'")
         self.reopen(opts, {'file': ''}, "Cannot find device='' nor node-name=''")
diff --git a/tests/qemu-iotests/287 b/tests/qemu-iotests/287
index 22ce9ff0e4..2d5334e8bf 100755
--- a/tests/qemu-iotests/287
+++ b/tests/qemu-iotests/287
@@ -53,7 +53,7 @@ CLUSTER_SIZE=65536
 
 # Check if we can run this test.
 output=$(_make_test_img -o 'compression_type=zstd' 64M; _cleanup_test_img)
-if echo "$output" | grep -q "Invalid parameter 'zstd'"; then
+if echo "$output" | grep -q "Parameter 'compression-type' does not accept value 'zstd'"; then
     _notrun "ZSTD is disabled"
 fi
 
diff --git a/tests/qemu-iotests/308 b/tests/qemu-iotests/308
index 6b386bd523..2e3f8f4282 100755
--- a/tests/qemu-iotests/308
+++ b/tests/qemu-iotests/308
@@ -148,7 +148,7 @@ rmdir "$EXT_MP" 2>/dev/null
 rm -f "$EXT_MP"
 output=$(fuse_export_add 'export-err' "'mountpoint': '$EXT_MP'" error)
 
-if echo "$output" | grep -q "Invalid parameter 'fuse'"; then
+if echo "$output" | grep -q "Parameter 'type' does not accept value 'fuse'"; then
     _notrun 'No FUSE support'
 fi
 
-- 
2.31.1


