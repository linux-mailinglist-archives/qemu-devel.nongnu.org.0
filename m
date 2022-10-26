Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 667F560E6EE
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 20:03:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onkcv-0008Vc-6t; Wed, 26 Oct 2022 13:55:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1onkcs-0008Ii-A7
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 13:55:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1onkcq-0005ee-OZ
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 13:55:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666806935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uzJAzjMNjcDM7GPHxFlvvDuJ8dRcnmI+OdDNr+sXSbA=;
 b=CXZrgwl0OyBCA4LYKUVPP9CAlWoy8eih/hVmVfEmq2fCR8QRHEoiKqxb+lnCQJb0ICzcfw
 w+7UZ9BP2XybTPVo9FPZEjd7jmrrjbugFmXdPrQaxHHT6nlrqpYWvbwXtUYSYn5ud5b6Z/
 ojEvtly6M1btWF5l2J3HxRrOTS1FUGQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-22-prtJywTSM7WFFbmZZwW98g-1; Wed, 26 Oct 2022 13:55:34 -0400
X-MC-Unique: prtJywTSM7WFFbmZZwW98g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B8BC1C08993;
 Wed, 26 Oct 2022 17:55:33 +0000 (UTC)
Received: from kostyanf14nb.redhat.com (ovpn-192-17.brq.redhat.com
 [10.40.192.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B8BA2166B2B;
 Wed, 26 Oct 2022 17:55:31 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 4/8] qga: Add shutdown/halt/reboot support for FreeBSD
Date: Wed, 26 Oct 2022 20:55:14 +0300
Message-Id: <20221026175518.2636846-5-kkostiuk@redhat.com>
In-Reply-To: <20221026175518.2636846-1-kkostiuk@redhat.com>
References: <20221026175518.2636846-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>

Add appropriate shutdown command arguments to qmp_guest_shutdown()
for FreeBSD.

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
---
 qga/commands-posix.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 6875ea8888..b0b467ebdb 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -90,6 +90,10 @@ void qmp_guest_shutdown(bool has_mode, const char *mode, Error **errp)
     const char *powerdown_flag = "-i5";
     const char *halt_flag = "-i0";
     const char *reboot_flag = "-i6";
+#elif defined(CONFIG_BSD)
+    const char *powerdown_flag = "-p";
+    const char *halt_flag = "-h";
+    const char *reboot_flag = "-r";
 #else
     const char *powerdown_flag = "-P";
     const char *halt_flag = "-H";
@@ -120,6 +124,9 @@ void qmp_guest_shutdown(bool has_mode, const char *mode, Error **errp)
 #ifdef CONFIG_SOLARIS
         execl("/sbin/shutdown", "shutdown", shutdown_flag, "-g0", "-y",
               "hypervisor initiated shutdown", (char *)NULL);
+#elif defined(CONFIG_BSD)
+        execl("/sbin/shutdown", "shutdown", shutdown_flag, "+0",
+               "hypervisor initiated shutdown", (char *)NULL);
 #else
         execl("/sbin/shutdown", "shutdown", "-h", shutdown_flag, "+0",
                "hypervisor initiated shutdown", (char *)NULL);
-- 
2.25.1


