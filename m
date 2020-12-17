Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E96C22DD456
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 16:40:35 +0100 (CET)
Received: from localhost ([::1]:36404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpvOM-0005Tc-Hl
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 10:40:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kpvME-0003lx-KC
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 10:38:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kpvMC-0007A9-Sg
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 10:38:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608219500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uB8t/ed0eWCpzbMtlZyPmvfm1sd0uT7mTQgP7lht7Fc=;
 b=BxzeK9PP4MaXnDPPCJsdcwHTX8akjJbXUX7fX5eDYiEwHV5a9vQQuYlsFCgRvSU7xqS795
 Lm9nh68+SZ92IC0E/wr8NnlmgZ1Kwxio+BcJfEHNXOKAzU81XWABTom+d+PMt5pojAxuQO
 c0oYZknS3YgpJlqbchGJQFNuha8mZnQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-nwqR0fZ2MdW0ic8JF5oTRQ-1; Thu, 17 Dec 2020 10:38:18 -0500
X-MC-Unique: nwqR0fZ2MdW0ic8JF5oTRQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74C1D107ACE4;
 Thu, 17 Dec 2020 15:38:17 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 176AD10013C0;
 Thu, 17 Dec 2020 15:38:14 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] scripts/gdb: fix 'qemu coroutine' when users selects a
 non topmost stack frame
Date: Thu, 17 Dec 2020 17:38:10 +0200
Message-Id: <20201217153811.919932-2-mlevitsk@redhat.com>
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


