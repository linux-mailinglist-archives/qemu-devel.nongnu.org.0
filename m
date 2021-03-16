Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B85F33E06C
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 22:22:28 +0100 (CET)
Received: from localhost ([::1]:57800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMH91-00065d-FD
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 17:22:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMH2f-0005WS-Bz
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:15:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMH2X-0003VC-SJ
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:15:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615929344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i/DGdtQQ1rUmbZ91UH2o/Fu6b9EvArbb0mGvRXoUJYc=;
 b=Oau0YtiBwa7bjhW0Zfs5QSqrZAJ7gmimt+7PNzkmiOZrRjPZBxoOaXwHdvtP0GvSVjrTjc
 Yz5LN53adudEJiualByYKeUpTSXIlCIrWqS7OmhzH/Qhjh/MxABcIG4bXu4cg7qlKyOTj5
 KmY9+JMRDXQ5gvwsH3mhB92jDGLizFo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-5wlDERFwNueVMz-1cwacPQ-1; Tue, 16 Mar 2021 17:15:42 -0400
X-MC-Unique: 5wlDERFwNueVMz-1cwacPQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCE8F108BD07;
 Tue, 16 Mar 2021 21:15:40 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8DD6B610AF;
 Tue, 16 Mar 2021 21:15:40 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/16] fuzz: add instructions for building reproducers
Date: Tue, 16 Mar 2021 17:15:22 -0400
Message-Id: <20210316211531.1649909-8-pbonzini@redhat.com>
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Bulekov <alxndr@bu.edu>

We have several scripts that help build reproducers, but no
documentation for how they should be used. Add some documentation

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/fuzzing.rst | 56 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/docs/devel/fuzzing.rst b/docs/devel/fuzzing.rst
index 97797c4f8c..2749bb9bed 100644
--- a/docs/devel/fuzzing.rst
+++ b/docs/devel/fuzzing.rst
@@ -210,6 +210,62 @@ Build details:
 - The script responsible for building the fuzzers can be found in the
   QEMU source tree at ``scripts/oss-fuzz/build.sh``
 
+Building Crash Reproducers
+-----------------------------------------
+When we find a crash, we should try to create an independent reproducer, that
+can be used on a non-fuzzer build of QEMU. This filters out any potential
+false-positives, and improves the debugging experience for developers.
+Here are the steps for building a reproducer for a crash found by the
+generic-fuzz target.
+
+- Ensure the crash reproduces::
+
+    qemu-fuzz-i386 --fuzz-target... ./crash-...
+
+- Gather the QTest output for the crash::
+
+    QEMU_FUZZ_TIMEOUT=0 QTEST_LOG=1 FUZZ_SERIALIZE_QTEST=1 \
+    qemu-fuzz-i386 --fuzz-target... ./crash-... &> /tmp/trace
+
+- Reorder and clean-up the resulting trace::
+
+    scripts/oss-fuzz/reorder_fuzzer_qtest_trace.py /tmp/trace > /tmp/reproducer
+
+- Get the arguments needed to start qemu, and provide a path to qemu::
+
+    less /tmp/trace # The args should be logged at the top of this file
+    export QEMU_ARGS="-machine ..."
+    export QEMU_PATH="path/to/qemu-system"
+
+- Ensure the crash reproduces in qemu-system::
+
+    $QEMU_PATH $QEMU_ARGS -qtest stdio < /tmp/reproducer
+
+- From the crash output, obtain some string that identifies the crash. This
+  can be a line in the stack-trace, for example::
+
+    export CRASH_TOKEN="hw/usb/hcd-xhci.c:1865"
+
+- Minimize the reproducer::
+
+    scripts/oss-fuzz/minimize_qtest_trace.py -M1 -M2 \
+      /tmp/reproducer /tmp/reproducer-minimized
+
+- Confirm that the minimized reproducer still crashes::
+
+    $QEMU_PATH $QEMU_ARGS -qtest stdio < /tmp/reproducer-minimized
+
+- Create a one-liner reproducer that can be sent over email::
+
+    ./scripts/oss-fuzz/output_reproducer.py -bash /tmp/reproducer-minimized
+
+- Output the C source code for a test case that will reproduce the bug::
+
+    ./scripts/oss-fuzz/output_reproducer.py -owner "John Smith <john@smith.com>"\
+      -name "test_function_name" /tmp/reproducer-minimized
+
+- Report the bug and send a patch with the C reproducer upstream
+
 Implementation Details / Fuzzer Lifecycle
 -----------------------------------------
 
-- 
2.26.2



