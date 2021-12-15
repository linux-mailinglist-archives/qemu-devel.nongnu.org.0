Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D154476239
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 20:54:12 +0100 (CET)
Received: from localhost ([::1]:56446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxaLq-0007Tx-Er
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 14:54:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxaAc-00053P-PK
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 14:42:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxaAY-0000Xs-Rh
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 14:42:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639597350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GHTs3dVM5hFbGiBs6bsJhoICZNDKvIQeHP9OLCa4kXo=;
 b=BRZ9/QILr/Pqqan2y+naDFhFTXOBgbNVfklUv+vJa8Q8hTVCzgxHLpaTXYoDGBijGVsRTz
 /4NQwH13II+dUzW+693/hzVdyXVtmgAb8uQ90w27GPcCndQb8wTGlJgg5SpoG1qpyWIrb3
 j85suXUiqnhVUs+5tLhNdI6PkveKpHc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-tJ-KfLmDMWC4qdHCactbmA-1; Wed, 15 Dec 2021 14:42:27 -0500
X-MC-Unique: tJ-KfLmDMWC4qdHCactbmA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08DC3801ADC;
 Wed, 15 Dec 2021 19:42:26 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA4E410074FD;
 Wed, 15 Dec 2021 19:42:24 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/25] python: move qmp utilities to python/qemu/utils
Date: Wed, 15 Dec 2021 14:39:24 -0500
Message-Id: <20211215193939.3768033-11-jsnow@redhat.com>
In-Reply-To: <20211215193939.3768033-1-jsnow@redhat.com>
References: <20211215193939.3768033-1-jsnow@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, Andrea Bolognani <abologna@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In order to upload a QMP package to PyPI, I want to remove any scripts
that I am not 100% confident I want to support upstream, beyond our
castle walls.

Move most of our QMP utilities into the utils package so we can split
them out from the PyPI upload.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/{qmp => utils}/qemu_ga_client.py |  0
 python/qemu/{qmp => utils}/qom.py            |  0
 python/qemu/{qmp => utils}/qom_common.py     |  0
 python/qemu/{qmp => utils}/qom_fuse.py       |  0
 python/setup.cfg                             | 16 ++++++++--------
 scripts/qmp/qemu-ga-client                   |  2 +-
 scripts/qmp/qom-fuse                         |  2 +-
 scripts/qmp/qom-get                          |  2 +-
 scripts/qmp/qom-list                         |  2 +-
 scripts/qmp/qom-set                          |  2 +-
 scripts/qmp/qom-tree                         |  2 +-
 11 files changed, 14 insertions(+), 14 deletions(-)
 rename python/qemu/{qmp => utils}/qemu_ga_client.py (100%)
 rename python/qemu/{qmp => utils}/qom.py (100%)
 rename python/qemu/{qmp => utils}/qom_common.py (100%)
 rename python/qemu/{qmp => utils}/qom_fuse.py (100%)

diff --git a/python/qemu/qmp/qemu_ga_client.py b/python/qemu/utils/qemu_ga_client.py
similarity index 100%
rename from python/qemu/qmp/qemu_ga_client.py
rename to python/qemu/utils/qemu_ga_client.py
diff --git a/python/qemu/qmp/qom.py b/python/qemu/utils/qom.py
similarity index 100%
rename from python/qemu/qmp/qom.py
rename to python/qemu/utils/qom.py
diff --git a/python/qemu/qmp/qom_common.py b/python/qemu/utils/qom_common.py
similarity index 100%
rename from python/qemu/qmp/qom_common.py
rename to python/qemu/utils/qom_common.py
diff --git a/python/qemu/qmp/qom_fuse.py b/python/qemu/utils/qom_fuse.py
similarity index 100%
rename from python/qemu/qmp/qom_fuse.py
rename to python/qemu/utils/qom_fuse.py
diff --git a/python/setup.cfg b/python/setup.cfg
index 417e937839..78421411d2 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -60,13 +60,13 @@ tui =
 
 [options.entry_points]
 console_scripts =
