Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DEA1C61C8
	for <lists+qemu-devel@lfdr.de>; Tue,  5 May 2020 22:14:55 +0200 (CEST)
Received: from localhost ([::1]:37688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jW3xt-0006PL-W2
	for lists+qemu-devel@lfdr.de; Tue, 05 May 2020 16:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1jW3sK-0004Zv-82
 for qemu-devel@nongnu.org; Tue, 05 May 2020 16:09:08 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:39905
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1jW3sH-0000s4-Uc
 for qemu-devel@nongnu.org; Tue, 05 May 2020 16:09:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588709345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mp8toag1KOdLycVqz03dtpucaf++c5WLObukaamtrkE=;
 b=ddhKcWLYbR/hCiv15GE8B1JdzIQcYcdnKPY1jMCNLtRqJdU+8Jmxug89QyJpRXP8UHX3De
 jmhts0UTuKNFDuyo3TEkK1sG0+Hn+GPrhW8fR1KnlhJMBRaF4NxIYpqKOUqk0UuCrICu/c
 BBY4Zb0BjGv9Fcu8ha8Vox/2EO8jQxM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-s1hyplsTN6qD_5_bjJKS0A-1; Tue, 05 May 2020 16:09:02 -0400
X-MC-Unique: s1hyplsTN6qD_5_bjJKS0A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90FE6468;
 Tue,  5 May 2020 20:09:01 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D37663F95;
 Tue,  5 May 2020 20:08:59 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 14/14] iotests: add tests for blockdev-amend
Date: Tue,  5 May 2020 23:08:19 +0300
Message-Id: <20200505200819.5662-15-mlevitsk@redhat.com>
In-Reply-To: <20200505200819.5662-1-mlevitsk@redhat.com>
References: <20200505200819.5662-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/05 00:37:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This commit adds two tests that cover the
new blockdev-amend functionality of luks and qcow2 driver

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 tests/qemu-iotests/302     | 278 +++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/302.out |  40 ++++++
 tests/qemu-iotests/303     | 233 +++++++++++++++++++++++++++++++
 tests/qemu-iotests/303.out |  33 +++++
 tests/qemu-iotests/group   |   2 +
 5 files changed, 586 insertions(+)
 create mode 100755 tests/qemu-iotests/302
 create mode 100644 tests/qemu-iotests/302.out
 create mode 100755 tests/qemu-iotests/303
 create mode 100644 tests/qemu-iotests/303.out

