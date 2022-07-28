Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E5E583B71
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 11:41:54 +0200 (CEST)
Received: from localhost ([::1]:48482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH01f-0003Q4-UN
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 05:41:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oGzw8-0006w2-G8
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 05:36:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oGzw4-0000O6-P7
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 05:36:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659000962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2UJGgabuVFGHq5XUuV5VDhxy1w/UlIZ0G13KeLSGwEU=;
 b=U/Z1JN6qGWFti4PDvgoe0LugJsnP58Jb6ybMzUhVyAY8sL6YMP89fccNfNKvljEC0fHR7K
 Xt8IcY/0Jj75LZ5VYqTyDiu1QjpO3S1a84djZDYuNiHda6Xvt/tIao0SnoP7EzKVI2dt7x
 zznqzuQ/wr2ZvB4hq2Djn6sj0Mfj/Xs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-132-IQceuZz2PHyiFCPIzaofQw-1; Thu, 28 Jul 2022 05:36:01 -0400
X-MC-Unique: IQceuZz2PHyiFCPIzaofQw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A93AA811E80;
 Thu, 28 Jul 2022 09:36:00 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 99E001121319;
 Thu, 28 Jul 2022 09:35:59 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, t0rr3sp3dr0@gmail.com, alex.bennee@linaro.org,
 dgilbert@redhat.com, agraf@suse.de, peter.maydell@linaro.org
Subject: [PATCH for-7.1] applesmc: silence invalid key warning in case default
 one is used
Date: Thu, 28 Jul 2022 05:35:58 -0400
Message-Id: <20220728093558.1163751-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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

QEMU probably can't carry OSK key[1] for legal reasons so it
can't supply the valid default key. However when tests are run
applesmc will pollute test log with distracting warning,
silence that warning so it won't distract maintainers/CI.

If user launches MacOS guest without supplying valid or any key
they will get upset MacOS (and legality of specifying valid key
on CLI is also questionable). This patch favors QEMU/tests vs
MacOS guest.

A patch from Apple needed to change default to the valid key,
until then prefer QEMU maintainers sanity/cleaner test logs
vs any inconvenience users running MacOS guest might suffer.

1) After some googling, it seems 'secret' key is the same for
   all Mac hardware and is widely known but whether it's
   permited to use that is up to lawyers/Apple to decide.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/misc/applesmc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
index 5f9c742e50..bce27b0950 100644
--- a/hw/misc/applesmc.c
+++ b/hw/misc/applesmc.c
@@ -84,7 +84,7 @@ enum {
 #define smc_debug(...) do { } while (0)
 #endif
 
-static char default_osk[64] = "This is a dummy key. Enter the real key "
+static char default_osk[65] = "This is a dummy key. Enter the real key "
                               "using the -osk parameter";
 
 struct AppleSMCData {
@@ -335,10 +335,12 @@ static void applesmc_isa_realize(DeviceState *dev, Error **errp)
     isa_register_ioport(&s->parent_obj, &s->io_err,
                         s->iobase + APPLESMC_ERR_PORT);
 
-    if (!s->osk || (strlen(s->osk) != 64)) {
-        warn_report("Using AppleSMC with invalid key");
+    if (!s->osk) {
         s->osk = default_osk;
     }
+    if (strlen(s->osk) != 64) {
+        warn_report("Using AppleSMC with invalid key");
+    }
 
     QLIST_INIT(&s->data_def);
     qdev_applesmc_isa_reset(dev);
-- 
2.31.1


