Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 516E4274CF6
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Sep 2020 00:58:30 +0200 (CEST)
Received: from localhost ([::1]:33362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKrEz-0004d8-9m
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 18:58:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKr2c-0002BU-4z
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 18:45:43 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:33335
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKr2K-0000PU-Pa
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 18:45:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600814722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vkvv1cb8+m3KMT4QTk8T1JEPJ7jJa4e0nDR3l/fNNhM=;
 b=ccRPPNzG/uUGV/4txfSKssOU5eAnXG2zEZliK9gvctzslFmZp+cDD3d9WhI5YRQkrFzlrZ
 Hm26HTzZqav7wNHgiB/THTzNHz9tm7Iy/NjIjLhCm9MtVSWXrb/A3qt/2JXIbQOq/FsN0o
 Jg9Wxn951MMAVdmA+E7bez6hde4ftJ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-rCwE_BeKOkSZRPgTMbuQkw-1; Tue, 22 Sep 2020 18:45:20 -0400
X-MC-Unique: rCwE_BeKOkSZRPgTMbuQkw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 928C2801AE8;
 Tue, 22 Sep 2020 22:45:19 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A34385C1A3;
 Tue, 22 Sep 2020 22:45:18 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 11/25] qapi/schema.py: Constrain type of QAPISchemaObjectType
 members field
Date: Tue, 22 Sep 2020 18:44:47 -0400
Message-Id: <20200922224501.4087749-12-jsnow@redhat.com>
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
Received-SPF: pass client-ip=207.211.31.81; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 17:01:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This must always be QAPISchemaObjectTypeMember, and we do check and
enforce this -- but because the seen dict is invariant and check methods
need to operate in terms of a more abstract type, we need to tell the
type system to believe us.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/schema.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 62b1a7e890..57343a1002 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -17,6 +17,7 @@
 import os
 import re
 from collections import OrderedDict
+from typing import cast, List
 
 from .common import c_name, POINTER_SUFFIX
 from .error import QAPISourceError, QAPISemError
@@ -391,7 +392,10 @@ def check(self, schema):
         for m in self.local_members:
             m.check(schema)
             m.check_clash(self.info, seen)
-        members = seen.values()
+
+        # check_clash is abstract, but local_members is asserted to be
+        # Sequence[QAPISchemaObjectTypeMember]. Cast to the narrower type.
+        members = cast(List[QAPISchemaObjectTypeMember], list(seen.values()))
 
         if self.variants:
             self.variants.check(schema, seen)
-- 
2.26.2


