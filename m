Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1347504818
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 16:52:05 +0200 (CEST)
Received: from localhost ([::1]:37088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng6Fu-0000BM-Q1
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 10:52:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hk@zapateado.de>) id 1ng6EK-0007C1-Oc
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 10:50:25 -0400
Received: from relay.yourmailgateway.de ([188.68.61.102]:53311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hk@zapateado.de>) id 1ng6EH-0003cX-Nh
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 10:50:24 -0400
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
 by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4KhCfK0kNBz80M4;
 Sun, 17 Apr 2022 16:50:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zapateado.de; s=key2;
 t=1650207017; bh=HLahuSnidVrbsmKjsUIu43a4rDS/nwuc7N/0xOF70G4=;
 h=Date:To:Cc:From:Subject:From;
 b=brZ4V8J/cMk5/rC+UZbxLl+KDbqEOQFB2TBvuHG0Nq0I/aESuSmKDQtWrGAYnnmiK
 XyUsBKiMfWS8lV0CnfyWuJkayKDGv9GhrUhqkPncoOfMY0i2kwwP1ZpP+L9RjcDFom
 8isyULq5EsOuAz0HxkFZhU8f26y6ocuW6sUmr/91PgY8HRe/GGnec6U3CKGTfeB75d
 mnsHaRfVX83bVMTlK1+B+Ry6TLXQZycfx4qQR3VFnQVgeBOStKVSBuFK2KM+3XGrwD
 pijHE2lbMt3eqPescZh+XmoHDYZrAJxdYfEKJf9LhzBlh+Vjk0p41y9I3xUwE5JIvB
 rL/l7BGkI0m+Q==
Received: from policy02-mors.netcup.net (unknown [46.38.225.53])
 by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4KhCfK0Ksfz80J9;
 Sun, 17 Apr 2022 16:50:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy02-mors.netcup.net
X-Spam-Score: -2.9
Received: from mx2f6e.netcup.net (unknown [10.243.12.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by policy02-mors.netcup.net (Postfix) with ESMTPS id 4KhCfH6l9bz8sZD;
 Sun, 17 Apr 2022 16:50:15 +0200 (CEST)
Received: from [192.168.54.9] (ip-095-223-070-176.um35.pools.vodafone-ip.de
 [95.223.70.176])
 by mx2f6e.netcup.net (Postfix) with ESMTPSA id BC697624BE;
 Sun, 17 Apr 2022 16:50:14 +0200 (CEST)
Authentication-Results: mx2f6e;
 spf=pass (sender IP is 95.223.70.176) smtp.mailfrom=hk@zapateado.de
 smtp.helo=[192.168.54.9]
Received-SPF: pass (mx2f6e: connection is authenticated)
Message-ID: <fb9c4633-27af-a01d-3cca-79ed20519727@zapateado.de>
Date: Sun, 17 Apr 2022 16:50:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: qemu-devel@nongnu.org
From: Helge Konetzka <hk@zapateado.de>
Subject: [PATCH] qga/vss-win32: enable qga-vss.tlb generation with widl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <165020701525.14827.16943721467131575911@mx2f6e.netcup.net>
X-PPP-Vhost: konetzka.de
X-NC-CID: scBfk89+cJNgH1nVsUlRBGrXqjpnfmeVeVfbfsbTmAcn
Received-SPF: pass client-ip=188.68.61.102; envelope-from=hk@zapateado.de;
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
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Generation with widl needs to be triggered explicitly and requires
library and include directories containing referenced *.idl and *.tlb
as parameters.

Signed-off-by: Helge Konetzka <hk@zapateado.de>
---

For tested Msys2 build all referenced resources reside in /<usr>/include.
Msys2 provides its flavours in different /<usr> bases.

This patch derives the missing include directory path from widl path.
Assuming the given widl path is /<usr>/bin/widl, it determines /<usr>
as base and appends /<usr>/include as include and library directories
to widl command. This way the directory is correct for any Msys2
flavour.
It makes sure, only existing directories are appended as parameter.

---
  qga/vss-win32/meson.build | 11 +++++++++--
  1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/qga/vss-win32/meson.build b/qga/vss-win32/meson.build
index 71c50d0866..51539a582c 100644
--- a/qga/vss-win32/meson.build
+++ b/qga/vss-win32/meson.build
@@ -30,9 +30,16 @@ if midl.found()
                            input: 'qga-vss.idl',
                            output: 'qga-vss.tlb',
                            command: [midl, '@INPUT@', '/tlb', '@OUTPUT@'])
-else
+elif widl.found()
+  widl_cmd = [widl, '-t', '@INPUT@', '-o', '@OUTPUT@']
+  usr_include = fs.parent(fs.parent(widl.full_path()))/'include'
+  if fs.is_dir(usr_include)
+    widl_cmd += ['-L', usr_include]
+    widl_cmd += ['-I', usr_include]
+  endif
    gen_tlb = custom_target('gen-tlb',
                            input: 'qga-vss.idl',
                            output: 'qga-vss.tlb',
-                          command: [widl, '-t', '@INPUT@', '-o', 
'@OUTPUT@'])
+                          build_by_default: true,
+                          command: widl_cmd)
  endif
-- 
2.30.2

