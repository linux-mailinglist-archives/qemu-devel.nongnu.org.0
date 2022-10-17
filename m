Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5FF601728
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 21:15:47 +0200 (CEST)
Received: from localhost ([::1]:45174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okVaU-0000XB-ED
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 15:15:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1okVX4-0004yQ-Gz
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 15:12:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1okVX2-0001XZ-Ug
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 15:12:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666033932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KRd9uX+wEmaOyExkP9bGuF2k2rW63CCEthnikvkTK1c=;
 b=gW4npvvuTFxGfxz/b9pBYBdn8kGIVM3FLVwEgzYj9MRRsPDmxhE6m2/Jn/9TJkdFoMs4sC
 +4V1WAD5JgsFZrKfLijU6Z9x9o+rziXLJEyKDnjQGiRRLTRvQy8k3kFLExe45E4RKxf/z8
 GulYf1HjX4Yen75VGw04Ek5VP8Nlsio=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-HVtAZ38SMlOWar2g3XWMSg-1; Mon, 17 Oct 2022 15:12:10 -0400
X-MC-Unique: HVtAZ38SMlOWar2g3XWMSg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 654EA8060A4;
 Mon, 17 Oct 2022 19:12:10 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 022861468208;
 Mon, 17 Oct 2022 19:12:09 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org (open list:Network Block Dev...)
Subject: [PATCH v2] nbd/client: Use smarter assert
Date: Mon, 17 Oct 2022 14:12:07 -0500
Message-Id: <20221017191207.1255807-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
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
Thankfully, the incoming strings can never be that large: if the
export name or query is reflecting a string the client got from the
server, we already guarantee that we dropped the NBD connection if the
server sent more than 32M in a single reply to our NBD_OPT_* request;
if the export name is coming from qemu, nbd_receive_negotiate()
asserted that strlen(info->name) <= NBD_MAX_STRING_SIZE; and
similarly, a query string via x->dirty_bitmap coming from the user was
bounds-checked in either qemu-nbd or by the limitations of QMP.
Still, it doesn't hurt to be more explicit in how we write our
assertions to not have to analyze whether inadvertent wraparound is
possible.

Fixes: 93676c88 ("nbd: Don't send oversize strings", v4.2.0)
Reported-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---

v2: update subject line and commit message to reflect file being
touched; adjust a second nearby assertion with the same issue

 nbd/client.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/nbd/client.c b/nbd/client.c
index 30d5383cb1..90a6b7b38b 100644
--- a/nbd/client.c
+++ b/nbd/client.c
@@ -658,11 +658,11 @@ static int nbd_send_meta_query(QIOChannel *ioc, uint32_t opt,
     char *p;

     data_len = sizeof(export_len) + export_len + sizeof(queries);
-    assert(export_len <= NBD_MAX_STRING_SIZE);
+    assert(strlen(export) <= NBD_MAX_STRING_SIZE);
     if (query) {
         query_len = strlen(query);
         data_len += sizeof(query_len) + query_len;
-        assert(query_len <= NBD_MAX_STRING_SIZE);
+        assert(strlen(query) <= NBD_MAX_STRING_SIZE);
     } else {
         assert(opt == NBD_OPT_LIST_META_CONTEXT);
     }
-- 
2.37.3


