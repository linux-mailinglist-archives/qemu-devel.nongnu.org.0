Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 197D858A9D8
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 13:01:27 +0200 (CEST)
Received: from localhost ([::1]:60478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJv53-0007Qn-Ct
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 07:01:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oJuzh-0001Td-VK
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 06:55:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oJuzg-0005cs-Ih
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 06:55:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659696951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fyjZlEVn1uU/HoHTUv/Uog7X2RmbV8dfGE2TGozYOmQ=;
 b=ELLqcwMkBhVqGQokw8mZtRsW5iZW6CrfZC+IjXzUkS7YYEB1Pj4a+CFQei3+2OngD5dITH
 qKv/dldhA55pYgaZmAdY/g5qMooGZgFC87GXiMaww74qdSJPHYoiCErg4loA0ATP3RVx5u
 FhlCOIsghHH4sxFxoo9Y2Kzx1NNffAI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-8-VzY7l1L4P1yz_484T01lrQ-1; Fri, 05 Aug 2022 06:55:49 -0400
X-MC-Unique: VzY7l1L4P1yz_484T01lrQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6075C101A54E
 for <qemu-devel@nongnu.org>; Fri,  5 Aug 2022 10:55:49 +0000 (UTC)
Received: from localhost (unknown [10.39.208.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8DB04492CA2;
 Fri,  5 Aug 2022 10:55:48 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 2/2] char: open unidirectional in/out pipes with one-way mode
Date: Fri,  5 Aug 2022 14:55:40 +0400
Message-Id: <20220805105540.143985-2-marcandre.lureau@redhat.com>
In-Reply-To: <20220805105540.143985-1-marcandre.lureau@redhat.com>
References: <20220805105540.143985-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This is how those paths are meant to be used.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 chardev/char-pipe.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/chardev/char-pipe.c b/chardev/char-pipe.c
index f9897a3786..3759558d81 100644
--- a/chardev/char-pipe.c
+++ b/chardev/char-pipe.c
@@ -131,8 +131,8 @@ static void qemu_chr_open_pipe(Chardev *chr,
 
     filename_in = g_strdup_printf("%s.in", filename);
     filename_out = g_strdup_printf("%s.out", filename);
-    TFR(fd_in = qemu_open_old(filename_in, O_RDWR | O_BINARY));
-    TFR(fd_out = qemu_open_old(filename_out, O_RDWR | O_BINARY));
+    TFR(fd_in = qemu_open_old(filename_in, O_RDONLY | O_BINARY));
+    TFR(fd_out = qemu_open_old(filename_out, O_WRONLY | O_BINARY));
     g_free(filename_in);
     g_free(filename_out);
     if (fd_in < 0 || fd_out < 0) {
-- 
2.37.1


