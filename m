Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFD8663E26
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 11:26:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFBKi-0002WV-DN; Tue, 10 Jan 2023 04:54:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFBKg-0002W6-Ii
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 04:54:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFBKe-0002uA-7L
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 04:54:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673344451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6khDx3+Gg/u48mmRar+fWB8u8XuRD+Ysu7YmiRet0vU=;
 b=c6C9hT94KDbeHhkFcNlsoN4pLEs++wLYURRQM30JQwuX9M/7PUsWKjQ/eX2cFA+AUJ1Xwa
 zTZMNY4ibUZpkq2dzP2NNmJHvGJruG61eLV3eem+o5GsnlKFDRx6FxxFVGuo9GDx6kAUvS
 Rv8tN5RP/YuaJVw3xj11/7cctejUZ00=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-5K0qhv0WPF6c70XxclWjLQ-1; Tue, 10 Jan 2023 04:54:06 -0500
X-MC-Unique: 5K0qhv0WPF6c70XxclWjLQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93FDA3C38FFC;
 Tue, 10 Jan 2023 09:54:05 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 620C24085720;
 Tue, 10 Jan 2023 09:54:03 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Michael S Tsirkin <mst@redhat.com>,
 qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v6 4/4] softmmu/rtc: Emit warning when using driftfix=slew on
 systems without mc146818
Date: Tue, 10 Jan 2023 10:53:51 +0100
Message-Id: <20230110095351.611724-5-thuth@redhat.com>
In-Reply-To: <20230110095351.611724-1-thuth@redhat.com>
References: <20230110095351.611724-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


