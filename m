Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C074F3B7A07
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 23:45:35 +0200 (CEST)
Received: from localhost ([::1]:54468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyLXy-0002a4-Pb
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 17:45:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyLW9-0000GV-PK
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 17:43:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyLW7-0005gQ-Hd
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 17:43:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625003019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wb55Cfx8Rqu2zIREMMEaByk8sWdqFIBegxO7/S1qi1U=;
 b=OiqUAKfox3Jz0bJz2ghyonmbQWjOQMfVrCAYdn7l0gPfaboe7CFwyQU61lp6xfL2Dd049v
 3bNlak3rxTJZNYM9LEAY+HZtG7GB6U1pNL8rZ38JqMww4dziUarXTp0j2JxLEZho2c7Iqx
 Zp6SwC0c1sfgjKjWrYct6u+xhlJcqBo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-oFF3xDYuP3OdaErX5LI46Q-1; Tue, 29 Jun 2021 17:43:37 -0400
X-MC-Unique: oFF3xDYuP3OdaErX5LI46Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE5011084F53;
 Tue, 29 Jun 2021 21:43:36 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 498E160C13;
 Tue, 29 Jun 2021 21:43:35 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/15] python: Re-lock pipenv at *oldest* supported versions
Date: Tue, 29 Jun 2021 17:43:12 -0400
Message-Id: <20210629214323.1329806-5-jsnow@redhat.com>
In-Reply-To: <20210629214323.1329806-1-jsnow@redhat.com>
References: <20210629214323.1329806-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

tox is already testing the most recent versions. Let's use pipenv to
test the oldest versions we claim to support. This matches the stylistic
choice to have pipenv always test our oldest supported Python version, 3.6.

The effect of this is that the python-check-pipenv CI job on gitlab will
now test against much older versions of these linters, which will help
highlight incompatible changes that might otherwise go unnoticed.

Update instructions for adding and bumping versions in setup.cfg. The
reason for deleting the line that gets added to Pipfile is largely just
to avoid having the version minimums specified in multiple places in
config checked into the tree.

(This patch was written by deleting Pipfile and Pipfile.lock, then
explicitly installing each dependency manually at a specific
version. Then, I restored the prior Pipfile and re-ran `pipenv lock
--dev --keep-outdated` to re-add the qemu dependency back to the pipenv
environment while keeping the "old" packages. It's annoying, yes, but I
think the improvement to test coverage is worthwhile.)

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
 python/Pipfile.lock | 113 +++++++++++++++++++++-----------------------
 python/setup.cfg    |   4 +-
 2 files changed, 56 insertions(+), 61 deletions(-)

