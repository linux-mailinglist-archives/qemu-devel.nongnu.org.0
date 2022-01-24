Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FB1498848
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 19:27:03 +0100 (CET)
Received: from localhost ([::1]:56314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC43T-0007x8-2p
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 13:27:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nC3kP-0002Dp-37
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 13:07:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nC3kM-0006xh-IA
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 13:07:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643047638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VXX7Vk2kcVpctLjnOkCQub6hzrm+bjQjMSo2N13dJT0=;
 b=h0NjcTkD8LkBjO63okqViyksmwznHzjXdA4zUoMxUI/8U6pgOyneR/B6Wlx4Ub3GLgycHe
 +WmWuABpPWsdMvwUO3OfV3Pdb01Djp6tB+q/6msBfH73dITdZDUqT+ph1DYmt3KObtuXxy
 VZHKG979OkWlp5Wd7HKJ2R86E34er3I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-83-_d_6LLErM_SHd8b5uccqwg-1; Mon, 24 Jan 2022 13:07:14 -0500
X-MC-Unique: _d_6LLErM_SHd8b5uccqwg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCD5E85EE60;
 Mon, 24 Jan 2022 18:07:13 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.35.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D4A4B7A445;
 Mon, 24 Jan 2022 18:06:57 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/4] python: upgrade mypy to 0.780
Date: Mon, 24 Jan 2022 13:06:25 -0500
Message-Id: <20220124180626.627718-4-jsnow@redhat.com>
In-Reply-To: <20220124180626.627718-1-jsnow@redhat.com>
References: <20220124180626.627718-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We need a slightly newer version of mypy in order to use some features
of the asyncio server functions in the next commit.

(Note: pipenv is not really suited to upgrading individual packages; I
need to replace this tool with something better for the task. For now,
the miscellaneous updates not related to the mypy upgrade are simply
beyond my control. It's on my list to take care of soon.)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/Pipfile.lock | 66 ++++++++++++++++++++++++++-------------------
 python/setup.cfg    |  2 +-
 2 files changed, 40 insertions(+), 28 deletions(-)

diff --git a/python/Pipfile.lock b/python/Pipfile.lock
index d2a7dbd88b..ce46404ce0 100644
--- a/python/Pipfile.lock
+++ b/python/Pipfile.lock
@@ -1,7 +1,7 @@
 {
     "_meta": {
         "hash": {
-            "sha256": "784b327272db32403d5a488507853b5afba850ba26a5948e5b6a90c1baef2d9c"
+            "sha256": "f1a25654d884a5b450e38d78b1f2e3ebb9073e421cc4358d4bbb83ac251a5670"
         },
         "pipfile-spec": 6,
         "requires": {
@@ -34,7 +34,7 @@
                 "sha256:09bdb456e02564731f8b5957cdd0c98a7f01d2db5e90eb1d794c353c28bfd705",
                 "sha256:6a8a51f64dae307f6e0c9db752b66a7951e282389d8362cc1d39a56f3feeb31d"
             ],
-            "markers": "python_version ~= '3.6'",
+            "index": "pypi",
             "version": "==2.6.0"
         },
         "avocado-framework": {
@@ -50,6 +50,7 @@
                 "sha256:106fef6dc37dd8c0e2c0a60d3fca3e77460a48907f335fa28420463a6f799736",
                 "sha256:23e223426b28491b1ced97dc3bbe183027419dfc7982b4fa2f05d5f3ff10711c"
             ],
+            "index": "pypi",
             "version": "==0.3.2"
         },
         "filelock": {
@@ -57,6 +58,7 @@
                 "sha256:18d82244ee114f543149c66a6e0c14e9c4f8a1044b5cdaadd0f82159d6a6ff59",
                 "sha256:929b7d63ec5b7d6b71b0fa5ac14e030b3f70b75747cef1b10da9b879fef15836"
             ],
+            "index": "pypi",
             "version": "==3.0.12"
         },
         "flake8": {
@@ -88,7 +90,7 @@
                 "sha256:54161657e8ffc76596c4ede7080ca68cb02962a2e074a2586b695a93a925d36e",
                 "sha256:e962bff7440364183203d179d7ae9ad90cb1f2b74dcb84300e88ecc42dca3351"
             ],
-            "markers": "python_version < '3.7'",
+            "index": "pypi",
             "version": "==5.1.4"
         },
         "isort": {
@@ -124,7 +126,7 @@
                 "sha256:ed361bb83436f117f9917d282a456f9e5009ea12fd6de8742d1a4752c3017e93",
                 "sha256:f5144c75445ae3ca2057faac03fda5a902eff196702b0a24daf1d6ce0650514b"
             ],
