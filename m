Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1464940CA67
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 18:36:20 +0200 (CEST)
Received: from localhost ([::1]:44116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQXtT-0003AA-3z
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 12:36:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQXoD-0003EA-5b
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:30:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQXoA-0004cT-Ct
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:30:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631723449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/tBwPO66m4qCtaUvyJSX+/k8d72dgk5dKnymRHaFgoE=;
 b=W5SF0LN1ptbJE93PlhWY0451dPgB6WsSpG4pU4WjM12F7P/R2qxcTnU2y7wAMLdtv97HPW
 Ss3IuRo+N/TXIPFwQ3yI0paKbwUL6qWPGfgYPM0Lq01uBtifoOhxdCumN+y8B4PctKkD+U
 wFa20OAYb30dLLgq2hKsh/HfKIT0slQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-cmhbET4MMxSq_GeiuIYnvA-1; Wed, 15 Sep 2021 12:30:44 -0400
X-MC-Unique: cmhbET4MMxSq_GeiuIYnvA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 266965722E;
 Wed, 15 Sep 2021 16:30:43 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D52A7771A;
 Wed, 15 Sep 2021 16:30:17 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 01/27] python/aqmp: add asynchronous QMP (AQMP) subpackage
Date: Wed, 15 Sep 2021 12:29:29 -0400
Message-Id: <20210915162955.333025-2-jsnow@redhat.com>
In-Reply-To: <20210915162955.333025-1-jsnow@redhat.com>
References: <20210915162955.333025-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.39, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For now, it's empty! Soon, it won't be.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 python/qemu/aqmp/__init__.py | 27 +++++++++++++++++++++++++++
 python/qemu/aqmp/py.typed    |  0
 python/setup.cfg             |  1 +
 3 files changed, 28 insertions(+)
 create mode 100644 python/qemu/aqmp/__init__.py
 create mode 100644 python/qemu/aqmp/py.typed

diff --git a/python/qemu/aqmp/__init__.py b/python/qemu/aqmp/__init__.py
new file mode 100644
index 0000000000..391141c948
--- /dev/null
+++ b/python/qemu/aqmp/__init__.py
@@ -0,0 +1,27 @@
+"""
+QEMU Monitor Protocol (QMP) development library & tooling.
+
+This package provides a fairly low-level class for communicating
+asynchronously with QMP protocol servers, as implemented by QEMU, the
+QEMU Guest Agent, and the QEMU Storage Daemon.
+
+`QMPClient` provides the main functionality of this package. All errors
+raised by this library dervive from `AQMPError`, see `aqmp.error` for
+additional detail. See `aqmp.events` for an in-depth tutorial on
+managing QMP events.
+"""
+
+# Copyright (C) 2020, 2021 John Snow for Red Hat, Inc.
+#
+# Authors:
+#  John Snow <jsnow@redhat.com>
+#
+# Based on earlier work by Luiz Capitulino <lcapitulino@redhat.com>.
+#
+# This work is licensed under the terms of the GNU GPL, version 2.  See
+# the COPYING file in the top-level directory.
+
+
+# The order of these fields impact the Sphinx documentation order.
+__all__ = (
+)
diff --git a/python/qemu/aqmp/py.typed b/python/qemu/aqmp/py.typed
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/python/setup.cfg b/python/setup.cfg
index 0f0cab098f..dfce732e83 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -27,6 +27,7 @@ packages =
     qemu.qmp
     qemu.machine
     qemu.utils
+    qemu.aqmp
 
 [options.package_data]
 * = py.typed
-- 
2.31.1


