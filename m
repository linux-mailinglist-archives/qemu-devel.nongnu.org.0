Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECEA2DD4B1
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 16:59:50 +0100 (CET)
Received: from localhost ([::1]:58896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpvgz-0001gI-5S
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 10:59:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kpvcE-0005Sh-Em
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 10:54:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kpvcB-0000lV-27
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 10:54:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608220490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CR5OU/vWaTbG82/mqChLOHmk101aowjVba1VRcxA3Y0=;
 b=cuhx/wMTpAavsFxYofFW2BWAjJezYq+tq8TgGnnjjw7Kxf69B9p4kQ19SrfKZP1FUC7Ah1
 lPNe2Wi7eN7DnP5DNLsl9V8mK+0XAMqIt/7TXg1MF6RFquuug8nUV+vfBrTRPLPcqNo+94
 wcUUQiAGaM8LVmtrIl5/d/l7SSJb0pE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-2K2ekK7JPWCt122L7ltNUQ-1; Thu, 17 Dec 2020 10:54:48 -0500
X-MC-Unique: 2K2ekK7JPWCt122L7ltNUQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7204F107ACE6;
 Thu, 17 Dec 2020 15:54:46 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2CDBE1C934;
 Thu, 17 Dec 2020 15:54:43 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] scripts/gdb: implement 'qemu bt'
Date: Thu, 17 Dec 2020 17:54:36 +0200
Message-Id: <20201217155436.927320-3-mlevitsk@redhat.com>
In-Reply-To: <20201217155436.927320-1-mlevitsk@redhat.com>
References: <20201217155436.927320-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This script first runs the regular gdb's 'bt' command, and then if we are in a
coroutine it prints the coroutines backtraces in the order in which they
were called.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 scripts/qemu-gdb.py          |  1 +
 scripts/qemugdb/coroutine.py | 28 +++++++++++++++++++++++++++-
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/scripts/qemu-gdb.py b/scripts/qemu-gdb.py
index e0bfa7b5a4..4d2a9f6c43 100644
--- a/scripts/qemu-gdb.py
+++ b/scripts/qemu-gdb.py
@@ -40,6 +40,7 @@ timers.TimersCommand()
 
 coroutine.CoroutineSPFunction()
 coroutine.CoroutinePCFunction()
+coroutine.CoroutineBt()
 
 # Default to silently passing through SIGUSR1, because QEMU sends it
 # to itself a lot.
diff --git a/scripts/qemugdb/coroutine.py b/scripts/qemugdb/coroutine.py
index e1399211e6..7db46d4b68 100644
--- a/scripts/qemugdb/coroutine.py
+++ b/scripts/qemugdb/coroutine.py
@@ -88,8 +88,11 @@ def bt_jmpbuf(jmpbuf):
 
     selected_frame.select()
 
+def co_cast(co):
+    return co.cast(gdb.lookup_type('CoroutineUContext').pointer())
+
 def coroutine_to_jmpbuf(co):
-    coroutine_pointer = co.cast(gdb.lookup_type('CoroutineUContext').pointer())
+    coroutine_pointer = co_cast(co)
     return coroutine_pointer['env']['__jmpbuf']
 
 
@@ -107,6 +110,29 @@ class CoroutineCommand(gdb.Command):
 
         bt_jmpbuf(coroutine_to_jmpbuf(gdb.parse_and_eval(argv[0])))
 
+class CoroutineBt(gdb.Command):
+    '''Display backtrace including coroutine switches'''
+    def __init__(self):
+        gdb.Command.__init__(self, 'qemu bt', gdb.COMMAND_STACK,
+                             gdb.COMPLETE_NONE)
+
+    def invoke(self, arg, from_tty):
+
+        gdb.execute("bt")
+
+        if gdb.parse_and_eval("qemu_in_coroutine()") == False:
+            return
+
+        co_ptr = gdb.parse_and_eval("qemu_coroutine_self()")
+
+        while True:
+            co = co_cast(co_ptr)
+            co_ptr = co["base"]["caller"]
+            if co_ptr == 0:
+                break
+            gdb.write("Coroutine at " + str(co_ptr) + ":\n")
+            bt_jmpbuf(coroutine_to_jmpbuf(co_ptr))
+
 class CoroutineSPFunction(gdb.Function):
     def __init__(self):
         gdb.Function.__init__(self, 'qemu_coroutine_sp')
-- 
2.26.2


