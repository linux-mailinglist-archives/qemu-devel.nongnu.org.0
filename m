Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6551E274B7C
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 23:49:15 +0200 (CEST)
Received: from localhost ([::1]:33678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKq9y-0005YA-F8
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 17:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKpbJ-0000oQ-M9
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 17:13:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKpbH-00061N-NI
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 17:13:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600809202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kiROWfsWIjfjZEiwsV7fIP+RW6PpLlCUtwamIXrMEmQ=;
 b=GsgkRqSigQg7OJz2ARHLMbTeY/btcvasSR5SpeN172lM2iphfEq9PWfKX/C/yoh+JPqQ+L
 yEEtlQZCSlNIrf6R9VZUiL4X2hNtwQkEnieDsNqEp3oUpawKiy38i4wY8pTyW1x3kxAYzj
 IUQG6a2dOdT5yFS9K0SEwU4FoInJx54=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-8R49_K1jPNSBPcTHcU4WiQ-1; Tue, 22 Sep 2020 17:13:20 -0400
X-MC-Unique: 8R49_K1jPNSBPcTHcU4WiQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBE2A64086;
 Tue, 22 Sep 2020 21:13:19 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0661173689;
 Tue, 22 Sep 2020 21:13:18 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 04/16] qapi/expr.py: Add assertion for union type 'check_dict'
Date: Tue, 22 Sep 2020 17:13:01 -0400
Message-Id: <20200922211313.4082880-5-jsnow@redhat.com>
In-Reply-To: <20200922211313.4082880-1-jsnow@redhat.com>
References: <20200922211313.4082880-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 02:07:04
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
Cc: Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

mypy isn't fond of allowing you to check for bool membership in a
collection of str elements. Guard this lookup for precisely when we were
given a name.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/expr.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index f6b55a87c1..67892502e9 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -166,7 +166,9 @@ def check_type(value, info, source,
         raise QAPISemError(info,
                            "%s should be an object or type name" % source)
 
-    permit_upper = allow_dict in info.pragma.name_case_whitelist
+    permit_upper = False
+    if isinstance(allow_dict, str):
+        permit_upper = allow_dict in info.pragma.name_case_whitelist
 
     # value is a dictionary, check that each member is okay
     for (key, arg) in value.items():
-- 
2.26.2


