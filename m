Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 846E8383ABD
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 19:08:35 +0200 (CEST)
Received: from localhost ([::1]:35574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ligjJ-000087-II
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 13:08:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lig9b-0005qa-IC
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:31:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lig9X-0006Nv-9V
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:31:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621269093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CiBkTQ1Zdpu/X2pCI0ZwTG292YXGnUzgjHgjy5GCGOA=;
 b=dKeeFQdkwxychWRarRAXWytiCf859Aez3NrDyCZZ2Ix+bMT+kOuO8hyBcjoW4T3LmMlTez
 BVhH3wxlfiL2gbxUVS0FgaBwMpjnxrDL4muxToLORfzz+PegRi0hxYyTNJQ4GS9/1jjVp3
 u4UpfRv+JUNaEq8Izir54QLTshP1wtY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-GgPps7L_Or6vw8ulUEMQxg-1; Mon, 17 May 2021 12:31:32 -0400
X-MC-Unique: GgPps7L_Or6vw8ulUEMQxg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 470601922963
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 16:31:31 +0000 (UTC)
Received: from localhost (unknown [10.36.110.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A1315C1D1;
 Mon, 17 May 2021 16:31:30 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v4 7/9] qapi: convert 'if' C-expressions to the new syntax tree
Date: Mon, 17 May 2021 20:30:38 +0400
Message-Id: <20210517163040.2308926-8-marcandre.lureau@redhat.com>
In-Reply-To: <20210517163040.2308926-1-marcandre.lureau@redhat.com>
References: <20210517163040.2308926-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 jsnow@redhat.com, Markus Armbruster <armbru@redhat.com>, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Tested-by: John Snow <jsnow@redhat.com>
---
 qapi/machine-target.json | 20 ++++++++++++++++----
 qapi/misc-target.json    | 12 +++++++++++-
 2 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/qapi/machine-target.json b/qapi/machine-target.json
index e7811654b7..9b56b81bea 100644
--- a/qapi/machine-target.json
+++ b/qapi/machine-target.json
@@ -213,7 +213,9 @@
 ##
 { 'struct': 'CpuModelExpansionInfo',
   'data': { 'model': 'CpuModelInfo' },
-  'if': 'defined(TARGET_S390X) || defined(TARGET_I386) || defined(TARGET_ARM)' }
+  'if': { 'any': [ 'defined(TARGET_S390X)',
+                   'defined(TARGET_I386)',
+                   'defined(TARGET_ARM)'] } }
 
 ##
 # @query-cpu-model-expansion:
@@ -252,7 +254,9 @@
   'data': { 'type': 'CpuModelExpansionType',
             'model': 'CpuModelInfo' },
   'returns': 'CpuModelExpansionInfo',
-  'if': 'defined(TARGET_S390X) || defined(TARGET_I386) || defined(TARGET_ARM)' }
+  'if': { 'any': [ 'defined(TARGET_S390X)',
+                   'defined(TARGET_I386)',
+                   'defined(TARGET_ARM)' ] } }
 
 ##
 # @CpuDefinitionInfo:
@@ -316,7 +320,11 @@
             'typename': 'str',
             '*alias-of' : 'str',
             'deprecated' : 'bool' },
-  'if': 'defined(TARGET_PPC) || defined(TARGET_ARM) || defined(TARGET_I386) || defined(TARGET_S390X) || defined(TARGET_MIPS)' }
+  'if': { 'any': [ 'defined(TARGET_PPC)',
+                   'defined(TARGET_ARM)',
+                   'defined(TARGET_I386)',
+                   'defined(TARGET_S390X)',
+                   'defined(TARGET_MIPS)' ] } }
 
 ##
 # @query-cpu-definitions:
@@ -328,4 +336,8 @@
 # Since: 1.2
 ##
 { 'command': 'query-cpu-definitions', 'returns': ['CpuDefinitionInfo'],
-  'if': 'defined(TARGET_PPC) || defined(TARGET_ARM) || defined(TARGET_I386) || defined(TARGET_S390X) || defined(TARGET_MIPS)' }
+  'if': { 'any': [ 'defined(TARGET_PPC)',
+                   'defined(TARGET_ARM)',
+                   'defined(TARGET_I386)',
+                   'defined(TARGET_S390X)',
+                   'defined(TARGET_MIPS)' ] } }
diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index 6200c671be..835a74a072 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -23,7 +23,17 @@
 ##
 { 'event': 'RTC_CHANGE',
   'data': { 'offset': 'int' },
-  'if': 'defined(TARGET_ALPHA) || defined(TARGET_ARM) || defined(TARGET_HPPA) || defined(TARGET_I386) || defined(TARGET_MIPS) || defined(TARGET_MIPS64) || defined(TARGET_PPC) || defined(TARGET_PPC64) || defined(TARGET_S390X) || defined(TARGET_SH4) || defined(TARGET_SPARC)' }
+  'if': { 'any': [ 'defined(TARGET_ALPHA)',
+                   'defined(TARGET_ARM)',
+                   'defined(TARGET_HPPA)',
+                   'defined(TARGET_I386)',
+                   'defined(TARGET_MIPS)',
+                   'defined(TARGET_MIPS64)',
+                   'defined(TARGET_PPC)',
+                   'defined(TARGET_PPC64)',
+                   'defined(TARGET_S390X)',
+                   'defined(TARGET_SH4)',
+                   'defined(TARGET_SPARC)' ] } }
 
 ##
 # @rtc-reset-reinjection:
-- 
2.29.0