-            "markers": "python_version >= '2.7' and python_version not in '3.0, 3.1, 3.2, 3.3, 3.4, 3.5'",
+            "index": "pypi",
             "version": "==1.6.0"
         },
         "mccabe": {
@@ -136,23 +138,23 @@
         },
         "mypy": {
             "hashes": [
-                "sha256:15b948e1302682e3682f11f50208b726a246ab4e6c1b39f9264a8796bb416aa2",
-                "sha256:219a3116ecd015f8dca7b5d2c366c973509dfb9a8fc97ef044a36e3da66144a1",
-                "sha256:3b1fc683fb204c6b4403a1ef23f0b1fac8e4477091585e0c8c54cbdf7d7bb164",
-                "sha256:3beff56b453b6ef94ecb2996bea101a08f1f8a9771d3cbf4988a61e4d9973761",
-                "sha256:7687f6455ec3ed7649d1ae574136835a4272b65b3ddcf01ab8704ac65616c5ce",
-                "sha256:7ec45a70d40ede1ec7ad7f95b3c94c9cf4c186a32f6bacb1795b60abd2f9ef27",
-                "sha256:86c857510a9b7c3104cf4cde1568f4921762c8f9842e987bc03ed4f160925754",
-                "sha256:8a627507ef9b307b46a1fea9513d5c98680ba09591253082b4c48697ba05a4ae",
-                "sha256:8dfb69fbf9f3aeed18afffb15e319ca7f8da9642336348ddd6cab2713ddcf8f9",
-                "sha256:a34b577cdf6313bf24755f7a0e3f3c326d5c1f4fe7422d1d06498eb25ad0c600",
-                "sha256:a8ffcd53cb5dfc131850851cc09f1c44689c2812d0beb954d8138d4f5fc17f65",
-                "sha256:b90928f2d9eb2f33162405f32dde9f6dcead63a0971ca8a1b50eb4ca3e35ceb8",
-                "sha256:c56ffe22faa2e51054c5f7a3bc70a370939c2ed4de308c690e7949230c995913",
-                "sha256:f91c7ae919bbc3f96cd5e5b2e786b2b108343d1d7972ea130f7de27fdd547cf3"
+                "sha256:00cb1964a7476e871d6108341ac9c1a857d6bd20bf5877f4773ac5e9d92cd3cd",
+                "sha256:127de5a9b817a03a98c5ae8a0c46a20dc44442af6dcfa2ae7f96cb519b312efa",
+                "sha256:1f3976a945ad7f0a0727aafdc5651c2d3278e3c88dee94e2bf75cd3386b7b2f4",
+                "sha256:2f8c098f12b402c19b735aec724cc9105cc1a9eea405d08814eb4b14a6fb1a41",
+                "sha256:4ef13b619a289aa025f2273e05e755f8049bb4eaba6d703a425de37d495d178d",
+                "sha256:5d142f219bf8c7894dfa79ebfb7d352c4c63a325e75f10dfb4c3db9417dcd135",
+                "sha256:62eb5dd4ea86bda8ce386f26684f7f26e4bfe6283c9f2b6ca6d17faf704dcfad",
+                "sha256:64c36eb0936d0bfb7d8da49f92c18e312ad2e3ed46e5548ae4ca997b0d33bd59",
+                "sha256:75eed74d2faf2759f79c5f56f17388defd2fc994222312ec54ee921e37b31ad4",
+                "sha256:974bebe3699b9b46278a7f076635d219183da26e1a675c1f8243a69221758273",
+                "sha256:a5e5bb12b7982b179af513dddb06fca12285f0316d74f3964078acbfcf4c68f2",
+                "sha256:d31291df31bafb997952dc0a17ebb2737f802c754aed31dd155a8bfe75112c57",
+                "sha256:d3b4941de44341227ece1caaf5b08b23e42ad4eeb8b603219afb11e9d4cfb437",
+                "sha256:eadb865126da4e3c4c95bdb47fe1bb087a3e3ea14d39a3b13224b8a4d9f9a102"
             ],
             "index": "pypi",
-            "version": "==0.770"
+            "version": "==0.780"
         },
         "mypy-extensions": {
             "hashes": [
@@ -166,7 +168,7 @@
                 "sha256:5b327ac1320dc863dca72f4514ecc086f31186744b84a230374cc1fd776feae5",
                 "sha256:67714da7f7bc052e064859c05c595155bd1ee9f69f76557e21f051443c20947a"
             ],
-            "markers": "python_version >= '2.7' and python_version not in '3.0, 3.1, 3.2, 3.3'",
+            "index": "pypi",
             "version": "==20.9"
         },
         "pluggy": {
@@ -174,7 +176,7 @@
                 "sha256:15b2acde666561e1298d71b523007ed7364de07029219b604cf808bfa1c765b0",
                 "sha256:966c145cd83c96502c3c3868f50408687b38434af77734af1e9ca461a4081d2d"
             ],
