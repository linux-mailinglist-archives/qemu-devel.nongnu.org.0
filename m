Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2CB3B0356
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 13:53:25 +0200 (CEST)
Received: from localhost ([::1]:51318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvey4-0001Jr-35
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 07:53:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lvewn-0000UO-4V
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 07:52:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lvewl-0004ha-2Q
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 07:52:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624362722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=30IyRXNdw0kg6i+1HpOv7TOXItPSbQgGl3xXwZdLl7Y=;
 b=HcJSYSbBgYdb4T53QLFLqUgNbrzjJAV2s3VyvNF4BXWxWIU4cINMcT0xIFRfsvsYYKxxO3
 Ke8dMB8m5Co0wrGudo2eL+w4R/qV0iBFPhMOCo4Qd5QeiIGH28wPGfVRGmCqG8UhQMPZ8U
 mfLP43LrBHd0yNhqCJ97TFrKualDpIc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-CHyk0J3WM8emv8qqRcyK8A-1; Tue, 22 Jun 2021 07:52:00 -0400
X-MC-Unique: CHyk0J3WM8emv8qqRcyK8A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E39FA1084F58;
 Tue, 22 Jun 2021 11:51:59 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-176.ams2.redhat.com
 [10.36.114.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 176145C1A3;
 Tue, 22 Jun 2021 11:51:57 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] block/ssh: add support for sha256 host key fingerprints
Date: Tue, 22 Jun 2021 12:51:56 +0100
Message-Id: <20210622115156.138458-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, "Richard W.M. Jones" <rjones@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the SSH block driver supports MD5 and SHA1 for host key
fingerprints. This is a cryptographically sensitive operation and
so these hash algorithms are inadequate by modern standards. This
adds support for SHA256 which has been supported in libssh since
the 0.8.1 release.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---

Note I can't actually get iotest '207' to fully pass. It always
complains that it can't validate the "known_hosts" file

  qemu-img: Could not open 'TEST_IMG': no host key was found in known_hosts

it seems to rely on some specific developer host setup that my
laptop doesn't satisfy. It would be useful if any pre-requisite
could be documented in the iotest.

At least the sha256 verification step I added to 207 does pass
though.

 block/ssh.c                |  3 +++
 qapi/block-core.json       |  3 ++-
 tests/qemu-iotests/207     | 54 ++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/207.out | 25 ++++++++++++++++++
 4 files changed, 84 insertions(+), 1 deletion(-)

diff --git a/block/ssh.c b/block/ssh.c
index b51a031620..d008caf059 100644
--- a/block/ssh.c
+++ b/block/ssh.c
@@ -442,6 +442,9 @@ static int check_host_key(BDRVSSHState *s, SshHostKeyCheck *hkc, Error **errp)
         } else if (hkc->u.hash.type == SSH_HOST_KEY_CHECK_HASH_TYPE_SHA1) {
             return check_host_key_hash(s, hkc->u.hash.hash,
                                        SSH_PUBLICKEY_HASH_SHA1, errp);
+        } else if (hkc->u.hash.type == SSH_HOST_KEY_CHECK_HASH_TYPE_SHA256) {
+            return check_host_key_hash(s, hkc->u.hash.hash,
+                                       SSH_PUBLICKEY_HASH_SHA256, errp);
         }
         g_assert_not_reached();
         break;
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 2ea294129e..4247dc46a5 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -3186,11 +3186,12 @@
 #
 # @md5: The given hash is an md5 hash
 # @sha1: The given hash is an sha1 hash
+# @sha256: The given hash is an sha256 hash
 #
 # Since: 2.12
 ##
 { 'enum': 'SshHostKeyCheckHashType',
-  'data': [ 'md5', 'sha1' ] }
+  'data': [ 'md5', 'sha1', 'sha256' ] }
 
 ##
 # @SshHostKeyHash:
diff --git a/tests/qemu-iotests/207 b/tests/qemu-iotests/207
index f9f3fd7131..0f5c4bc8a0 100755
--- a/tests/qemu-iotests/207
+++ b/tests/qemu-iotests/207
@@ -73,6 +73,9 @@ with iotests.FilePath('t.img') as disk_path, \
     iotests.log("=== Test host-key-check options ===")
     iotests.log("")
 
