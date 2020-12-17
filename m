Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BE32DD4B0
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 16:59:02 +0100 (CET)
Received: from localhost ([::1]:56740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpvgE-0000lH-1F
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 10:59:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kpvc8-0005O4-Mf
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 10:54:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kpvc6-0000ke-TV
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 10:54:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608220486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uB8t/ed0eWCpzbMtlZyPmvfm1sd0uT7mTQgP7lht7Fc=;
 b=BHXOMIgtbWEDJKuPQ8U8d5iOK5ctE9sdC31+EqIl8K1OntO3rvgG+rwv5oDZxnNzcfONCs
 HenMDR4IFnNWVMoxEjwT5gqZ8I8eXA25F0VNM09j0w6Fn9l9ebphXU/ol9zRCnr/0Zxnr+
 swjVlwLnKkQ9dV97jWd8P3zOc1yH2kk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-DtN1UfY5M6SO-zv4BzgUmw-1; Thu, 17 Dec 2020 10:54:44 -0500
X-MC-Unique: DtN1UfY5M6SO-zv4BzgUmw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 916E4192296B;
 Thu, 17 Dec 2020 15:54:43 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B0941F055;
 Thu, 17 Dec 2020 15:54:40 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] scripts/gdb: fix 'qemu coroutine' when users selects a
 non topmost stack frame
Date: Thu, 17 Dec 2020 17:54:35 +0200
Message-Id: <20201217155436.927320-2-mlevitsk@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The code that dumps the stack frame works like that:
* save current registers
* overwrite current registers (including rip/rsp) with coroutine snapshot
  in the jmpbuf
* print backtrace
* restore the saved registers.

If the user has currently selected a non topmost stack frame in gdb,
the above code will still restore the selected frame registers,
but the gdb will then lose the selected frame index, which makes it impossible
to switch back to frame 0, to continue debugging the executable.

Therefore switch temporarily to the topmost frame of the stack
for the above code.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 scripts/qemugdb/coroutine.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/qemugdb/coroutine.py b/scripts/qemugdb/coroutine.py
index db61389022..e1399211e6 100644
--- a/scripts/qemugdb/coroutine.py
+++ b/scripts/qemugdb/coroutine.py
@@ -70,6 +70,11 @@ def bt_jmpbuf(jmpbuf):
     regs = get_jmpbuf_regs(jmpbuf)
     old = dict()
 
+    # remember current stack frame and select the topmost
+    # so that register modifications don't wreck it
+    selected_frame = gdb.selected_frame()
+    gdb.newest_frame().select()
+
     for i in regs:
         old[i] = gdb.parse_and_eval('(uint64_t)$%s' % i)
 
@@ -81,6 +86,8 @@ def bt_jmpbuf(jmpbuf):
     for i in regs:
         gdb.execute('set $%s = %s' % (i, old[i]))
 
+    selected_frame.select()
+
 def coroutine_to_jmpbuf(co):
     coroutine_pointer = co.cast(gdb.lookup_type('CoroutineUContext').pointer())
     return coroutine_pointer['env']['__jmpbuf']
-- 
2.26.2


