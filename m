Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCF3435257
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 20:08:15 +0200 (CEST)
Received: from localhost ([::1]:35844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdG0c-0002xS-7P
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 14:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mdFvH-0005VT-TZ
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 14:02:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mdFvD-0001q0-AH
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 14:02:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634752957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qzOXBxLCYJpjtssZ+9RTI0mGEjGG71mElYTKjYL6U2w=;
 b=a3BelmKI5FYXPk6zwfSSdYANiwdxaMXgjkdyqge+dI/y2Zg1/cxF+Kfjv2G35eg7pdw4LO
 RRsW5Jc+40pxOTjUzQQInYjSHDNYDHgd1wJztW4tdV4aTC70uik1/yZAKkRmEkdtNKmH8a
 67fjM9HwgOTZVaY8HACqbYqbGe+hjGI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-RroXKA7AMt67SdjXShnOpQ-1; Wed, 20 Oct 2021 14:02:34 -0400
X-MC-Unique: RroXKA7AMt67SdjXShnOpQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53739806668;
 Wed, 20 Oct 2021 18:02:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F13A3ADCD;
 Wed, 20 Oct 2021 18:02:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 80B8B11380A7; Wed, 20 Oct 2021 20:02:31 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] qapi: Improve input_type_enum()'s error message
Date: Wed, 20 Oct 2021 20:02:31 +0200
Message-Id: <20211020180231.434071-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 michael.roth@amd.com, hreitz@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The error message claims the parameter is invalid:

    $ qemu-system-x86_64 -object qom-type=nonexistent
    qemu-system-x86_64: -object qom-type=nonexistent: Invalid parameter 'nonexistent'

What's wrong is actually the *value* 'nonexistent'.  Improve the
message to

    qemu-system-x86_64: -object qom-type=nonexistent: Parameter 'qom-type' does not accept value 'nonexistent'

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v2: iotests 287 and 308 updated [Kevin]

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


