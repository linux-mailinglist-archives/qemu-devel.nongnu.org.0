Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF2B402DC5
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 19:36:25 +0200 (CEST)
Received: from localhost ([::1]:33610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNf1E-0007id-LU
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 13:36:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mNf09-0006uS-S8
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 13:35:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mNf06-0005TV-9a
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 13:35:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631036112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ignPgDUT+Ou2B5oy93lqPzEkeGt9ap/CK24ZUps243I=;
 b=NuLv6ncYpVr4m1V87gj3GTE+sA84AomjLGW0lV3AJtPzpcJFEye8yL7Wf/xVCIj1goXqWA
 4YSYy7sbqSLFTA46Y9YGsZzQQOyMCx83D96wR/cCtJ3A853muvtHD59zfXSmulNg5a+Boq
 HEmeFzUB2uTOanl5HgeqlW03XlsdGOc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-7TezZDnqMGmzbOzXul0JMg-1; Tue, 07 Sep 2021 13:35:09 -0400
X-MC-Unique: 7TezZDnqMGmzbOzXul0JMg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E00521854E21;
 Tue,  7 Sep 2021 17:35:08 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-95.phx2.redhat.com [10.3.112.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 79DAB19739;
 Tue,  7 Sep 2021 17:35:08 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] nbd/server: Allow LIST_META_CONTEXT without STRUCTURED_REPLY
Date: Tue,  7 Sep 2021 12:35:05 -0500
Message-Id: <20210907173505.1499709-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: vsementsov@virtuozzo.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The NBD protocol just relaxed the requirements on
NBD_OPT_LIST_META_CONTEXT:

https://github.com/NetworkBlockDevice/nbd/commit/13a4e33a87

Since listing is not stateful (unlike SET_META_CONTEXT), we don't care
if a client asks for meta contexts without first requesting structured
replies.  Well-behaved clients will still ask for structured reply
first (if for no other reason than for back-compat to older servers),
but that's no reason to avoid this change.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 nbd/server.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/nbd/server.c b/nbd/server.c
index 1646796a4798..bd635cf8ffd1 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -980,7 +980,7 @@ static int nbd_negotiate_meta_queries(NBDClient *client,
     size_t i;
     size_t count = 0;

-    if (!client->structured_reply) {
+    if (client->opt == NBD_OPT_SET_META_CONTEXT && !client->structured_reply) {
         return nbd_opt_invalid(client, errp,
                                "request option '%s' when structured reply "
                                "is not negotiated",
-- 
2.31.1


