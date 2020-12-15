Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F7B2DB38F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 19:21:35 +0100 (CET)
Received: from localhost ([::1]:41594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpEx4-0004Zc-93
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 13:21:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXo-0003NF-MT
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:55:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXe-0001Zu-Dp
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:55:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608054917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QwnR1o1H7XTJjRP5j8/ZMO3lw2UvrTVXSKfmb0/ATYA=;
 b=Phyma6ZEgMJi6lEIQlEKiqQ4rKcaaR6W3zc6WdFGSxg4Abhzt4RjRpGU79fiyv4oVWMuG+
 ja98mi9nH3omH6bdmiM/SELBu3+g4a1Nx3rqGqaqK4cTajtCahUgvS0EuyB+DWoy6ePllK
 Seh8FENJlzAQbCZj2jQIJor4Mc3aUCQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-nwEow456M72uKQi33aBmJA-1; Tue, 15 Dec 2020 12:55:12 -0500
X-MC-Unique: nwEow456M72uKQi33aBmJA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E48518B37E0;
 Tue, 15 Dec 2020 17:55:11 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C029F60854;
 Tue, 15 Dec 2020 17:55:10 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 41/45] compiler: remove GNUC check
Date: Tue, 15 Dec 2020 12:54:41 -0500
Message-Id: <20201215175445.1272776-42-pbonzini@redhat.com>
In-Reply-To: <20201215175445.1272776-1-pbonzini@redhat.com>
References: <20201215175445.1272776-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

QEMU requires Clang or GCC, that define and support __GNUC__ extensions.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20201210134752.780923-12-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/compiler.h | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index 6212295e52..5e6cf2c8e8 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -64,14 +64,10 @@
     (offsetof(container, field) + sizeof_field(container, field))
 
 /* Convert from a base type to a parent type, with compile time checking.  */
-#ifdef __GNUC__
 #define DO_UPCAST(type, field, dev) ( __extension__ ( { \
     char __attribute__((unused)) offset_must_be_zero[ \
         -offsetof(type, field)]; \
     container_of(dev, type, field);}))
-#else
-#define DO_UPCAST(type, field, dev) container_of(dev, type, field)
-#endif
 
 #define typeof_field(type, field) typeof(((type *)0)->field)
 #define type_check(t1,t2) ((t1*)0 - (t2*)0)
@@ -102,7 +98,7 @@
 #if defined(__clang__)
 /* clang doesn't support gnu_printf, so use printf. */
 # define GCC_FMT_ATTR(n, m) __attribute__((format(printf, n, m)))
-#elif defined(__GNUC__)
+#else
 /* Use gnu_printf (qemu uses standard format strings). */
 # define GCC_FMT_ATTR(n, m) __attribute__((format(gnu_printf, n, m)))
 # if defined(_WIN32)
@@ -112,8 +108,6 @@
  */
 #  define __printf__ __gnu_printf__
 # endif
-#else
-#define GCC_FMT_ATTR(n, m)
 #endif
 
 #ifndef __has_warning
-- 
2.26.2



