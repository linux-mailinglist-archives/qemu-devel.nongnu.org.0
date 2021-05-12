Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A81937EF80
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 01:20:21 +0200 (CEST)
Received: from localhost ([::1]:34580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgy9M-0000W6-AE
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 19:20:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgy2l-0001v0-43
 for qemu-devel@nongnu.org; Wed, 12 May 2021 19:13:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgy2d-00066w-Ka
 for qemu-devel@nongnu.org; Wed, 12 May 2021 19:13:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620861203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wRANU4OBek6ly1ImRZc2ovgK7u3t8rjJjcROM6mCA/w=;
 b=QIV+JJZM5ftGbYerKLQc80LCbOAyTV4v4gTH/1XWOQhQkLUtmiyj3mxfj2znvvncHbESUx
 J1EXw8qtorUU4UhzqxtymbPgiN+MPR0B03jUS1ZbNY+NQPMoyqyJKKkH4yyW9VLPZqfmr/
 mFZ5bZYb60cnj+UBfkSy46RYZuOiRMs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-QsP703mpP2eGZsJdKaqQug-1; Wed, 12 May 2021 19:13:21 -0400
X-MC-Unique: QsP703mpP2eGZsJdKaqQug-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 238ED107ACCA;
 Wed, 12 May 2021 23:13:20 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A89CE629DA;
 Wed, 12 May 2021 23:13:18 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 11/25] python: add pylint to pipenv
Date: Wed, 12 May 2021 19:12:27 -0400
Message-Id: <20210512231241.2816122-12-jsnow@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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

We are specifying >= pylint 2.7.x for several reasons:

1. For setup.cfg support, added in pylint 2.5.x
2. To specify a version that has incompatibly dropped
   bad-whitespace checks (2.6.x)
3. 2.7.x fixes "unsubscriptable" warnings in Python 3.9

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/Pipfile      |   1 +
 python/Pipfile.lock | 130 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 131 insertions(+)
 create mode 100644 python/Pipfile.lock

diff --git a/python/Pipfile b/python/Pipfile
index 9534830b5eb..aaee00581eb 100644
--- a/python/Pipfile
+++ b/python/Pipfile
@@ -4,6 +4,7 @@ url = "https://pypi.org/simple"
 verify_ssl = true
 
 [dev-packages]
+pylint = ">=2.7.0"
 
 [packages]
 
