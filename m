Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B852A7EA3
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Nov 2020 13:33:47 +0100 (CET)
Received: from localhost ([::1]:33204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaeSY-0006s1-Cs
	for lists+qemu-devel@lfdr.de; Thu, 05 Nov 2020 07:33:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kaeOm-0002sz-8w
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 07:29:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kaeOg-0004rm-Jk
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 07:29:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604579385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=td3LLZfOziubZsGkL7IXlrUFtRrI6rry0Ahjkf7+L80=;
 b=Ge2PhYS5GCILXCermBPSizY/5UOsxQJhT+q8SEFAo9vlR3IABjUq2vJ5ZNVEn3j0u0K//Y
 mWT4z6DE5oxNPGGvDatYQka0fgKMvwd76a8aZDz/VipiHjAqOLEXghbNu7JXHBN6Nn2/h+
 /Y1o8wU7fwEx6l3SN1TQ+svbJHGucCE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-SdB0Gv9oNxWjKycXOsgVhA-1; Thu, 05 Nov 2020 07:29:41 -0500
X-MC-Unique: SdB0Gv9oNxWjKycXOsgVhA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BC7D107ACF6;
 Thu,  5 Nov 2020 12:29:40 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 356B15C3E1;
 Thu,  5 Nov 2020 12:29:32 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/9] qapi: introduce IfPredicateList and IfAny
Date: Thu,  5 Nov 2020 16:28:03 +0400
Message-Id: <20201105122808.1182973-5-marcandre.lureau@redhat.com>
In-Reply-To: <20201105122808.1182973-1-marcandre.lureau@redhat.com>
References: <20201105122808.1182973-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/05 01:14:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, jsnow@redhat.com,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Based on IfAll, introduce a base class IfPredicateList, and add IfAny
for 'any' conditions.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 scripts/qapi/common.py | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index 01c4c0c878..8dc2824186 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -215,20 +215,32 @@ class IfOption(IfPredicate):
         return self.option == other.option
 
 
-class IfAll(IfPredicate):
+class IfPredicateList(IfPredicate):
+    C_OP = ""
+
     def __init__(self, pred_list: Sequence[IfPredicate]):
         self.pred_list = pred_list
 
     def cgen(self) -> str:
-        return " && ".join([p.cgen() for p in self.pred_list])
+        op = " " + self.C_OP + " "
+        return "(%s)" % op.join([p.cgen() for p in self.pred_list])
 
     def __bool__(self) -> bool:
         return bool(self.pred_list)
 
     def __repr__(self) -> str:
-        return f"IfAll({self.pred_list})"
+        ty = type(self)
+        return f"{ty.__qualname__}({self.pred_list})"
 
     def __eq__(self, other: object) -> bool:
-        if not isinstance(other, IfAll):
+        if not isinstance(other, type(self)):
             return False
         return self.pred_list == other.pred_list
+
+
+class IfAll(IfPredicateList):
+    C_OP = "&&"
+
+
+class IfAny(IfPredicateList):
+    C_OP = "||"
-- 
2.29.0


