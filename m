Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EADA274CED
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Sep 2020 00:56:33 +0200 (CEST)
Received: from localhost ([::1]:53486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKrD6-0001C7-44
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 18:56:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKr2g-0002EF-CI
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 18:45:47 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:25604
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKr2P-0000Py-2E
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 18:45:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600814726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+E+mV59mJlkX4nFN4kcpjssEGCtAusD4bkmzsFbnN0A=;
 b=HfvlOQ/miSVlI9R6sv7z7/pSAo73s0MteInNDlz3tpHpJIAOQEle5TeUfIW9TpTvsq3/e8
 5Acoy3ft2bDOkBNmtqu8duNRfJDfz0K29yD/kfpE+Em1AB2cGMuq/LtbFzX64GVkwQGRNh
 fpTiw1QB1zpdbrh0R/Nr4kO6msu+AVQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-2ryE0ewlMaWVM44pIyienQ-1; Tue, 22 Sep 2020 18:45:24 -0400
X-MC-Unique: 2ryE0ewlMaWVM44pIyienQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59AAF1005E64;
 Tue, 22 Sep 2020 22:45:23 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1BF1B5C1A3;
 Tue, 22 Sep 2020 22:45:21 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 14/25] qapi/schema.py: Assert variants of an object are also
 objects
Date: Tue, 22 Sep 2020 18:44:50 -0400
Message-Id: <20200922224501.4087749-15-jsnow@redhat.com>
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

The 'seen' dictionaries are invariant types and require the most
abstracted type to maintain a consistent interface with other
check_clash implementations.

In this case, we happen to know (and require) that they will be object
types, so add a runtime assertion to constrain that type.

Corrects this warning:
qapi/schema.py:718: error: Item "QAPISchemaType" of "Optional[QAPISchemaType]"
    has no attribute "check_clash"

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/schema.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 09c7ceab41..b502eee9cb 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -620,6 +620,7 @@ def check_clash(self, info, seen):
         for v in self.variants:
             # Reset seen map for each variant, since qapi names from one
             # branch do not affect another branch
+            assert isinstance(v.type, QAPISchemaObjectType)
             v.type.check_clash(info, dict(seen))
 
 
-- 
2.26.2


