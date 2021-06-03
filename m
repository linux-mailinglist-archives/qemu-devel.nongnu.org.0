Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E075039972B
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 02:44:56 +0200 (CEST)
Received: from localhost ([::1]:45010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lobTj-00042S-Vl
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 20:44:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lobMm-00052u-PU
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 20:37:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lobMk-0004oH-Ue
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 20:37:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622680662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AzIulRTPQzYUJvspCQFmwoZtqKCpHFSHcbEXqeOXCJM=;
 b=aJ4P92yatokElFG4tlHlw6ng9OCrWYuZczmeEk96j1G71UGkBMyE+TIj6+lXRgkDIkfK8w
 G2vNhf2ZSJAyMgNneebvhLdL4WepgDbkWCT5U+9bdF67q6Xg2cmq27LhZoUYiiJDQPv+zS
 slpSVtqVvXyuxTTgmJLnY1pIVsWOmTI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-OidnOUVIOrucv5saVoX5yw-1; Wed, 02 Jun 2021 20:37:40 -0400
X-MC-Unique: OidnOUVIOrucv5saVoX5yw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07D41801106;
 Thu,  3 Jun 2021 00:37:40 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B43410013D6;
 Thu,  3 Jun 2021 00:37:39 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/19] python: add optional FUSE dependencies
Date: Wed,  2 Jun 2021 20:37:16 -0400
Message-Id: <20210603003719.1321369-17-jsnow@redhat.com>
In-Reply-To: <20210603003719.1321369-1-jsnow@redhat.com>
References: <20210603003719.1321369-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In preparation for moving qom-fuse over to the python package, we need
some new dependencies to support it.

Add an optional 'fusepy' dependency that users of the package can opt
into with e.g. "pip install qemu[fuse]" which installs the requirements
necessary to obtain the additional functionality.

Add the same fusepy dependency to the 'devel' extras group --
unfortunately I do not see a way for optional groups to imply other
optional groups at present, so the dependency is repeated. The
development group needs to include the full set of dependencies for the
purpose of static analysis of all features offered by this library.

Lastly, add the [fuse] extras group to tox's configuration as a
workaround so that if a stale tox environment is found when running
`make check-tox`, tox will know to rebuild its environments.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/Pipfile.lock | 6 ++++++
 python/setup.cfg    | 9 ++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/python/Pipfile.lock b/python/Pipfile.lock
index f2a3f91d0fa..5bb3f1b6351 100644
--- a/python/Pipfile.lock
+++ b/python/Pipfile.lock
@@ -67,6 +67,12 @@
             "markers": "python_version >= '2.7' and python_version not in '3.0, 3.1, 3.2, 3.3, 3.4'",
             "version": "==3.9.2"
         },
+        "fusepy": {
+            "hashes": [
+                "sha256:72ff783ec2f43de3ab394e3f7457605bf04c8cf288a2f4068b4cde141d4ee6bd"
+            ],
+            "version": "==3.0.1"
+        },
         "importlib-metadata": {
             "hashes": [
                 "sha256:8c501196e49fb9df5df43833bdb1e4328f64847763ec8a50703148b73784d581",
diff --git a/python/setup.cfg b/python/setup.cfg
index ba8d29fd62d..aca6f311853 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -32,11 +32,16 @@ packages =
 devel =
     avocado-framework >= 87.0
     flake8 >= 3.6.0
+    fusepy >= 2.0.4
     isort >= 5.1.2
     mypy >= 0.770
     pylint >= 2.8.0
     tox >= 3.18.0
 
+# Provides qom-fuse functionality
+fuse =
+    fusepy >= 2.0.4
+
 [options.entry_points]
 console_scripts =
     qom = qemu.qmp.qom:main
@@ -114,6 +119,8 @@ envlist = py36, py37, py38, py39, py310
 
 [testenv]
 allowlist_externals = make
-deps = .[devel]
+deps =
+    .[devel]
+    .[fuse]  # Workaround to trigger tox venv rebuild
 commands =
     make check
-- 
2.31.1


