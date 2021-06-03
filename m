Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F0D399733
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 02:48:11 +0200 (CEST)
Received: from localhost ([::1]:56676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lobWs-0003Qd-Rg
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 20:48:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lobMr-0005PD-W9
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 20:37:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lobMq-0004rQ-2v
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 20:37:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622680667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rXF4ZXaMMbLySO5l6Dq9d86icbMOjB0pb0H/AUQB23I=;
 b=efGIL7RKxSr176mV7MENpLOx4ZF4PRrDnN0MTFhS+1pzFu6wHrtOX+hEzLs6WBtrpHUI2L
 FSta8XIfPdiAZy/MTcCKUb3bXfc/lUd01jKmpTt6zLOK+tj52kudn3kd+amgSCzltLrrAO
 2dTaYHUg/nbxowoRYDZEwFajHS2PSvg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-dX0QTr6MN9qw7cFcDbJsRw-1; Wed, 02 Jun 2021 20:37:44 -0400
X-MC-Unique: dX0QTr6MN9qw7cFcDbJsRw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 141388018A7;
 Thu,  3 Jun 2021 00:37:43 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15B4010013D6;
 Thu,  3 Jun 2021 00:37:42 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 19/19] python/qmp: add fuse command to 'qom' tools
Date: Wed,  2 Jun 2021 20:37:19 -0400
Message-Id: <20210603003719.1321369-20-jsnow@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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

The 'fuse' command will be unavailable if 'fusepy' is not installed. It
will simply not load and subsequently be unavailable as a subcommand.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/qmp/qom.py | 14 ++++++++++++--
 python/setup.cfg       |  1 +
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/python/qemu/qmp/qom.py b/python/qemu/qmp/qom.py
index 7fe1448b5d9..7ec7843d57a 100644
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
index aca6f311853..6b6be8b03c6 100644
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


