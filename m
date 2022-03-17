Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6B94DD1DD
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 01:17:52 +0100 (CET)
Received: from localhost ([::1]:33082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nV0JT-0000tY-MS
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 20:17:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nUzsW-0001jU-NT
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 19:50:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nUzsP-0005gI-QZ
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 19:49:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647560989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x0shJdul2EPVIFtDlrVo0hMJSNMIUGVEdP8RtI0A3E8=;
 b=RPWm8xR2kyaCgihHsT9bkmcBO3Vk0MgAo6Vj5Ng6VBzuyj0tXCDlW0tud4d8P5SSvMQA7u
 J8YdT2x6XLJgZFIX4rN5gT5Gx0rut1/8uYxaeKn52fn8YaYZG4jvmKK2C8GOoyIip8iJd/
 S50sjMBIe5MmFRJ3AHRIsy45dOPgl1Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-75-dDfTU71WP-eGyySAJhRfFw-1; Thu, 17 Mar 2022 19:49:48 -0400
X-MC-Unique: dDfTU71WP-eGyySAJhRfFw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09D2F80159B;
 Thu, 17 Mar 2022 23:49:48 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.32.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ABB50112C256;
 Thu, 17 Mar 2022 23:49:47 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 13/18] iotests/149: Remove qemu_img_pipe() call
Date: Thu, 17 Mar 2022 19:49:32 -0400
Message-Id: <20220317234937.569525-14-jsnow@redhat.com>
In-Reply-To: <20220317234937.569525-1-jsnow@redhat.com>
References: <20220317234937.569525-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu_img_pipe calls blank their output when the command being run is a
'create' call and the command succeeds. Thus, the normative output for
this command in iotest 149 is to print a blank line. We can remove the
logging from this invocation and use a checked invocation, but we still
need to inspect the actual output to see if we want to retroactively
skip the test due to missing cipher support.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/149     |  7 +++++--
 tests/qemu-iotests/149.out | 21 ---------------------
 2 files changed, 5 insertions(+), 23 deletions(-)

diff --git a/tests/qemu-iotests/149 b/tests/qemu-iotests/149
index d49646ca60..9bb96d6a1d 100755
--- a/tests/qemu-iotests/149
+++ b/tests/qemu-iotests/149
@@ -265,8 +265,11 @@ def qemu_img_create(config, size_mb):
             "%dM" % size_mb]
 
     iotests.log("qemu-img " + " ".join(args), filters=[iotests.filter_test_dir])
-    iotests.log(check_cipher_support(config, iotests.qemu_img_pipe(*args)),
-                filters=[iotests.filter_test_dir])
+    try:
+        iotests.qemu_img(*args)
+    except subprocess.CalledProcessError as exc:
+        check_cipher_support(config, exc.output)
+        raise
 
 def qemu_io_image_args(config, dev=False):
     """Get the args for access an image or device with qemu-io"""
diff --git a/tests/qemu-iotests/149.out b/tests/qemu-iotests/149.out
index ab879596ce..2cc5b82f7c 100644
--- a/tests/qemu-iotests/149.out
+++ b/tests/qemu-iotests/149.out
@@ -61,7 +61,6 @@ unlink TEST_DIR/luks-aes-256-xts-plain64-sha1.img
 # ================= qemu-img aes-256-xts-plain64-sha1 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=aes-256,cipher-mode=xts,ivgen-alg=plain64,hash-alg=sha1 TEST_DIR/luks-aes-256-xts-plain64-sha1.img 4194304M
-
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-xts-plain64-sha1.img qiotest-145-aes-256-xts-plain64-sha1
 # Write test pattern 0xa7
@@ -180,7 +179,6 @@ unlink TEST_DIR/luks-twofish-256-xts-plain64-sha1.img
 # ================= qemu-img twofish-256-xts-plain64-sha1 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=twofish-256,cipher-mode=xts,ivgen-alg=plain64,hash-alg=sha1 TEST_DIR/luks-twofish-256-xts-plain64-sha1.img 4194304M
-
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-twofish-256-xts-plain64-sha1.img qiotest-145-twofish-256-xts-plain64-sha1
 # Write test pattern 0xa7
@@ -299,7 +297,6 @@ unlink TEST_DIR/luks-serpent-256-xts-plain64-sha1.img
 # ================= qemu-img serpent-256-xts-plain64-sha1 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=serpent-256,cipher-mode=xts,ivgen-alg=plain64,hash-alg=sha1 TEST_DIR/luks-serpent-256-xts-plain64-sha1.img 4194304M
-
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-serpent-256-xts-plain64-sha1.img qiotest-145-serpent-256-xts-plain64-sha1
 # Write test pattern 0xa7
