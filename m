Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E226A0B1C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 14:48:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVBvj-00021s-7C; Thu, 23 Feb 2023 08:46:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVBvf-0001zz-MJ
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 08:46:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVBve-0001N4-73
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 08:46:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677159993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TEL7zz2s6I30r6akxagYQKYrspxUO19/B/4B/vAnqrU=;
 b=bVsKOv2pRoZK4yOnCiHObO0uAeCdsXJTcxShvg3QIV8dNvOAPwyv51idlDsPOQOiqzyzyE
 JnWu55JvNQQznSDvdkh2JfcVwfkN0souMaYWajSpcxoiR6K4dFPXTafaLM5U48zZLQzwTd
 Mo5dFGcHWOocH4et7RQqyw360CjYtGQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-Wml4GfQWPwGVgpcHke5wqQ-1; Thu, 23 Feb 2023 08:46:29 -0500
X-MC-Unique: Wml4GfQWPwGVgpcHke5wqQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5F293810B19;
 Thu, 23 Feb 2023 13:46:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 956F9C15BAD;
 Thu, 23 Feb 2023 13:46:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A37C921E6A28; Thu, 23 Feb 2023 14:46:26 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>
Subject: [PULL 08/12] qga: Drop dangling reference to QERR_QGA_LOGGING_DISABLED
Date: Thu, 23 Feb 2023 14:46:22 +0100
Message-Id: <20230223134626.2107382-9-armbru@redhat.com>
In-Reply-To: <20230223134626.2107382-1-armbru@redhat.com>
References: <20230223134626.2107382-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

slog()'s function comment advises to use QERR_QGA_LOGGING_DISABLED.
This macro never existed.  The reference got added in commit
e3d4d25206a "guest agent: add guest agent RPCs/commands" along with
QERR_QGA_LOGGING_FAILED, so maybe that one was meant.  However,
QERR_QGA_LOGGING_FAILED was never actually used, and was removed in
commit d73f0beadb5 "qerror.h: Remove unused error classes".

Drop the dangling reference.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230207075115.1525-9-armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
---
 qga/commands.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/qga/commands.c b/qga/commands.c
index 360077364e..172826f8f8 100644
--- a/qga/commands.c
+++ b/qga/commands.c
@@ -32,9 +32,8 @@
 #define GUEST_FILE_READ_COUNT_MAX (48 * MiB)
 
 /* Note: in some situations, like with the fsfreeze, logging may be
- * temporarilly disabled. if it is necessary that a command be able
- * to log for accounting purposes, check ga_logging_enabled() beforehand,
- * and use the QERR_QGA_LOGGING_DISABLED to generate an error
+ * temporarily disabled. if it is necessary that a command be able
+ * to log for accounting purposes, check ga_logging_enabled() beforehand.
  */
 void slog(const gchar *fmt, ...)
 {
-- 
2.39.0


