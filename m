Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 141B031F074
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 20:52:58 +0100 (CET)
Received: from localhost ([::1]:49694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCpM9-0007yO-21
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 14:52:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lCoyK-00037l-8P
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 14:28:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lCoyH-0003eD-WB
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 14:28:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613676497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MAmK655zNgk2J5QJKfZw6Xsu0ak6H0JldAXshWYoHdY=;
 b=CwgCF8RFFvJI4ID4oTdNz05Qk+MOwvAzl4lBlaiJ7GtjTdRJ2HLWj0f7TO615xXTlIEnH5
 h86GVG1hHwLZKt2IIQkfXt6r3V7f5l9W7dFOkV6LZ4XX27VCOarm3iCZBKe+SzoMyfs9WQ
 8C5/82q8emdcGp5amqHQCgAnJ+pmmTk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-gUWJjIQVO-ubrTe8s3RqJg-1; Thu, 18 Feb 2021 14:28:13 -0500
X-MC-Unique: gUWJjIQVO-ubrTe8s3RqJg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72ADB427C5;
 Thu, 18 Feb 2021 19:28:12 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2CE6E60BE5;
 Thu, 18 Feb 2021 19:28:11 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 16/25] python: add mypy to pipenv
Date: Thu, 18 Feb 2021 14:27:24 -0500
Message-Id: <20210218192733.370968-17-jsnow@redhat.com>
In-Reply-To: <20210218192733.370968-1-jsnow@redhat.com>
References: <20210218192733.370968-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
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
index d1f7045f680..51c537b0d10 100644
--- a/python/Pipfile
+++ b/python/Pipfile
@@ -5,6 +5,7 @@ verify_ssl = true
 
 [dev-packages]
 flake8 = ">=3.6.0"
+mypy = ">=0.770"
 pylint = ">=2.6.0"
 
 [packages]
diff --git a/python/Pipfile.lock b/python/Pipfile.lock
index 869b0bdf67f..5f8aab117c3 100644
--- a/python/Pipfile.lock
+++ b/python/Pipfile.lock
@@ -1,7 +1,7 @@
 {
     "_meta": {
         "hash": {
-            "sha256": "9f6d4857a6c72ad40fc1ec1e58cdb76f187a2986ac4156f0027e5eb798ec69a9"
+            "sha256": "65f010a8f2e55e9870d2b7e0d8af129516097d23abf2504f396552748b067ade"
         },
         "pipfile-spec": 6,
         "requires": {
@@ -83,6 +83,41 @@
             ],
             "version": "==0.6.1"
         },
+        "mypy": {
+            "hashes": [
+                "sha256:0d2fc8beb99cd88f2d7e20d69131353053fbecea17904ee6f0348759302c52fa",
+                "sha256:2b216eacca0ec0ee124af9429bfd858d5619a0725ee5f88057e6e076f9eb1a7b",
+                "sha256:319ee5c248a7c3f94477f92a729b7ab06bf8a6d04447ef3aa8c9ba2aa47c6dcf",
+                "sha256:3e0c159a7853e3521e3f582adb1f3eac66d0b0639d434278e2867af3a8c62653",
+                "sha256:5615785d3e2f4f03ab7697983d82c4b98af5c321614f51b8f1034eb9ebe48363",
+                "sha256:5ff616787122774f510caeb7b980542a7cc2222be3f00837a304ea85cd56e488",
+                "sha256:6f8425fecd2ba6007e526209bb985ce7f49ed0d2ac1cc1a44f243380a06a84fb",
+                "sha256:74f5aa50d0866bc6fb8e213441c41e466c86678c800700b87b012ed11c0a13e0",
+                "sha256:90b6f46dc2181d74f80617deca611925d7e63007cf416397358aa42efb593e07",
+                "sha256:947126195bfe4709c360e89b40114c6746ae248f04d379dca6f6ab677aa07641",
+                "sha256:a301da58d566aca05f8f449403c710c50a9860782148332322decf73a603280b",
+                "sha256:aa9d4901f3ee1a986a3a79fe079ffbf7f999478c281376f48faa31daaa814e86",
+                "sha256:b9150db14a48a8fa114189bfe49baccdff89da8c6639c2717750c7ae62316738",
+                "sha256:b95068a3ce3b50332c40e31a955653be245666a4bc7819d3c8898aa9fb9ea496",
+                "sha256:ca7ad5aed210841f1e77f5f2f7d725b62c78fa77519312042c719ed2ab937876",
+                "sha256:d16c54b0dffb861dc6318a8730952265876d90c5101085a4bc56913e8521ba19",
+                "sha256:e0202e37756ed09daf4b0ba64ad2c245d357659e014c3f51d8cd0681ba66940a",
+                "sha256:e1c84c65ff6d69fb42958ece5b1255394714e0aac4df5ffe151bc4fe19c7600a",
+                "sha256:e32b7b282c4ed4e378bba8b8dfa08e1cfa6f6574067ef22f86bee5b1039de0c9",
+                "sha256:e3b8432f8df19e3c11235c4563a7250666dc9aa7cdda58d21b4177b20256ca9f",
+                "sha256:e497a544391f733eca922fdcb326d19e894789cd4ff61d48b4b195776476c5cf",
+                "sha256:f5fdf935a46aa20aa937f2478480ebf4be9186e98e49cc3843af9a5795a49a25"
+            ],
+            "index": "pypi",
+            "version": "==0.800"
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
                 "sha256:2295e7b2f6b5bd100585ebcb1f616591b652db8a741695b3d8f5d28bdc934367",
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
2.29.2