@@ -418,7 +415,6 @@ unlink TEST_DIR/luks-cast5-128-cbc-plain64-sha1.img
 # ================= qemu-img cast5-128-cbc-plain64-sha1 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=cast5-128,cipher-mode=cbc,ivgen-alg=plain64,hash-alg=sha1 TEST_DIR/luks-cast5-128-cbc-plain64-sha1.img 4194304M
-
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-cast5-128-cbc-plain64-sha1.img qiotest-145-cast5-128-cbc-plain64-sha1
 # Write test pattern 0xa7
@@ -538,7 +534,6 @@ unlink TEST_DIR/luks-aes-256-cbc-plain-sha1.img
 # ================= qemu-img aes-256-cbc-plain-sha1 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=aes-256,cipher-mode=cbc,ivgen-alg=plain,hash-alg=sha1 TEST_DIR/luks-aes-256-cbc-plain-sha1.img 4194304M
-
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-cbc-plain-sha1.img qiotest-145-aes-256-cbc-plain-sha1
 # Write test pattern 0xa7
@@ -657,7 +652,6 @@ unlink TEST_DIR/luks-aes-256-cbc-plain64-sha1.img
 # ================= qemu-img aes-256-cbc-plain64-sha1 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=aes-256,cipher-mode=cbc,ivgen-alg=plain64,hash-alg=sha1 TEST_DIR/luks-aes-256-cbc-plain64-sha1.img 4194304M
-
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-cbc-plain64-sha1.img qiotest-145-aes-256-cbc-plain64-sha1
 # Write test pattern 0xa7
@@ -776,7 +770,6 @@ unlink TEST_DIR/luks-aes-256-cbc-essiv-sha256-sha1.img
 # ================= qemu-img aes-256-cbc-essiv-sha256-sha1 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=aes-256,cipher-mode=cbc,ivgen-alg=essiv,hash-alg=sha1,ivgen-hash-alg=sha256 TEST_DIR/luks-aes-256-cbc-essiv-sha256-sha1.img 4194304M
-
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-cbc-essiv-sha256-sha1.img qiotest-145-aes-256-cbc-essiv-sha256-sha1
 # Write test pattern 0xa7
@@ -895,7 +888,6 @@ unlink TEST_DIR/luks-aes-256-xts-essiv-sha256-sha1.img
 # ================= qemu-img aes-256-xts-essiv-sha256-sha1 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=aes-256,cipher-mode=xts,ivgen-alg=essiv,hash-alg=sha1,ivgen-hash-alg=sha256 TEST_DIR/luks-aes-256-xts-essiv-sha256-sha1.img 4194304M
-
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-xts-essiv-sha256-sha1.img qiotest-145-aes-256-xts-essiv-sha256-sha1
 # Write test pattern 0xa7
@@ -1014,7 +1006,6 @@ unlink TEST_DIR/luks-aes-128-xts-plain64-sha256-sha1.img
 # ================= qemu-img aes-128-xts-plain64-sha256-sha1 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=aes-128,cipher-mode=xts,ivgen-alg=plain64,hash-alg=sha1 TEST_DIR/luks-aes-128-xts-plain64-sha256-sha1.img 4194304M
-
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-128-xts-plain64-sha256-sha1.img qiotest-145-aes-128-xts-plain64-sha256-sha1
 # Write test pattern 0xa7
@@ -1133,7 +1124,6 @@ unlink TEST_DIR/luks-aes-192-xts-plain64-sha256-sha1.img
 # ================= qemu-img aes-192-xts-plain64-sha256-sha1 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=aes-192,cipher-mode=xts,ivgen-alg=plain64,hash-alg=sha1 TEST_DIR/luks-aes-192-xts-plain64-sha256-sha1.img 4194304M
-
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-192-xts-plain64-sha256-sha1.img qiotest-145-aes-192-xts-plain64-sha256-sha1
 # Write test pattern 0xa7
@@ -1252,7 +1242,6 @@ unlink TEST_DIR/luks-twofish-128-xts-plain64-sha1.img
 # ================= qemu-img twofish-128-xts-plain64-sha1 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=twofish-128,cipher-mode=xts,ivgen-alg=plain64,hash-alg=sha1 TEST_DIR/luks-twofish-128-xts-plain64-sha1.img 4194304M
-
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-twofish-128-xts-plain64-sha1.img qiotest-145-twofish-128-xts-plain64-sha1
 # Write test pattern 0xa7
@@ -1372,7 +1361,6 @@ unlink TEST_DIR/luks-serpent-128-xts-plain64-sha1.img
 # ================= qemu-img serpent-128-xts-plain64-sha1 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=serpent-128,cipher-mode=xts,ivgen-alg=plain64,hash-alg=sha1 TEST_DIR/luks-serpent-128-xts-plain64-sha1.img 4194304M
-
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-serpent-128-xts-plain64-sha1.img qiotest-145-serpent-128-xts-plain64-sha1
 # Write test pattern 0xa7
