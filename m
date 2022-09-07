Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 577B55B083E
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 17:14:40 +0200 (CEST)
Received: from localhost ([::1]:37222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVwlD-00065c-H8
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 11:14:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oVwab-0004Sa-Ba
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 11:03:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oVwaZ-0004UT-UP
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 11:03:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662563019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hpUrsigqFeNLbg5u0wePxMjRmYh+BjsEdEkokZXTtGM=;
 b=gf9bmzP5bdh3yGccM5iLrsMYXJAU8v55qrqBT8KyXvwKdZjwUXzMBvlTF2L0gxitMtZiLb
 forYKe6lppWXcL+xQFZdBw0SSdQv8rHZBH5YLDHPSK6flZ5xXRi9cTyCL54RFIhOBtBuji
 nN7Vn6/SyoDScRx7A5Xi2bdYFzwR1NA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-dsFGWxXRPmOE6Va5j5Yk_g-1; Wed, 07 Sep 2022 11:03:30 -0400
X-MC-Unique: dsFGWxXRPmOE6Va5j5Yk_g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B488C805AF5
 for <qemu-devel@nongnu.org>; Wed,  7 Sep 2022 15:03:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 845582166B26;
 Wed,  7 Sep 2022 15:03:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4485121E6931; Wed,  7 Sep 2022 17:03:27 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
	Victor Toso <victortoso@redhat.com>
Subject: [PULL 04/10] qapi: fix example of BLOCK_JOB_READY event
Date: Wed,  7 Sep 2022 17:03:21 +0200
Message-Id: <20220907150327.538464-5-armbru@redhat.com>
In-Reply-To: <20220907150327.538464-1-armbru@redhat.com>
References: <20220907150327.538464-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Victor Toso <victortoso@redhat.com>

Example output is missing ',' delimiter. Fix it.

Problem was noticed when trying to load the example into python's json
library.

Signed-off-by: Victor Toso <victortoso@redhat.com>
Message-Id: <20220901085840.22520-5-victortoso@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/block-core.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 2173e7734a..882b266532 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -5252,7 +5252,7 @@
 #
 # <- { "event": "BLOCK_JOB_READY",
 #      "data": { "device": "drive0", "type": "mirror", "speed": 0,
-#                "len": 2097152, "offset": 2097152 }
+#                "len": 2097152, "offset": 2097152 },
 #      "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
 #
 ##
-- 
2.37.2


