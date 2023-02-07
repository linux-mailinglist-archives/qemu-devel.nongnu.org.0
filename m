Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D54A68D104
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 08:53:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPIlG-00039n-NY; Tue, 07 Feb 2023 02:51:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPIlC-00037H-5M
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:51:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPIlA-0000sh-Lr
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:51:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675756284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mQhwRcUcE2+dAJH49ieRGdsbl4FmVRnHGi/U+5WVLss=;
 b=JElONy/Y7K2j0VbxU8CRVYwXbBVWTvGJmCJGCmhesjJy7DnPIv+l9VLyG0Nw7rNdMI4aHM
 KYOJ5irEnt3Q/jX3DW4AjmX7h4/2HaJbs1eHtQPIDH+chq1QeUXJi46cwFSRuu5/K+ck9t
 zyYOeuI+Sda6zR6rwvzvmkI2tbxRPAM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-wLClHU_YOriXh3PoFclhBA-1; Tue, 07 Feb 2023 02:51:20 -0500
X-MC-Unique: wLClHU_YOriXh3PoFclhBA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81E9D299E754;
 Tue,  7 Feb 2023 07:51:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A30D14171B6;
 Tue,  7 Feb 2023 07:51:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CC2B821E6A28; Tue,  7 Feb 2023 08:51:15 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 philmd@linaro.org, wangyanan55@huawei.com, jiri@resnulli.us,
 jasowang@redhat.com, pavel.dovgaluk@ispras.ru, pbonzini@redhat.com,
 zhanghailiang@xfusion.com, quintela@redhat.com, dgilbert@redhat.com,
 michael.roth@amd.com, kkostiuk@redhat.com
Subject: [PATCH 08/12] qga: Drop dangling reference to
 QERR_QGA_LOGGING_DISABLED
Date: Tue,  7 Feb 2023 08:51:11 +0100
Message-Id: <20230207075115.1525-9-armbru@redhat.com>
In-Reply-To: <20230207075115.1525-1-armbru@redhat.com>
References: <20230207075115.1525-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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


