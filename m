Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC810C06DB
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 16:01:45 +0200 (CEST)
Received: from localhost ([::1]:51160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDqoa-0005r0-KX
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 10:01:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33027)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1iDq6o-0006ZQ-NH
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 09:16:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1iDq6k-0007Ww-J4
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 09:16:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39486)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>)
 id 1iDq6U-0007UN-OK; Fri, 27 Sep 2019 09:16:10 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5AB74C0578F8;
 Fri, 27 Sep 2019 10:11:58 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-55.ams2.redhat.com
 [10.36.112.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C47AD6012C;
 Fri, 27 Sep 2019 10:11:56 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests: fix I/O test for hosts defaulting to LUKSv2
Date: Fri, 27 Sep 2019 11:11:55 +0100
Message-Id: <20190927101155.25896-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Fri, 27 Sep 2019 10:11:58 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some distros are now defaulting to LUKS version 2 which QEMU cannot
process. For our I/O test that validates interoperability between the
kernel/cryptsetup and QEMU, we need to explicitly ask for version 1
of the LUKS format.

Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 tests/qemu-iotests/149     |  2 +-
 tests/qemu-iotests/149.out | 44 +++++++++++++++++++-------------------
 2 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/tests/qemu-iotests/149 b/tests/qemu-iotests/149
index 4f363f295f..8ab42e94c6 100755
--- a/tests/qemu-iotests/149
+++ b/tests/qemu-iotests/149
@@ -153,7 +153,7 @@ def cryptsetup_format(config):
=20
     (password, slot) =3D config.first_password()
=20
-    args =3D ["luksFormat"]
+    args =3D ["luksFormat", "--type", "luks1"]
     cipher =3D config.cipher + "-" + config.mode + "-" + config.ivgen
     if config.ivgen_hash is not None:
         cipher =3D cipher + ":" + config.ivgen_hash
diff --git a/tests/qemu-iotests/149.out b/tests/qemu-iotests/149.out
index 1407ce6dad..6877ab6c4a 100644
--- a/tests/qemu-iotests/149.out
+++ b/tests/qemu-iotests/149.out
@@ -2,7 +2,7 @@
 # Create image
 truncate TEST_DIR/luks-aes-256-xts-plain64-sha1.img --size 4194304MB
 # Format image
-sudo cryptsetup -q -v luksFormat --cipher aes-xts-plain64 --key-size 512=
 --hash sha1 --key-slot 0 --key-file - --iter-time 10 TEST_DIR/luks-aes-2=
56-xts-plain64-sha1.img
+sudo cryptsetup -q -v luksFormat --type luks1 --cipher aes-xts-plain64 -=
-key-size 512 --hash sha1 --key-slot 0 --key-file - --iter-time 10 TEST_D=
IR/luks-aes-256-xts-plain64-sha1.img
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-xts-plain64-sha1.im=
g qiotest-145-aes-256-xts-plain64-sha1
 # Write test pattern 0xa7
@@ -122,7 +122,7 @@ unlink TEST_DIR/luks-aes-256-xts-plain64-sha1.img
 # Create image
 truncate TEST_DIR/luks-twofish-256-xts-plain64-sha1.img --size 4194304MB
 # Format image
-sudo cryptsetup -q -v luksFormat --cipher twofish-xts-plain64 --key-size=
 512 --hash sha1 --key-slot 0 --key-file - --iter-time 10 TEST_DIR/luks-t=
wofish-256-xts-plain64-sha1.img
+sudo cryptsetup -q -v luksFormat --type luks1 --cipher twofish-xts-plain=
64 --key-size 512 --hash sha1 --key-slot 0 --key-file - --iter-time 10 TE=
ST_DIR/luks-twofish-256-xts-plain64-sha1.img
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-twofish-256-xts-plain64-sha=
1.img qiotest-145-twofish-256-xts-plain64-sha1
 # Write test pattern 0xa7
@@ -242,7 +242,7 @@ unlink TEST_DIR/luks-twofish-256-xts-plain64-sha1.img
 # Create image
 truncate TEST_DIR/luks-serpent-256-xts-plain64-sha1.img --size 4194304MB
 # Format image
-sudo cryptsetup -q -v luksFormat --cipher serpent-xts-plain64 --key-size=
 512 --hash sha1 --key-slot 0 --key-file - --iter-time 10 TEST_DIR/luks-s=
erpent-256-xts-plain64-sha1.img
+sudo cryptsetup -q -v luksFormat --type luks1 --cipher serpent-xts-plain=
64 --key-size 512 --hash sha1 --key-slot 0 --key-file - --iter-time 10 TE=
ST_DIR/luks-serpent-256-xts-plain64-sha1.img
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-serpent-256-xts-plain64-sha=
1.img qiotest-145-serpent-256-xts-plain64-sha1
 # Write test pattern 0xa7
@@ -362,7 +362,7 @@ unlink TEST_DIR/luks-serpent-256-xts-plain64-sha1.img
 # Create image
 truncate TEST_DIR/luks-cast5-128-cbc-plain64-sha1.img --size 4194304MB
 # Format image
-sudo cryptsetup -q -v luksFormat --cipher cast5-cbc-plain64 --key-size 1=
28 --hash sha1 --key-slot 0 --key-file - --iter-time 10 TEST_DIR/luks-cas=
t5-128-cbc-plain64-sha1.img
+sudo cryptsetup -q -v luksFormat --type luks1 --cipher cast5-cbc-plain64=
 --key-size 128 --hash sha1 --key-slot 0 --key-file - --iter-time 10 TEST=
_DIR/luks-cast5-128-cbc-plain64-sha1.img
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-cast5-128-cbc-plain64-sha1.=
img qiotest-145-cast5-128-cbc-plain64-sha1
 # Write test pattern 0xa7
@@ -483,7 +483,7 @@ Skipping cast6-256-xts-plain64-sha1 in blacklist
 # Create image
 truncate TEST_DIR/luks-aes-256-cbc-plain-sha1.img --size 4194304MB
 # Format image
-sudo cryptsetup -q -v luksFormat --cipher aes-cbc-plain --key-size 256 -=
-hash sha1 --key-slot 0 --key-file - --iter-time 10 TEST_DIR/luks-aes-256=
-cbc-plain-sha1.img
+sudo cryptsetup -q -v luksFormat --type luks1 --cipher aes-cbc-plain --k=
ey-size 256 --hash sha1 --key-slot 0 --key-file - --iter-time 10 TEST_DIR=
/luks-aes-256-cbc-plain-sha1.img
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-cbc-plain-sha1.img =
qiotest-145-aes-256-cbc-plain-sha1
 # Write test pattern 0xa7
@@ -603,7 +603,7 @@ unlink TEST_DIR/luks-aes-256-cbc-plain-sha1.img
 # Create image
 truncate TEST_DIR/luks-aes-256-cbc-plain64-sha1.img --size 4194304MB
 # Format image
-sudo cryptsetup -q -v luksFormat --cipher aes-cbc-plain64 --key-size 256=
 --hash sha1 --key-slot 0 --key-file - --iter-time 10 TEST_DIR/luks-aes-2=
56-cbc-plain64-sha1.img
+sudo cryptsetup -q -v luksFormat --type luks1 --cipher aes-cbc-plain64 -=
-key-size 256 --hash sha1 --key-slot 0 --key-file - --iter-time 10 TEST_D=
IR/luks-aes-256-cbc-plain64-sha1.img
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-cbc-plain64-sha1.im=
g qiotest-145-aes-256-cbc-plain64-sha1
 # Write test pattern 0xa7
@@ -723,7 +723,7 @@ unlink TEST_DIR/luks-aes-256-cbc-plain64-sha1.img
 # Create image
 truncate TEST_DIR/luks-aes-256-cbc-essiv-sha256-sha1.img --size 4194304M=
B
 # Format image
-sudo cryptsetup -q -v luksFormat --cipher aes-cbc-essiv:sha256 --key-siz=
e 256 --hash sha1 --key-slot 0 --key-file - --iter-time 10 TEST_DIR/luks-=
aes-256-cbc-essiv-sha256-sha1.img
+sudo cryptsetup -q -v luksFormat --type luks1 --cipher aes-cbc-essiv:sha=
256 --key-size 256 --hash sha1 --key-slot 0 --key-file - --iter-time 10 T=
EST_DIR/luks-aes-256-cbc-essiv-sha256-sha1.img
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-cbc-essiv-sha256-sh=
a1.img qiotest-145-aes-256-cbc-essiv-sha256-sha1
 # Write test pattern 0xa7
@@ -843,7 +843,7 @@ unlink TEST_DIR/luks-aes-256-cbc-essiv-sha256-sha1.im=
g
 # Create image
 truncate TEST_DIR/luks-aes-256-xts-essiv-sha256-sha1.img --size 4194304M=
B
 # Format image
-sudo cryptsetup -q -v luksFormat --cipher aes-xts-essiv:sha256 --key-siz=
e 512 --hash sha1 --key-slot 0 --key-file - --iter-time 10 TEST_DIR/luks-=
aes-256-xts-essiv-sha256-sha1.img
+sudo cryptsetup -q -v luksFormat --type luks1 --cipher aes-xts-essiv:sha=
256 --key-size 512 --hash sha1 --key-slot 0 --key-file - --iter-time 10 T=
EST_DIR/luks-aes-256-xts-essiv-sha256-sha1.img
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-xts-essiv-sha256-sh=
a1.img qiotest-145-aes-256-xts-essiv-sha256-sha1
 # Write test pattern 0xa7
@@ -963,7 +963,7 @@ unlink TEST_DIR/luks-aes-256-xts-essiv-sha256-sha1.im=
g
 # Create image
 truncate TEST_DIR/luks-aes-128-xts-plain64-sha256-sha1.img --size 419430=
4MB
 # Format image
-sudo cryptsetup -q -v luksFormat --cipher aes-xts-plain64 --key-size 256=
 --hash sha1 --key-slot 0 --key-file - --iter-time 10 TEST_DIR/luks-aes-1=
28-xts-plain64-sha256-sha1.img
+sudo cryptsetup -q -v luksFormat --type luks1 --cipher aes-xts-plain64 -=
-key-size 256 --hash sha1 --key-slot 0 --key-file - --iter-time 10 TEST_D=
IR/luks-aes-128-xts-plain64-sha256-sha1.img
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-128-xts-plain64-sha256-=
sha1.img qiotest-145-aes-128-xts-plain64-sha256-sha1
 # Write test pattern 0xa7
@@ -1083,7 +1083,7 @@ unlink TEST_DIR/luks-aes-128-xts-plain64-sha256-sha=
1.img
 # Create image
 truncate TEST_DIR/luks-aes-192-xts-plain64-sha256-sha1.img --size 419430=
4MB
 # Format image
-sudo cryptsetup -q -v luksFormat --cipher aes-xts-plain64 --key-size 384=
 --hash sha1 --key-slot 0 --key-file - --iter-time 10 TEST_DIR/luks-aes-1=
92-xts-plain64-sha256-sha1.img
+sudo cryptsetup -q -v luksFormat --type luks1 --cipher aes-xts-plain64 -=
-key-size 384 --hash sha1 --key-slot 0 --key-file - --iter-time 10 TEST_D=
IR/luks-aes-192-xts-plain64-sha256-sha1.img
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-192-xts-plain64-sha256-=
sha1.img qiotest-145-aes-192-xts-plain64-sha256-sha1
 # Write test pattern 0xa7
@@ -1203,7 +1203,7 @@ unlink TEST_DIR/luks-aes-192-xts-plain64-sha256-sha=
1.img
 # Create image
 truncate TEST_DIR/luks-twofish-128-xts-plain64-sha1.img --size 4194304MB
 # Format image
-sudo cryptsetup -q -v luksFormat --cipher twofish-xts-plain64 --key-size=
 256 --hash sha1 --key-slot 0 --key-file - --iter-time 10 TEST_DIR/luks-t=
wofish-128-xts-plain64-sha1.img
+sudo cryptsetup -q -v luksFormat --type luks1 --cipher twofish-xts-plain=
64 --key-size 256 --hash sha1 --key-slot 0 --key-file - --iter-time 10 TE=
ST_DIR/luks-twofish-128-xts-plain64-sha1.img
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-twofish-128-xts-plain64-sha=
1.img qiotest-145-twofish-128-xts-plain64-sha1
 # Write test pattern 0xa7
@@ -1324,7 +1324,7 @@ Skipping twofish-192-xts-plain64-sha1 in blacklist
 # Create image
 truncate TEST_DIR/luks-serpent-128-xts-plain64-sha1.img --size 4194304MB
 # Format image
-sudo cryptsetup -q -v luksFormat --cipher serpent-xts-plain64 --key-size=
 256 --hash sha1 --key-slot 0 --key-file - --iter-time 10 TEST_DIR/luks-s=
erpent-128-xts-plain64-sha1.img
+sudo cryptsetup -q -v luksFormat --type luks1 --cipher serpent-xts-plain=
64 --key-size 256 --hash sha1 --key-slot 0 --key-file - --iter-time 10 TE=
ST_DIR/luks-serpent-128-xts-plain64-sha1.img
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-serpent-128-xts-plain64-sha=
1.img qiotest-145-serpent-128-xts-plain64-sha1
 # Write test pattern 0xa7
@@ -1444,7 +1444,7 @@ unlink TEST_DIR/luks-serpent-128-xts-plain64-sha1.i=
mg
 # Create image
 truncate TEST_DIR/luks-serpent-192-xts-plain64-sha1.img --size 4194304MB
 # Format image
-sudo cryptsetup -q -v luksFormat --cipher serpent-xts-plain64 --key-size=
 384 --hash sha1 --key-slot 0 --key-file - --iter-time 10 TEST_DIR/luks-s=
erpent-192-xts-plain64-sha1.img
+sudo cryptsetup -q -v luksFormat --type luks1 --cipher serpent-xts-plain=
64 --key-size 384 --hash sha1 --key-slot 0 --key-file - --iter-time 10 TE=
ST_DIR/luks-serpent-192-xts-plain64-sha1.img
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-serpent-192-xts-plain64-sha=
1.img qiotest-145-serpent-192-xts-plain64-sha1
 # Write test pattern 0xa7
@@ -1566,7 +1566,7 @@ Skipping cast6-192-xts-plain64-sha1 in blacklist
 # Create image
 truncate TEST_DIR/luks-aes-256-xts-plain64-sha224.img --size 4194304MB
 # Format image
-sudo cryptsetup -q -v luksFormat --cipher aes-xts-plain64 --key-size 512=
 --hash sha224 --key-slot 0 --key-file - --iter-time 10 TEST_DIR/luks-aes=
-256-xts-plain64-sha224.img
+sudo cryptsetup -q -v luksFormat --type luks1 --cipher aes-xts-plain64 -=
-key-size 512 --hash sha224 --key-slot 0 --key-file - --iter-time 10 TEST=
_DIR/luks-aes-256-xts-plain64-sha224.img
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-xts-plain64-sha224.=
img qiotest-145-aes-256-xts-plain64-sha224
 # Write test pattern 0xa7
@@ -1686,7 +1686,7 @@ unlink TEST_DIR/luks-aes-256-xts-plain64-sha224.img
 # Create image
 truncate TEST_DIR/luks-aes-256-xts-plain64-sha256.img --size 4194304MB
 # Format image
-sudo cryptsetup -q -v luksFormat --cipher aes-xts-plain64 --key-size 512=
 --hash sha256 --key-slot 0 --key-file - --iter-time 10 TEST_DIR/luks-aes=
-256-xts-plain64-sha256.img
+sudo cryptsetup -q -v luksFormat --type luks1 --cipher aes-xts-plain64 -=
-key-size 512 --hash sha256 --key-slot 0 --key-file - --iter-time 10 TEST=
_DIR/luks-aes-256-xts-plain64-sha256.img
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-xts-plain64-sha256.=
img qiotest-145-aes-256-xts-plain64-sha256
 # Write test pattern 0xa7
@@ -1806,7 +1806,7 @@ unlink TEST_DIR/luks-aes-256-xts-plain64-sha256.img
 # Create image
 truncate TEST_DIR/luks-aes-256-xts-plain64-sha384.img --size 4194304MB
 # Format image
-sudo cryptsetup -q -v luksFormat --cipher aes-xts-plain64 --key-size 512=
 --hash sha384 --key-slot 0 --key-file - --iter-time 10 TEST_DIR/luks-aes=
-256-xts-plain64-sha384.img
+sudo cryptsetup -q -v luksFormat --type luks1 --cipher aes-xts-plain64 -=
-key-size 512 --hash sha384 --key-slot 0 --key-file - --iter-time 10 TEST=
_DIR/luks-aes-256-xts-plain64-sha384.img
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-xts-plain64-sha384.=
img qiotest-145-aes-256-xts-plain64-sha384
 # Write test pattern 0xa7
@@ -1926,7 +1926,7 @@ unlink TEST_DIR/luks-aes-256-xts-plain64-sha384.img
 # Create image
 truncate TEST_DIR/luks-aes-256-xts-plain64-sha512.img --size 4194304MB
 # Format image
-sudo cryptsetup -q -v luksFormat --cipher aes-xts-plain64 --key-size 512=
 --hash sha512 --key-slot 0 --key-file - --iter-time 10 TEST_DIR/luks-aes=
-256-xts-plain64-sha512.img
+sudo cryptsetup -q -v luksFormat --type luks1 --cipher aes-xts-plain64 -=
-key-size 512 --hash sha512 --key-slot 0 --key-file - --iter-time 10 TEST=
_DIR/luks-aes-256-xts-plain64-sha512.img
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-xts-plain64-sha512.=
img qiotest-145-aes-256-xts-plain64-sha512
 # Write test pattern 0xa7
@@ -2046,7 +2046,7 @@ unlink TEST_DIR/luks-aes-256-xts-plain64-sha512.img
 # Create image
 truncate TEST_DIR/luks-aes-256-xts-plain64-ripemd160.img --size 4194304M=
B
 # Format image
-sudo cryptsetup -q -v luksFormat --cipher aes-xts-plain64 --key-size 512=
 --hash ripemd160 --key-slot 0 --key-file - --iter-time 10 TEST_DIR/luks-=
aes-256-xts-plain64-ripemd160.img
+sudo cryptsetup -q -v luksFormat --type luks1 --cipher aes-xts-plain64 -=
-key-size 512 --hash ripemd160 --key-slot 0 --key-file - --iter-time 10 T=
EST_DIR/luks-aes-256-xts-plain64-ripemd160.img
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-xts-plain64-ripemd1=
60.img qiotest-145-aes-256-xts-plain64-ripemd160
 # Write test pattern 0xa7
@@ -2166,7 +2166,7 @@ unlink TEST_DIR/luks-aes-256-xts-plain64-ripemd160.=
img
 # Create image
 truncate TEST_DIR/luks-aes-256-xts-plain-sha1-pwslot3.img --size 4194304=
MB
 # Format image
-sudo cryptsetup -q -v luksFormat --cipher aes-xts-plain --key-size 512 -=
-hash sha1 --key-slot 3 --key-file - --iter-time 10 TEST_DIR/luks-aes-256=
-xts-plain-sha1-pwslot3.img
+sudo cryptsetup -q -v luksFormat --type luks1 --cipher aes-xts-plain --k=
ey-size 512 --hash sha1 --key-slot 3 --key-file - --iter-time 10 TEST_DIR=
/luks-aes-256-xts-plain-sha1-pwslot3.img
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-xts-plain-sha1-pwsl=
ot3.img qiotest-145-aes-256-xts-plain-sha1-pwslot3
 # Write test pattern 0xa7
@@ -2226,7 +2226,7 @@ unlink TEST_DIR/luks-aes-256-xts-plain-sha1-pwslot3=
.img
 # Create image
 truncate TEST_DIR/luks-aes-256-xts-plain-sha1-pwallslots.img --size 4194=
304MB
 # Format image
-sudo cryptsetup -q -v luksFormat --cipher aes-xts-plain --key-size 512 -=
-hash sha1 --key-slot 0 --key-file - --iter-time 10 TEST_DIR/luks-aes-256=
-xts-plain-sha1-pwallslots.img
+sudo cryptsetup -q -v luksFormat --type luks1 --cipher aes-xts-plain --k=
ey-size 512 --hash sha1 --key-slot 0 --key-file - --iter-time 10 TEST_DIR=
/luks-aes-256-xts-plain-sha1-pwallslots.img
 # Add password slot 1
 sudo cryptsetup -q -v luksAddKey TEST_DIR/luks-aes-256-xts-plain-sha1-pw=
allslots.img --key-slot 1 --key-file - --iter-time 10 TEST_DIR/passwd.txt
 # Add password slot 2
@@ -2360,7 +2360,7 @@ unlink TEST_DIR/luks-aes-256-xts-plain-sha1-pwallsl=
ots.img
 # Create image
 truncate TEST_DIR/luks-aes-256-cbc-essiv-auto-sha1.img --size 4194304MB
 # Format image
-sudo cryptsetup -q -v luksFormat --cipher aes-cbc-essiv:sha256 --key-siz=
e 256 --hash sha1 --key-slot 0 --key-file - --iter-time 10 TEST_DIR/luks-=
aes-256-cbc-essiv-auto-sha1.img
+sudo cryptsetup -q -v luksFormat --type luks1 --cipher aes-cbc-essiv:sha=
256 --key-size 256 --hash sha1 --key-slot 0 --key-file - --iter-time 10 T=
EST_DIR/luks-aes-256-cbc-essiv-auto-sha1.img
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-cbc-essiv-auto-sha1=
.img qiotest-145-aes-256-cbc-essiv-auto-sha1
 # Write test pattern 0xa7
@@ -2480,7 +2480,7 @@ unlink TEST_DIR/luks-aes-256-cbc-essiv-auto-sha1.im=
g
 # Create image
 truncate TEST_DIR/luks-aes-256-cbc-plain64-sha256-sha1.img --size 419430=
4MB
 # Format image
-sudo cryptsetup -q -v luksFormat --cipher aes-cbc-plain64:sha256 --key-s=
ize 256 --hash sha1 --key-slot 0 --key-file - --iter-time 10 TEST_DIR/luk=
s-aes-256-cbc-plain64-sha256-sha1.img
+sudo cryptsetup -q -v luksFormat --type luks1 --cipher aes-cbc-plain64:s=
ha256 --key-size 256 --hash sha1 --key-slot 0 --key-file - --iter-time 10=
 TEST_DIR/luks-aes-256-cbc-plain64-sha256-sha1.img
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-cbc-plain64-sha256-=
sha1.img qiotest-145-aes-256-cbc-plain64-sha256-sha1
 # Write test pattern 0xa7
--=20
2.21.0


