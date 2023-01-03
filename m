Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2A265BC7C
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 09:51:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCcyd-0001dz-7S; Tue, 03 Jan 2023 03:48:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pCcyH-0001bY-Bk
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 03:48:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pCcyF-0007XP-4F
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 03:48:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672735710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JP8yvFnO+sMzdcLZ770nqwSJNaTq4oXE344WoEOJ8oM=;
 b=KXHC+I7q2s0UNe1S0+ACviBH9sdTqPmEPfid9tyJ9hkcW4FiwYtgacffM43U6W+6euzBPx
 VKdx8eqnW/CFBfAiU0vVatcRdkNma4/+aPIn3/4sLssNXBShFZJJCm8ngymSNHTJRj+CGR
 IY2Xra+XVYp485/Jb74TbjRjpcs9C0s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-luR7oqgnPb2m6Q4vk_UfGA-1; Tue, 03 Jan 2023 03:48:27 -0500
X-MC-Unique: luR7oqgnPb2m6Q4vk_UfGA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F2F185A588;
 Tue,  3 Jan 2023 08:48:26 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C8EA400D752;
 Tue,  3 Jan 2023 08:48:23 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Michael S Tsirkin <mst@redhat.com>,
 qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH 6/6] softmmu/rtc: Emit warning when using driftfix=slew on
 systems without mc146818
Date: Tue,  3 Jan 2023 09:48:01 +0100
Message-Id: <20230103084801.20437-7-thuth@redhat.com>
In-Reply-To: <20230103084801.20437-1-thuth@redhat.com>
References: <20230103084801.20437-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

The 'slew' lost tick policy is only available on systems with a mc146818
RTC. On other systems, "-rtc driftfix=slew" is currently silently ignored.
Let's emit at least a warning in this case to make the users aware that
there is something wrong in their command line settings.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 softmmu/rtc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/softmmu/rtc.c b/softmmu/rtc.c
index 7e2956f81e..f7114bed7d 100644
--- a/softmmu/rtc.c
+++ b/softmmu/rtc.c
@@ -33,6 +33,7 @@
 #include "sysemu/replay.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/rtc.h"
+#include "hw/rtc/mc146818rtc.h"
 
 static enum {
     RTC_BASE_UTC,
@@ -177,10 +178,13 @@ void configure_rtc(QemuOpts *opts)
     value = qemu_opt_get(opts, "driftfix");
     if (value) {
         if (!strcmp(value, "slew")) {
-            object_register_sugar_prop("mc146818rtc",
+            object_register_sugar_prop(TYPE_MC146818_RTC,
                                        "lost_tick_policy",
                                        "slew",
                                        false);
+            if (!object_class_by_name(TYPE_MC146818_RTC)) {
+                warn_report("driftfix 'slew' is not available with this machine");
+            }
         } else if (!strcmp(value, "none")) {
             /* discard is default */
         } else {
-- 
2.31.1


