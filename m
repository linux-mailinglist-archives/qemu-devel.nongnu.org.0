Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FED29049F
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Oct 2020 14:03:09 +0200 (CEST)
Received: from localhost ([::1]:54896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTORw-0002om-6b
	for lists+qemu-devel@lfdr.de; Fri, 16 Oct 2020 08:03:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kTODm-0000hW-Vy
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 07:48:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kTODj-0002q0-8L
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 07:48:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602848906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kxdVjF2Er60OGDzynNPANMzCS861qRa0y8atYbWDuco=;
 b=MaJnGceGgsGOiotUQZhfvvlJmz5jimm3VPkiFkloAOJL+ezanexyCcc9otgAHpBLzAWRdh
 8+O7kKrdvhcYBkJzvx+8JeTaZz6IT/2FSgyQP+O7/vC5oQz59WXV7Td6VcccnhLjXEuqa/
 lBBqUGx8dhWxcvH/HEQkIGl9Nx1RSnE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-JIjJhn7KOGu6JbOBtbyiVA-1; Fri, 16 Oct 2020 07:48:24 -0400
X-MC-Unique: JIjJhn7KOGu6JbOBtbyiVA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3ADFB805EFB;
 Fri, 16 Oct 2020 11:48:23 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3DAB76642;
 Fri, 16 Oct 2020 11:48:22 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/22] fuzz: Disable QEMU's SIG{INT,HUP,TERM} handlers
Date: Fri, 16 Oct 2020 07:48:12 -0400
Message-Id: <20201016114814.1564523-21-pbonzini@redhat.com>
In-Reply-To: <20201016114814.1564523-1-pbonzini@redhat.com>
References: <20201016114814.1564523-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/15 20:29:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Bulekov <alxndr@bu.edu>

Prior to this patch, the only way I found to terminate the fuzzer was
either to:
 1. Explicitly specify the number of fuzzer runs with the -runs= flag
 2. SIGKILL the process with "pkill -9 qemu-fuzz-*" or similar

In addition to being annoying to deal with, SIGKILLing the process skips
over any exit handlers(e.g. registered with atexit()). This is bad,
since some fuzzers might create temporary files that should ideally be
removed on exit using an exit handler. The only way to achieve a clean
exit now is to specify -runs=N , but the desired "N" is tricky to
identify prior to fuzzing.

Why doesn't the process exit with standard SIGINT,SIGHUP,SIGTERM
signals? QEMU installs its own handlers for these signals in
os-posix.c:os_setup_signal_handling, which notify the main loop that an
exit was requested. The fuzzer, however, does not run qemu_main_loop,
which performs the main_loop_should_exit() check.  This means that the
fuzzer effectively ignores these signals. As we don't really care about
cleanly stopping the disposable fuzzer "VM", this patch uninstalls
QEMU's signal handlers. Thus, we can stop the fuzzer with
SIG{INT,HUP,TERM} and the fuzzing code can optionally use atexit() to
clean up temporary files/resources.

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Message-Id: <20201014142157.46028-1-alxndr@bu.edu>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qtest/fuzz/fuzz.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/qtest/fuzz/fuzz.c b/tests/qtest/fuzz/fuzz.c
index d926c490c5..eb0070437f 100644
--- a/tests/qtest/fuzz/fuzz.c
+++ b/tests/qtest/fuzz/fuzz.c
@@ -217,5 +217,13 @@ int LLVMFuzzerInitialize(int *argc, char ***argv, char ***envp)
     /* re-enable the rcu atfork, which was previously disabled in qemu_init */
     rcu_enable_atfork();
 
+    /*
+     * Disable QEMU's signal handlers, since we manually control the main_loop,
+     * and don't check for main_loop_should_exit
+     */
+    signal(SIGINT, SIG_DFL);
+    signal(SIGHUP, SIG_DFL);
+    signal(SIGTERM, SIG_DFL);
+
     return 0;
 }
-- 
2.26.2



