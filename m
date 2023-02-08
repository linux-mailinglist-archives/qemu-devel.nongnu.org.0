Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1691A68E5F4
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 03:14:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPZxT-0002jb-J2; Tue, 07 Feb 2023 21:13:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pPZxR-0002j3-LY
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 21:13:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pPZxP-00040y-VX
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 21:13:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675822391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r2aZxQLAeUC0cRqiVMBvIYd8dSbo69BJeODYzbqQ5I4=;
 b=P/6fBfpUx7x2OArkILz+6l5/whYyaBlkrCJJhHoIlA5w0x6ve4I9FQIA3II59FWfdOemxd
 sQvOgqIVHn2cMNaRpCzMYlQXyI1pi8K3PUUEqPAGJ0wu4PV5bNudP3eg0tKbsNK3LiEuts
 /+wjsgz4G1gpE0PLPotBNWmVgOL9FI0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-177-dgkJ6yDONoe_5TuScjxkdg-1; Tue, 07 Feb 2023 21:13:07 -0500
X-MC-Unique: dgkJ6yDONoe_5TuScjxkdg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D7033C0DDB7;
 Wed,  8 Feb 2023 02:13:07 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4DD921121314;
 Wed,  8 Feb 2023 02:13:07 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH v2 4/7] qapi/expr: add typing workaround for AbstractSet
Date: Tue,  7 Feb 2023 21:13:03 -0500
Message-Id: <20230208021306.870657-5-jsnow@redhat.com>
In-Reply-To: <20230208021306.870657-1-jsnow@redhat.com>
References: <20230208021306.870657-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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

As part of attempting to unify the JSON types, I discovered that mypy
believes that `Mapping[str, ...].keys() & Set[str]` produces an
`AbstractSet[str]` and not a `Set[str]`.

As a result, mypy is unsure if the .pop() is safe.

Eh, fine, just wrap the expression in a set() constructor to force it to
be a mutable type.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/expr.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 338c9ea4131..95a25758fed 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -610,8 +610,8 @@ def check_expr(pexpr: ParsedExpression) -> None:
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