+    iotests.log("--- no host key checking --")
+    iotests.log("")
+
     vm.launch()
     blockdev_create(vm, { 'driver': 'ssh',
                           'location': {
@@ -90,6 +93,9 @@ with iotests.FilePath('t.img') as disk_path, \
 
     iotests.img_info_log(remote_path)
 
+    iotests.log("--- known_hosts key checking --")
+    iotests.log("")
+
     vm.launch()
     blockdev_create(vm, { 'driver': 'ssh',
                           'location': {
@@ -115,6 +121,7 @@ with iotests.FilePath('t.img') as disk_path, \
     # Mappings of base64 representations to digests
     md5_keys = {}
     sha1_keys = {}
+    sha256_keys = {}
 
     for key in keys:
         md5_keys[key] = subprocess.check_output(
@@ -125,6 +132,10 @@ with iotests.FilePath('t.img') as disk_path, \
             'echo %s | base64 -d | sha1sum -b | cut -d" " -f1' % key,
             shell=True).rstrip().decode('ascii')
 
+        sha256_keys[key] = subprocess.check_output(
+            'echo %s | base64 -d | sha256sum -b | cut -d" " -f1' % key,
+            shell=True).rstrip().decode('ascii')
+
     vm.launch()
 
     # Find correct key first
@@ -150,6 +161,9 @@ with iotests.FilePath('t.img') as disk_path, \
         vm.shutdown()
         iotests.notrun('Did not find a key that fits 127.0.0.1')
 
+    iotests.log("--- explicit md5 key checking --")
+    iotests.log("")
+
     blockdev_create(vm, { 'driver': 'ssh',
                           'location': {
                               'path': disk_path,
@@ -164,6 +178,7 @@ with iotests.FilePath('t.img') as disk_path, \
                               }
                           },
                           'size': 2097152 })
+
     blockdev_create(vm, { 'driver': 'ssh',
                           'location': {
                               'path': disk_path,
@@ -182,6 +197,9 @@ with iotests.FilePath('t.img') as disk_path, \
 
     iotests.img_info_log(remote_path)
 
+    iotests.log("--- explicit sha1 key checking --")
+    iotests.log("")
+
     vm.launch()
     blockdev_create(vm, { 'driver': 'ssh',
                           'location': {
@@ -215,6 +233,42 @@ with iotests.FilePath('t.img') as disk_path, \
 
     iotests.img_info_log(remote_path)
 
+    iotests.log("--- explicit sha256 key checking --")
+    iotests.log("")
+
+    vm.launch()
+    blockdev_create(vm, { 'driver': 'ssh',
+                          'location': {
+                              'path': disk_path,
+                              'server': {
+                                  'host': '127.0.0.1',
+                                  'port': '22'
+                              },
+                              'host-key-check': {
+                                  'mode': 'hash',
+                                  'type': 'sha256',
+                                  'hash': 'wrong',
+                              }
+                          },
+                          'size': 2097152 })
+    blockdev_create(vm, { 'driver': 'ssh',
+                          'location': {
+                              'path': disk_path,
+                              'server': {
+                                  'host': '127.0.0.1',
+                                  'port': '22'
+                              },
+                              'host-key-check': {
+                                  'mode': 'hash',
+                                  'type': 'sha256',
+                                  'hash': sha256_keys[matching_key],
+                              }
+                          },
+                          'size': 4194304 })
+    vm.shutdown()
+
+    iotests.img_info_log(remote_path)
+
     #
     # Invalid path and user
     #
diff --git a/tests/qemu-iotests/207.out b/tests/qemu-iotests/207.out
index 1239d9d648..aeb8569d77 100644
--- a/tests/qemu-iotests/207.out
+++ b/tests/qemu-iotests/207.out
@@ -16,6 +16,8 @@ virtual size: 4 MiB (4194304 bytes)
 
 === Test host-key-check options ===
 
+--- no host key checking --
+
 {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": {"driver": "ssh", "location": {"host-key-check": {"mode": "none"}, "path": "TEST_DIR/PID-t.img", "server": {"host": "127.0.0.1", "port": "22"}}, "size": 8388608}}}
 {"return": {}}
 {"execute": "job-dismiss", "arguments": {"id": "job0"}}
@@ -25,6 +27,8 @@ image: TEST_IMG
 file format: IMGFMT
 virtual size: 8 MiB (8388608 bytes)
 
+--- known_hosts key checking --
+
 {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": {"driver": "ssh", "location": {"host-key-check": {"mode": "known_hosts"}, "path": "TEST_DIR/PID-t.img", "server": {"host": "127.0.0.1", "port": "22"}}, "size": 4194304}}}
 {"return": {}}
 {"execute": "job-dismiss", "arguments": {"id": "job0"}}
@@ -34,6 +38,8 @@ image: TEST_IMG
 file format: IMGFMT
 virtual size: 4 MiB (4194304 bytes)
 
+--- explicit md5 key checking --
+
 {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": {"driver": "ssh", "location": {"host-key-check": {"hash": "wrong", "mode": "hash", "type": "md5"}, "path": "TEST_DIR/PID-t.img", "server": {"host": "127.0.0.1", "port": "22"}}, "size": 2097152}}}
 {"return": {}}
 Job failed: remote host key does not match host_key_check 'wrong'
@@ -49,6 +55,8 @@ image: TEST_IMG
 file format: IMGFMT
 virtual size: 8 MiB (8388608 bytes)
 
+--- explicit sha1 key checking --
+
 {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": {"driver": "ssh", "location": {"host-key-check": {"hash": "wrong", "mode": "hash", "type": "sha1"}, "path": "TEST_DIR/PID-t.img", "server": {"host": "127.0.0.1", "port": "22"}}, "size": 2097152}}}
 {"return": {}}
 Job failed: remote host key does not match host_key_check 'wrong'
@@ -64,6 +72,23 @@ image: TEST_IMG
 file format: IMGFMT
 virtual size: 4 MiB (4194304 bytes)
 
+--- explicit sha256 key checking --
+
+{"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": {"driver": "ssh", "location": {"host-key-check": {"hash": "wrong", "mode": "hash", "type": "sha256"}, "path": "TEST_DIR/PID-t.img", "server": {"host": "127.0.0.1", "port": "22"}}, "size": 2097152}}}
+{"return": {}}
+Job failed: remote host key does not match host_key_check 'wrong'
+{"execute": "job-dismiss", "arguments": {"id": "job0"}}
+{"return": {}}
+
+{"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": {"driver": "ssh", "location": {"host-key-check": {"hash": "HASH", "mode": "hash", "type": "sha256"}, "path": "TEST_DIR/PID-t.img", "server": {"host": "127.0.0.1", "port": "22"}}, "size": 4194304}}}
+{"return": {}}
+{"execute": "job-dismiss", "arguments": {"id": "job0"}}
+{"return": {}}
+
+image: TEST_IMG
+file format: IMGFMT
+virtual size: 4 MiB (4194304 bytes)
+
 === Invalid path and user ===
 
 {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": {"driver": "ssh", "location": {"host-key-check": {"mode": "none"}, "path": "/this/is/not/an/existing/path", "server": {"host": "127.0.0.1", "port": "22"}}, "size": 4194304}}}
-- 
2.31.1


