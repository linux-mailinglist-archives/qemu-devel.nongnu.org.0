Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A642839E854
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 22:22:25 +0200 (CEST)
Received: from localhost ([::1]:52824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqLlQ-0000bZ-Ga
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 16:22:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqLXE-0004SR-FA
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 16:07:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqLWy-0006YF-OM
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 16:07:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623096448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6I1ffH67Oby/X5z1JMtzleyrDhl2w0HdTScRKZu2wHk=;
 b=ctLrRs7lfquP7Pg5MLS7Ng5i/KlzHJ9ZLKj1ghuLhvfZepTk0H82HMo9S7BwDwDjOoEeuT
 yNxPTdcS5I+GS56p4DaBoCZKViZ6MzRrccW4OBQAAkYst/2S2lmsituoE1uVsnrcCw09Nj
 2MrANXUivtu4lqizDVKUTDvG+cDJ+5Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-hpqAkDckMUWLXq2LGbK_EA-1; Mon, 07 Jun 2021 16:07:24 -0400
X-MC-Unique: hpqAkDckMUWLXq2LGbK_EA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A6FB19251CE;
 Mon,  7 Jun 2021 20:07:17 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4EC055C1C2;
 Mon,  7 Jun 2021 20:07:16 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 23/42] scripts/qmp-shell: Fix "FuzzyJSON" parser
Date: Mon,  7 Jun 2021 16:06:30 -0400
Message-Id: <20210607200649.1840382-24-jsnow@redhat.com>
In-Reply-To: <20210607200649.1840382-1-jsnow@redhat.com>
References: <20210607200649.1840382-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Niteesh G . S ." <niteesh.gs@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm not sure when this regressed (Or maybe if it was ever working right
to begin with?), but the Python AST requires you to change "Names" to
"Constants" in order to truly convert `false` to `False`.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qmp-shell | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
index aa148517a8..847d34890f 100755
--- a/scripts/qmp/qmp-shell
+++ b/scripts/qmp/qmp-shell
@@ -95,18 +95,19 @@ class QMPShellError(Exception):
 class FuzzyJSON(ast.NodeTransformer):
     """
     This extension of ast.NodeTransformer filters literal "true/false/null"
-    values in an AST and replaces them by proper "True/False/None" values that
-    Python can properly evaluate.
+    values in a Python AST and replaces them by proper "True/False/None" values
+    that Python can properly evaluate.
     """
 
     @classmethod
-    def visit_Name(cls, node):  # pylint: disable=invalid-name
+    def visit_Name(cls,  # pylint: disable=invalid-name
+                   node: ast.Name) -> ast.AST:
         if node.id == 'true':
-            node.id = 'True'
+            return ast.Constant(value=True)
         if node.id == 'false':
-            node.id = 'False'
+            return ast.Constant(value=False)
         if node.id == 'null':
-            node.id = 'None'
+            return ast.Constant(value=None)
         return node
 
 
@@ -174,10 +175,9 @@ class QMPShell(qmp.QEMUMonitorProtocol):
             # Try once again as FuzzyJSON:
             try:
                 tree = ast.parse(val, mode='eval')
-                return ast.literal_eval(FuzzyJSON().visit(tree))
-            except SyntaxError:
-                pass
-            except ValueError:
+                transformed = FuzzyJSON().visit(tree)
+                return ast.literal_eval(transformed)
+            except (SyntaxError, ValueError):
                 pass
         return val
 
-- 
2.31.1