@@ -1491,7 +1479,6 @@ unlink TEST_DIR/luks-serpent-192-xts-plain64-sha1.img
 # ================= qemu-img serpent-192-xts-plain64-sha1 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=serpent-192,cipher-mode=xts,ivgen-alg=plain64,hash-alg=sha1 TEST_DIR/luks-serpent-192-xts-plain64-sha1.img 4194304M
-
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-serpent-192-xts-plain64-sha1.img qiotest-145-serpent-192-xts-plain64-sha1
 # Write test pattern 0xa7
@@ -1612,7 +1599,6 @@ unlink TEST_DIR/luks-aes-256-xts-plain64-sha224.img
 # ================= qemu-img aes-256-xts-plain64-sha224 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=aes-256,cipher-mode=xts,ivgen-alg=plain64,hash-alg=sha224 TEST_DIR/luks-aes-256-xts-plain64-sha224.img 4194304M
-
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-xts-plain64-sha224.img qiotest-145-aes-256-xts-plain64-sha224
 # Write test pattern 0xa7
@@ -1731,7 +1717,6 @@ unlink TEST_DIR/luks-aes-256-xts-plain64-sha256.img
 # ================= qemu-img aes-256-xts-plain64-sha256 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=aes-256,cipher-mode=xts,ivgen-alg=plain64,hash-alg=sha256 TEST_DIR/luks-aes-256-xts-plain64-sha256.img 4194304M
-
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-xts-plain64-sha256.img qiotest-145-aes-256-xts-plain64-sha256
 # Write test pattern 0xa7
@@ -1850,7 +1835,6 @@ unlink TEST_DIR/luks-aes-256-xts-plain64-sha384.img
 # ================= qemu-img aes-256-xts-plain64-sha384 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=aes-256,cipher-mode=xts,ivgen-alg=plain64,hash-alg=sha384 TEST_DIR/luks-aes-256-xts-plain64-sha384.img 4194304M
-
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-xts-plain64-sha384.img qiotest-145-aes-256-xts-plain64-sha384
 # Write test pattern 0xa7
@@ -1969,7 +1953,6 @@ unlink TEST_DIR/luks-aes-256-xts-plain64-sha512.img
 # ================= qemu-img aes-256-xts-plain64-sha512 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=aes-256,cipher-mode=xts,ivgen-alg=plain64,hash-alg=sha512 TEST_DIR/luks-aes-256-xts-plain64-sha512.img 4194304M
-
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-xts-plain64-sha512.img qiotest-145-aes-256-xts-plain64-sha512
 # Write test pattern 0xa7
@@ -2088,7 +2071,6 @@ unlink TEST_DIR/luks-aes-256-xts-plain64-ripemd160.img
 # ================= qemu-img aes-256-xts-plain64-ripemd160 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=aes-256,cipher-mode=xts,ivgen-alg=plain64,hash-alg=ripemd160 TEST_DIR/luks-aes-256-xts-plain64-ripemd160.img 4194304M
-
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-xts-plain64-ripemd160.img qiotest-145-aes-256-xts-plain64-ripemd160
 # Write test pattern 0xa7
@@ -2281,7 +2263,6 @@ unlink TEST_DIR/luks-aes-256-xts-plain-sha1-pwallslots.img
 # ================= qemu-img aes-256-xts-plain-sha1-pwallslots =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=c2xvdDE=,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=aes-256,cipher-mode=xts,ivgen-alg=plain,hash-alg=sha1 TEST_DIR/luks-aes-256-xts-plain-sha1-pwallslots.img 4194304M
-
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-xts-plain-sha1-pwallslots.img qiotest-145-aes-256-xts-plain-sha1-pwallslots
 # Write test pattern 0xa7
@@ -2400,7 +2381,6 @@ unlink TEST_DIR/luks-aes-256-cbc-essiv-auto-sha1.img
 # ================= qemu-img aes-256-cbc-essiv-auto-sha1 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=aes-256,cipher-mode=cbc,ivgen-alg=essiv,hash-alg=sha1 TEST_DIR/luks-aes-256-cbc-essiv-auto-sha1.img 4194304M
-
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-cbc-essiv-auto-sha1.img qiotest-145-aes-256-cbc-essiv-auto-sha1
 # Write test pattern 0xa7
@@ -2519,7 +2499,6 @@ unlink TEST_DIR/luks-aes-256-cbc-plain64-sha256-sha1.img
 # ================= qemu-img aes-256-cbc-plain64-sha256-sha1 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=aes-256,cipher-mode=cbc,ivgen-alg=plain64,hash-alg=sha1,ivgen-hash-alg=sha256 TEST_DIR/luks-aes-256-cbc-plain64-sha256-sha1.img 4194304M
-
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-cbc-plain64-sha256-sha1.img qiotest-145-aes-256-cbc-plain64-sha256-sha1
 # Write test pattern 0xa7
-- 
2.34.1


