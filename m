Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3C44E5690
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 17:34:35 +0100 (CET)
Received: from localhost ([::1]:37344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX3wQ-00036M-Hx
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 12:34:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3QI-00061O-2F
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:01:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3QF-0005Zv-SP
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:01:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648051279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dWwR08z67iXiVGPK7Mz+Bv+ZrOQOGn3PYka71HHp7JA=;
 b=LCFSq0o0d9xoNB+mQtMA6aS9VDnkfftv2H8EJy1jh0+j9K+w01JO4mK7XLp+qSOGB6GFpT
 h6pp7IUhWYxzlP6kyn//mF+9D8tHuNgbFTATfWPVb/6QAGd5Mz6ExwJOGyREM5yx3SW6Hh
 GuneNzIC/cnU//ri1p9cV/4O4qeGesk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-q0JIeUndO4mk_2Q6qNiRHA-1; Wed, 23 Mar 2022 12:01:15 -0400
X-MC-Unique: q0JIeUndO4mk_2Q6qNiRHA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0F4C1C09049;
 Wed, 23 Mar 2022 16:01:14 +0000 (UTC)
Received: from localhost (unknown [10.39.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 555D4403D1A3;
 Wed, 23 Mar 2022 16:01:13 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 25/32] include: move qemu_get_vm_name() to sysemu.h
Date: Wed, 23 Mar 2022 19:57:36 +0400
Message-Id: <20220323155743.1585078-26-marcandre.lureau@redhat.com>
In-Reply-To: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, "open list:iSCSI" <qemu-block@nongnu.org>,
 Peter Lieven <pl@kamp.de>, Hanna Reitz <hreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qemu-common.h   | 2 --
 include/sysemu/sysemu.h | 2 ++
 audio/audio.c           | 2 +-
 block/iscsi.c           | 2 +-
 stubs/get-vm-name.c     | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/qemu-common.h b/include/qemu-common.h
index fee2181af218..1fbc20e4bcf7 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -24,8 +24,6 @@
 int qemu_main(int argc, char **argv, char **envp);
 #endif
 
-const char *qemu_get_vm_name(void);
-
 /* OS specific functions */
 void os_setup_early_signal_handling(void);
 int os_parse_cmd_args(int index, const char *optarg);
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index b9421e03ffdd..10e283c17064 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -13,6 +13,8 @@ extern const char *qemu_name;
 extern QemuUUID qemu_uuid;
 extern bool qemu_uuid_set;
 
+const char *qemu_get_vm_name(void);
+
 void qemu_add_exit_notifier(Notifier *notify);
 void qemu_remove_exit_notifier(Notifier *notify);
 
diff --git a/audio/audio.c b/audio/audio.c
index 1c98964eb843..9e91a5a4f2b8 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -32,7 +32,7 @@
 #include "qapi/qapi-visit-audio.h"
 #include "qemu/cutils.h"
 #include "qemu/module.h"
-#include "qemu-common.h"
+#include "sysemu/sysemu.h"
 #include "sysemu/replay.h"
 #include "sysemu/runstate.h"
 #include "ui/qemu-spice.h"
diff --git a/block/iscsi.c b/block/iscsi.c
index 51f2a5eeaa80..d707d0b35435 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -28,7 +28,7 @@
 #include <poll.h>
 #include <math.h>
 #include <arpa/inet.h>
-#include "qemu-common.h"
+#include "sysemu/sysemu.h"
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
 #include "qemu/bitops.h"
diff --git a/stubs/get-vm-name.c b/stubs/get-vm-name.c
index fa990136b068..0906303f7306 100644
--- a/stubs/get-vm-name.c
+++ b/stubs/get-vm-name.c
@@ -1,5 +1,5 @@
 #include "qemu/osdep.h"
-#include "qemu-common.h"
+#include "sysemu/sysemu.h"
 
 const char *qemu_get_vm_name(void)
 {
-- 
2.35.1.273.ge6ebfd0e8cbb


