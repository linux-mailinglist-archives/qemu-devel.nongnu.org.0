Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A44145A716
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 17:03:51 +0100 (CET)
Received: from localhost ([::1]:41888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpYGs-0002MV-1U
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 11:03:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mpYCd-0004WW-VL
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 10:59:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mpYCc-0007gu-Az
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 10:59:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637683165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kpfgdX372kuJC19fIhHQJvofnBmUEOAhXayxTc7AI8w=;
 b=cuvMVL0fZqzrlL/ZH78ngYXbCJ/bVXsLKSXDbapqcv/9tiqViq9tjarjdPhpsgfIh/WPui
 nocSujENbTf5D0Z+Yx6eWbR2S15uCUXBBKecb8H3FBvIPvjARIf8yqDf3t4ZI83Ayp4LJN
 oU2/ekUR1e/wI0je0qYvMnMtAjGapzo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-508-alESFW-mPvuJuKMEFcesOA-1; Tue, 23 Nov 2021 10:59:21 -0500
X-MC-Unique: alESFW-mPvuJuKMEFcesOA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D17FF100C61C;
 Tue, 23 Nov 2021 15:59:20 +0000 (UTC)
Received: from localhost (unknown [10.39.194.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 39E0A5D6CF;
 Tue, 23 Nov 2021 15:59:19 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 2/3] iotests: Use aes-128-cbc
Date: Tue, 23 Nov 2021 16:59:08 +0100
Message-Id: <20211123155909.717547-3-hreitz@redhat.com>
In-Reply-To: <20211123155909.717547-1-hreitz@redhat.com>
References: <20211123155909.717547-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Our gnutls crypto backend (which is the default as of 8bd0931f6)
supports neither twofish-128 nor the CTR mode.  CBC and aes-128 are
supported by all of our backends (as far as I can tell), so use
aes-128-cbc in our iotests.

(We could also use e.g. aes-256-cbc, but the different key sizes would
lead to different key slot offsets and so change the reference output
more, which is why I went with aes-128.)

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20211117151707.52549-2-hreitz@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
---
 tests/qemu-iotests/206     | 4 ++--
 tests/qemu-iotests/206.out | 6 +++---
 tests/qemu-iotests/210     | 4 ++--
 tests/qemu-iotests/210.out | 6 +++---
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/tests/qemu-iotests/206 b/tests/qemu-iotests/206
index c3cdad4ce4..10eff343f7 100755
--- a/tests/qemu-iotests/206
+++ b/tests/qemu-iotests/206
@@ -162,8 +162,8 @@ with iotests.FilePath('t.qcow2') as disk_path, \
                          'encrypt': {
                              'format': 'luks',
                              'key-secret': 'keysec0',
-                             'cipher-alg': 'twofish-128',
-                             'cipher-mode': 'ctr',
+                             'cipher-alg': 'aes-128',
+                             'cipher-mode': 'cbc',
                              'ivgen-alg': 'plain64',
                              'ivgen-hash-alg': 'md5',
                              'hash-alg': 'sha1',
diff --git a/tests/qemu-iotests/206.out b/tests/qemu-iotests/206.out
index 3593e8e9c2..80cd274223 100644
--- a/tests/qemu-iotests/206.out
+++ b/tests/qemu-iotests/206.out
@@ -97,7 +97,7 @@ Format specific information:
 
 === Successful image creation (encrypted) ===
 
-{"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": {"driver": "qcow2", "encrypt": {"cipher-alg": "twofish-128", "cipher-mode": "ctr", "format": "luks", "hash-alg": "sha1", "iter-time": 10, "ivgen-alg": "plain64", "ivgen-hash-alg": "md5", "key-secret": "keysec0"}, "file": {"driver": "file", "filename": "TEST_DIR/PID-t.qcow2"}, "size": 33554432}}}
+{"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": {"driver": "qcow2", "encrypt": {"cipher-alg": "aes-128", "cipher-mode": "cbc", "format": "luks", "hash-alg": "sha1", "iter-time": 10, "ivgen-alg": "plain64", "ivgen-hash-alg": "md5", "key-secret": "keysec0"}, "file": {"driver": "file", "filename": "TEST_DIR/PID-t.qcow2"}, "size": 33554432}}}
 {"return": {}}
 {"execute": "job-dismiss", "arguments": {"id": "job0"}}
 {"return": {}}
@@ -115,10 +115,10 @@ Format specific information:
     encrypt:
         ivgen alg: plain64
         hash alg: sha1
-        cipher alg: twofish-128
+        cipher alg: aes-128
         uuid: XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
         format: luks
-        cipher mode: ctr
+        cipher mode: cbc
         slots:
             [0]:
                 active: true
diff --git a/tests/qemu-iotests/210 b/tests/qemu-iotests/210
index 5a62ed4dd1..a4dcc5fe59 100755
--- a/tests/qemu-iotests/210
+++ b/tests/qemu-iotests/210
@@ -83,8 +83,8 @@ with iotests.FilePath('t.luks') as disk_path, \
                          },
                          'size': size,
                          'key-secret': 'keysec0',
-                         'cipher-alg': 'twofish-128',
-                         'cipher-mode': 'ctr',
+                         'cipher-alg': 'aes-128',
+                         'cipher-mode': 'cbc',
                          'ivgen-alg': 'plain64',
                          'ivgen-hash-alg': 'md5',
                          'hash-alg': 'sha1',
diff --git a/tests/qemu-iotests/210.out b/tests/qemu-iotests/210.out
index 55c0844370..96d9f749dd 100644
--- a/tests/qemu-iotests/210.out
+++ b/tests/qemu-iotests/210.out
@@ -59,7 +59,7 @@ Format specific information:
 {"execute": "job-dismiss", "arguments": {"id": "job0"}}
 {"return": {}}
 
-{"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": {"cipher-alg": "twofish-128", "cipher-mode": "ctr", "driver": "luks", "file": {"driver": "file", "filename": "TEST_DIR/PID-t.luks"}, "hash-alg": "sha1", "iter-time": 10, "ivgen-alg": "plain64", "ivgen-hash-alg": "md5", "key-secret": "keysec0", "size": 67108864}}}
+{"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": {"cipher-alg": "aes-128", "cipher-mode": "cbc", "driver": "luks", "file": {"driver": "file", "filename": "TEST_DIR/PID-t.luks"}, "hash-alg": "sha1", "iter-time": 10, "ivgen-alg": "plain64", "ivgen-hash-alg": "md5", "key-secret": "keysec0", "size": 67108864}}}
 {"return": {}}
 {"execute": "job-dismiss", "arguments": {"id": "job0"}}
 {"return": {}}
@@ -71,9 +71,9 @@ encrypted: yes
 Format specific information:
     ivgen alg: plain64
     hash alg: sha1
-    cipher alg: twofish-128
+    cipher alg: aes-128
     uuid: XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
-    cipher mode: ctr
+    cipher mode: cbc
     slots:
         [0]:
             active: true
-- 
2.33.1


