Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AD950A893
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 20:57:56 +0200 (CEST)
Received: from localhost ([::1]:48506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhc03-0006eg-M3
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 14:57:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhbk0-0001qF-1h
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 14:41:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhbjy-00062F-EU
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 14:41:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650566477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nAZ0hMye+wTjnjKUhNTlNO9H6DiFfeVSktumbW0T7L8=;
 b=L3hWTln3yeCRPHhHkrOAi6IL/rnFD246JXOwDZmDwfP8b69Q0OZ60GH7NhJZ31M7jxc2zB
 bQl8MAQFMYvzPWQCs49OWu3S0xU8VGLnCM+ZPhzSW77iyY42yQ0RgvufnHG6HFmCS7fMwR
 RZfv0EBpCiRa7qwwm2QIiNSREWEbEJk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-K4gCwJ2VMoi-wJ2hpb0sBg-1; Thu, 21 Apr 2022 14:41:16 -0400
X-MC-Unique: K4gCwJ2VMoi-wJ2hpb0sBg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76FED803D42
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 18:41:16 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.195.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF15840C1438;
 Thu, 21 Apr 2022 18:41:15 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	peterx@redhat.com,
	berrange@redhat.com
Subject: [PULL 17/18] migration: Fix operator type
Date: Thu, 21 Apr 2022 19:40:51 +0100
Message-Id: <20220421184052.306581-18-dgilbert@redhat.com>
In-Reply-To: <20220421184052.306581-1-dgilbert@redhat.com>
References: <20220421184052.306581-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Clang spotted an & that should have been an &&; fix it.

Reported by: David Binderman / https://gitlab.com/dcb
Fixes: 65dacaa04fa ("migration: introduce save_normal_page()")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/963
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20220406102515.96320-1-dgilbert@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/ram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/ram.c b/migration/ram.c
index 253fe4b756..a2489a2699 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1291,7 +1291,7 @@ static int save_normal_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
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


