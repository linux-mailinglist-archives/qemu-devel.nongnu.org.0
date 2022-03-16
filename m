Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 022F34DAFF0
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 13:42:30 +0100 (CET)
Received: from localhost ([::1]:44114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUSyz-0001S3-3V
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 08:42:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hk@zapateado.de>) id 1nUSoP-0007re-SB
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 08:31:33 -0400
Received: from relay.yourmailgateway.de ([188.68.61.106]:41419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hk@zapateado.de>) id 1nUSoN-0002QS-P3
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 08:31:33 -0400
Received: from mors-relay-8405.netcup.net (localhost [127.0.0.1])
 by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4KJV4v5rrmz6wRK;
 Wed, 16 Mar 2022 13:31:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zapateado.de; s=key2;
 t=1647433887; bh=hpf64MAEL03Djqz2oxTZF6QkE+XCWDY7nI9CX7mbfsA=;
 h=Date:To:Cc:From:Subject:From;
 b=BUVwwOsOF6p9mqEgrr88mtAAaLPBPnvYKe+NqretIS2LgPy+UQjp/oJCefBXen63w
 Ey7xDpc0C+6MycNhdKbhYzhmkNa4yChb84pzxa1Ov2icxlVLw+CTvfPo2PWuXb9DDo
 p4IxJUdEmGfwau35+sqJMyHgSZ3ucbNHCSgUd9IhQL9586mWJZonON97a7qxoCs34b
 a6VolTIb9XFJqv6C1jU2rMOMVfOJ0A7Bl9BcP+AbSh5Z2orEoFkOPHw3LId95gwEz3
 ENt8m5kmMJ6sDQS+HzkbJ3sBvdiKbWQHsBFtL90QeF/pWucYGhKJ7BkZgMsHLN5qAp
 jIDiu4sWk6SxA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.53])
 by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4KJV4v5Tj2z6wRB;
 Wed, 16 Mar 2022 13:31:27 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy02-mors.netcup.net
X-Spam-Score: -2.9
Received: from mx2f6e.netcup.net (unknown [10.243.12.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by policy02-mors.netcup.net (Postfix) with ESMTPS id 4KJV4t64GJz8sh6;
 Wed, 16 Mar 2022 13:31:26 +0100 (CET)
Received: from [192.168.54.9] (ip-095-223-071-086.um35.pools.vodafone-ip.de
 [95.223.71.86])
 by mx2f6e.netcup.net (Postfix) with ESMTPSA id 20A2865138;
 Wed, 16 Mar 2022 13:31:26 +0100 (CET)
Authentication-Results: mx2f6e;
 spf=pass (sender IP is 95.223.71.86) smtp.mailfrom=hk@zapateado.de
 smtp.helo=[192.168.54.9]
Received-SPF: pass (mx2f6e: connection is authenticated)
Message-ID: <240b4ac6-7f74-e959-ae81-73dbe3fa904e@zapateado.de>
Date: Wed, 16 Mar 2022 13:31:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: qemu-devel@nongnu.org
From: Helge Konetzka <hk@zapateado.de>
Subject: [PATCH-for-7.0] qga/vss-win32: fix compilation with clang++
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <164743388644.5006.140164006973286509@mx2f6e.netcup.net>
X-PPP-Vhost: konetzka.de
X-NC-CID: JBJVHFRxFcWfhKAKTyWENiFiDyT+DHbeU/TzPWeFwNtm
Received-SPF: pass client-ip=188.68.61.106; envelope-from=hk@zapateado.de;
 helo=relay.yourmailgateway.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Compiling with clang++ of msys2 toolchain clang64 leads to an error
on initializing 'char*' variable nul with a 'const char*' value

Signed-off-by: Helge Konetzka <hk@zapateado.de>
---
Compiling with clang++ of msys2 toolchain clang64 leads to

[1445/1747] Compiling C++ object qga/vss-win32/qga-vss.dll.p/install.cpp.obj
FAILED: qga/vss-win32/qga-vss.dll.p/install.cpp.obj
...
qga/vss-win32/install.cpp:49:24: error: cannot initialize a variable of 
type 'char *' with an rvalue of type 'const char *'
     char *msg = NULL, *nul = strchr(text, '(');
                        ^     ~~~~~~~~~~~~~~~~~
1 error generated.
ninja: build stopped: subcommand failed.
make: *** [Makefile:163: run-ninja] Error 1
==> ERROR: A failure occurred in build().
     Aborting...
---
  qga/vss-win32/install.cpp | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/qga/vss-win32/install.cpp b/qga/vss-win32/install.cpp
index 8076efe3cb..b57508fbe0 100644
--- a/qga/vss-win32/install.cpp
+++ b/qga/vss-win32/install.cpp
@@ -46,7 +46,8 @@ void errmsg(DWORD err, const char *text)
       * If text doesn't contains '(', negative precision is given, which is
       * treated as though it were missing.
       */
-    char *msg = NULL, *nul = strchr(text, '(');
+    char *msg = NULL;
+    const char *nul = strchr(text, '(');
      int len = nul ? nul - text : -1;

      FormatMessage(FORMAT_MESSAGE_ALLOCATE_BUFFER |
-- 
2.30.2


