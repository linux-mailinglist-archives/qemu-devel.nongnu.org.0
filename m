Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D953F87B8
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 14:39:22 +0200 (CEST)
Received: from localhost ([::1]:58720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJEf6-00030h-Op
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 08:39:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJEYm-0004Ai-9S
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 08:32:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJEYh-0008Bz-Rp
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 08:32:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629981157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rn2CN1rw2QVgV2voQEWpCgiUFC18pxVmFIWB9duZW0w=;
 b=HSJIxTH0xy3NTNP79WlOQkpO3wd9hhq3OqSNthf793sJ1rfKJGUybH8XrBzjwHiEq2K1mC
 2qtqkbTVBQ5QynKZ73PlgvOFNnCzxlY/GVblnqJbVyXdBSbs+DTLL27vmrWmEau9gYonGx
 raen5a83/NMGcGolSjPbQUhtjpYADr8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-0kIu1FnBOzCQvwALsw3vHA-1; Thu, 26 Aug 2021 08:32:35 -0400
X-MC-Unique: 0kIu1FnBOzCQvwALsw3vHA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A57C81008062;
 Thu, 26 Aug 2021 12:32:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 88E1D5F724;
 Thu, 26 Aug 2021 12:32:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B4DB011380C3; Thu, 26 Aug 2021 14:32:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/11] qapi: Use 'if': { 'any': ... } where appropriate
Date: Thu, 26 Aug 2021 14:32:23 +0200
Message-Id: <20210826123225.157891-10-armbru@redhat.com>
In-Reply-To: <20210826123225.157891-1-armbru@redhat.com>
References: <20210826123225.157891-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Tested-by: John Snow <jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210804083105.97531-9-marcandre.lureau@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
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
index 5573dcf8f0..9e2ea4a04a 100644
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
2.31.1


