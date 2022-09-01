Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C26AE5A940F
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 12:17:01 +0200 (CEST)
Received: from localhost ([::1]:41366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oThFs-0002Gu-Fq
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 06:17:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oThAY-00054a-IJ
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 06:11:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oThAV-0000SK-Cs
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 06:11:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662027085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Opex+efEbROVkWlKD0oqihv9PpMRJKcC5EK8AFLjLdw=;
 b=aJoK9Z43zfb31wrBmw4Uh57hR/YkPq4bUo0c8RIQoKnJLFP1ACBQtJdILzWtmsgY++vNLg
 Np1T4V3RHV6yT8yIIOMJhhAaDsgCN+l59ttd++Iava4UA2nJRJjv+MrlgBb0rzs0QPc/B5
 cQi0uHmHR9r+YlSKsSGt5PqOHVgDgAc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-e02MoqlHPcW9x8aG-Tg4_A-1; Thu, 01 Sep 2022 06:11:24 -0400
X-MC-Unique: e02MoqlHPcW9x8aG-Tg4_A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8449D85A58B
 for <qemu-devel@nongnu.org>; Thu,  1 Sep 2022 10:11:24 +0000 (UTC)
Received: from localhost (unknown [10.39.208.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 734A6C15BB3;
 Thu,  1 Sep 2022 10:11:22 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH] qio: fix command spawn RDONLY/WRONLY
Date: Thu,  1 Sep 2022 14:11:20 +0400
Message-Id: <20220901101120.2741109-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

The in/out handling is inverted, although nothing seemed to notice that yet.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 io/channel-command.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/io/channel-command.c b/io/channel-command.c
index 9f2f4a1793..ed17b44f74 100644
--- a/io/channel-command.c
+++ b/io/channel-command.c
@@ -79,10 +79,10 @@ qio_channel_command_new_spawn(const char *const argv[],
     flags = flags & O_ACCMODE;
 
     if (flags == O_RDONLY) {
-        stdinnull = true;
+        stdoutnull = true;
     }
     if (flags == O_WRONLY) {
-        stdoutnull = true;
+        stdinnull = true;
     }
 
     if (stdinnull || stdoutnull) {
-- 
2.37.2


