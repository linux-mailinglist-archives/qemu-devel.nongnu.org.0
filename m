Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAAB36EB83
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 15:46:13 +0200 (CEST)
Received: from localhost ([::1]:58232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc6zc-0001Se-Ar
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 09:46:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lc6vQ-0005Z6-6p
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 09:41:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lc6vN-0002qP-UG
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 09:41:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619703708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9GO1/RofcESgTCd5CChnD9KyFoKgnAVQZlUbSt2nCUs=;
 b=KoCcVjgT3wf1Lj+9VSjfkWbEgqpu7Xkj+kOQkY9TWo+vGpRoWLHim/dWvlSc2AAkyqvFN3
 jjdb2mI5YMP0jprUhxd7Lpk/sATRvLJD+juNM7eg04SjkGEdlSyDFh2b1zy9hCzJUgL3WN
 C/GNAkOiSitoP5PrBIvXlTtwi/02fbo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-598-fq5rx_-xOwqYEYg9z80aOA-1; Thu, 29 Apr 2021 09:41:47 -0400
X-MC-Unique: fq5rx_-xOwqYEYg9z80aOA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B5578189D4
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 13:41:46 +0000 (UTC)
Received: from localhost (unknown [10.36.110.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 000C01017CF5;
 Thu, 29 Apr 2021 13:41:41 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 7/9] qapi: convert 'if' C-expressions to the new syntax tree
Date: Thu, 29 Apr 2021 17:40:30 +0400
Message-Id: <20210429134032.1125111-8-marcandre.lureau@redhat.com>
In-Reply-To: <20210429134032.1125111-1-marcandre.lureau@redhat.com>
References: <20210429134032.1125111-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
 jsnow@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 qapi/machine-target.json | 20 ++++++++++++++++----
 qapi/misc-target.json    | 13 ++++++++++++-
 2 files changed, 28 insertions(+), 5 deletions(-)

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
index 0c7491cd82..2891df6890 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -23,7 +23,18 @@
 ##
 { 'event': 'RTC_CHANGE',
   'data': { 'offset': 'int' },
-  'if': 'defined(TARGET_ALPHA) || defined(TARGET_ARM) || defined(TARGET_HPPA) || defined(TARGET_I386) || defined(TARGET_MIPS) || defined(TARGET_MIPS64) || defined(TARGET_MOXIE) || defined(TARGET_PPC) || defined(TARGET_PPC64) || defined(TARGET_S390X) || defined(TARGET_SH4) || defined(TARGET_SPARC)' }
+  'if': { 'any': [ 'defined(TARGET_ALPHA)',
+                   'defined(TARGET_ARM)',
+                   'defined(TARGET_HPPA)',
+                   'defined(TARGET_I386)',
+                   'defined(TARGET_MIPS)',
+                   'defined(TARGET_MIPS64)',
+                   'defined(TARGET_MOXIE)',
+                   'defined(TARGET_PPC)',
+                   'defined(TARGET_PPC64)',
+                   'defined(TARGET_S390X)',
+                   'defined(TARGET_SH4)',
+                   'defined(TARGET_SPARC)' ] } }
 
 ##
 # @rtc-reset-reinjection:
-- 
2.29.0


