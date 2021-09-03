Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C00C4400631
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 21:54:02 +0200 (CEST)
Received: from localhost ([::1]:37684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMFGD-00023b-QA
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 15:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mMEvE-0005m1-ND
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:32:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mMEvD-0003bi-4j
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:32:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630697538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Cdr/4ksTApBPzwkIEiFKujnttTP2oviLVmsZAoMmxk=;
 b=UDfs1TZNiQbb9TTjc9Tq60/iub1Kvp6Sbzo+7snSzJpFL4NGHWoUrEGC9f9vWROuGvK4U2
 Rae3FFsKRowH5koMkvsIWZ0erPhyQZXHBZnkFpkQOS+jCc38MVhyXMXbyw82u1jsZ6STyC
 a2yBUgaKHekSDbFS2lrmkVN1QOZfQiw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-Iu0oWu5QMgCCHrgy2Ag8FQ-1; Fri, 03 Sep 2021 15:32:17 -0400
X-MC-Unique: Iu0oWu5QMgCCHrgy2Ag8FQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 853BA501E1;
 Fri,  3 Sep 2021 19:32:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D19610023AE;
 Fri,  3 Sep 2021 19:32:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D2AA61138223; Fri,  3 Sep 2021 21:32:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/13] qapi: Fix C code generation for 'if'
Date: Fri,  3 Sep 2021 21:32:02 +0200
Message-Id: <20210903193209.1426791-7-armbru@redhat.com>
In-Reply-To: <20210903193209.1426791-1-armbru@redhat.com>
References: <20210903193209.1426791-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When commit 5d83b9a130 "qapi: replace if condition list with dict
{'all': [...]}" made cgen_ifcond() and docgen_ifcond() recursive, it
messed up parenthesises in the former, and got them right in the
latter, as the previous commit demonstrates.

To fix, adopt the latter's working code for the former.  This
generates the correct code from the previous commit's commit message.

Fixes: 5d83b9a130690f879d5f33e991beabe69cb88bc8
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210831123809.1107782-6-armbru@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 scripts/qapi/common.py                  | 4 ++--
 tests/qapi-schema/qapi-schema-test.json | 1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index 1c1dc87ccb..f31e077d7b 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -209,9 +209,9 @@ def cgen_ifcond(ifcond: Optional[Union[str, Dict[str, Any]]]) -> str:
     oper, operands = next(iter(ifcond.items()))
     if oper == 'not':
         return '!' + cgen_ifcond(operands)
-    oper = {'all': '&&', 'any': '||'}[oper]
+    oper = {'all': ' && ', 'any': ' || '}[oper]
     operands = [cgen_ifcond(o) for o in operands]
-    return '(' + (') ' + oper + ' (').join(operands) + ')'
+    return '(' + oper.join(operands) + ')'
 
 
 def docgen_ifcond(ifcond: Optional[Union[str, Dict[str, Any]]]) -> str:
diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qapi-schema-test.json
index 6e37758280..b6c36a9eee 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -262,7 +262,6 @@
   'if': { 'all': ['TEST_IF_EVT', 'TEST_IF_STRUCT'] } }
 
 { 'event': 'TEST_IF_EVENT2', 'data': {},
-  # FIXME C #if generated for this conditional is wrong
   'if': { 'not': { 'any': [ { 'not': 'TEST_IF_EVT' },
                             { 'not': 'TEST_IF_STRUCT' } ] } } }
 
-- 
2.31.1


