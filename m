Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF4237EFC5
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 01:28:09 +0200 (CEST)
Received: from localhost ([::1]:38962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgyGu-00063P-Nv
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 19:28:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgy30-0002ah-Ia
 for qemu-devel@nongnu.org; Wed, 12 May 2021 19:13:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgy2v-0006Lo-Vo
 for qemu-devel@nongnu.org; Wed, 12 May 2021 19:13:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620861221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FBnIMi9nn9lsSjNz/v/14byGnxXGLwd6TjiEyjUtMvs=;
 b=CQFXBdR1S1+z7WzhZl6a/K1rmUXZVpI4ZfjSa/mp15lU76BJ79B6GP7SQ1dL4CrRObNHT+
 KM/7g9J7Hhw2++l5sujMY8NkpnIUl/sL5y8L5pr2n8qpfQBs1dHTodGiQUBQOjd9feudl6
 O/DgI2Il+gHAhAarRGMRyvRSv26uDdA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-R-yckyd-NjKRHlLHIBybYQ-1; Wed, 12 May 2021 19:13:37 -0400
X-MC-Unique: R-yckyd-NjKRHlLHIBybYQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD9FF801817;
 Wed, 12 May 2021 23:13:36 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 43534629DA;
 Wed, 12 May 2021 23:13:34 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 16/25] python: add mypy to pipenv
Date: Wed, 12 May 2021 19:12:32 -0400
Message-Id: <20210512231241.2816122-17-jsnow@redhat.com>
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

0.730 appears to be about the oldest version that works with the
features we want, including nice human readable output (to make sure
iotest 297 passes), and type-parameterized Popen generics.

0.770, however, supports adding 'strict' to the config file, so require
at least 0.770.

Now that we are checking a namespace package, we need to tell mypy to
allow PEP420 namespaces, so modify the mypy config as part of the move.

mypy can now be run from the python root by typing 'mypy -p qemu'.

A note on mypy invocation: Running it as "mypy qemu/" changes the import
path detection mechanisms in mypy slightly, and it will fail. See
https://github.com/python/mypy/issues/8584 for a decent entry point with
more breadcrumbs on the various behaviors that contribute to this subtle
difference.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>
---
 python/Pipfile      |  1 +
 python/Pipfile.lock | 37 ++++++++++++++++++++++++++++++++++++-
 python/setup.cfg    |  1 +
 3 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/python/Pipfile b/python/Pipfile
index cc43445ef8f..bb2e34b381d 100644
--- a/python/Pipfile
+++ b/python/Pipfile
@@ -5,6 +5,7 @@ verify_ssl = true
 
 [dev-packages]
 flake8 = ">=3.6.0"
+mypy = ">=0.770"
 pylint = ">=2.7.0"
 
 [packages]
diff --git a/python/Pipfile.lock b/python/Pipfile.lock
index dd2fafadd61..2b1567b359c 100644
--- a/python/Pipfile.lock
+++ b/python/Pipfile.lock
@@ -1,7 +1,7 @@
 {
     "_meta": {
         "hash": {
-            "sha256": "4a4a9c6e09d9c5ce670fe4d067052a743dc3eff93c4790f9da31a0db2a66f8fc"
+            "sha256": "5e5b76eb2f6d8e833b79d9f083f08e0087b3e663275a00b84a6799419aa8a776"
         },
         "pipfile-spec": 6,
         "requires": {
@@ -84,6 +84,41 @@
             ],
             "version": "==0.6.1"
         },
+        "mypy": {
+            "hashes": [
+                "sha256:0d0a87c0e7e3a9becdfbe936c981d32e5ee0ccda3e0f07e1ef2c3d1a817cf73e",
+                "sha256:25adde9b862f8f9aac9d2d11971f226bd4c8fbaa89fb76bdadb267ef22d10064",
+                "sha256:28fb5479c494b1bab244620685e2eb3c3f988d71fd5d64cc753195e8ed53df7c",
+                "sha256:2f9b3407c58347a452fc0736861593e105139b905cca7d097e413453a1d650b4",
+                "sha256:33f159443db0829d16f0a8d83d94df3109bb6dd801975fe86bacb9bf71628e97",
+                "sha256:3f2aca7f68580dc2508289c729bd49ee929a436208d2b2b6aab15745a70a57df",
+                "sha256:499c798053cdebcaa916eef8cd733e5584b5909f789de856b482cd7d069bdad8",
+                "sha256:4eec37370483331d13514c3f55f446fc5248d6373e7029a29ecb7b7494851e7a",
+                "sha256:552a815579aa1e995f39fd05dde6cd378e191b063f031f2acfe73ce9fb7f9e56",
+                "sha256:5873888fff1c7cf5b71efbe80e0e73153fe9212fafdf8e44adfe4c20ec9f82d7",
+                "sha256:61a3d5b97955422964be6b3baf05ff2ce7f26f52c85dd88db11d5e03e146a3a6",
+                "sha256:674e822aa665b9fd75130c6c5f5ed9564a38c6cea6a6432ce47eafb68ee578c5",
+                "sha256:7ce3175801d0ae5fdfa79b4f0cfed08807af4d075b402b7e294e6aa72af9aa2a",
+                "sha256:9743c91088d396c1a5a3c9978354b61b0382b4e3c440ce83cf77994a43e8c521",
+                "sha256:9f94aac67a2045ec719ffe6111df543bac7874cee01f41928f6969756e030564",
+                "sha256:a26f8ec704e5a7423c8824d425086705e381b4f1dfdef6e3a1edab7ba174ec49",
+                "sha256:abf7e0c3cf117c44d9285cc6128856106183938c68fd4944763003decdcfeb66",
+                "sha256:b09669bcda124e83708f34a94606e01b614fa71931d356c1f1a5297ba11f110a",
+                "sha256:cd07039aa5df222037005b08fbbfd69b3ab0b0bd7a07d7906de75ae52c4e3119",
+                "sha256:d23e0ea196702d918b60c8288561e722bf437d82cb7ef2edcd98cfa38905d506",
+                "sha256:d65cc1df038ef55a99e617431f0553cd77763869eebdf9042403e16089fe746c",
+                "sha256:d7da2e1d5f558c37d6e8c1246f1aec1e7349e4913d8fb3cb289a35de573fe2eb"
+            ],
+            "index": "pypi",
+            "version": "==0.812"
+        },
+        "mypy-extensions": {
+            "hashes": [
+                "sha256:090fedd75945a69ae91ce1303b5824f428daf5a028d2f6ab8a299250a846f15d",
+                "sha256:2d82818f5bb3e369420cb3c4060a7970edba416647068eb4c5343488a6c604a8"
+            ],
+            "version": "==0.4.3"
+        },
         "pycodestyle": {
             "hashes": [
                 "sha256:514f76d918fcc0b55c6680472f0a37970994e07bbb80725808c17089be302068",
diff --git a/python/setup.cfg b/python/setup.cfg
index a3fcf67f8d2..cdd8477292b 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -28,6 +28,7 @@ exclude = __pycache__,
 strict = True
 python_version = 3.6
 warn_unused_configs = True
+namespace_packages = True
 
 [pylint.messages control]
 # Disable the message, report, category or checker with the given id(s). You
-- 
2.30.2