diff --git a/tests/qemu-iotests/302 b/tests/qemu-iotests/302
new file mode 100755
index 0000000000..f7b4d13bd2
--- /dev/null
+++ b/tests/qemu-iotests/302
@@ -0,0 +1,278 @@
+#!/usr/bin/env python3
+#
+# Test case QMP's encrypted key management
+#
+# Copyright (C) 2019 Red Hat, Inc.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+#
+
+import iotests
+import os
+import time
+import json
+
+test_img =3D os.path.join(iotests.test_dir, 'test.img')
+
+class Secret:
+    def __init__(self, index):
+        self._id =3D "keysec" + str(index)
+        # you are not supposed to see the password...
+        self._secret =3D "hunter" + str(index)
+
+    def id(self):
+        return self._id
+
+    def secret(self):
+        return self._secret
+
+    def to_cmdline_object(self):
+        return  [ "secret,id=3D" + self._id + ",data=3D" + self._secret]
+
+    def to_qmp_object(self):
+        return { "qom_type" : "secret", "id": self.id(),
+                 "props": { "data": self.secret() } }
+
+##########################################################################=
######
+class EncryptionSetupTestCase(iotests.QMPTestCase):
+
+    # test case startup
+    def setUp(self):
+        # start the VM
+        self.vm =3D iotests.VM()
+        self.vm.launch()
+
+        # create the secrets and load 'em into the VM
+        self.secrets =3D [ Secret(i) for i in range(0, 6) ]
+        for secret in self.secrets:
+            result =3D self.vm.qmp("object-add", **secret.to_qmp_object())
+            self.assert_qmp(result, 'return', {})
+
+        if iotests.imgfmt =3D=3D "qcow2":
+            self.pfx =3D "encrypt."
+            self.img_opts =3D [ '-o', "encrypt.format=3Dluks" ]
+        else:
+            self.pfx =3D ""
+            self.img_opts =3D []
+
+    # test case shutdown
+    def tearDown(self):
+        # stop the VM
+        self.vm.shutdown()
+
+    ######################################################################=
#####
+    # create the encrypted block device
+    def createImg(self, file, secret):
+
+        iotests.qemu_img(
+            'create',
+            '--object', *secret.to_cmdline_object(),
+            '-f', iotests.imgfmt,
+            '-o', self.pfx + 'key-secret=3D' + secret.id(),
+            '-o', self.pfx + 'iter-time=3D10',
+            *self.img_opts,
+            file,
+            '1M')
+
+    ######################################################################=
#####
+    # open an encrypted block device
+    def openImageQmp(self, id, file, secret, read_only =3D False):
+
+        encrypt_options =3D {
+            'key-secret' : secret.id()
+        }
+
+        if iotests.imgfmt =3D=3D "qcow2":
+            encrypt_options =3D {
+                'encrypt': {
+                    'format':'luks',
+                    **encrypt_options
+                }
+            }
+
+        result =3D self.vm.qmp('blockdev-add', **
+            {
+                'driver': iotests.imgfmt,
+                'node-name': id,
+                'read-only': read_only,
+
+                **encrypt_options,
+
+                'file': {
+                    'driver': 'file',
+                    'filename': test_img,
+                }
+            }
+        )
+        self.assert_qmp(result, 'return', {})
+
+    # close the encrypted block device
+    def closeImageQmp(self, id):
+        result =3D self.vm.qmp('blockdev-del', **{ 'node-name': id })
+        self.assert_qmp(result, 'return', {})
+
+    ######################################################################=
#####
+    # add a key to an encrypted block device
+    def addKeyQmp(self, id, new_secret, secret =3D None,
+                  slot =3D None, force =3D False):
+
+        crypt_options =3D {
+            'state'      : 'active',
+            'new-secret' : new_secret.id(),
+            'iter-time' : 10
+        }
+
+        if slot !=3D None:
+            crypt_options['keyslot'] =3D slot
+
+
+        if secret !=3D None:
+            crypt_options['secret'] =3D secret.id()
+
+        if iotests.imgfmt =3D=3D "qcow2":
+            crypt_options['format'] =3D 'luks'
+            crypt_options =3D {
+                'encrypt': crypt_options
+            }
+
+        args =3D {
+            'node-name': id,
+            'job-id' : 'job_add_key',
+            'options' : {
+                    'driver' : iotests.imgfmt,
+                    **crypt_options
+                },
+        }
+
+        if force =3D=3D True:
+            args['force'] =3D True
+
+        #TODO: check what jobs return
+        result =3D self.vm.qmp('x-blockdev-amend', **args)
+        assert result['return'] =3D=3D {}
+        self.vm.run_job('job_add_key')
+
+    # erase a key from an encrypted block device
+    def eraseKeyQmp(self, id, old_secret =3D None, slot =3D None, force =
=3D False):
+
+        crypt_options =3D {
+            'state'      : 'inactive',
+        }
+
+        if slot !=3D None:
+            crypt_options['keyslot'] =3D slot
+        if old_secret !=3D None:
+            crypt_options['old-secret'] =3D old_secret.id()
+
+        if iotests.imgfmt =3D=3D "qcow2":
+            crypt_options['format'] =3D 'luks'
+            crypt_options =3D {
+                'encrypt': crypt_options
+            }
+
+        args =3D {
+            'node-name': id,
+            'job-id' : 'job_erase_key',
+            'options' : {
+                    'driver' : iotests.imgfmt,
+                    **crypt_options
+                },
+        }
+
+        if force =3D=3D True:
+            args['force'] =3D True
+
+        result =3D self.vm.qmp('x-blockdev-amend', **args)
+        assert result['return'] =3D=3D {}
+        self.vm.run_job('job_erase_key')
+
+    ######################################################################=
#####
+    # create image, and change its key
+    def testChangeKey(self):
+
+        # create the image with secret0 and open it
+        self.createImg(test_img, self.secrets[0]);
+        self.openImageQmp("testdev", test_img, self.secrets[0])
+
+        # add key to slot 1
+        self.addKeyQmp("testdev", new_secret =3D self.secrets[1])
+
+        # add key to slot 5
+        self.addKeyQmp("testdev", new_secret =3D self.secrets[2], slot=3D5=
)
+
+        # erase key from slot 0
+        self.eraseKeyQmp("testdev", old_secret =3D self.secrets[0])
+
+        #reopen the image with secret1
+        self.closeImageQmp("testdev")
+        self.openImageQmp("testdev", test_img, self.secrets[1])
+
+        # close and erase the image for good
+        self.closeImageQmp("testdev")
+        os.remove(test_img)
+
+    # test that if we erase the old password,
+    # we can still change the encryption keys using 'old-secret'
+    def testOldPassword(self):
+
+        # create the image with secret0 and open it
+        self.createImg(test_img, self.secrets[0]);
+        self.openImageQmp("testdev", test_img, self.secrets[0])
+
+        # add key to slot 1
+        self.addKeyQmp("testdev", new_secret =3D self.secrets[1])
+
+        # erase key from slot 0
+        self.eraseKeyQmp("testdev", old_secret =3D self.secrets[0])
+
+        # this will fail as the old password is no longer valid
+        self.addKeyQmp("testdev", new_secret =3D self.secrets[2])
+
+        # this will work
+        self.addKeyQmp("testdev", new_secret =3D self.secrets[2], secret =
=3D self.secrets[1])
+
+        # close and erase the image for good
+        self.closeImageQmp("testdev")
+        os.remove(test_img)
+
+    def testUseForceLuke(self):
+
+        self.createImg(test_img, self.secrets[0]);
+        self.openImageQmp("testdev", test_img, self.secrets[0])
+
+        # Add bunch of secrets
+        self.addKeyQmp("testdev", new_secret =3D self.secrets[1], slot=3D4=
)
+        self.addKeyQmp("testdev", new_secret =3D self.secrets[4], slot=3D2=
)
+
+        # overwrite an active secret
+        self.addKeyQmp("testdev", new_secret =3D self.secrets[5], slot=3D2=
)
+        self.addKeyQmp("testdev", new_secret =3D self.secrets[5], slot=3D2=
, force=3DTrue)
+
+        self.addKeyQmp("testdev", new_secret =3D self.secrets[0])
+
+        # Now erase all the secrets
+        self.eraseKeyQmp("testdev", old_secret =3D self.secrets[5])
+        self.eraseKeyQmp("testdev", slot=3D4)
+
+        # erase last keyslot
+        self.eraseKeyQmp("testdev", old_secret =3D self.secrets[0])
+        self.eraseKeyQmp("testdev", old_secret =3D self.secrets[0], force=
=3DTrue)
+
+        self.closeImageQmp("testdev")
+        os.remove(test_img)
+
+
+if __name__ =3D=3D '__main__':
+    # Encrypted formats support
+    iotests.main(supported_fmts =3D ['qcow2', 'luks'])
diff --git a/tests/qemu-iotests/302.out b/tests/qemu-iotests/302.out
new file mode 100644
index 0000000000..750116fd56
--- /dev/null
+++ b/tests/qemu-iotests/302.out
@@ -0,0 +1,40 @@
+...
+----------------------------------------------------------------------
+Ran 3 tests
+
+OK
+{"execute": "job-dismiss", "arguments": {"id": "job_add_key"}}
+{"return": {}}
+{"execute": "job-dismiss", "arguments": {"id": "job_add_key"}}
+{"return": {}}
+{"execute": "job-dismiss", "arguments": {"id": "job_erase_key"}}
+{"return": {}}
+{"execute": "job-dismiss", "arguments": {"id": "job_add_key"}}
+{"return": {}}
+{"execute": "job-dismiss", "arguments": {"id": "job_erase_key"}}
+{"return": {}}
+Job failed: Invalid password, cannot unlock any keyslot
+{"execute": "job-dismiss", "arguments": {"id": "job_add_key"}}
+{"return": {}}
+{"execute": "job-dismiss", "arguments": {"id": "job_add_key"}}
+{"return": {}}
+{"execute": "job-dismiss", "arguments": {"id": "job_add_key"}}
+{"return": {}}
+{"execute": "job-dismiss", "arguments": {"id": "job_add_key"}}
+{"return": {}}
+Job failed: Refusing to overwrite active keyslot 2 - please erase it first
+{"execute": "job-dismiss", "arguments": {"id": "job_add_key"}}
+{"return": {}}
+{"execute": "job-dismiss", "arguments": {"id": "job_add_key"}}
+{"return": {}}
+{"execute": "job-dismiss", "arguments": {"id": "job_add_key"}}
+{"return": {}}
+{"execute": "job-dismiss", "arguments": {"id": "job_erase_key"}}
+{"return": {}}
+{"execute": "job-dismiss", "arguments": {"id": "job_erase_key"}}
+{"return": {}}
+Job failed: All the active keyslots match the (old) password that was give=
n and erasing them will erase all the data in the image irreversibly - refu=
sing operation
+{"execute": "job-dismiss", "arguments": {"id": "job_erase_key"}}
+{"return": {}}
+{"execute": "job-dismiss", "arguments": {"id": "job_erase_key"}}
+{"return": {}}
diff --git a/tests/qemu-iotests/303 b/tests/qemu-iotests/303
new file mode 100755
index 0000000000..ba30d8781f
--- /dev/null
+++ b/tests/qemu-iotests/303
@@ -0,0 +1,233 @@
+#!/usr/bin/env python3
+#
+# Test case for encryption key management versus image sharing
+#
+# Copyright (C) 2019 Red Hat, Inc.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+#
+
+import iotests
+import os
+import time
+import json
+
+test_img =3D os.path.join(iotests.test_dir, 'test.img')
+
+class Secret:
+    def __init__(self, index):
+        self._id =3D "keysec" + str(index)
+        # you are not supposed to see the password...
+        self._secret =3D "hunter" + str(index)
+
+    def id(self):
+        return self._id
+
+    def secret(self):
+        return self._secret
+
+    def to_cmdline_object(self):
+        return  [ "secret,id=3D" + self._id + ",data=3D" + self._secret]
+
+    def to_qmp_object(self):
+        return { "qom_type" : "secret", "id": self.id(),
+                 "props": { "data": self.secret() } }
+
+##########################################################################=
######
+
+class EncryptionSetupTestCase(iotests.QMPTestCase):
+
+    # test case startup
+    def setUp(self):
+
+        # start the VMs
+        self.vm1 =3D iotests.VM(path_suffix =3D 'VM1')
+        self.vm2 =3D iotests.VM(path_suffix =3D 'VM2')
+        self.vm1.launch()
+        self.vm2.launch()
+
+        # create the secrets and load 'em into the VMs
+        self.secrets =3D [ Secret(i) for i in range(0, 4) ]
+        for secret in self.secrets:
+            result =3D self.vm1.qmp("object-add", **secret.to_qmp_object()=
)
+            self.assert_qmp(result, 'return', {})
+            result =3D self.vm2.qmp("object-add", **secret.to_qmp_object()=
)
+            self.assert_qmp(result, 'return', {})
+
+    # test case shutdown
+    def tearDown(self):
+        # stop the VM
+        self.vm1.shutdown()
+        self.vm2.shutdown()
+
+    ######################################################################=
#####
+    # create the encrypted block device using qemu-img
+    def createImg(self, file, secret):
+
+        output =3D iotests.qemu_img_pipe(
+            'create',
+            '--object', *secret.to_cmdline_object(),
+            '-f', iotests.imgfmt,
+            '-o', 'key-secret=3D' + secret.id(),
+            '-o', 'iter-time=3D10',
+            file,
+            '1M')
+
+        iotests.log(output, filters=3D[iotests.filter_test_dir])
+
+    # attempts to add a key using qemu-img
+    def addKey(self, file, secret, new_secret):
+
+        image_options =3D {
+            'key-secret' : secret.id(),
+            'driver' : iotests.imgfmt,
+            'file' : {
+                'driver':'file',
+                'filename': file,
+                }
+            }
+
+        output =3D iotests.qemu_img_pipe(
+            'amend',
+            '--object', *secret.to_cmdline_object(),
+            '--object', *new_secret.to_cmdline_object(),
+
+            '-o', 'state=3Dactive',
+            '-o', 'new-secret=3D' + new_secret.id(),
+            '-o', 'iter-time=3D10',
+
+            "json:" + json.dumps(image_options)
+            )
+
+        iotests.log(output, filters=3D[iotests.filter_test_dir])
+
+    ######################################################################=
#####
+    # open an encrypted block device
+    def openImageQmp(self, vm, id, file, secret,
+                     readOnly =3D False, reOpen =3D False):
+
+        command =3D 'x-blockdev-reopen' if reOpen else 'blockdev-add'
+
+        result =3D vm.qmp(command, **
+            {
+                'driver': iotests.imgfmt,
+                'node-name': id,
+                'read-only': readOnly,
+                'key-secret' : secret.id(),
+                'file': {
+                    'driver': 'file',
+                    'filename': test_img,
+                }
+            }
+        )
+        self.assert_qmp(result, 'return', {})
+
+    # close the encrypted block device
+    def closeImageQmp(self, vm, id):
+        result =3D vm.qmp('blockdev-del', **{ 'node-name': id })
+        self.assert_qmp(result, 'return', {})
+
+    ######################################################################=
#####
+
+    # add a key to an encrypted block device
+    def addKeyQmp(self, vm, id, new_secret):
+
+        args =3D {
+            'node-name': id,
+            'job-id' : 'job0',
+            'options' : {
+                'state'     : 'active',
+                'driver'    : iotests.imgfmt,
+                'new-secret': new_secret.id(),
+                'iter-time' : 10
+            },
+        }
+
+        result =3D vm.qmp('x-blockdev-amend', **args)
+        assert result['return'] =3D=3D {}
+        vm.run_job('job0')
+
+    # test that when the image opened by two qemu processes,
+    # neither of them can update the image
+    def test1(self):
+        self.createImg(test_img, self.secrets[0]);
+
+        # VM1 opens the image and adds a key
+        self.openImageQmp(self.vm1, "testdev", test_img, self.secrets[0])
+        self.addKeyQmp(self.vm1, "testdev", new_secret =3D self.secrets[1]=
)
+
+
+        # VM2 opens the image
+        self.openImageQmp(self.vm2, "testdev", test_img, self.secrets[0])
+
+
+        # neither VMs now should be able to add a key
+        self.addKeyQmp(self.vm1, "testdev", new_secret =3D self.secrets[2]=
)
+        self.addKeyQmp(self.vm2, "testdev", new_secret =3D self.secrets[2]=
)
+
+
+        # VM 1 closes the image
+        self.closeImageQmp(self.vm1, "testdev")
+
+
+        # now VM2 can add the key
+        self.addKeyQmp(self.vm2, "testdev", new_secret =3D self.secrets[2]=
)
+
+
+        # qemu-img should also not be able to add a key
+        self.addKey(test_img, self.secrets[0], self.secrets[2])
+
+        # cleanup
+        self.closeImageQmp(self.vm2, "testdev")
+        os.remove(test_img)
+
+
+    def test2(self):
+        self.createImg(test_img, self.secrets[0]);
+
+        # VM1 opens the image readonly
+        self.openImageQmp(self.vm1, "testdev", test_img, self.secrets[0],
+                          readOnly =3D True)
+
+        # VM2 opens the image
+        self.openImageQmp(self.vm2, "testdev", test_img, self.secrets[0])
+
+        # VM1 can't add a key since image is readonly
+        self.addKeyQmp(self.vm1, "testdev", new_secret =3D self.secrets[2]=
)
+
+        # VM2 can't add a key since VM is has the image opened
+        self.addKeyQmp(self.vm2, "testdev", new_secret =3D self.secrets[2]=
)
+
+
+        #VM1 reopens the image read-write
+        self.openImageQmp(self.vm1, "testdev", test_img, self.secrets[0],
+                          reOpen =3D True, readOnly =3D False)
+
+        # VM1 still can't add the key
+        self.addKeyQmp(self.vm1, "testdev", new_secret =3D self.secrets[2]=
)
+
+        # VM2 gets away
+        self.closeImageQmp(self.vm2, "testdev")
+
+        # VM1 now can add the key
+        self.addKeyQmp(self.vm1, "testdev", new_secret =3D self.secrets[2]=
)
+
+        self.closeImageQmp(self.vm1, "testdev")
+        os.remove(test_img)
+
+
+if __name__ =3D=3D '__main__':
+    # support only raw luks since luks encrypted qcow2 is a proper
+    # format driver which doesn't allow any sharing
+    iotests.main(supported_fmts =3D ['luks'])
diff --git a/tests/qemu-iotests/303.out b/tests/qemu-iotests/303.out
new file mode 100644
index 0000000000..a62bb20b67
--- /dev/null
+++ b/tests/qemu-iotests/303.out
@@ -0,0 +1,33 @@
+..
+----------------------------------------------------------------------
+Ran 2 tests
+
+OK
+Formatting 'TEST_DIR/test.img', fmt=3Dluks size=3D1048576 key-secret=3Dkey=
sec0 iter-time=3D10
+
+{"execute": "job-dismiss", "arguments": {"id": "job0"}}
+{"return": {}}
+Job failed: Failed to get shared "consistent read" lock
+{"execute": "job-dismiss", "arguments": {"id": "job0"}}
+{"return": {}}
+Job failed: Failed to get shared "consistent read" lock
+{"execute": "job-dismiss", "arguments": {"id": "job0"}}
+{"return": {}}
+{"execute": "job-dismiss", "arguments": {"id": "job0"}}
+{"return": {}}
+qemu-img: Failed to get shared "consistent read" lock
+Is another process using the image [TEST_DIR/test.img]?
+
+Formatting 'TEST_DIR/test.img', fmt=3Dluks size=3D1048576 key-secret=3Dkey=
sec0 iter-time=3D10
+
+Job failed: Block node is read-only
+{"execute": "job-dismiss", "arguments": {"id": "job0"}}
+{"return": {}}
+Job failed: Failed to get shared "consistent read" lock
+{"execute": "job-dismiss", "arguments": {"id": "job0"}}
+{"return": {}}
+Job failed: Failed to get shared "consistent read" lock
+{"execute": "job-dismiss", "arguments": {"id": "job0"}}
+{"return": {}}
+{"execute": "job-dismiss", "arguments": {"id": "job0"}}
+{"return": {}}
diff --git a/tests/qemu-iotests/group b/tests/qemu-iotests/group
index ed8580e660..64c6c7d2e6 100644
--- a/tests/qemu-iotests/group
+++ b/tests/qemu-iotests/group
@@ -301,3 +301,5 @@
=20
 300 rw auto
 301 rw auto quick
+302 rw auto
+303 rw auto
--=20
2.17.2


