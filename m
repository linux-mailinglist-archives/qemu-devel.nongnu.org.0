Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C084145CD61
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 20:36:36 +0100 (CET)
Received: from localhost ([::1]:53660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpy4E-00061u-0h
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 14:36:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mpxvC-0003VW-Dy
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 14:27:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mpxvA-0007dP-SW
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 14:27:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637782027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o/D/PEB9EDF7yYxBFFSKnfUT785DfwIux93dqCYu8qA=;
 b=ihasMqDfQQmMo+VnkkrekLz31oksW3AJjMyc6N5SJIkW12De1c0Of0emhitv4QwXlg1Acn
 EiMKg6ur9iXnfKrRjMH+Uj/LMUMpqPZ/mmcMnAFihgXA+aCwl+qgjP3a0wmz2oJVBUheSK
 KK+/Ve32jKz7NPhzR0vkRRCiA/xGWCs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-44-UMe7T4kSPxaSJywGdudO_Q-1; Wed, 24 Nov 2021 14:27:06 -0500
X-MC-Unique: UMe7T4kSPxaSJywGdudO_Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1F68EC1D9;
 Wed, 24 Nov 2021 19:26:58 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CCEC65B826;
 Wed, 24 Nov 2021 19:26:57 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/23] python: move qmp-shell under the AQMP package
Date: Wed, 24 Nov 2021 14:26:04 -0500
Message-Id: <20211124192617.3396403-11-jsnow@redhat.com>
In-Reply-To: <20211124192617.3396403-1-jsnow@redhat.com>
References: <20211124192617.3396403-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/README.rst                      | 2 +-
 python/qemu/{qmp => aqmp}/qmp_shell.py | 0
 python/setup.cfg                       | 2 +-
 scripts/qmp/qmp-shell                  | 2 +-
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename python/qemu/{qmp => aqmp}/qmp_shell.py (100%)

diff --git a/python/README.rst b/python/README.rst
index 9c1fceaee7..fcf74f69ea 100644
--- a/python/README.rst
+++ b/python/README.rst
@@ -59,7 +59,7 @@ Package installation also normally provides executable console scripts,
 so that tools like ``qmp-shell`` are always available via $PATH. To
 invoke them without installation, you can invoke e.g.:
 
-``> PYTHONPATH=~/src/qemu/python python3 -m qemu.qmp.qmp_shell``
+``> PYTHONPATH=~/src/qemu/python python3 -m qemu.aqmp.qmp_shell``
 
 The mappings between console script name and python module path can be
 found in ``setup.cfg``.
diff --git a/python/qemu/qmp/qmp_shell.py b/python/qemu/aqmp/qmp_shell.py
similarity index 100%
rename from python/qemu/qmp/qmp_shell.py
rename to python/qemu/aqmp/qmp_shell.py
diff --git a/python/setup.cfg b/python/setup.cfg
index 78421411d2..168a79c867 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -67,7 +67,7 @@ console_scripts =
     qom-tree = qemu.utils.qom:QOMTree.entry_point
     qom-fuse = qemu.utils.qom_fuse:QOMFuse.entry_point [fuse]
     qemu-ga-client = qemu.utils.qemu_ga_client:main
-    qmp-shell = qemu.qmp.qmp_shell:main
+    qmp-shell = qemu.aqmp.qmp_shell:main
     aqmp-tui = qemu.aqmp.aqmp_tui:main [tui]
 
 [flake8]
diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
index 4a20f97db7..31b19d73e2 100755
--- a/scripts/qmp/qmp-shell
+++ b/scripts/qmp/qmp-shell
@@ -4,7 +4,7 @@ import os
 import sys
 
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
-from qemu.qmp import qmp_shell
+from qemu.aqmp import qmp_shell
 
 
 if __name__ == '__main__':
-- 
2.31.1


