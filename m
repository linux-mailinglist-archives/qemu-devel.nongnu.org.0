Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B2E6892A6
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 09:49:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNri8-0008T4-Dk; Fri, 03 Feb 2023 03:46:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNrhq-0008Ke-Ee
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:46:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNrhl-0007VA-Sn
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:46:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675413957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6943nLlRjZzRD3ILoczYJS2u4IPftlOx77tLI0cJ8Qg=;
 b=CSONGTpr3+F6uaJV6mMwIPCdSyb4KpQk/Y/2/xWUWho69yl92sJZK74Jd+nsey04wun1FP
 csu9OCWAv7hZAeWIo76jD39LEPKvSFTZXntnHMC+n0dmpsIL+64ti2/w8ZpesY37eI6XUO
 9woyh4If48vpExR2INjoJ5psA+OKkI4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-lBXynaH2OnijQaS1i8lXsQ-1; Fri, 03 Feb 2023 03:45:55 -0500
X-MC-Unique: lBXynaH2OnijQaS1i8lXsQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 45CF8196EF8D;
 Fri,  3 Feb 2023 08:45:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 025C5408573E;
 Fri,  3 Feb 2023 08:45:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0D7C921E6888; Fri,  3 Feb 2023 09:45:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 35/35] monitor: Rename misc.c to hmp-target.c
Date: Fri,  3 Feb 2023 09:45:49 +0100
Message-Id: <20230203084549.2622302-36-armbru@redhat.com>
In-Reply-To: <20230203084549.2622302-1-armbru@redhat.com>
References: <20230203084549.2622302-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

What's left in misc.c is exactly the target-dependent part of the HMP
core.  Rename accordingly.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230124121946.1139465-33-armbru@redhat.com>
---
 monitor/{misc.c => hmp-target.c} | 2 +-
 monitor/meson.build              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename monitor/{misc.c => hmp-target.c} (99%)

diff --git a/monitor/misc.c b/monitor/hmp-target.c
similarity index 99%
rename from monitor/misc.c
rename to monitor/hmp-target.c
index 99317a8ff4..1eb72ac1bf 100644
--- a/monitor/misc.c
+++ b/monitor/hmp-target.c
@@ -1,5 +1,5 @@
 /*
- * QEMU monitor
+ * QEMU monitor, target-dependent part
  *
  * Copyright (c) 2003-2004 Fabrice Bellard
  *
diff --git a/monitor/meson.build b/monitor/meson.build
index 795a271545..ccb4d1a8e6 100644
--- a/monitor/meson.build
+++ b/monitor/meson.build
@@ -8,4 +8,4 @@ softmmu_ss.add(files(
 softmmu_ss.add([spice_headers, files('qmp-cmds.c')])
 
 specific_ss.add(when: 'CONFIG_SOFTMMU',
-		if_true: [files( 'hmp-cmds-target.c', 'misc.c'), spice])
+		if_true: [files( 'hmp-cmds-target.c', 'hmp-target.c'), spice])
-- 
2.39.0


