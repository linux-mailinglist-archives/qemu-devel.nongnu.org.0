Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 013E23677E0
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 05:23:59 +0200 (CEST)
Received: from localhost ([::1]:47860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZPwc-0005hw-3U
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 23:23:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZPgz-0006Uw-0b
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 23:07:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZPgl-0006TK-Cx
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 23:07:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619060852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fu3F09nKvK06zGFS37EYCt26mMCvcXkCpmOT//N3gFU=;
 b=SPfV9q6nUxtxZxqNUIJZLssMWD1VIj/+8NqDgA1UtS8RUw1GTZkGTU/q0G81tEgrnuydhv
 pdoyzeNSGDOhyCsgrlFYpi4txYDfS6iX69OPy1UEqmj6EPkyuDmruk4Ku9oUFkHTcz2/6e
 HkquQZ+XTw1iKYWfA+J88klHhnJUWZE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-J4Xbgs2JPMKb7FQm9ekBLQ-1; Wed, 21 Apr 2021 23:07:31 -0400
X-MC-Unique: J4Xbgs2JPMKb7FQm9ekBLQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C6D5107ACCA;
 Thu, 22 Apr 2021 03:07:30 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-152.rdu2.redhat.com [10.10.118.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84376607CB;
 Thu, 22 Apr 2021 03:07:29 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/22] qapi/parser: Fix typing of token membership tests
Date: Wed, 21 Apr 2021 23:07:08 -0400
Message-Id: <20210422030720.3685766-11-jsnow@redhat.com>
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

When the token can be None, we can't use 'x in "abc"' style membership
tests to group types of tokens together, because 'None in "abc"' is a
TypeError.

Easy enough to fix, if not a little ugly.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/parser.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 7f3c009f64b..16fd36f8391 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -272,7 +272,7 @@ def get_values(self):
         if self.tok == ']':
             self.accept()
             return expr
-        if self.tok not in "{['tf":
+        if self.tok is None or self.tok not in "{['tf":
             raise QAPIParseError(
                 self, "expected '{', '[', ']', string, or boolean")
         while True:
@@ -294,7 +294,8 @@ def get_expr(self, nested):
         elif self.tok == '[':
             self.accept()
             expr = self.get_values()
-        elif self.tok in "'tf":
+        elif self.tok and self.tok in "'tf":
+            assert isinstance(self.val, (str, bool))
             expr = self.val
             self.accept()
         else:
-- 
2.30.2


