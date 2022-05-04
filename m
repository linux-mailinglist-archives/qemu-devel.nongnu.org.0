Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F82051A25D
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 16:37:30 +0200 (CEST)
Received: from localhost ([::1]:54544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmG89-0004dh-HZ
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 10:37:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nmFwk-0000tp-UG
 for qemu-devel@nongnu.org; Wed, 04 May 2022 10:25:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nmFwh-0007Gf-C1
 for qemu-devel@nongnu.org; Wed, 04 May 2022 10:25:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651674338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bwrTv1nHgz7R8Rsr+X7iaBFxqQjwmzvWlujG/Ax9JIg=;
 b=Hs0LT9j7wMHIO60mvEKq9z5f0d09bAtBfW0sjmJP9jq8Xvq/ePJhV2jEjYOPxhX8uluLz+
 xrkSN9HGOQoUbPYpIYK1ERQMC+QNxBIDlZpR2pdb76P/pvMOshlmUTdREaD3TPzZTzHIGY
 CMOZnm+Or/OH85lSrI4ZLUQn91TOhLo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-myJKUiyPPgOcuHMvQjGWhQ-1; Wed, 04 May 2022 10:25:35 -0400
X-MC-Unique: myJKUiyPPgOcuHMvQjGWhQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C281F29ABA08;
 Wed,  4 May 2022 14:25:34 +0000 (UTC)
Received: from merkur.str.redhat.com (dhcp-192-180.str.redhat.com
 [10.33.192.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40C9C4021A3;
 Wed,  4 May 2022 14:25:34 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 07/13] Revert "main-loop: Disable GLOBAL_STATE_CODE()
 assertions"
Date: Wed,  4 May 2022 16:25:16 +0200
Message-Id: <20220504142522.167506-8-kwolf@redhat.com>
In-Reply-To: <20220504142522.167506-1-kwolf@redhat.com>
References: <20220504142522.167506-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Hanna Reitz <hreitz@redhat.com>

This reverts commit b1c073490553f80594b903ceedfc7c1aef6b1b19.  (We
wanted to do so once the 7.1 tree opens, which has happened.  The issue
reported in https://gitlab.com/qemu-project/qemu/-/issues/945 should be
fixed by the preceding patches.)

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220427114057.36651-4-hreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/qemu/main-loop.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
index d3750c8e76..89bd9edefb 100644
--- a/include/qemu/main-loop.h
+++ b/include/qemu/main-loop.h
@@ -284,8 +284,7 @@ bool qemu_in_main_thread(void);
 #else
 #define GLOBAL_STATE_CODE()                                         \
     do {                                                            \
-        /* FIXME: Re-enable after 7.0 release */                    \
-        /* assert(qemu_in_main_thread()); */                        \
+        assert(qemu_in_main_thread());                              \
     } while (0)
 #endif /* CONFIG_COCOA */
 
-- 
2.35.1