diff --git a/python/Pipfile.lock b/python/Pipfile.lock
index 5bb3f1b635..8ab41a3f60 100644
--- a/python/Pipfile.lock
+++ b/python/Pipfile.lock
@@ -31,19 +31,19 @@
         },
         "astroid": {
             "hashes": [
-                "sha256:4db03ab5fc3340cf619dbc25e42c2cc3755154ce6009469766d7143d1fc2ee4e",
-                "sha256:8a398dfce302c13f14bab13e2b14fe385d32b73f4e4853b9bdfb64598baa1975"
+                "sha256:09bdb456e02564731f8b5957cdd0c98a7f01d2db5e90eb1d794c353c28bfd705",
+                "sha256:6a8a51f64dae307f6e0c9db752b66a7951e282389d8362cc1d39a56f3feeb31d"
             ],
             "markers": "python_version ~= '3.6'",
-            "version": "==2.5.6"
+            "version": "==2.6.0"
         },
         "avocado-framework": {
             "hashes": [
-                "sha256:42aa7962df98d6b78d4efd9afa2177226dc630f3d83a2a7d5baf7a0a7da7fa1b",
-                "sha256:d96ae343abf890e1ef3b3a6af5ce49e35f6bded0715770c4acb325bca555c515"
+                "sha256:3fca7226d7d164f124af8a741e7fa658ff4345a0738ddc32907631fd688b38ed",
+                "sha256:48ac254c0ae2ef0c0ceeb38e3d3df0388718eda8f48b3ab55b30b252839f42b1"
             ],
-            "markers": "python_version >= '3.6'",
-            "version": "==88.1"
+            "index": "pypi",
+            "version": "==87.0"
         },
         "distlib": {
             "hashes": [
@@ -61,25 +61,27 @@
         },
         "flake8": {
             "hashes": [
-                "sha256:07528381786f2a6237b061f6e96610a4167b226cb926e2aa2b6b1d78057c576b",
-                "sha256:bf8fd333346d844f616e8d47905ef3a3384edae6b4e9beb0c5101e25e3110907"
+                "sha256:6a35f5b8761f45c5513e3405f110a86bea57982c3b75b766ce7b65217abe1670",
+                "sha256:c01f8a3963b3571a8e6bd7a4063359aff90749e160778e03817cd9b71c9e07d2"
             ],
-            "markers": "python_version >= '2.7' and python_version not in '3.0, 3.1, 3.2, 3.3, 3.4'",
-            "version": "==3.9.2"
+            "index": "pypi",
+            "version": "==3.6.0"
         },
         "fusepy": {
             "hashes": [
-                "sha256:72ff783ec2f43de3ab394e3f7457605bf04c8cf288a2f4068b4cde141d4ee6bd"
+                "sha256:10f5c7f5414241bffecdc333c4d3a725f1d6605cae6b4eaf86a838ff49cdaf6c",
+                "sha256:a9f3a3699080ddcf0919fd1eb2cf743e1f5859ca54c2018632f939bdfac269ee"
             ],
-            "version": "==3.0.1"
+            "index": "pypi",
+            "version": "==2.0.4"
         },
         "importlib-metadata": {
             "hashes": [
-                "sha256:8c501196e49fb9df5df43833bdb1e4328f64847763ec8a50703148b73784d581",
-                "sha256:d7eb1dea6d6a6086f8be21784cc9e3bcfa55872b52309bc5fad53a8ea444465d"
+                "sha256:90bb658cdbbf6d1735b6341ce708fc7024a3e14e99ffdc5783edea9f9b077f83",
+                "sha256:dc15b2969b4ce36305c51eebe62d418ac7791e9a157911d58bfb1f9ccd8e2070"
             ],
             "markers": "python_version < '3.8'",
-            "version": "==4.0.1"
+            "version": "==1.7.0"
         },
         "importlib-resources": {
             "hashes": [
@@ -91,11 +93,11 @@
         },
         "isort": {
             "hashes": [
-                "sha256:0a943902919f65c5684ac4e0154b1ad4fac6dcaa5d9f3426b732f1c8b5419be6",
-                "sha256:2bb1680aad211e3c9944dbce1d4ba09a989f04e238296c87fe2139faa26d655d"
+                "sha256:408e4d75d84f51b64d0824894afee44469eba34a4caee621dc53799f80d71ccc",
+                "sha256:64022dea6a06badfa09b300b4dfe8ba968114a737919e8ed50aea1c288f078aa"
             ],
-            "markers": "python_version >= '3.6' and python_version < '4.0'",
-            "version": "==5.8.0"
+            "index": "pypi",
+            "version": "==5.1.2"
         },
         "lazy-object-proxy": {
             "hashes": [
@@ -134,31 +136,23 @@
         },
         "mypy": {
             "hashes": [
-                "sha256:0d0a87c0e7e3a9becdfbe936c981d32e5ee0ccda3e0f07e1ef2c3d1a817cf73e",
-                "sha256:25adde9b862f8f9aac9d2d11971f226bd4c8fbaa89fb76bdadb267ef22d10064",
-                "sha256:28fb5479c494b1bab244620685e2eb3c3f988d71fd5d64cc753195e8ed53df7c",
-                "sha256:2f9b3407c58347a452fc0736861593e105139b905cca7d097e413453a1d650b4",
-                "sha256:33f159443db0829d16f0a8d83d94df3109bb6dd801975fe86bacb9bf71628e97",
-                "sha256:3f2aca7f68580dc2508289c729bd49ee929a436208d2b2b6aab15745a70a57df",
-                "sha256:499c798053cdebcaa916eef8cd733e5584b5909f789de856b482cd7d069bdad8",
-                "sha256:4eec37370483331d13514c3f55f446fc5248d6373e7029a29ecb7b7494851e7a",
-                "sha256:552a815579aa1e995f39fd05dde6cd378e191b063f031f2acfe73ce9fb7f9e56",
-                "sha256:5873888fff1c7cf5b71efbe80e0e73153fe9212fafdf8e44adfe4c20ec9f82d7",
-                "sha256:61a3d5b97955422964be6b3baf05ff2ce7f26f52c85dd88db11d5e03e146a3a6",
-                "sha256:674e822aa665b9fd75130c6c5f5ed9564a38c6cea6a6432ce47eafb68ee578c5",
-                "sha256:7ce3175801d0ae5fdfa79b4f0cfed08807af4d075b402b7e294e6aa72af9aa2a",
-                "sha256:9743c91088d396c1a5a3c9978354b61b0382b4e3c440ce83cf77994a43e8c521",
-                "sha256:9f94aac67a2045ec719ffe6111df543bac7874cee01f41928f6969756e030564",
-                "sha256:a26f8ec704e5a7423c8824d425086705e381b4f1dfdef6e3a1edab7ba174ec49",
-                "sha256:abf7e0c3cf117c44d9285cc6128856106183938c68fd4944763003decdcfeb66",
-                "sha256:b09669bcda124e83708f34a94606e01b614fa71931d356c1f1a5297ba11f110a",
-                "sha256:cd07039aa5df222037005b08fbbfd69b3ab0b0bd7a07d7906de75ae52c4e3119",
-                "sha256:d23e0ea196702d918b60c8288561e722bf437d82cb7ef2edcd98cfa38905d506",
-                "sha256:d65cc1df038ef55a99e617431f0553cd77763869eebdf9042403e16089fe746c",
-                "sha256:d7da2e1d5f558c37d6e8c1246f1aec1e7349e4913d8fb3cb289a35de573fe2eb"
+                "sha256:15b948e1302682e3682f11f50208b726a246ab4e6c1b39f9264a8796bb416aa2",
+                "sha256:219a3116ecd015f8dca7b5d2c366c973509dfb9a8fc97ef044a36e3da66144a1",
+                "sha256:3b1fc683fb204c6b4403a1ef23f0b1fac8e4477091585e0c8c54cbdf7d7bb164",
+                "sha256:3beff56b453b6ef94ecb2996bea101a08f1f8a9771d3cbf4988a61e4d9973761",
+                "sha256:7687f6455ec3ed7649d1ae574136835a4272b65b3ddcf01ab8704ac65616c5ce",
+                "sha256:7ec45a70d40ede1ec7ad7f95b3c94c9cf4c186a32f6bacb1795b60abd2f9ef27",
+                "sha256:86c857510a9b7c3104cf4cde1568f4921762c8f9842e987bc03ed4f160925754",
+                "sha256:8a627507ef9b307b46a1fea9513d5c98680ba09591253082b4c48697ba05a4ae",
+                "sha256:8dfb69fbf9f3aeed18afffb15e319ca7f8da9642336348ddd6cab2713ddcf8f9",
+                "sha256:a34b577cdf6313bf24755f7a0e3f3c326d5c1f4fe7422d1d06498eb25ad0c600",
+                "sha256:a8ffcd53cb5dfc131850851cc09f1c44689c2812d0beb954d8138d4f5fc17f65",
+                "sha256:b90928f2d9eb2f33162405f32dde9f6dcead63a0971ca8a1b50eb4ca3e35ceb8",
+                "sha256:c56ffe22faa2e51054c5f7a3bc70a370939c2ed4de308c690e7949230c995913",
+                "sha256:f91c7ae919bbc3f96cd5e5b2e786b2b108343d1d7972ea130f7de27fdd547cf3"
             ],
-            "markers": "python_version >= '3.5'",
-            "version": "==0.812"
+            "index": "pypi",
+            "version": "==0.770"
         },
         "mypy-extensions": {
             "hashes": [
@@ -193,27 +187,26 @@
         },
         "pycodestyle": {
             "hashes": [
-                "sha256:514f76d918fcc0b55c6680472f0a37970994e07bbb80725808c17089be302068",
-                "sha256:c389c1d06bf7904078ca03399a4816f974a1d590090fecea0c63ec26ebaf1cef"
+                "sha256:74abc4e221d393ea5ce1f129ea6903209940c1ecd29e002e8c6933c2b21026e0",
+                "sha256:cbc619d09254895b0d12c2c691e237b2e91e9b2ecf5e84c26b35400f93dcfb83",
+                "sha256:cbfca99bd594a10f674d0cd97a3d802a1fdef635d4361e1a2658de47ed261e3a"
             ],
-            "markers": "python_version >= '2.7' and python_version not in '3.0, 3.1, 3.2, 3.3'",
-            "version": "==2.7.0"
+            "version": "==2.4.0"
         },
         "pyflakes": {
             "hashes": [
-                "sha256:7893783d01b8a89811dd72d7dfd4d84ff098e5eed95cfa8905b22bbffe52efc3",
-                "sha256:f5bc8ecabc05bb9d291eb5203d6810b49040f6ff446a756326104746cc00c1db"
+                "sha256:9a7662ec724d0120012f6e29d6248ae3727d821bba522a0e6b356eff19126a49",
+                "sha256:f661252913bc1dbe7fcfcbf0af0db3f42ab65aabd1a6ca68fe5d466bace94dae"
             ],
-            "markers": "python_version >= '2.7' and python_version not in '3.0, 3.1, 3.2, 3.3'",
-            "version": "==2.3.1"
+            "version": "==2.0.0"
         },
         "pylint": {
             "hashes": [
-                "sha256:586d8fa9b1891f4b725f587ef267abe2a1bad89d6b184520c7f07a253dd6e217",
-                "sha256:f7e2072654a6b6afdf5e2fb38147d3e2d2d43c89f648637baab63e026481279b"
+                "sha256:082a6d461b54f90eea49ca90fff4ee8b6e45e8029e5dbd72f6107ef84f3779c0",
+                "sha256:a01cd675eccf6e25b3bdb42be184eb46aaf89187d612ba0fb5f93328ed6b0fd5"
             ],
-            "markers": "python_version ~= '3.6'",
-            "version": "==2.8.2"
+            "index": "pypi",
+            "version": "==2.8.0"
         },
         "pyparsing": {
             "hashes": [
@@ -245,11 +238,11 @@
         },
         "tox": {
             "hashes": [
-                "sha256:307a81ddb82bd463971a273f33e9533a24ed22185f27db8ce3386bff27d324e3",
-                "sha256:b0b5818049a1c1997599d42012a637a33f24c62ab8187223fdd318fa8522637b"
+                "sha256:c60692d92fe759f46c610ac04c03cf0169432d1ff8e981e8ae63e068d0954fc3",
+                "sha256:f179cb4043d7dc1339425dd49ab1dd8c916246b0d9173143c1b0af7498a03ab0"
             ],
-            "markers": "python_version >= '2.7' and python_version not in '3.0, 3.1, 3.2, 3.3, 3.4'",
-            "version": "==3.23.1"
+            "index": "pypi",
+            "version": "==3.18.0"
         },
         "typed-ast": {
             "hashes": [
diff --git a/python/setup.cfg b/python/setup.cfg
index 524789d6e0..e730f208d3 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -32,7 +32,9 @@ packages =
 * = py.typed
 
 [options.extras_require]
-# Run `pipenv lock --dev` when changing these requirements.
+# For the devel group, When adding new dependencies or bumping the minimum
+# version, use e.g. "pipenv install --dev pylint==3.0.0".
+# Subsequently, edit 'Pipfile' to remove e.g. 'pylint = "==3.0.0'.
 devel =
     avocado-framework >= 87.0
     flake8 >= 3.6.0
-- 
2.31.1


