Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF4E48A3DA
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 00:45:31 +0100 (CET)
Received: from localhost ([::1]:44376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n74Ly-00072o-42
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 18:45:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n748w-0004dw-Fs
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 18:32:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n748t-0000Jf-Fk
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 18:32:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641857516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cPzbOhw7pxcTM4EH09AzBQnYI/L+iSIjq3Lzr2bqJ4U=;
 b=YxFdBuzW8pcsTu0jKT5QmpKSlVn7nqGA/10py1JE9wHyVL6sZWx7ZaPVDYOi/wlKHKU4lC
 z/+zW45yF3VYL38hfgiSGfbfPZuUPyzO8ErTdRV7rSWL08rqN3nwEj9NE0tTtpFNfna+r5
 HHfg3H+ciewGgjJ320jxnPt+dz4SqNw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-RwqNj0e_PTavQOMyPpFURQ-1; Mon, 10 Jan 2022 18:31:53 -0500
X-MC-Unique: RwqNj0e_PTavQOMyPpFURQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C02A192CC40;
 Mon, 10 Jan 2022 23:31:52 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.219])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E624A7B028;
 Mon, 10 Jan 2022 23:31:50 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/31] python: move qmp-shell under the AQMP package
Date: Mon, 10 Jan 2022 18:28:55 -0500
Message-Id: <20220110232910.1923864-17-jsnow@redhat.com>
In-Reply-To: <20220110232910.1923864-1-jsnow@redhat.com>
References: <20220110232910.1923864-1-jsnow@redhat.com>
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
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Beraldo Leal <bleal@redhat.com>
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


