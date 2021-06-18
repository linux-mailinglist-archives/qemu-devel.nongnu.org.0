Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 232853AD5B1
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 01:13:55 +0200 (CEST)
Received: from localhost ([::1]:55028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luNgQ-0001n8-4y
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 19:13:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNYK-00078x-Pn
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:05:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNYE-0006EA-Ov
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:05:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624057524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ap2Mdb+flfrX3RVVi0nRFr55p/hO46n9xP9m/rbnl70=;
 b=BST8p8s9TfeDyHdYnqyEGKpURpFrvCHrzaKDnK8G18tvOtOgcwNt4bZtAOhckgjS3/grLj
 8lwF/K/GQUUzjsUc1l4RqEGVwFqJNjQx6PouZ3qo9H+HiyXQmqw8U6nfLEbxUFD1C/fn6M
 ivMVyBgsFGILTptphwSS+uG+J3tmbLc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-mjhjOEqvNzana9kPoZ7yAw-1; Fri, 18 Jun 2021 19:05:22 -0400
X-MC-Unique: mjhjOEqvNzana9kPoZ7yAw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BD05801596;
 Fri, 18 Jun 2021 23:05:21 +0000 (UTC)
Received: from scv.redhat.com (ovpn-113-126.rdu2.redhat.com [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5181B1017CE5;
 Fri, 18 Jun 2021 23:05:20 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/72] python/qmp: add fuse command to 'qom' tools
Date: Fri, 18 Jun 2021 19:04:02 -0400
Message-Id: <20210618230455.2891199-20-jsnow@redhat.com>
In-Reply-To: <20210618230455.2891199-1-jsnow@redhat.com>
References: <20210618230455.2891199-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'fuse' command will be unavailable if 'fusepy' is not installed. It
will simply not load and subsequently be unavailable as a subcommand.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20210603003719.1321369-20-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/qmp/qom.py | 14 ++++++++++++--
 python/setup.cfg       |  1 +
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/python/qemu/qmp/qom.py b/python/qemu/qmp/qom.py
index 7fe1448b5d..7ec7843d57 100644
--- a/python/qemu/qmp/qom.py
+++ b/python/qemu/qmp/qom.py
@@ -1,7 +1,7 @@
 """
 QEMU Object Model testing tools.
 
-usage: qom [-h] {set,get,list,tree} ...
+usage: qom [-h] {set,get,list,tree,fuse} ...
 
 Query and manipulate QOM data
 
@@ -9,11 +9,12 @@
   -h, --help           show this help message and exit
 
 QOM commands:
-  {set,get,list,tree}
+  {set,get,list,tree,fuse}
     set                Set a QOM property value
     get                Get a QOM property value
     list               List QOM properties at a given path
     tree               Show QOM tree from a given path
+    fuse               Mount a QOM tree as a FUSE filesystem
 """
 ##
 # Copyright John Snow 2020, for Red Hat, Inc.
@@ -35,6 +36,15 @@
 from .qom_common import QOMCommand
 
 
+try:
+    from .qom_fuse import QOMFuse
+except ModuleNotFoundError as err:
+    if err.name != 'fuse':
+        raise
+else:
+    assert issubclass(QOMFuse, QOMCommand)
+
+
 class QOMSet(QOMCommand):
     """
     QOM Command - Set a property to a given value.
diff --git a/python/setup.cfg b/python/setup.cfg
index aca6f31185..6b6be8b03c 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -49,6 +49,7 @@ console_scripts =
     qom-get = qemu.qmp.qom:QOMGet.entry_point
     qom-list = qemu.qmp.qom:QOMList.entry_point
     qom-tree = qemu.qmp.qom:QOMTree.entry_point
+    qom-fuse = qemu.qmp.qom_fuse:QOMFuse.entry_point [fuse]
 
 [flake8]
 extend-ignore = E722  # Prefer pylint's bare-except checks to flake8's
-- 
2.31.1