diff --git a/python/Pipfile.lock b/python/Pipfile.lock
new file mode 100644
index 00000000000..b5e556d265b
--- /dev/null
+++ b/python/Pipfile.lock
@@ -0,0 +1,130 @@
+{
+    "_meta": {
+        "hash": {
+            "sha256": "2016d2670f203ed4ffac9f59cdfbc540f209ad76eff28e484f245f401d524f5c"
+        },
+        "pipfile-spec": 6,
+        "requires": {
+            "python_version": "3.6"
+        },
+        "sources": [
+            {
+                "name": "pypi",
+                "url": "https://pypi.org/simple",
+                "verify_ssl": true
+            }
+        ]
+    },
+    "default": {},
+    "develop": {
+        "astroid": {
+            "hashes": [
+                "sha256:6b0ed1af831570e500e2437625979eaa3b36011f66ddfc4ce930128610258ca9",
+                "sha256:cd80bf957c49765dce6d92c43163ff9d2abc43132ce64d4b1b47717c6d2522df"
+            ],
+            "markers": "python_version >= '3.6'",
+            "version": "==2.5.2"
+        },
+        "isort": {
+            "hashes": [
+                "sha256:0a943902919f65c5684ac4e0154b1ad4fac6dcaa5d9f3426b732f1c8b5419be6",
+                "sha256:2bb1680aad211e3c9944dbce1d4ba09a989f04e238296c87fe2139faa26d655d"
+            ],
+            "markers": "python_version >= '3.6' and python_version < '4.0'",
+            "version": "==5.8.0"
+        },
+        "lazy-object-proxy": {
+            "hashes": [
+                "sha256:17e0967ba374fc24141738c69736da90e94419338fd4c7c7bef01ee26b339653",
+                "sha256:1fee665d2638491f4d6e55bd483e15ef21f6c8c2095f235fef72601021e64f61",
+                "sha256:22ddd618cefe54305df49e4c069fa65715be4ad0e78e8d252a33debf00f6ede2",
+                "sha256:24a5045889cc2729033b3e604d496c2b6f588c754f7a62027ad4437a7ecc4837",
+                "sha256:410283732af311b51b837894fa2f24f2c0039aa7f220135192b38fcc42bd43d3",
+                "sha256:4732c765372bd78a2d6b2150a6e99d00a78ec963375f236979c0626b97ed8e43",
+                "sha256:489000d368377571c6f982fba6497f2aa13c6d1facc40660963da62f5c379726",
+                "sha256:4f60460e9f1eb632584c9685bccea152f4ac2130e299784dbaf9fae9f49891b3",
+                "sha256:5743a5ab42ae40caa8421b320ebf3a998f89c85cdc8376d6b2e00bd12bd1b587",
+                "sha256:85fb7608121fd5621cc4377a8961d0b32ccf84a7285b4f1d21988b2eae2868e8",
+                "sha256:9698110e36e2df951c7c36b6729e96429c9c32b3331989ef19976592c5f3c77a",
+                "sha256:9d397bf41caad3f489e10774667310d73cb9c4258e9aed94b9ec734b34b495fd",
+                "sha256:b579f8acbf2bdd9ea200b1d5dea36abd93cabf56cf626ab9c744a432e15c815f",
+                "sha256:b865b01a2e7f96db0c5d12cfea590f98d8c5ba64ad222300d93ce6ff9138bcad",
+                "sha256:bf34e368e8dd976423396555078def5cfc3039ebc6fc06d1ae2c5a65eebbcde4",
+                "sha256:c6938967f8528b3668622a9ed3b31d145fab161a32f5891ea7b84f6b790be05b",
+                "sha256:d1c2676e3d840852a2de7c7d5d76407c772927addff8d742b9808fe0afccebdf",
+                "sha256:d7124f52f3bd259f510651450e18e0fd081ed82f3c08541dffc7b94b883aa981",
+                "sha256:d900d949b707778696fdf01036f58c9876a0d8bfe116e8d220cfd4b15f14e741",
+                "sha256:ebfd274dcd5133e0afae738e6d9da4323c3eb021b3e13052d8cbd0e457b1256e",
+                "sha256:ed361bb83436f117f9917d282a456f9e5009ea12fd6de8742d1a4752c3017e93",
+                "sha256:f5144c75445ae3ca2057faac03fda5a902eff196702b0a24daf1d6ce0650514b"
+            ],
+            "markers": "python_version >= '2.7' and python_version not in '3.0, 3.1, 3.2, 3.3, 3.4, 3.5'",
+            "version": "==1.6.0"
+        },
+        "mccabe": {
+            "hashes": [
+                "sha256:ab8a6258860da4b6677da4bd2fe5dc2c659cff31b3ee4f7f5d64e79735b80d42",
+                "sha256:dd8d182285a0fe56bace7f45b5e7d1a6ebcbf524e8f3bd87eb0f125271b8831f"
+            ],
+            "version": "==0.6.1"
+        },
+        "pylint": {
+            "hashes": [
+                "sha256:0e21d3b80b96740909d77206d741aa3ce0b06b41be375d92e1f3244a274c1f8a",
+                "sha256:d09b0b07ba06bcdff463958f53f23df25e740ecd81895f7d2699ec04bbd8dc3b"
+            ],
+            "index": "pypi",
+            "version": "==2.7.2"
+        },
+        "toml": {
+            "hashes": [
+                "sha256:806143ae5bfb6a3c6e736a764057db0e6a0e05e338b5630894a5f779cabb4f9b",
+                "sha256:b3bda1d108d5dd99f4a20d24d9c348e91c4db7ab1b749200bded2f839ccbe68f"
+            ],
+            "markers": "python_version >= '2.6' and python_version not in '3.0, 3.1, 3.2, 3.3'",
+            "version": "==0.10.2"
+        },
+        "typed-ast": {
+            "hashes": [
+                "sha256:07d49388d5bf7e863f7fa2f124b1b1d89d8aa0e2f7812faff0a5658c01c59aa1",
+                "sha256:14bf1522cdee369e8f5581238edac09150c765ec1cb33615855889cf33dcb92d",
+                "sha256:240296b27397e4e37874abb1df2a608a92df85cf3e2a04d0d4d61055c8305ba6",
+                "sha256:36d829b31ab67d6fcb30e185ec996e1f72b892255a745d3a82138c97d21ed1cd",
+                "sha256:37f48d46d733d57cc70fd5f30572d11ab8ed92da6e6b28e024e4a3edfb456e37",
+                "sha256:4c790331247081ea7c632a76d5b2a265e6d325ecd3179d06e9cf8d46d90dd151",
+                "sha256:5dcfc2e264bd8a1db8b11a892bd1647154ce03eeba94b461effe68790d8b8e07",
+                "sha256:7147e2a76c75f0f64c4319886e7639e490fee87c9d25cb1d4faef1d8cf83a440",
+                "sha256:7703620125e4fb79b64aa52427ec192822e9f45d37d4b6625ab37ef403e1df70",
+                "sha256:8368f83e93c7156ccd40e49a783a6a6850ca25b556c0fa0240ed0f659d2fe496",
+                "sha256:84aa6223d71012c68d577c83f4e7db50d11d6b1399a9c779046d75e24bed74ea",
+                "sha256:85f95aa97a35bdb2f2f7d10ec5bbdac0aeb9dafdaf88e17492da0504de2e6400",
+                "sha256:8db0e856712f79c45956da0c9a40ca4246abc3485ae0d7ecc86a20f5e4c09abc",
+                "sha256:9044ef2df88d7f33692ae3f18d3be63dec69c4fb1b5a4a9ac950f9b4ba571606",
+                "sha256:963c80b583b0661918718b095e02303d8078950b26cc00b5e5ea9ababe0de1fc",
+                "sha256:987f15737aba2ab5f3928c617ccf1ce412e2e321c77ab16ca5a293e7bbffd581",
+                "sha256:9ec45db0c766f196ae629e509f059ff05fc3148f9ffd28f3cfe75d4afb485412",
+                "sha256:9fc0b3cb5d1720e7141d103cf4819aea239f7d136acf9ee4a69b047b7986175a",
+                "sha256:a2c927c49f2029291fbabd673d51a2180038f8cd5a5b2f290f78c4516be48be2",
+                "sha256:a38878a223bdd37c9709d07cd357bb79f4c760b29210e14ad0fb395294583787",
+                "sha256:b4fcdcfa302538f70929eb7b392f536a237cbe2ed9cba88e3bf5027b39f5f77f",
+                "sha256:c0c74e5579af4b977c8b932f40a5464764b2f86681327410aa028a22d2f54937",
+                "sha256:c1c876fd795b36126f773db9cbb393f19808edd2637e00fd6caba0e25f2c7b64",
+                "sha256:c9aadc4924d4b5799112837b226160428524a9a45f830e0d0f184b19e4090487",
+                "sha256:cc7b98bf58167b7f2db91a4327da24fb93368838eb84a44c472283778fc2446b",
+                "sha256:cf54cfa843f297991b7388c281cb3855d911137223c6b6d2dd82a47ae5125a41",
+                "sha256:d003156bb6a59cda9050e983441b7fa2487f7800d76bdc065566b7d728b4581a",
+                "sha256:d175297e9533d8d37437abc14e8a83cbc68af93cc9c1c59c2c292ec59a0697a3",
+                "sha256:d746a437cdbca200622385305aedd9aef68e8a645e385cc483bdc5e488f07166",
+                "sha256:e683e409e5c45d5c9082dc1daf13f6374300806240719f95dc783d1fc942af10"
+            ],
+            "markers": "python_version < '3.8' and implementation_name == 'cpython'",
+            "version": "==1.4.2"
+        },
+        "wrapt": {
+            "hashes": [
+                "sha256:b62ffa81fb85f4332a4f609cab4ac40709470da05643a082ec1eb88e6d9b97d7"
+            ],
+            "version": "==1.12.1"
+        }
+    }
+}
-- 
2.30.2


