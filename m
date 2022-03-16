Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBF04DB214
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 15:01:03 +0100 (CET)
Received: from localhost ([::1]:47232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUUD0-0004rJ-G9
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 10:01:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hk@zapateado.de>) id 1nUU6Q-0004vf-IC
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:54:16 -0400
Received: from relay.yourmailgateway.de ([46.38.247.118]:33255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hk@zapateado.de>) id 1nUU6O-0000bF-9Z
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:54:14 -0400
Received: from mors-relay-8404.netcup.net (localhost [127.0.0.1])
 by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4KJWwK3m6Sz7ypW;
 Wed, 16 Mar 2022 14:54:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zapateado.de; s=key2;
 t=1647438849; bh=QBWOPRw8uEP6jueG9An1GcpHNFMk5NLqKlLHSvOTHT8=;
 h=Date:To:Cc:From:Subject:From;
 b=d6UM31O2GKny99ouo7IR0o939KRp7wtzqUzzuVnZ1eb8XfY2nEoi9FVKt90kepYKc
 BDSB27mDqaNgbuIppywNcZ0woC5XgyNVLigtdUuVBrSXl9II56Z6BSXVLqzzFLkbqO
 3DshqFqdL/7Jj/a/DzNWu/yTy0Wsp2tSYBWbLuBjhN/56/+T2hAsp3SPJeyNLCAhI6
 3CQhiGV3PfJSkBYi3Q48iuIchXOAahNQqf5ggQ5ngNI8r8njxYCIHZ+DKpTqKtVW7D
 Q8bnu1kA4jbWi3rvujeTqyBz6fkhQ2CDJ++S/jDuF6RI5L80HwNHQ80dd48WrnVnI8
 at9E0tln4MU/Q==
Received: from policy02-mors.netcup.net (unknown [46.38.225.53])
 by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4KJWwK3Llhz4xXB;
 Wed, 16 Mar 2022 14:54:09 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy02-mors.netcup.net
X-Spam-Score: -2.9
Received: from mx2f6e.netcup.net (unknown [10.243.12.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by policy02-mors.netcup.net (Postfix) with ESMTPS id 4KJWwJ2vD7z8sjv;
 Wed, 16 Mar 2022 14:54:08 +0100 (CET)
Received: from [192.168.54.9] (ip-095-223-071-086.um35.pools.vodafone-ip.de
 [95.223.71.86])
 by mx2f6e.netcup.net (Postfix) with ESMTPSA id 65BAC6507B;
 Wed, 16 Mar 2022 14:54:07 +0100 (CET)
Authentication-Results: mx2f6e;
 spf=pass (sender IP is 95.223.71.86) smtp.mailfrom=hk@zapateado.de
 smtp.helo=[192.168.54.9]
Received-SPF: pass (mx2f6e: connection is authenticated)
Message-ID: <39400817-3dc9-516d-9096-bc1f68862531@zapateado.de>
Date: Wed, 16 Mar 2022 14:54:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: qemu-devel@nongnu.org
From: Helge Konetzka <hk@zapateado.de>
Subject: [PATCH-for-7.0 v2] qga/vss-win32: fix compilation with clang++
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <164743884782.5090.10142427628386342622@mx2f6e.netcup.net>
X-PPP-Vhost: konetzka.de
X-NC-CID: ZWHbmEijIv4fCGjsBqi/mvMNPONNeS90k95j80e9mWAq
Received-SPF: pass client-ip=46.38.247.118; envelope-from=hk@zapateado.de;
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
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This fixes:

qga/vss-win32/install.cpp:49:24: error: cannot initialize a variable of
type 'char *' with an rvalue of type 'const char *'
     char *msg = NULL, *nul = strchr(text, '(');
                        ^     ~~~~~~~~~~~~~~~~~

Signed-off-by: Helge Konetzka <hk@zapateado.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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

