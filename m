Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABC52F16B2
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 14:57:00 +0100 (CET)
Received: from localhost ([::1]:58844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyxgp-0001uC-FM
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 08:56:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kyxUP-0002lm-32
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 08:44:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kyxUM-00083a-JJ
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 08:44:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610372644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gq49cOEfMMs77Yl4299xFFf2rjGK8IXwDJOnTUpWTbk=;
 b=cFowyMheQKX5aGBrYx2qJsZCpYI06t2oNu8Y4gDtNjITiBAiqlgJB4Qa0D4GHrns4/9Woi
 2sEHSfkOR+QHh3K/z12Enc6nZTV4Z181VnZOTYiXa885sAje5bVhB/kutx5CRsOpm/GtQO
 sP117l2ssmIVYBdCmEghjwPN1VlkLZM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-QjiVH_zROLq5csbhWC0iEw-1; Mon, 11 Jan 2021 08:44:02 -0500
X-MC-Unique: QjiVH_zROLq5csbhWC0iEw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD25381CBDF;
 Mon, 11 Jan 2021 13:44:00 +0000 (UTC)
Received: from thuth.com (ovpn-112-147.ams2.redhat.com [10.36.112.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3AE417C5F;
 Mon, 11 Jan 2021 13:43:58 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 09/15] fuzz: add minimization options
Date: Mon, 11 Jan 2021 14:43:22 +0100
Message-Id: <20210111134328.157775-10-thuth@redhat.com>
In-Reply-To: <20210111134328.157775-1-thuth@redhat.com>
References: <20210111134328.157775-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Warner Losh <imp@freebsd.org>,
 Qiuhao Li <Qiuhao.Li@outlook.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Qiuhao Li <Qiuhao.Li@outlook.com>

-M1: remove IO commands iteratively
-M2: try setting bits in operand of write/out to zero

Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Tested-by: Alexander Bulekov <alxndr@bu.edu>
Message-Id: <SYCPR01MB350204C52E7A39E6B0EEC870FCAB0@SYCPR01MB3502.ausprd01.prod.outlook.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 scripts/oss-fuzz/minimize_qtest_trace.py | 30 ++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index 219858a9e3..0e59bdbb01 100755
--- a/scripts/oss-fuzz/minimize_qtest_trace.py
+++ b/scripts/oss-fuzz/minimize_qtest_trace.py
@@ -16,6 +16,10 @@ QEMU_PATH = None
 TIMEOUT = 5
 CRASH_TOKEN = None
 
+# Minimization levels
+M1 = False # try removing IO commands iteratively
+M2 = False # try setting bits in operand of write/out to zero
+
 write_suffix_lookup = {"b": (1, "B"),
                        "w": (2, "H"),
                        "l": (4, "L"),
@@ -23,10 +27,20 @@ write_suffix_lookup = {"b": (1, "B"),
 
 def usage():
     sys.exit("""\
-Usage: QEMU_PATH="/path/to/qemu" QEMU_ARGS="args" {} input_trace output_trace
+Usage:
+
+QEMU_PATH="/path/to/qemu" QEMU_ARGS="args" {} [Options] input_trace output_trace
+
 By default, will try to use the second-to-last line in the output to identify
 whether the crash occred. Optionally, manually set a string that idenitifes the
 crash by setting CRASH_TOKEN=
+
+Options:
+
+-M1: enable a loop around the remove minimizer, which may help decrease some
+     timing dependant instructions. Off by default.
+-M2: try setting bits in operand of write/out to zero. Off by default.
+
 """.format((sys.argv[0])))
 
 deduplication_note = """\n\
@@ -216,24 +230,32 @@ def minimize_trace(inpath, outpath):
     print("Setting the timeout for {} seconds".format(TIMEOUT))
 
     newtrace = trace[:]
+    global M1, M2
 
     # remove lines
     old_len = len(newtrace) + 1
     while(old_len > len(newtrace)):
         old_len = len(newtrace)
+        print("trace lenth = ", old_len)
         remove_lines(newtrace, outpath)
+        if not M1 and not M2:
+            break
         newtrace = list(filter(lambda s: s != "", newtrace))
     assert(check_if_trace_crashes(newtrace, outpath))
 
     # set bits to zero
-    clear_bits(newtrace, outpath)
+    if M2:
+        clear_bits(newtrace, outpath)
     assert(check_if_trace_crashes(newtrace, outpath))
 
 
 if __name__ == '__main__':
     if len(sys.argv) < 3:
         usage()
-
+    if "-M1" in sys.argv:
+        M1 = True
+    if "-M2" in sys.argv:
+        M2 = True
     QEMU_PATH = os.getenv("QEMU_PATH")
     QEMU_ARGS = os.getenv("QEMU_ARGS")
     if QEMU_PATH is None or QEMU_ARGS is None:
@@ -242,4 +264,4 @@ if __name__ == '__main__':
     #     QEMU_ARGS += " -accel qtest"
     CRASH_TOKEN = os.getenv("CRASH_TOKEN")
     QEMU_ARGS += " -qtest stdio -monitor none -serial none "
-    minimize_trace(sys.argv[1], sys.argv[2])
+    minimize_trace(sys.argv[-2], sys.argv[-1])
-- 
2.27.0


