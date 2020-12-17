Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 925D22DD476
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 16:43:27 +0100 (CET)
Received: from localhost ([::1]:47174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpvR8-0001UT-H9
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 10:43:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kpvMH-0003sT-Ek
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 10:38:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kpvMF-0007Al-Ok
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 10:38:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608219503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dr3gqa6nrhH/uqBQf7dXwynNIGujuvPl3eJ29yLHITY=;
 b=gKJbhdcg2b6Hms3CqJQpJuJpAP6fj1FYum57xEiESjCyMwhkrAeu+9SGQbGRLWI9g8/v0D
 1tHbxv89bq8CQuv7qd9YDrrxICj5vA+rKopR32dVLUeHROngJIQwpdWBdpdk9b7hwbcFGs
 rTqfwae1qfS9Qwxho4Om8PrOc72496Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-BppVfmxHOX2Et47fkOAYSQ-1; Thu, 17 Dec 2020 10:38:21 -0500
X-MC-Unique: BppVfmxHOX2Et47fkOAYSQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 864A9100A642;
 Thu, 17 Dec 2020 15:38:20 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0FCB710013C0;
 Thu, 17 Dec 2020 15:38:17 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] scripts/gdb: implement 'qemu bt'
Date: Thu, 17 Dec 2020 17:38:11 +0200
Message-Id: <20201217153811.919932-3-mlevitsk@redhat.com>
In-Reply-To: <20201217153811.919932-1-mlevitsk@redhat.com>
References: <20201217153811.919932-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
 scripts/qemugdb/coroutine.py | 32 +++++++++++++++++++++++++++++++-
 2 files changed, 32 insertions(+), 1 deletion(-)

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
index e1399211e6..39d53a102e 100644
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
 
 
@@ -107,6 +110,33 @@ class CoroutineCommand(gdb.Command):
 
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
+        thread = gdb.selected_thread()
+        if thread == None or not thread.is_stopped():
+            raise gdb.GdbError("No currrent thread")
+
+        if gdb.parse_and_eval("qemu_in_coroutine()") == False:
+            return
+
+        co_ptr = gdb.parse_and_eval("qemu_coroutine_self()")
+        gdb.write("Coroutine at " + str(co_ptr) + ":\n")
+
+        while True:
+            co = co_cast(co_ptr)
+            co_ptr = co["base"]["caller"]
+            if co_ptr == 0:
+                break
+            bt_jmpbuf(coroutine_to_jmpbuf(co_ptr))
+
 class CoroutineSPFunction(gdb.Function):
     def __init__(self):
         gdb.Function.__init__(self, 'qemu_coroutine_sp')
-- 
2.26.2


