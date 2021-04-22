Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 234C43677CC
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 05:12:55 +0200 (CEST)
Received: from localhost ([::1]:50966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZPlu-0003YE-58
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 23:12:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZPgv-0006MG-5E
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 23:07:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZPgh-0006SP-K8
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 23:07:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619060849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PFAT3UhFNT6M1PcQh3K2YyKNd9ww7GL+/z+LIKs2t1s=;
 b=Gr5rvrvjBdG0+boAWEZhGCflVLX5l/gOVaVUL+8a+3J+Rqa8A7WdKP6Zpuy88Ao+eFcWSi
 M8ph/xp2o76K49Q15hFPErVg/h+mtT3WIiubCL5ACzdTqos5fpb1v6Km8FMUqR5hLRDz/O
 9ksUNDuzb/3X2KnxCg6TV5uks/9vApI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-xu3YGywuMiayKcmpK0iu9g-1; Wed, 21 Apr 2021 23:07:27 -0400
X-MC-Unique: xu3YGywuMiayKcmpK0iu9g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFD8410054F6;
 Thu, 22 Apr 2021 03:07:26 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-152.rdu2.redhat.com [10.10.118.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1C1D607CB;
 Thu, 22 Apr 2021 03:07:25 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/22] qapi/parser: assert get_expr returns object in outer
 loop
Date: Wed, 21 Apr 2021 23:07:04 -0400
Message-Id: <20210422030720.3685766-7-jsnow@redhat.com>
In-Reply-To: <20210422030720.3685766-1-jsnow@redhat.com>
References: <20210422030720.3685766-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

get_expr can return many things, depending on where it is used. In the
outer parsing loop, we expect and require it to return a dict.

(It's (maybe) a bit involved to teach mypy that when nested is False,
this is already always True. I'll look into it later, maybe.)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/parser.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index c75434e75a5..6b443b1247e 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -78,6 +78,8 @@ def _parse(self):
                 continue
 
             expr = self.get_expr(False)
+            assert isinstance(expr, dict)  # Guaranteed when nested=False
+
             if 'include' in expr:
                 self.reject_expr_doc(cur_doc)
                 if len(expr) != 1:
@@ -278,6 +280,7 @@ def get_values(self):
             self.accept()
 
     def get_expr(self, nested):
+        # TODO: Teach mypy that nested=False means the retval is a Dict.
         if self.tok != '{' and not nested:
             raise QAPIParseError(self, "expected '{'")
         if self.tok == '{':
-- 
2.30.2


