Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AC350A2A8
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 16:36:58 +0200 (CEST)
Received: from localhost ([::1]:47202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhXvV-00012q-Ex
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 10:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nhXqQ-0002c2-BH
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 10:31:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nhXqO-0004Kg-6s
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 10:31:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650551499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UaSWxSHwOaVEOSu50/urVOZd/RmYPyr4Rsit0zBKVZ0=;
 b=PzHnsidnfj3ykn85ocLuKkiOK7H+15yMlZqDyFMuKRtykiAZZVSqqMd5r922KneKO4YXcl
 v9CKCJWjCD+91lxSg8L67NnUL0gW7kn6q/uKWL8esRt+bYBVFkrvYT88/HN2dPH0qJyXoM
 hhE8MHX/VNiTrX9uful84VhP6cBwbtk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-499-zEEsoqCBOXO-AcwJzdMjqA-1; Thu, 21 Apr 2022 10:31:38 -0400
X-MC-Unique: zEEsoqCBOXO-AcwJzdMjqA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ECD153811A36;
 Thu, 21 Apr 2022 14:31:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC26AC27EBD;
 Thu, 21 Apr 2022 14:31:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AFC9121E6A26; Thu, 21 Apr 2022 16:31:35 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 7/7] qapi: Fix version of cpu0-id field
Date: Thu, 21 Apr 2022 16:31:35 +0200
Message-Id: <20220421143135.1491256-8-armbru@redhat.com>
In-Reply-To: <20220421143135.1491256-1-armbru@redhat.com>
References: <20220421143135.1491256-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Dov Murik <dovmurik@linux.ibm.com>, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dov Murik <dovmurik@linux.ibm.com>

Commit 811b4ec7f8eb ("qapi, target/i386/sev: Add cpu0-id to
query-sev-capabilities") wrongly stated that the new field is available
since version 7.0.

Fix the QAPI documentation to state that the cpu0-id field is included
since 7.1.

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
Message-Id: <20220420190129.3532623-1-dovmurik@linux.ibm.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/misc-target.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index bc9355b595..ed4a468aab 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -144,7 +144,7 @@
 #
 # @cert-chain:  PDH certificate chain (base64 encoded)
 #
-# @cpu0-id: Unique ID of CPU0 (base64 encoded) (since 7.0)
+# @cpu0-id: Unique ID of CPU0 (base64 encoded) (since 7.1)
 #
 # @cbitpos: C-bit location in page table entry
 #
-- 
2.35.1


