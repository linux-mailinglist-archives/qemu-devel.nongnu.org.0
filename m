Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D25E37EFC4
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 01:27:23 +0200 (CEST)
Received: from localhost ([::1]:37050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgyGA-0004iZ-KI
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 19:27:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgy3F-0002wb-KR
 for qemu-devel@nongnu.org; Wed, 12 May 2021 19:14:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgy3A-0006WJ-6J
 for qemu-devel@nongnu.org; Wed, 12 May 2021 19:14:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620861235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AyOcZ0tYR+UePeW+Qp2XAjg3qjhhe7e+eG+1LamxD0M=;
 b=FQzUtFgOwNOVfd//QmWIfIZkELYBztgoEODEMzwKUQrUkX5gvScOR9+C5ZK94ZIUrv5UY8
 b9Fk2r3F0gaWKuXn/60Aiw4zmUdzI5/mgrM9+onsguZ7vGUobtxYZewPOA2z8BgHVLswGJ
 GFtpqsRlFP2xsaK7fqG4E1rDwi7FAy4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-NZ8mcKyAMeWHbVW4_NhoYA-1; Wed, 12 May 2021 19:13:53 -0400
X-MC-Unique: NZ8mcKyAMeWHbVW4_NhoYA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F95B184609D;
 Wed, 12 May 2021 23:13:52 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 08C8A62923;
 Wed, 12 May 2021 23:13:46 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 21/25] python: add avocado-framework and tests
Date: Wed, 12 May 2021 19:12:37 -0400
Message-Id: <20210512231241.2816122-22-jsnow@redhat.com>
In-Reply-To: <20210512231241.2816122-1-jsnow@redhat.com>
References: <20210512231241.2816122-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Try using avocado to manage our various tests; even though right now
they're only invoking shell scripts and not really running any
python-native code.

Create tests/, and add shell scripts which call out to mypy, flake8,
pylint and isort to enforce the standards in this directory.

Add avocado-framework to the setup.cfg development dependencies, and add
avocado.cfg to store some preferences for how we'd like the test output
to look.

Finally, add avocado-framework to the Pipfile environment and lock the
new dependencies. We are using avocado >= 87.0 here to take advantage of
some features that Cleber has helpfully added to make the test output
here *very* friendly and easy to read for developers that might chance
upon the output in Gitlab CI.

[Note: ALL of the dependencies get updated to the most modern versions
that exist at the time of this writing. No way around it that I have
seen. Not ideal, but so it goes.]

Provided you have the right development dependencies (mypy, flake8,
isort, pylint, and now avocado-framework) You should be able to run
"avocado --config avocado.cfg run tests/" from the python folder to run
all of these linters with the correct arguments.

(A forthcoming commit adds the much easier 'make check'.)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/README.rst      |   2 +
 python/Pipfile.lock    | 104 ++++++++++++++++++++++-------------------
 python/avocado.cfg     |  10 ++++
 python/setup.cfg       |   1 +
 python/tests/flake8.sh |   2 +
 python/tests/isort.sh  |   2 +
 python/tests/mypy.sh   |   2 +
 python/tests/pylint.sh |   2 +
 8 files changed, 77 insertions(+), 48 deletions(-)
 create mode 100644 python/avocado.cfg
 create mode 100755 python/tests/flake8.sh
 create mode 100755 python/tests/isort.sh
 create mode 100755 python/tests/mypy.sh
 create mode 100755 python/tests/pylint.sh

diff --git a/python/README.rst b/python/README.rst
index e27ba0130ba..e107bd12a69 100644
--- a/python/README.rst
+++ b/python/README.rst
@@ -33,6 +33,8 @@ Files in this directory
 -----------------------
 
 - ``qemu/`` Python package source directory.
+- ``tests/`` Python package tests directory.
+- ``avocado.cfg`` Configuration for the Avocado test-runner.
 - ``MANIFEST.in`` is read by python setuptools, it specifies additional files
   that should be included by a source distribution.
 - ``PACKAGE.rst`` is used as the README file that is visible on PyPI.org.
