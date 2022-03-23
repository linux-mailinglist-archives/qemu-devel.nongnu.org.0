Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 421494E5624
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 17:16:25 +0100 (CET)
Received: from localhost ([::1]:50348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX3eq-00075Q-Ar
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 12:16:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3P1-0004sV-Be
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:00:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3Ow-000562-5m
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:00:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648051197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yyI9SfewY6WIzZXt86EzMxc5Y3s+H8W05dmiQig6CQM=;
 b=hPR0uJL86RSjPtUoIS5SGG7lqfLyaXjyUiKDN11+jCK62jXmdK5PC+p2G+H9GdwleXmS7R
 qa+tWbeFgmXGxrf1fxUTaVlMaj9yEOHvEgQDGxVZC+1jlFBMDKkjZW3+3dUdrR9rk44rkj
 aAVIXgsBQa5buE4WciyuNwIUe2E+AlY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-527-iPeEKIyBPj-SNRbumSp5lA-1; Wed, 23 Mar 2022 11:59:56 -0400
X-MC-Unique: iPeEKIyBPj-SNRbumSp5lA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3DF461044561
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 15:59:56 +0000 (UTC)
Received: from localhost (unknown [10.39.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C45B58059A;
 Wed, 23 Mar 2022 15:59:54 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 15/32] error-report: use error_printf() for program prefix
Date: Wed, 23 Mar 2022 19:57:26 +0400
Message-Id: <20220323155743.1585078-16-marcandre.lureau@redhat.com>
In-Reply-To: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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

For consistency with other calls in the function, let's use
error_printf(). (it will use stderr since !monitor_cur())

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 util/error-report.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/error-report.c b/util/error-report.c
index 4ea380dd4169..3a1d4923d620 100644
--- a/util/error-report.c
+++ b/util/error-report.c
@@ -156,7 +156,7 @@ static void print_loc(void)
     const char *const *argp;
 
     if (!monitor_cur() && g_get_prgname()) {
-        fprintf(stderr, "%s:", g_get_prgname());
+        error_printf("%s:", g_get_prgname());
         sep = " ";
     }
     switch (cur_loc->kind) {
-- 
2.35.1.273.ge6ebfd0e8cbb


