Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF71A2F15DF
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 14:47:12 +0100 (CET)
Received: from localhost ([::1]:54862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyxXL-0004Zd-TP
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 08:47:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kyxUM-0002hs-ST
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 08:44:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kyxUE-00082r-W0
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 08:44:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610372636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9OyA7s3fu9/RJlUjnURCpan4t4/LnXrI2eQKIq33aXc=;
 b=eA9/5Pg+QYlW2GbUPe39Y8uFVX+F9iudMDtXkrbovNc13BL2+8WPARxUkDbk/+P86s9LBU
 8+ELCtPJXzzfMA+oR5PuGx4YCWJaNKxEsN2ui0YiE/7WrXYnlsh1rV8FEthq9XEU8cKRfb
 KM4W/eeWCmI4Odi0ii2J8GjgPNuyd48=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-otO8p-xsPvSIj8fp84JNGw-1; Mon, 11 Jan 2021 08:43:52 -0500
X-MC-Unique: otO8p-xsPvSIj8fp84JNGw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0FC4DF8A4;
 Mon, 11 Jan 2021 13:43:50 +0000 (UTC)
Received: from thuth.com (ovpn-112-147.ams2.redhat.com [10.36.112.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16C4D2BFE9;
 Mon, 11 Jan 2021 13:43:48 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 05/15] fuzz: double the IOs to remove for every loop
Date: Mon, 11 Jan 2021 14:43:18 +0100
Message-Id: <20210111134328.157775-6-thuth@redhat.com>
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

Instead of removing IO instructions one by one, we can try deleting multiple
instructions at once. According to the locality of reference, we double the
number of instructions to remove for the next round and recover it to one
once we fail.

This patch is usually significant for large input.

Test with quadrupled trace input at:
  https://bugs.launchpad.net/qemu/+bug/1890333/comments/1

Patched 1/6 version:
  real  0m45.904s
  user  0m16.874s
  sys   0m10.042s

Refined version:
  real  0m11.412s
  user  0m6.888s
  sys   0m3.325s

Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Tested-by: Alexander Bulekov <alxndr@bu.edu>
Message-Id: <SYCPR01MB350280A67BB55C3FADF173E3FCAB0@SYCPR01MB3502.ausprd01.prod.outlook.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 scripts/oss-fuzz/minimize_qtest_trace.py | 33 +++++++++++++++---------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index a28913a2a7..cacabf2638 100755
--- a/scripts/oss-fuzz/minimize_qtest_trace.py
+++ b/scripts/oss-fuzz/minimize_qtest_trace.py
@@ -88,19 +88,28 @@ def minimize_trace(inpath, outpath):
 
     i = 0
     newtrace = trace[:]
-    # For each line
+    remove_step = 1
     while i < len(newtrace):
-        # 1.) Try to remove it completely and reproduce the crash. If it works,
-        # we're done.
-        prior = newtrace[i]
-        print("Trying to remove {}".format(newtrace[i]))
-        # Try to remove the line completely
-        newtrace[i] = ""
+        # 1.) Try to remove lines completely and reproduce the crash.
+        # If it works, we're done.
+        if (i+remove_step) >= len(newtrace):
+            remove_step = 1
+        prior = newtrace[i:i+remove_step]
+        for j in range(i, i+remove_step):
+            newtrace[j] = ""
+        print("Removing {lines} ...".format(lines=prior))
         if check_if_trace_crashes(newtrace, outpath):
-            i += 1
+            i += remove_step
+            # Double the number of lines to remove for next round
+            remove_step *= 2
             continue
-        newtrace[i] = prior
-
+        # Failed to remove multiple IOs, fast recovery
+        if remove_step > 1:
+            for j in range(i, i+remove_step):
+                newtrace[j] = prior[j-i]
+            remove_step = 1
+            continue
+        newtrace[i] = prior[0] # remove_step = 1
         # 2.) Try to replace write{bwlq} commands with a write addr, len
         # command. Since this can require swapping endianness, try both LE and
         # BE options. We do this, so we can "trim" the writes in (3)
@@ -121,7 +130,7 @@ def minimize_trace(inpath, outpath):
                 if(check_if_trace_crashes(newtrace, outpath)):
                     break
             else:
-                newtrace[i] = prior
+                newtrace[i] = prior[0]
 
         # 3.) If it is a qtest write command: write addr len data, try to split
         # it into two separate write commands. If splitting the write down the
@@ -154,7 +163,7 @@ def minimize_trace(inpath, outpath):
                 if check_if_trace_crashes(newtrace, outpath):
                     i -= 1
                 else:
-                    newtrace[i] = prior
+                    newtrace[i] = prior[0]
                     del newtrace[i+1]
         i += 1
     check_if_trace_crashes(newtrace, outpath)
-- 
2.27.0