-    qom = qemu.qmp.qom:main
-    qom-set = qemu.qmp.qom:QOMSet.entry_point
-    qom-get = qemu.qmp.qom:QOMGet.entry_point
-    qom-list = qemu.qmp.qom:QOMList.entry_point
-    qom-tree = qemu.qmp.qom:QOMTree.entry_point
-    qom-fuse = qemu.qmp.qom_fuse:QOMFuse.entry_point [fuse]
-    qemu-ga-client = qemu.qmp.qemu_ga_client:main
+    qom = qemu.utils.qom:main
+    qom-set = qemu.utils.qom:QOMSet.entry_point
+    qom-get = qemu.utils.qom:QOMGet.entry_point
+    qom-list = qemu.utils.qom:QOMList.entry_point
+    qom-tree = qemu.utils.qom:QOMTree.entry_point
+    qom-fuse = qemu.utils.qom_fuse:QOMFuse.entry_point [fuse]
+    qemu-ga-client = qemu.utils.qemu_ga_client:main
     qmp-shell = qemu.qmp.qmp_shell:main
     aqmp-tui = qemu.aqmp.aqmp_tui:main [tui]
 
@@ -80,7 +80,7 @@ python_version = 3.6
 warn_unused_configs = True
 namespace_packages = True
 
-[mypy-qemu.qmp.qom_fuse]
+[mypy-qemu.utils.qom_fuse]
 # fusepy has no type stubs:
 allow_subclassing_any = True
 
diff --git a/scripts/qmp/qemu-ga-client b/scripts/qmp/qemu-ga-client
index 102fd2cad9..56edd0234a 100755
--- a/scripts/qmp/qemu-ga-client
+++ b/scripts/qmp/qemu-ga-client
@@ -4,7 +4,7 @@ import os
 import sys
 
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
-from qemu.qmp import qemu_ga_client
+from qemu.utils import qemu_ga_client
 
 
 if __name__ == '__main__':
diff --git a/scripts/qmp/qom-fuse b/scripts/qmp/qom-fuse
index a58c8ef979..d453807b27 100755
--- a/scripts/qmp/qom-fuse
+++ b/scripts/qmp/qom-fuse
@@ -4,7 +4,7 @@ import os
 import sys
 
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
-from qemu.qmp.qom_fuse import QOMFuse
+from qemu.utils.qom_fuse import QOMFuse
 
 
 if __name__ == '__main__':
diff --git a/scripts/qmp/qom-get b/scripts/qmp/qom-get
index e4f3e0c013..04ebe052e8 100755
--- a/scripts/qmp/qom-get
+++ b/scripts/qmp/qom-get
@@ -4,7 +4,7 @@ import os
 import sys
 
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
-from qemu.qmp.qom import QOMGet
+from qemu.utils.qom import QOMGet
 
 
 if __name__ == '__main__':
diff --git a/scripts/qmp/qom-list b/scripts/qmp/qom-list
index 7a071a54e1..853b85a8d3 100755
--- a/scripts/qmp/qom-list
+++ b/scripts/qmp/qom-list
@@ -4,7 +4,7 @@ import os
 import sys
 
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
-from qemu.qmp.qom import QOMList
+from qemu.utils.qom import QOMList
 
 
 if __name__ == '__main__':
diff --git a/scripts/qmp/qom-set b/scripts/qmp/qom-set
index 9ca9e2ba10..06820feec4 100755
--- a/scripts/qmp/qom-set
+++ b/scripts/qmp/qom-set
@@ -4,7 +4,7 @@ import os
 import sys
 
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
-from qemu.qmp.qom import QOMSet
+from qemu.utils.qom import QOMSet
 
 
 if __name__ == '__main__':
diff --git a/scripts/qmp/qom-tree b/scripts/qmp/qom-tree
index 7d0ccca3a4..760e172277 100755
--- a/scripts/qmp/qom-tree
+++ b/scripts/qmp/qom-tree
@@ -4,7 +4,7 @@ import os
 import sys
 
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
-from qemu.qmp.qom import QOMTree
+from qemu.utils.qom import QOMTree
 
 
 if __name__ == '__main__':
-- 
2.31.1


