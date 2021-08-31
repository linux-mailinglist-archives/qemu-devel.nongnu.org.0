Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A443FC802
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 15:17:02 +0200 (CEST)
Received: from localhost ([::1]:52880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL3dN-0004tc-Gl
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 09:17:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mL320-0006CI-LF
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:38:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mL31y-0005IN-1Y
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:38:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630413500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hd91u5E04t1VmcfaDpmv7bPokygiedERw8tBibtAcp8=;
 b=Jb9hD48FDD4e2adBntOLu+muOrx9JN0/fbBswl3pFvGsLZkobOrSyq7bEsa5BC+7maJx7s
 8jVcncs9w2P8K1Vn0QqGAFNB/larRK8NCoXTbLPlkGTL9GjSmGFsesFahVbgVycuTICdsq
 7cRE/ZIg+M+PlXeLKmgPf9pwXpvZhyc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-J_MNJznxNCCoi_gmi9lEsg-1; Tue, 31 Aug 2021 08:38:17 -0400
X-MC-Unique: J_MNJznxNCCoi_gmi9lEsg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87115802920;
 Tue, 31 Aug 2021 12:38:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 56C5860CA0;
 Tue, 31 Aug 2021 12:38:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6DE4D11380BA; Tue, 31 Aug 2021 14:38:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/12] qapi: Avoid redundant parens in code generated for
 conditionals
Date: Tue, 31 Aug 2021 14:38:04 +0200
Message-Id: <20210831123809.1107782-8-armbru@redhat.com>
In-Reply-To: <20210831123809.1107782-1-armbru@redhat.com>
References: <20210831123809.1107782-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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
Cc: marcandre.lureau@redhat.com, jsnow@redhat.com, michael.roth@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 6cc2e4817f "qapi: introduce QAPISchemaIfCond.cgen()" caused a
minor regression: redundant parenthesis.  Subsequent commits
eliminated of many of them, but not all.  Get rid of the rest now.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/common.py         | 10 ++++++----
 tests/qapi-schema/doc-good.txt |  6 +++---
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index df92cff852..c7ccc7cec7 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -205,24 +205,26 @@ def gen_ifcond(ifcond: Optional[Union[str, Dict[str, Any]]],
                cond_fmt: str, not_fmt: str,
                all_operator: str, any_operator: str) -> str:
 
-    def do_gen(ifcond: Union[str, Dict[str, Any]]):
+    def do_gen(ifcond: Union[str, Dict[str, Any]], need_parens: bool):
         if isinstance(ifcond, str):
             return cond_fmt % ifcond
         assert isinstance(ifcond, dict) and len(ifcond) == 1
         if 'not' in ifcond:
-            return not_fmt % do_gen(ifcond['not'])
+            return not_fmt % do_gen(ifcond['not'], True)
         if 'all' in ifcond:
             gen = gen_infix(all_operator, ifcond['all'])
         else:
             gen = gen_infix(any_operator, ifcond['any'])
+        if need_parens:
+            gen = '(' + gen + ')'
         return gen
 
     def gen_infix(operator: str, operands: Sequence[Any]) -> str:
-        return '(' + operator.join([do_gen(o) for o in operands]) + ')'
+        return operator.join([do_gen(o, True) for o in operands])
 
     if not ifcond:
         return ''
-    return do_gen(ifcond)
+    return do_gen(ifcond, False)
 
 
 def cgen_ifcond(ifcond: Optional[Union[str, Dict[str, Any]]]) -> str:
diff --git a/tests/qapi-schema/doc-good.txt b/tests/qapi-schema/doc-good.txt
index 85a370831f..75f51a6fc1 100644
--- a/tests/qapi-schema/doc-good.txt
+++ b/tests/qapi-schema/doc-good.txt
@@ -79,7 +79,7 @@ Members
 If
 ~~
 
-"(IFALL1 and IFALL2)"
+"IFALL1 and IFALL2"
 
 
 "Variant1" (Object)
@@ -120,8 +120,8 @@ Members
 
 The members of "Base"
 The members of "Variant1" when "base1" is ""one""
-The members of "Variant2" when "base1" is ""two"" (**If: **"(IFONE or
-IFTWO)")
+The members of "Variant2" when "base1" is ""two"" (**If: **"IFONE or
+IFTWO")
 
 Features
 ~~~~~~~~
-- 
2.31.1


