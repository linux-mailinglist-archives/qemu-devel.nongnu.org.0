Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D11073677C9
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 05:12:49 +0200 (CEST)
Received: from localhost ([::1]:50594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZPlo-0003Op-TJ
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 23:12:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZPgt-0006Lb-A8
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 23:07:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZPgh-0006SK-Jx
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 23:07:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619060849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pL1l/VqQlyd061vDNxj2U4genMFEVf+bwm5y/ryP3NM=;
 b=STeoWLmwxnuQZv+YqW0OkJyzvKv+L0nxrz6fSTN0mAajNq30tMhSQfk9x9At01lsPCWOly
 DrXN7MJGiLcPqRv3KBP3gOBDk/XJfmxidG2ZDbP3MgfISbx1HUL+/rOYMjdap/AQmBSq90
 cfreysqxJYbnYsRBPCoOSP9elraxcng=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-Dwg_77vuNJ2vXGruatDb_w-1; Wed, 21 Apr 2021 23:07:27 -0400
X-MC-Unique: Dwg_77vuNJ2vXGruatDb_w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CAD878030A1;
 Thu, 22 Apr 2021 03:07:25 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-152.rdu2.redhat.com [10.10.118.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 19E29607CB;
 Thu, 22 Apr 2021 03:07:25 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/22] qapi/parser: Assert lexer value is a string
Date: Wed, 21 Apr 2021 23:07:03 -0400
Message-Id: <20210422030720.3685766-6-jsnow@redhat.com>
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The type checker can't narrow the type of the token value to string,
because it's only loosely correlated with the return token.

We know that a token of '#' should always have a "str" value.
Add an assertion.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/parser.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index f519518075e..c75434e75a5 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -303,6 +303,7 @@ def get_doc(self, info):
         cur_doc = QAPIDoc(self, info)
         self.accept(False)
         while self.tok == '#':
+            assert isinstance(self.val, str), "Expected str value"
             if self.val.startswith('##'):
                 # End of doc comment
                 if self.val != '##':
-- 
2.30.2


