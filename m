Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF1B2A7EDE
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Nov 2020 13:45:00 +0100 (CET)
Received: from localhost ([::1]:37338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaedP-0003n2-5m
	for lists+qemu-devel@lfdr.de; Thu, 05 Nov 2020 07:44:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kaePR-0003Po-Ln
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 07:30:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kaePN-000531-I5
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 07:30:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604579425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XxqpAwNZSC20GvlcAbAEUY6jZ+u8+JNGSH8Z/mKsgcY=;
 b=hqtdG1PQ/BmciEvGGPbjX/8664CQK+rLvpclLqa6tPt2ui9jdcV4y/HyKSvUPARjybPjhs
 grRCttLqqwnXW/+fyitmh9SYfri9uTIHu2+GxOMB1KlQgsGz25dLAF02MqHTT2AQD9MInC
 5nLKRWSxWgJjd0YqNDDaUX+YGWlBLzA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-bJ-nhQZLNNWg1Sa5Tik1Eg-1; Thu, 05 Nov 2020 07:30:20 -0500
X-MC-Unique: bJ-nhQZLNNWg1Sa5Tik1Eg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB5A68030B6;
 Thu,  5 Nov 2020 12:30:19 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D73926CE52;
 Thu,  5 Nov 2020 12:30:07 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/9] qapi: convert 'if' C expressions to the new literal
 form
Date: Thu,  5 Nov 2020 16:28:06 +0400
Message-Id: <20201105122808.1182973-8-marcandre.lureau@redhat.com>
In-Reply-To: <20201105122808.1182973-1-marcandre.lureau@redhat.com>
References: <20201105122808.1182973-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/05 01:14:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, jsnow@redhat.com,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 qapi/machine-target.json | 20 ++++++++++++++++----
 qapi/misc-target.json    | 13 ++++++++++++-
 2 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/qapi/machine-target.json b/qapi/machine-target.json
index fec3bb8679..f60dccad5d 100644
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
 # Since: 1.2.0
 ##
 { 'command': 'query-cpu-definitions', 'returns': ['CpuDefinitionInfo'],
-  'if': 'defined(TARGET_PPC) || defined(TARGET_ARM) || defined(TARGET_I386) || defined(TARGET_S390X) || defined(TARGET_MIPS)' }
+  'if': { 'any': [ 'defined(TARGET_PPC)',
+                   'defined(TARGET_ARM)',
+                   'defined(TARGET_I386)',
+                   'defined(TARGET_S390X)',
+                   'defined(TARGET_MIPS)' ] } }
diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index 1e561fa97b..c1aa592137 100644
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


