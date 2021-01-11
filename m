Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FF02F1689
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 14:54:48 +0100 (CET)
Received: from localhost ([::1]:50370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyxeh-0006mT-HC
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 08:54:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kyxUN-0002jS-S0
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 08:44:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kyxUK-00083W-Ol
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 08:44:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610372643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dFrvAd2IsxigZPKJMCv1fZIRUKsIu3NYj2MZmm8CuH0=;
 b=b7a/dUi0EcPCQPWraAi2wPfvotOQFVexmIaMMS7dGIX+qD+xPyLQjSMSXnCD2TwVTIHyLV
 gm3BNBh2mYVSXVF4bsACeBbYPhy5qHrGNtXrCOfH33apJC+FKkBvixNm3ZIcpXTxAkIFaP
 sJlkGx/II5Z9QoXi8KofvKYeft1zU18=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-cRWreBfCMDW15PMbbuArFw-1; Mon, 11 Jan 2021 08:43:59 -0500
X-MC-Unique: cRWreBfCMDW15PMbbuArFw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5699DDF8A4;
 Mon, 11 Jan 2021 13:43:58 +0000 (UTC)
Received: from thuth.com (ovpn-112-147.ams2.redhat.com [10.36.112.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6EE7517C5F;
 Mon, 11 Jan 2021 13:43:56 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 08/15] fuzz: set bits in operand of write/out to zero
Date: Mon, 11 Jan 2021 14:43:21 +0100
Message-Id: <20210111134328.157775-9-thuth@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Simplifying the crash cases by opportunistically setting bits in operands of
out/write to zero may help to debug, since usually bit one means turn on or
trigger a function while zero is the default turn-off setting.

Tested bug https://bugs.launchpad.net/qemu/+bug/1908062

Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Tested-by: Alexander Bulekov <alxndr@bu.edu>
Message-Id: <SYCPR01MB3502C84B6346A3E3DE708C7BFCAB0@SYCPR01MB3502.ausprd01.prod.outlook.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 scripts/oss-fuzz/minimize_qtest_trace.py | 39 ++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index 59e91de7e2..219858a9e3 100755
--- a/scripts/oss-fuzz/minimize_qtest_trace.py
+++ b/scripts/oss-fuzz/minimize_qtest_trace.py
@@ -167,6 +167,42 @@ def remove_lines(newtrace, outpath):
         i += 1
 
 
+def clear_bits(newtrace, outpath):
+    # try setting bits in operands of out/write to zero
+    i = 0
+    while i < len(newtrace):
+        if (not newtrace[i].startswith("write ") and not
+           newtrace[i].startswith("out")):
+           i += 1
+           continue
+        # write ADDR SIZE DATA
+        # outx ADDR VALUE
+        print("\nzero setting bits: {}".format(newtrace[i]))
+
+        prefix = " ".join(newtrace[i].split()[:-1])
+        data = newtrace[i].split()[-1]
+        data_bin = bin(int(data, 16))
+        data_bin_list = list(data_bin)
+
+        for j in range(2, len(data_bin_list)):
+            prior = newtrace[i]
+            if (data_bin_list[j] == '1'):
+                data_bin_list[j] = '0'
+                data_try = hex(int("".join(data_bin_list), 2))
+                # It seems qtest only accepts padded hex-values.
+                if len(data_try) % 2 == 1:
+                    data_try = data_try[:2] + "0" + data_try[2:-1]
+
+                newtrace[i] = "{prefix} {data_try}\n".format(
+                        prefix=prefix,
+                        data_try=data_try)
+
+                if not check_if_trace_crashes(newtrace, outpath):
+                    data_bin_list[j] = '1'
+                    newtrace[i] = prior
+        i += 1
+
+
 def minimize_trace(inpath, outpath):
     global TIMEOUT
     with open(inpath) as f:
@@ -187,7 +223,10 @@ def minimize_trace(inpath, outpath):
         old_len = len(newtrace)
         remove_lines(newtrace, outpath)
         newtrace = list(filter(lambda s: s != "", newtrace))
+    assert(check_if_trace_crashes(newtrace, outpath))
 
+    # set bits to zero
+    clear_bits(newtrace, outpath)
     assert(check_if_trace_crashes(newtrace, outpath))
 
 
-- 
2.27.0


