Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B043FC7B3
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 14:58:22 +0200 (CEST)
Received: from localhost ([::1]:38238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL3LJ-0007Vv-PZ
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 08:58:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mL320-0006CF-KJ
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:38:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mL31v-0005HF-IX
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:38:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630413498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wm69j6/CFRxwgaYQ+Xy6zXix5cpMlAE3PNNbisLdhjY=;
 b=bAdm2InM6Zhkr2n5f4X8Jpet12ZTkSChEjYLO9SYCMyBV3qzxGldNNoyeB0tjdFbjq65mI
 T6I3NQziAp33WqKAhZSp0lkpXE7LmeZis8yQ2iw57wAgaIJagOLWaYjvXwkO588wRbajSf
 gUUXFATFAPlm/HFHOrrR4t0TI8h0dUE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-598-T_fNsC6PPTuYj7TYKc7ddw-1; Tue, 31 Aug 2021 08:38:17 -0400
X-MC-Unique: T_fNsC6PPTuYj7TYKc7ddw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 846D2801B3D;
 Tue, 31 Aug 2021 12:38:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 568C260C05;
 Tue, 31 Aug 2021 12:38:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6A99F11380B9; Tue, 31 Aug 2021 14:38:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/12] qapi: Factor common recursion out of cgen_ifcond(),
 docgen_ifcond()
Date: Tue, 31 Aug 2021 14:38:03 +0200
Message-Id: <20210831123809.1107782-7-armbru@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: marcandre.lureau@redhat.com, jsnow@redhat.com, michael.roth@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/common.py | 45 +++++++++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index f31e077d7b..df92cff852 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -17,6 +17,7 @@
     Dict,
     Match,
     Optional,
+    Sequence,
     Union,
 )
 
@@ -200,33 +201,37 @@ def guardend(name: str) -> str:
                  name=c_fname(name).upper())
 
 
-def cgen_ifcond(ifcond: Optional[Union[str, Dict[str, Any]]]) -> str:
+def gen_ifcond(ifcond: Optional[Union[str, Dict[str, Any]]],
+               cond_fmt: str, not_fmt: str,
+               all_operator: str, any_operator: str) -> str:
+
+    def do_gen(ifcond: Union[str, Dict[str, Any]]):
+        if isinstance(ifcond, str):
+            return cond_fmt % ifcond
+        assert isinstance(ifcond, dict) and len(ifcond) == 1
+        if 'not' in ifcond:
+            return not_fmt % do_gen(ifcond['not'])
+        if 'all' in ifcond:
+            gen = gen_infix(all_operator, ifcond['all'])
+        else:
+            gen = gen_infix(any_operator, ifcond['any'])
+        return gen
+
+    def gen_infix(operator: str, operands: Sequence[Any]) -> str:
+        return '(' + operator.join([do_gen(o) for o in operands]) + ')'
+
     if not ifcond:
         return ''
-    if isinstance(ifcond, str):
-        return 'defined(' + ifcond + ')'
+    return do_gen(ifcond)
 
-    oper, operands = next(iter(ifcond.items()))
-    if oper == 'not':
-        return '!' + cgen_ifcond(operands)
-    oper = {'all': ' && ', 'any': ' || '}[oper]
-    operands = [cgen_ifcond(o) for o in operands]
-    return '(' + oper.join(operands) + ')'
+
+def cgen_ifcond(ifcond: Optional[Union[str, Dict[str, Any]]]) -> str:
+    return gen_ifcond(ifcond, 'defined(%s)', '!%s', ' && ', ' || ')
 
 
 def docgen_ifcond(ifcond: Optional[Union[str, Dict[str, Any]]]) -> str:
     # TODO Doc generated for conditions needs polish
-    if not ifcond:
-        return ''
-    if isinstance(ifcond, str):
-        return ifcond
-
-    oper, operands = next(iter(ifcond.items()))
-    if oper == 'not':
-        return '!' + docgen_ifcond(operands)
-    oper = {'all': ' and ', 'any': ' or '}[oper]
-    operands = [docgen_ifcond(o) for o in operands]
-    return '(' + oper.join(operands) + ')'
+    return gen_ifcond(ifcond, '%s', '!%s', ' and ', ' or ')
 
 
 def gen_if(cond: str) -> str:
-- 
2.31.1


