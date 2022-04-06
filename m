Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8394F5A90
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 12:30:29 +0200 (CEST)
Received: from localhost ([::1]:57864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc2vk-00035V-ND
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 06:30:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nc2rJ-0000FX-R1
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 06:25:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nc2r6-0004GG-Uk
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 06:25:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649240737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9QbqiIe3+3xu24r/KYZA67c1OWcixljOx5YAGklnfpc=;
 b=NtqBnJwg2LR8ySi8R/p+66bw/hfIeH2eZRmW+Ac8c2B1SnDdU1foEVmmNLn/IJZ2jnAwJn
 3WULGi3QyXZDbpH8quvy8JdY38sTpvt6dvHNMzcjir2JYk6tw3CvNUKHIifpAY0ow+afFj
 rM65noVB/vjmIH64Tajt8NxwIWv6ptc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-52-1Yev6YPAMDmh3BGBlXaMDg-1; Wed, 06 Apr 2022 06:25:36 -0400
X-MC-Unique: 1Yev6YPAMDmh3BGBlXaMDg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67ED63C37F22
 for <qemu-devel@nongnu.org>; Wed,  6 Apr 2022 10:25:36 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.195.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D54932026D64;
 Wed,  6 Apr 2022 10:25:19 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	quintela@redhat.com
Subject: [PATCH] migration: Fix operator type
Date: Wed,  6 Apr 2022 11:25:15 +0100
Message-Id: <20220406102515.96320-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: leobras@redhat.com, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Clang spotted an & that should have been an &&; fix it.

Reported by: David Binderman / https://gitlab.com/dcb
Fixes: 65dacaa04fa ("migration: introduce save_normal_page()")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/963
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/ram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/ram.c b/migration/ram.c
index 3532f64ecb..0ef4bd63eb 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1289,7 +1289,7 @@ static int save_normal_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
                                          offset | RAM_SAVE_FLAG_PAGE));
     if (async) {
         qemu_put_buffer_async(rs->f, buf, TARGET_PAGE_SIZE,
-                              migrate_release_ram() &
+                              migrate_release_ram() &&
                               migration_in_postcopy());
     } else {
         qemu_put_buffer(rs->f, buf, TARGET_PAGE_SIZE);
-- 
2.35.1


