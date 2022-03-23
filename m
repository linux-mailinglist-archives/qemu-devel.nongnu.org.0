Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F954E5634
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 17:19:57 +0100 (CET)
Received: from localhost ([::1]:59102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX3iG-0004Wr-Os
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 12:19:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3P3-0004wX-0T
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:00:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3P1-00057d-2L
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:00:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648051202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FeTKXxoCA4TmzkCaXdTiX57mus9QuNuqMjq6Lg0jkVc=;
 b=gm2+JfYyZOAY8ODwiWzG/nCrH6dd4NOk7Rsf3e54RwC/eWi2C0fKnoknvNU9YL9t/sgrXz
 y1pGEyk/Jbu1/BMzpiPzP4sbgiRc94FvXyc4PKpMv0uUXIJUWVVOnakwxXwl0xhfbEAq+5
 dmH5Kzruk+vOPWQdEoSWwR5XG98K1sg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-2ehL_WU-MyOkVMMAGOJs8g-1; Wed, 23 Mar 2022 12:00:00 -0400
X-MC-Unique: 2ehL_WU-MyOkVMMAGOJs8g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B6213C01B97
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 16:00:00 +0000 (UTC)
Received: from localhost (unknown [10.39.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9103E400F737;
 Wed, 23 Mar 2022 15:59:59 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 16/32] include: move TFR to osdep.h
Date: Wed, 23 Mar 2022 19:57:27 +0400
Message-Id: <20220323155743.1585078-17-marcandre.lureau@redhat.com>
In-Reply-To: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The macro requires EINTR, which has its header included in osdep.h.

(Not sure what TFR stands for, perhaps "Test For Retry". Rename it ?)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qemu-common.h | 2 --
 include/qemu/osdep.h  | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/qemu-common.h b/include/qemu-common.h
index f9b3f85b8124..db8b03be51f3 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -10,8 +10,6 @@
 #ifndef QEMU_COMMON_H
 #define QEMU_COMMON_H
 
-#define TFR(expr) do { if ((expr) != -1) break; } while (errno == EINTR)
-
 /* Copyright string for -version arguments, About dialogs, etc */
 #define QEMU_COPYRIGHT "Copyright (c) 2003-2022 " \
     "Fabrice Bellard and the QEMU Project developers"
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 240b48707ecc..489a5d1aad5f 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -226,6 +226,8 @@ extern "C" {
 #define ESHUTDOWN 4099
 #endif
 
+#define TFR(expr) do { if ((expr) != -1) break; } while (errno == EINTR)
+
 /* time_t may be either 32 or 64 bits depending on the host OS, and
  * can be either signed or unsigned, so we can't just hardcode a
  * specific maximum value. This is not a C preprocessor constant,
-- 
2.35.1.273.ge6ebfd0e8cbb