-            "markers": "python_version >= '2.7' and python_version not in '3.0, 3.1, 3.2, 3.3'",
+            "index": "pypi",
             "version": "==0.13.1"
         },
         "py": {
@@ -182,7 +184,7 @@
                 "sha256:21b81bda15b66ef5e1a777a21c4dcd9c20ad3efd0b3f817e7a809035269e1bd3",
                 "sha256:3b80836aa6d1feeaa108e046da6423ab8f6ceda6468545ae8d02d9d58d18818a"
             ],
-            "markers": "python_version >= '2.7' and python_version not in '3.0, 3.1, 3.2, 3.3'",
+            "index": "pypi",
             "version": "==1.10.0"
         },
         "pycodestyle": {
@@ -205,7 +207,7 @@
                 "sha256:a18f47b506a429f6f4b9df81bb02beab9ca21d0a5fee38ed15aef65f0545519f",
                 "sha256:d66e804411278594d764fc69ec36ec13d9ae9147193a1740cd34d272ca383b8e"
             ],
-            "markers": "python_version >= '3.5'",
+            "index": "pypi",
             "version": "==2.9.0"
         },
         "pylint": {
@@ -221,13 +223,21 @@
                 "sha256:c203ec8783bf771a155b207279b9bccb8dea02d8f0c9e5f8ead507bc3246ecc1",
                 "sha256:ef9d7589ef3c200abe66653d3f1ab1033c3c419ae9b9bdb1240a85b024efc88b"
             ],
-            "markers": "python_version >= '2.6' and python_version not in '3.0, 3.1, 3.2, 3.3'",
+            "index": "pypi",
             "version": "==2.4.7"
         },
         "qemu": {
             "editable": true,
             "path": "."
         },
+        "setuptools": {
+            "hashes": [
+                "sha256:22c7348c6d2976a52632c67f7ab0cdf40147db7789f9aed18734643fe9cf3373",
+                "sha256:4ce92f1e1f8f01233ee9952c04f6b81d1e02939d6e1b488428154974a4d0783e"
+            ],
+            "markers": "python_version >= '3.6'",
+            "version": "==59.6.0"
+        },
         "six": {
             "hashes": [
                 "sha256:1e61c37477a1626458e36f7b1d82aa5c9b094fa4802892072e49de9c60c4c926",
@@ -294,19 +304,21 @@
                 "sha256:50b6f157849174217d0656f99dc82fe932884fb250826c18350e159ec6cdf342",
                 "sha256:779383f6086d90c99ae41cf0ff39aac8a7937a9283ce0a414e5dd782f4c94a84"
             ],
-            "markers": "python_version < '3.8'",
+            "index": "pypi",
             "version": "==3.10.0.0"
         },
         "urwid": {
             "hashes": [
                 "sha256:588bee9c1cb208d0906a9f73c613d2bd32c3ed3702012f51efe318a3f2127eae"
             ],
+            "index": "pypi",
             "version": "==2.1.2"
         },
         "urwid-readline": {
             "hashes": [
                 "sha256:018020cbc864bb5ed87be17dc26b069eae2755cb29f3a9c569aac3bded1efaf4"
             ],
+            "index": "pypi",
             "version": "==0.13"
         },
         "virtualenv": {
@@ -314,7 +326,7 @@
                 "sha256:14fdf849f80dbb29a4eb6caa9875d476ee2a5cf76a5f5415fa2f1606010ab467",
                 "sha256:2b0126166ea7c9c3661f5b8e06773d28f83322de7a3ff7d06f0aed18c9de6a76"
             ],
-            "markers": "python_version >= '2.7' and python_version not in '3.0, 3.1, 3.2, 3.3'",
+            "index": "pypi",
             "version": "==20.4.7"
         },
         "wrapt": {
@@ -328,7 +340,7 @@
                 "sha256:3607921face881ba3e026887d8150cca609d517579abe052ac81fc5aeffdbd76",
                 "sha256:51cb66cc54621609dd593d1787f286ee42a5c0adbb4b29abea5a63edc3e03098"
             ],
-            "markers": "python_version < '3.10'",
+            "index": "pypi",
             "version": "==3.4.1"
         }
     }
diff --git a/python/setup.cfg b/python/setup.cfg
index 3fb18f845d..18aea2bab3 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -41,7 +41,7 @@ devel =
     flake8 >= 3.6.0
     fusepy >= 2.0.4
     isort >= 5.1.2
-    mypy >= 0.770
+    mypy >= 0.780
     pylint >= 2.8.0
     tox >= 3.18.0
     urwid >= 2.1.2
-- 
2.31.1


