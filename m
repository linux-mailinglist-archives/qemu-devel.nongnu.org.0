Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39886274C6E
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Sep 2020 00:49:37 +0200 (CEST)
Received: from localhost ([::1]:56364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKr6O-0007N1-9z
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 18:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKr2G-00021o-5j
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 18:45:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKr2E-0000Mk-8Z
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 18:45:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600814717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3hwPPP7ajxXWgMYSvqQEb3O2rXxN2d7kmT45cRPWKTA=;
 b=Ffv2JlN6oyFwBfFNi4b/FPKQiU+M1cH+h0KeNkkeIeh5tM8nQjOIRoSNfiqxu7T38nr5Pi
 q/npSrKHtWRY5Ro5WTwfzP3MD+wAJ/lz2QUER9xUIR1b4sTJTWpxG1z2RnRKynX6xv+p9f
 YHitU9k6/MnBITVR6WCMsm4fXExxwsY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-kvonn3BgPk6yGgNOGS0p3w-1; Tue, 22 Sep 2020 18:45:13 -0400
X-MC-Unique: kvonn3BgPk6yGgNOGS0p3w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C584425DD;
 Tue, 22 Sep 2020 22:45:12 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76BAD5C1A3;
 Tue, 22 Sep 2020 22:45:11 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 04/25] qapi/schema.py: constrain QAPISchemaObjectType base type
Date: Tue, 22 Sep 2020 18:44:40 -0400
Message-Id: <20200922224501.4087749-5-jsnow@redhat.com>
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
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Re-order check slightly so we can provide a stronger guarantee on the
typing of the base field.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/schema.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index a53631e660..3aa842be08 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -378,14 +378,14 @@ def check(self, schema):
 
         seen = OrderedDict()
         if self._base_name:
-            self.base = schema.resolve_type(self._base_name, self.info,
-                                            "'base'")
-            if (not isinstance(self.base, QAPISchemaObjectType)
-                    or self.base.variants):
+            base = schema.resolve_type(self._base_name, self.info, "'base'")
+            if (not isinstance(base, QAPISchemaObjectType)
+                    or base.variants):
                 raise QAPISemError(
                     self.info,
                     "'base' requires a struct type, %s isn't"
-                    % self.base.describe())
+                    % base.describe())
+            self.base = base
             self.base.check(schema)
             self.base.check_clash(self.info, seen)
         for m in self.local_members:
-- 
2.26.2