diff --git a/python/Pipfile.lock b/python/Pipfile.lock
index 18f3bba08f2..2995ede77cd 100644
--- a/python/Pipfile.lock
+++ b/python/Pipfile.lock
@@ -24,27 +24,35 @@
     "develop": {
         "astroid": {
             "hashes": [
-                "sha256:6b0ed1af831570e500e2437625979eaa3b36011f66ddfc4ce930128610258ca9",
-                "sha256:cd80bf957c49765dce6d92c43163ff9d2abc43132ce64d4b1b47717c6d2522df"
+                "sha256:4db03ab5fc3340cf619dbc25e42c2cc3755154ce6009469766d7143d1fc2ee4e",
+                "sha256:8a398dfce302c13f14bab13e2b14fe385d32b73f4e4853b9bdfb64598baa1975"
             ],
-            "markers": "python_version >= '3.6'",
-            "version": "==2.5.2"
+            "markers": "python_version ~= '3.6'",
+            "version": "==2.5.6"
+        },
+        "avocado-framework": {
+            "hashes": [
+                "sha256:3fca7226d7d164f124af8a741e7fa658ff4345a0738ddc32907631fd688b38ed",
+                "sha256:48ac254c0ae2ef0c0ceeb38e3d3df0388718eda8f48b3ab55b30b252839f42b1"
+            ],
+            "markers": "python_version >= '3.5'",
+            "version": "==87.0"
         },
         "flake8": {
             "hashes": [
-                "sha256:12d05ab02614b6aee8df7c36b97d1a3b2372761222b19b58621355e82acddcff",
-                "sha256:78873e372b12b093da7b5e5ed302e8ad9e988b38b063b61ad937f26ca58fc5f0"
+                "sha256:07528381786f2a6237b061f6e96610a4167b226cb926e2aa2b6b1d78057c576b",
+                "sha256:bf8fd333346d844f616e8d47905ef3a3384edae6b4e9beb0c5101e25e3110907"
             ],
             "markers": "python_version >= '2.7' and python_version not in '3.0, 3.1, 3.2, 3.3, 3.4'",
-            "version": "==3.9.0"
+            "version": "==3.9.2"
         },
         "importlib-metadata": {
             "hashes": [
-                "sha256:1cedf994a9b6885dcbb7ed40b24c332b1de3956319f4b1a0f07c0621d453accc",
-                "sha256:c9c1b6c7dbc62084f3e6a614a194eb16ded7947736c18e3300125d5c0a7a8b3c"
+                "sha256:8c501196e49fb9df5df43833bdb1e4328f64847763ec8a50703148b73784d581",
+                "sha256:d7eb1dea6d6a6086f8be21784cc9e3bcfa55872b52309bc5fad53a8ea444465d"
             ],
             "markers": "python_version < '3.8'",
-            "version": "==3.9.1"
+            "version": "==4.0.1"
         },
         "isort": {
             "hashes": [
@@ -142,11 +150,11 @@
         },
         "pylint": {
             "hashes": [
-                "sha256:0e21d3b80b96740909d77206d741aa3ce0b06b41be375d92e1f3244a274c1f8a",
-                "sha256:d09b0b07ba06bcdff463958f53f23df25e740ecd81895f7d2699ec04bbd8dc3b"
+                "sha256:586d8fa9b1891f4b725f587ef267abe2a1bad89d6b184520c7f07a253dd6e217",
+                "sha256:f7e2072654a6b6afdf5e2fb38147d3e2d2d43c89f648637baab63e026481279b"
             ],
             "markers": "python_version ~= '3.6'",
-            "version": "==2.7.2"
+            "version": "==2.8.2"
         },
         "qemu": {
             "editable": true,
@@ -162,48 +170,48 @@
         },
         "typed-ast": {
             "hashes": [
-                "sha256:07d49388d5bf7e863f7fa2f124b1b1d89d8aa0e2f7812faff0a5658c01c59aa1",
-                "sha256:14bf1522cdee369e8f5581238edac09150c765ec1cb33615855889cf33dcb92d",
-                "sha256:240296b27397e4e37874abb1df2a608a92df85cf3e2a04d0d4d61055c8305ba6",
-                "sha256:36d829b31ab67d6fcb30e185ec996e1f72b892255a745d3a82138c97d21ed1cd",
-                "sha256:37f48d46d733d57cc70fd5f30572d11ab8ed92da6e6b28e024e4a3edfb456e37",
-                "sha256:4c790331247081ea7c632a76d5b2a265e6d325ecd3179d06e9cf8d46d90dd151",
-                "sha256:5dcfc2e264bd8a1db8b11a892bd1647154ce03eeba94b461effe68790d8b8e07",
-                "sha256:7147e2a76c75f0f64c4319886e7639e490fee87c9d25cb1d4faef1d8cf83a440",
-                "sha256:7703620125e4fb79b64aa52427ec192822e9f45d37d4b6625ab37ef403e1df70",
-                "sha256:8368f83e93c7156ccd40e49a783a6a6850ca25b556c0fa0240ed0f659d2fe496",
-                "sha256:84aa6223d71012c68d577c83f4e7db50d11d6b1399a9c779046d75e24bed74ea",
-                "sha256:85f95aa97a35bdb2f2f7d10ec5bbdac0aeb9dafdaf88e17492da0504de2e6400",
-                "sha256:8db0e856712f79c45956da0c9a40ca4246abc3485ae0d7ecc86a20f5e4c09abc",
-                "sha256:9044ef2df88d7f33692ae3f18d3be63dec69c4fb1b5a4a9ac950f9b4ba571606",
-                "sha256:963c80b583b0661918718b095e02303d8078950b26cc00b5e5ea9ababe0de1fc",
-                "sha256:987f15737aba2ab5f3928c617ccf1ce412e2e321c77ab16ca5a293e7bbffd581",
-                "sha256:9ec45db0c766f196ae629e509f059ff05fc3148f9ffd28f3cfe75d4afb485412",
-                "sha256:9fc0b3cb5d1720e7141d103cf4819aea239f7d136acf9ee4a69b047b7986175a",
-                "sha256:a2c927c49f2029291fbabd673d51a2180038f8cd5a5b2f290f78c4516be48be2",
-                "sha256:a38878a223bdd37c9709d07cd357bb79f4c760b29210e14ad0fb395294583787",
-                "sha256:b4fcdcfa302538f70929eb7b392f536a237cbe2ed9cba88e3bf5027b39f5f77f",
-                "sha256:c0c74e5579af4b977c8b932f40a5464764b2f86681327410aa028a22d2f54937",
-                "sha256:c1c876fd795b36126f773db9cbb393f19808edd2637e00fd6caba0e25f2c7b64",
-                "sha256:c9aadc4924d4b5799112837b226160428524a9a45f830e0d0f184b19e4090487",
-                "sha256:cc7b98bf58167b7f2db91a4327da24fb93368838eb84a44c472283778fc2446b",
-                "sha256:cf54cfa843f297991b7388c281cb3855d911137223c6b6d2dd82a47ae5125a41",
-                "sha256:d003156bb6a59cda9050e983441b7fa2487f7800d76bdc065566b7d728b4581a",
-                "sha256:d175297e9533d8d37437abc14e8a83cbc68af93cc9c1c59c2c292ec59a0697a3",
-                "sha256:d746a437cdbca200622385305aedd9aef68e8a645e385cc483bdc5e488f07166",
-                "sha256:e683e409e5c45d5c9082dc1daf13f6374300806240719f95dc783d1fc942af10"
+                "sha256:01ae5f73431d21eead5015997ab41afa53aa1fbe252f9da060be5dad2c730ace",
+                "sha256:067a74454df670dcaa4e59349a2e5c81e567d8d65458d480a5b3dfecec08c5ff",
+                "sha256:0fb71b8c643187d7492c1f8352f2c15b4c4af3f6338f21681d3681b3dc31a266",
+                "sha256:1b3ead4a96c9101bef08f9f7d1217c096f31667617b58de957f690c92378b528",
+                "sha256:2068531575a125b87a41802130fa7e29f26c09a2833fea68d9a40cf33902eba6",
+                "sha256:209596a4ec71d990d71d5e0d312ac935d86930e6eecff6ccc7007fe54d703808",
+                "sha256:2c726c276d09fc5c414693a2de063f521052d9ea7c240ce553316f70656c84d4",
+                "sha256:398e44cd480f4d2b7ee8d98385ca104e35c81525dd98c519acff1b79bdaac363",
+                "sha256:52b1eb8c83f178ab787f3a4283f68258525f8d70f778a2f6dd54d3b5e5fb4341",
+                "sha256:5feca99c17af94057417d744607b82dd0a664fd5e4ca98061480fd8b14b18d04",
+                "sha256:7538e495704e2ccda9b234b82423a4038f324f3a10c43bc088a1636180f11a41",
+                "sha256:760ad187b1041a154f0e4d0f6aae3e40fdb51d6de16e5c99aedadd9246450e9e",
+                "sha256:777a26c84bea6cd934422ac2e3b78863a37017618b6e5c08f92ef69853e765d3",
+                "sha256:95431a26309a21874005845c21118c83991c63ea800dd44843e42a916aec5899",
+                "sha256:9ad2c92ec681e02baf81fdfa056fe0d818645efa9af1f1cd5fd6f1bd2bdfd805",
+                "sha256:9c6d1a54552b5330bc657b7ef0eae25d00ba7ffe85d9ea8ae6540d2197a3788c",
+                "sha256:aee0c1256be6c07bd3e1263ff920c325b59849dc95392a05f258bb9b259cf39c",
+                "sha256:af3d4a73793725138d6b334d9d247ce7e5f084d96284ed23f22ee626a7b88e39",
+                "sha256:b36b4f3920103a25e1d5d024d155c504080959582b928e91cb608a65c3a49e1a",
+                "sha256:b9574c6f03f685070d859e75c7f9eeca02d6933273b5e69572e5ff9d5e3931c3",
+                "sha256:bff6ad71c81b3bba8fa35f0f1921fb24ff4476235a6e94a26ada2e54370e6da7",
+                "sha256:c190f0899e9f9f8b6b7863debfb739abcb21a5c054f911ca3596d12b8a4c4c7f",
+                "sha256:c907f561b1e83e93fad565bac5ba9c22d96a54e7ea0267c708bffe863cbe4075",
+                "sha256:cae53c389825d3b46fb37538441f75d6aecc4174f615d048321b716df2757fb0",
+                "sha256:dd4a21253f42b8d2b48410cb31fe501d32f8b9fbeb1f55063ad102fe9c425e40",
+                "sha256:dde816ca9dac1d9c01dd504ea5967821606f02e510438120091b84e852367428",
+                "sha256:f2362f3cb0f3172c42938946dbc5b7843c2a28aec307c49100c8b38764eb6927",
+                "sha256:f328adcfebed9f11301eaedfa48e15bdece9b519fb27e6a8c01aa52a17ec31b3",
+                "sha256:f8afcf15cc511ada719a88e013cec87c11aff7b91f019295eb4530f96fe5ef2f",
+                "sha256:fb1bbeac803adea29cedd70781399c99138358c26d05fcbd23c13016b7f5ec65"
             ],
             "markers": "implementation_name == 'cpython' and python_version < '3.8'",
-            "version": "==1.4.2"
+            "version": "==1.4.3"
         },
         "typing-extensions": {
             "hashes": [
-                "sha256:7cb407020f00f7bfc3cb3e7881628838e69d8f3fcab2f64742a5e76b2f841918",
-                "sha256:99d4073b617d30288f569d3f13d2bd7548c3a7e4c8de87db09a9d29bb3a4a60c",
-                "sha256:dafc7639cde7f1b6e1acc0f457842a83e722ccca8eef5270af2d74792619a89f"
+                "sha256:0ac0f89795dd19de6b97debb0c6af1c70987fd80a2d62d1958f7e56fcc31b497",
+                "sha256:50b6f157849174217d0656f99dc82fe932884fb250826c18350e159ec6cdf342",
+                "sha256:779383f6086d90c99ae41cf0ff39aac8a7937a9283ce0a414e5dd782f4c94a84"
             ],
             "markers": "python_version < '3.8'",
-            "version": "==3.7.4.3"
+            "version": "==3.10.0.0"
         },
         "wrapt": {
             "hashes": [
diff --git a/python/avocado.cfg b/python/avocado.cfg
new file mode 100644
index 00000000000..10dc6fb6054
--- /dev/null
+++ b/python/avocado.cfg
@@ -0,0 +1,10 @@
+[simpletests]
+# Don't show stdout/stderr in the test *summary*
+status.failure_fields = ['status']
+
+[job]
+# Don't show the full debug.log output; only select stdout/stderr.
+output.testlogs.logfiles = ['stdout', 'stderr']
+
+# Show full stdout/stderr only on tests that FAIL
+output.testlogs.statuses = ['FAIL']
diff --git a/python/setup.cfg b/python/setup.cfg
index 9d941386921..364b68434ca 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -26,6 +26,7 @@ devel =
     isort >= 5.1.2
     mypy >= 0.770
     pylint >= 2.7.0
+    avocado-framework >= 87.0
 
 
 [flake8]
diff --git a/python/tests/flake8.sh b/python/tests/flake8.sh
new file mode 100755
index 00000000000..51e0788462b
--- /dev/null
+++ b/python/tests/flake8.sh
@@ -0,0 +1,2 @@
+#!/bin/sh -e
+python3 -m flake8
diff --git a/python/tests/isort.sh b/python/tests/isort.sh
new file mode 100755
index 00000000000..4480405bfb0
--- /dev/null
+++ b/python/tests/isort.sh
@@ -0,0 +1,2 @@
+#!/bin/sh -e
+python3 -m isort -c qemu/
diff --git a/python/tests/mypy.sh b/python/tests/mypy.sh
new file mode 100755
index 00000000000..5f980f563bb
--- /dev/null
+++ b/python/tests/mypy.sh
@@ -0,0 +1,2 @@
+#!/bin/sh -e
+python3 -m mypy -p qemu
diff --git a/python/tests/pylint.sh b/python/tests/pylint.sh
new file mode 100755
index 00000000000..4b10b34db7c
--- /dev/null
+++ b/python/tests/pylint.sh
@@ -0,0 +1,2 @@
+#!/bin/sh -e
+python3 -m pylint qemu/
-- 
2.30.2


