Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3C3274CF4
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Sep 2020 00:57:42 +0200 (CEST)
Received: from localhost ([::1]:58434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKrED-0003Iz-J5
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 18:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKr2c-0002BV-5k
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 18:45:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKr2M-0000Po-AP
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 18:45:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600814724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uJOLSFLQS5Ql/KtJdcuLr156RfGDWaTWC6vpyFkF8ZM=;
 b=Es/7wed6PjN2EDwiiDnyzh5wkCmYSgZWL6Gl8rTHLVgsMfnzvLvhQrBcZv6ouRgz6+5X2S
 wXs4KQhL7k3HxafQHT9CNk5C8pXk5w9/PeKit00ihrZN0TxNFG5ObgfvKYh9Fyg3ugcVEn
 GmZ5WRo15Sd6h6aEwM3GRUcekq7FuQQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-RAJO-UEAP8uKrF6xm8E2-w-1; Tue, 22 Sep 2020 18:45:23 -0400
X-MC-Unique: RAJO-UEAP8uKrF6xm8E2-w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D438C425CE;
 Tue, 22 Sep 2020 22:45:21 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7B865C1A3;
 Tue, 22 Sep 2020 22:45:20 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 13/25] qapi/schema.py: Test type of self.ret_type instead of
 local temp
Date: Tue, 22 Sep 2020 18:44:49 -0400
Message-Id: <20200922224501.4087749-14-jsnow@redhat.com>
In-Reply-To: <20200922224501.4087749-1-jsnow@redhat.com>
References: <20200922224501.4087749-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 15:47:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is obscure: If we test the type on a local copy instead of the
stored state AFTER the assignment, mypy does not constrain the type of
the copy. If we test on the stored state, it works out fine.

Corrects this warning:

qapi/schema.py:887: error: "QAPISchemaType" has no attribute "element_type"

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/schema.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 943f234ee2..09c7ceab41 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -764,7 +764,7 @@ def check(self, schema):
                 self._ret_type_name, self.info, "command's 'returns'")
             if self.name not in self.info.pragma.returns_whitelist:
                 typ = self.ret_type
-                if isinstance(typ, QAPISchemaArrayType):
+                if isinstance(self.ret_type, QAPISchemaArrayType):
                     typ = self.ret_type.element_type
                     assert typ
                 if not isinstance(typ, QAPISchemaObjectType):
-- 
2.26.2


