Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2776015A1
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 19:46:29 +0200 (CEST)
Received: from localhost ([::1]:38308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okUC3-0005cZ-BO
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 13:46:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1okU3W-00087E-F1
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 13:37:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1okU3S-0003Xx-Rj
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 13:37:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666028253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=M7m1sAW0B7/XBcnTsrnF2OIn4+D5WPTlfN5770bIApk=;
 b=BnhTInBQ8PbuxIeSkj3owJYYV4//TamoYckHh8wxjK5ZFVFEocRlZjzlGUD9BaOwqMHrsI
 TqM3SMwEgF4KVJP9oIekzct+qkz0j//MzpUOnNraFNAlRb98nXy5nzZUJ9CqVmsR5Qyy3F
 FLP3H2K0ad5D12M6nnpzegl8Hq1NLeo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-nkU9b4ejNjKVlc8FWko3Jg-1; Mon, 17 Oct 2022 13:37:30 -0400
X-MC-Unique: nkU9b4ejNjKVlc8FWko3Jg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3CFA3802C17;
 Mon, 17 Oct 2022 17:37:30 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AED03C15BA5;
 Mon, 17 Oct 2022 17:37:29 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org (open list:Network Block Dev...)
Subject: [PATCH] nbd/server: Use smarter assert
Date: Mon, 17 Oct 2022 12:37:27 -0500
Message-Id: <20221017173727.1246179-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Assigning strlen() to a uint32_t and then asserting that it isn't too
large doesn't catch the case of an input string 4G in length.
Thankfully, the incoming string can never be that large: if the export
name is reflecting what the client asked about, we already guarantee
that we drop the NBD connection if the client tries to send more than
32M in a single NBD_OPT_* request; and if the export name is coming
from qemu, nbd_receive_negotiate() asserted that strlen(info->name) <=
NBD_MAX_STRING_SIZE.  Still, it doesn't hurt to be more explicit in
how we write our assertion that we are aware that no wraparound is
possible.

Fixes: 93676c88 ("nbd: Don't send oversize strings", v4.2.0)
Reported-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 nbd/client.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/nbd/client.c b/nbd/client.c
index 60c9f4941a..b601ee97e5 100644
--- a/nbd/client.c
+++ b/nbd/client.c
@@ -658,7 +658,7 @@ static int nbd_send_meta_query(QIOChannel *ioc, uint32_t opt,
     char *p;

     data_len = sizeof(export_len) + export_len + sizeof(queries);
-    assert(export_len <= NBD_MAX_STRING_SIZE);
+    assert(strlen(export) <= NBD_MAX_STRING_SIZE);
     if (query) {
         query_len = strlen(query);
         data_len += sizeof(query_len) + query_len;
-- 
2.37.3


