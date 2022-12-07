Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E73D645AEC
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 14:28:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2uKu-0007eU-3G; Wed, 07 Dec 2022 08:19:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p2uKp-0007dm-Uo
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 08:19:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p2uKo-0006Sv-Jf
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 08:19:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670419178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dEEyJzhUKAsww0k472ZWz2T+EYnMnuaKXW6ZRQdf7lQ=;
 b=WvBL4HbgwAzvovj30RlCRLUzhWGaqZ6gjB2eWMz/ucFTDujue+nQxmbC5sK2w8XAndE5go
 d/YICcqns8cAbKEzI64OQN8IKEwKeGgD9Wi/FZ/yFx0yqJ4WeBTDTKlgERX0+0+/SiVqqS
 ZdicjSzj2r4BLPATgxsUY0Ri6hH9qkc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-NGiMIDzHP5aAmCn_B2KO_w-1; Wed, 07 Dec 2022 08:19:30 -0500
X-MC-Unique: NGiMIDzHP5aAmCn_B2KO_w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 599E0811E7A;
 Wed,  7 Dec 2022 13:19:30 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3DDEB1121319;
 Wed,  7 Dec 2022 13:19:29 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, vsementsov@yandex-team.ru, qemu-devel@nongnu.org
Subject: [PATCH 06/18] clang-tsa: Add TSA_ASSERT() macro
Date: Wed,  7 Dec 2022 14:18:26 +0100
Message-Id: <20221207131838.239125-7-kwolf@redhat.com>
In-Reply-To: <20221207131838.239125-1-kwolf@redhat.com>
References: <20221207131838.239125-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/qemu/clang-tsa.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/qemu/clang-tsa.h b/include/qemu/clang-tsa.h
index 0a3361dfc8..211ee0ae73 100644
--- a/include/qemu/clang-tsa.h
+++ b/include/qemu/clang-tsa.h
@@ -98,4 +98,13 @@
  */
 #define TSA_NO_TSA TSA(no_thread_safety_analysis)
 
+/*
+ * TSA_ASSERT() is used to annotate functions: This function will assert that
+ * the lock is held. When it returns, the caller of the function is assumed to
+ * already hold the resource.
+ *
+ * More than one mutex may be specified, comma-separated.
+ */
+#define TSA_ASSERT(...) TSA(assert_capability(__VA_ARGS__))
+
 #endif /* #ifndef CLANG_TSA_H */
-- 
2.38.1


