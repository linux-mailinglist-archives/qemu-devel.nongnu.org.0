Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5913511665
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 13:50:11 +0200 (CEST)
Received: from localhost ([::1]:36362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njgBL-0001I0-QB
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 07:50:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1njg2t-0005QG-3L
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 07:41:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1njg2r-000369-Hm
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 07:41:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651059681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QUajXLIz1w0mEkoz0EDPtlK93pHKpbHvMptJ5r4Aryo=;
 b=Wxju4sAZqtDVAEFPXd6Tv51AIsi1Xta5cE5qhTKOTBzMV6UVCYeu2TFHjOdxHzlSg0JChl
 Q5mqq4NfPWxPwih5nMWm65Ak2G2Ruivrl1XgmyAUFUZAQ+XEKhNSDbVP8OLNddUeUZBAR1
 7GXCjlJEgN4WWsCkyylLgty4KPRV+F8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-375-u9TBWR8zMy6t5S-ZYgzXjg-1; Wed, 27 Apr 2022 07:41:19 -0400
X-MC-Unique: u9TBWR8zMy6t5S-ZYgzXjg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A50C801E67;
 Wed, 27 Apr 2022 11:41:19 +0000 (UTC)
Received: from localhost (unknown [10.39.193.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 66853111D3C7;
 Wed, 27 Apr 2022 11:41:08 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 3/4] Revert "main-loop: Disable GLOBAL_STATE_CODE() assertions"
Date: Wed, 27 Apr 2022 13:40:56 +0200
Message-Id: <20220427114057.36651-4-hreitz@redhat.com>
In-Reply-To: <20220427114057.36651-1-hreitz@redhat.com>
References: <20220427114057.36651-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit b1c073490553f80594b903ceedfc7c1aef6b1b19.  (We
wanted to do so once the 7.1 tree opens, which has happened.  The issue
reported in https://gitlab.com/qemu-project/qemu/-/issues/945 should be
fixed by the preceding patches.)

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
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


