Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2852319332
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 20:37:11 +0100 (CET)
Received: from localhost ([::1]:60772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAHm2-0004dl-Un
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 14:37:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lAHCR-0004Vl-G7
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:00:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lAHC8-0005an-N3
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:00:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613070003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P5Lj9gKSHUJHg537gSSwSQg0+dnfCC743ixmUhWpk0g=;
 b=TI/QeNL6WAdLr23CiSFqyp8ufhdI//BoSLoRDGKDDuYlJydqSPqCZWDG/yKWy2w7O2Yh/B
 F3Z0qtX7rIlfir1XQ4tYxPssGXAIbCh8agPV312GU+QsNQ3X8/3IRE8TYsQgho08K3bnpW
 +O9/6t80eHCbRX+0EcxbJv8NGlBijr4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-VibTZ7HlNba-HFZydKV5Vw-1; Thu, 11 Feb 2021 13:59:59 -0500
X-MC-Unique: VibTZ7HlNba-HFZydKV5Vw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69253101CCCD;
 Thu, 11 Feb 2021 18:59:45 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E85613828;
 Thu, 11 Feb 2021 18:59:43 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/24] python: add pylint to pipenv
Date: Thu, 11 Feb 2021 13:58:43 -0500
Message-Id: <20210211185856.3975616-12-jsnow@redhat.com>
In-Reply-To: <20210211185856.3975616-1-jsnow@redhat.com>
References: <20210211185856.3975616-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are specifying >= pylint 2.6.x for two reasons:

1. For setup.cfg support, added in pylint 2.5.x
2. To clarify that we are using a version that has incompatibly dropped
bad-whitespace checks.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/Pipfile      |   1 +
 python/Pipfile.lock | 137 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 138 insertions(+)
 create mode 100644 python/Pipfile.lock

diff --git a/python/Pipfile b/python/Pipfile
index 9534830b5eb..1e58986c895 100644
--- a/python/Pipfile
+++ b/python/Pipfile
@@ -4,6 +4,7 @@ url = "https://pypi.org/simple"
 verify_ssl = true
 
 [dev-packages]
+pylint = ">=2.6.0"
 
 [packages]
 
diff --git a/python/Pipfile.lock b/python/Pipfile.lock
new file mode 100644
index 00000000000..4506335b7d9
--- /dev/null
+++ b/python/Pipfile.lock
@@ -0,0 +1,137 @@
+{
+    "_meta": {
+        "hash": {
+            "sha256": "b7ac1f2ad73bc166244c0378298afba64951a16bb749b81a9668dc41f40f941c"
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
+                "sha256:2f4078c2a41bf377eea06d71c9d2ba4eb8f6b1af2135bec27bbbb7d8f12bb703",
+                "sha256:bc58d83eb610252fd8de6363e39d4f1d0619c894b0ed24603b881c02e64c7386"
+            ],
+            "markers": "python_version >= '3.5'",
+            "version": "==2.4.2"
+        },
+        "isort": {
+            "hashes": [
+                "sha256:c729845434366216d320e936b8ad6f9d681aab72dc7cbc2d51bedc3582f3ad1e",
+                "sha256:fff4f0c04e1825522ce6949973e83110a6e907750cd92d128b0d14aaaadbffdc"
+            ],
+            "markers": "python_version >= '3.6' and python_version < '4.0'",
+            "version": "==5.7.0"
+        },
+        "lazy-object-proxy": {
+            "hashes": [
+                "sha256:0c4b206227a8097f05c4dbdd323c50edf81f15db3b8dc064d08c62d37e1a504d",
+                "sha256:194d092e6f246b906e8f70884e620e459fc54db3259e60cf69a4d66c3fda3449",
+                "sha256:1be7e4c9f96948003609aa6c974ae59830a6baecc5376c25c92d7d697e684c08",
+                "sha256:4677f594e474c91da97f489fea5b7daa17b5517190899cf213697e48d3902f5a",
+                "sha256:48dab84ebd4831077b150572aec802f303117c8cc5c871e182447281ebf3ac50",
+                "sha256:5541cada25cd173702dbd99f8e22434105456314462326f06dba3e180f203dfd",
+                "sha256:59f79fef100b09564bc2df42ea2d8d21a64fdcda64979c0fa3db7bdaabaf6239",
+                "sha256:8d859b89baf8ef7f8bc6b00aa20316483d67f0b1cbf422f5b4dc56701c8f2ffb",
+                "sha256:9254f4358b9b541e3441b007a0ea0764b9d056afdeafc1a5569eee1cc6c1b9ea",
+                "sha256:9651375199045a358eb6741df3e02a651e0330be090b3bc79f6d0de31a80ec3e",
+                "sha256:97bb5884f6f1cdce0099f86b907aa41c970c3c672ac8b9c8352789e103cf3156",
+                "sha256:9b15f3f4c0f35727d3a0fba4b770b3c4ebbb1fa907dbcc046a1d2799f3edd142",
+                "sha256:a2238e9d1bb71a56cd710611a1614d1194dc10a175c1e08d75e1a7bcc250d442",
+                "sha256:a6ae12d08c0bf9909ce12385803a543bfe99b95fe01e752536a60af2b7797c62",
+                "sha256:ca0a928a3ddbc5725be2dd1cf895ec0a254798915fb3a36af0964a0a4149e3db",
+                "sha256:cb2c7c57005a6804ab66f106ceb8482da55f5314b7fcb06551db1edae4ad1531",
+                "sha256:d74bb8693bf9cf75ac3b47a54d716bbb1a92648d5f781fc799347cfc95952383",
+                "sha256:d945239a5639b3ff35b70a88c5f2f491913eb94871780ebfabb2568bd58afc5a",
+                "sha256:eba7011090323c1dadf18b3b689845fd96a61ba0a1dfbd7f24b921398affc357",
+                "sha256:efa1909120ce98bbb3777e8b6f92237f5d5c8ea6758efea36a473e1d38f7d3e4",
+                "sha256:f3900e8a5de27447acbf900b4750b0ddfd7ec1ea7fbaf11dfa911141bc522af0"
+            ],
+            "markers": "python_version >= '2.7' and python_version not in '3.0, 3.1, 3.2, 3.3'",
+            "version": "==1.4.3"
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
+                "sha256:bb4a908c9dadbc3aac18860550e870f58e1a02c9f2c204fdf5693d73be061210",
+                "sha256:bfe68f020f8a0fece830a22dd4d5dddb4ecc6137db04face4c3420a46a52239f"
+            ],
+            "index": "pypi",
+            "version": "==2.6.0"
+        },
+        "six": {
+            "hashes": [
+                "sha256:30639c035cdb23534cd4aa2dd52c3bf48f06e5f4a941509c8bafd8ce11080259",
+                "sha256:8b74bedcbbbaca38ff6d7491d76f2b06b3592611af620f8426e82dddb04a5ced"
+            ],
+            "markers": "python_version >= '2.7' and python_version not in '3.0, 3.1, 3.2'",
+            "version": "==1.15.0"
+        },
+        "toml": {
+            "hashes": [
+                "sha256:806143ae5bfb6a3c6e736a764057db0e6a0e05e338b5630894a5f779cabb4f9b",
+                "sha256:b3bda1d108d5dd99f4a20d24d9c348e91c4db7ab1b749200bded2f839ccbe68f"
+            ],
+            "markers": "python_version >= '2.6' and python_version not in '3.0, 3.1, 3.2'",
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
+            "markers": "implementation_name == 'cpython' and python_version < '3.8'",
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
2.29.2


