Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC76633E073
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 22:24:53 +0100 (CET)
Received: from localhost ([::1]:37350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMHBM-0000ug-OL
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 17:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMH2g-0005ae-Mk
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:15:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMH2W-0003Uu-1U
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:15:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615929343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bxuEem7eH3oi70ZALrvisRIbjREUWOlBR4STd9QYAFc=;
 b=Hcx99u2qvTvYtrIkzESpXtUHMQBSwPVVwAnKD4MHP+DrOlcjoaEYgq06FzlWzVHCdN5QTW
 zUO1pcnSwZIZH0wCLfmqq/c9lzqhEucGiqCR4nA1tkaBiKG4jMqQ3CafqNyDBURMcj1so1
 rt3F31pN9WD2lmcilanpRGJdXahvfls=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-G69D9ZwIPzuGNeOjqqPjoA-1; Tue, 16 Mar 2021 17:15:41 -0400
X-MC-Unique: G69D9ZwIPzuGNeOjqqPjoA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 097F9A40C0;
 Tue, 16 Mar 2021 21:15:40 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F805610AF;
 Tue, 16 Mar 2021 21:15:39 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/16] fuzz: don't leave orphan llvm-symbolizers around
Date: Tue, 16 Mar 2021 17:15:20 -0400
Message-Id: <20210316211531.1649909-6-pbonzini@redhat.com>
In-Reply-To: <20210316211531.1649909-1-pbonzini@redhat.com>
References: <20210316211531.1649909-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Thomas Huth <thuth@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Bulekov <alxndr@bu.edu>

I noticed that with a sufficiently small timeout, the fuzzer fork-server
sometimes locks up. On closer inspection, the issue appeared to be
caused by entering our SIGALRM handler, while libfuzzer is in it's crash
handlers. Because libfuzzer relies on pipe communication with an
external child process to print out stack-traces, we shouldn't exit
early, and leave an orphan child. Check for children in the SIGALRM
handler to avoid this issue.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Acked-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qtest/fuzz/generic_fuzz.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index ee8c17a04c..387ae2020a 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -583,6 +583,21 @@ static void handle_timeout(int sig)
         fprintf(stderr, "[Timeout]\n");
         fflush(stderr);
     }
+
+    /*
+     * If there is a crash, libfuzzer/ASAN forks a child to run an
+     * "llvm-symbolizer" process for printing out a pretty stacktrace. It
+     * communicates with this child using a pipe.  If we timeout+Exit, while
+     * libfuzzer is still communicating with the llvm-symbolizer child, we will
+     * be left with an orphan llvm-symbolizer process. Sometimes, this appears
+     * to lead to a deadlock in the forkserver. Use waitpid to check if there
+     * are any waitable children. If so, exit out of the signal-handler, and
+     * let libfuzzer finish communicating with the child, and exit, on its own.
+     */
+    if (waitpid(-1, NULL, WNOHANG) == 0) {
+        return;
+    }
+
     _Exit(0);
 }
 
-- 
2.26.2



