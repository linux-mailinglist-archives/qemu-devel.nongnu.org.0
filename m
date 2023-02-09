Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 929606910AB
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 19:49:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQBxp-0007VY-Nv; Thu, 09 Feb 2023 13:48:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pQBxm-0007US-Sy
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 13:48:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pQBxk-0005UR-Bz
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 13:48:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675968483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mA+SaeruvzqzE8bmFvWSmbnGGMoxvOYDMUhTw9Kr3cY=;
 b=T+45AortQ4icRYk2TYInp/57QynFKOdh4e9S5vxzDqXgXyZ+LRgt1kCzG8z2eG/6CtHd1b
 yuMhxLzZmOsXCOwTd99Mx1jEXoP31UdpOMqgatUTVgzRZKrk2bJalYwa4SMNH7WgTAAJfZ
 P49NCtFroFIUXsGxjYGVz9Whj6CEI04=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-112-CbaKdSDlOZWy5WjElCNk5g-1; Thu, 09 Feb 2023 13:48:00 -0500
X-MC-Unique: CbaKdSDlOZWy5WjElCNk5g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D14E8811E6E;
 Thu,  9 Feb 2023 18:47:59 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A3D88492C3E;
 Thu,  9 Feb 2023 18:47:59 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH v3 4/7] qapi/expr: add typing workaround for AbstractSet
Date: Thu,  9 Feb 2023 13:47:55 -0500
Message-Id: <20230209184758.1017863-5-jsnow@redhat.com>
In-Reply-To: <20230209184758.1017863-1-jsnow@redhat.com>
References: <20230209184758.1017863-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

mypy can only narrow the type of `Mapping[str, ...].keys() & Set[str]`
to `AbstractSet[str]` and not a `Set[str]`. As a result, if the type of
an expression is changed to a Mapping[], mypy is unsure if the .pop() is
safe.

A forthcoming commit does exactly that, so wrap the expression in a
set() constructor to force the intermediate expression to be resolved as
a mutable type.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/expr.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index b56353bdf84..af802367eff 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -622,8 +622,8 @@ def check_expr(expr_elem: _JSONObject) -> None:
     if 'include' in expr:
         return
 
-    metas = expr.keys() & {'enum', 'struct', 'union', 'alternate',
-                           'command', 'event'}
+    metas = set(expr.keys() & {
+        'enum', 'struct', 'union', 'alternate', 'command', 'event'})
     if len(metas) != 1:
         raise QAPISemError(
             info,
-- 
2.39.0


