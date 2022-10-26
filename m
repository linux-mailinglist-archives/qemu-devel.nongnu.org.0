Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6677660E6E4
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 19:59:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onkcz-000060-VP; Wed, 26 Oct 2022 13:55:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1onkcy-00005K-2P
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 13:55:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1onkcv-0005fj-Op
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 13:55:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666806941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ZAqmK1x4NQ3GxoKv0wHJKJGpehWaLuPjvqzLYjvfok=;
 b=DCQrVFWRjPcDTYVyyZwlVWxMtwF3yu4x+AiPMVPFEmSA8mQbG6UUjwUq9EWZBamfdceozg
 sksNNz63ydkhFxXWEO/0ne3LFoEzomKp5xua1e+gxu7750bMtDfAPxY4JOw1LEL2dcirgz
 EFP4c2OxmLsrONAu+Ki2G1T1ghvG5ZA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-vR7s5jrTNbqZ_yd2qx0KJg-1; Wed, 26 Oct 2022 13:55:37 -0400
X-MC-Unique: vR7s5jrTNbqZ_yd2qx0KJg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 87621101CC6B;
 Wed, 26 Oct 2022 17:55:37 +0000 (UTC)
Received: from kostyanf14nb.redhat.com (ovpn-192-17.brq.redhat.com
 [10.40.192.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D5C12166B2B;
 Wed, 26 Oct 2022 17:55:36 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 7/8] qga: Add HW address getting for FreeBSD
Date: Wed, 26 Oct 2022 20:55:17 +0300
Message-Id: <20221026175518.2636846-8-kkostiuk@redhat.com>
In-Reply-To: <20221026175518.2636846-1-kkostiuk@redhat.com>
References: <20221026175518.2636846-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
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

Replace a dumb function in commands-bsd.c by the code of HW address
getting.

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
---
 qga/commands-bsd.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/qga/commands-bsd.c b/qga/commands-bsd.c
index ebf0fb8b0f..15cade2d4c 100644
--- a/qga/commands-bsd.c
+++ b/qga/commands-bsd.c
@@ -20,6 +20,8 @@
 #include <sys/param.h>
 #include <sys/ucred.h>
 #include <sys/mount.h>
+#include <net/if_dl.h>
+#include <net/ethernet.h>
 #include <paths.h>
 
 #if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
@@ -179,7 +181,20 @@ GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp)
 bool guest_get_hw_addr(struct ifaddrs *ifa, unsigned char *buf,
                        bool *obtained, Error **errp)
 {
+    struct sockaddr_dl *sdp;
+
     *obtained = false;
+
+    if (ifa->ifa_addr->sa_family != AF_LINK) {
+        /* We can get HW address only for AF_LINK family. */
+        g_debug("failed to get MAC address of %s", ifa->ifa_name);
+        return true;
+    }
+
+    sdp = (struct sockaddr_dl *)ifa->ifa_addr;
+    memcpy(buf, sdp->sdl_data + sdp->sdl_nlen, ETHER_ADDR_LEN);
+    *obtained = true;
+
     return true;
 }
 #endif /* HAVE_GETIFADDRS */
-- 
2.25.1


