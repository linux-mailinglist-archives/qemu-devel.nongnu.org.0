Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D3A3D585A
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 13:12:46 +0200 (CEST)
Received: from localhost ([::1]:53944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7yXN-0005eO-4X
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 07:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m7yR1-0001gx-H3
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 07:06:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m7yQz-0004kQ-7u
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 07:06:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627297568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3fQJ5Fhjfhtv/lHU86aDgiru4R8Wx7Ogn7sW6atW0SA=;
 b=TcW9Jnbk3dJrjS75JEDLjkvQzreOgmYVmA/ynLtkYN79pf5Luokn8bpz7bxfmsLDjXjr4P
 cGksGqlq5pf4KIKHC/asaCJqZHaq6kbWNCH984Aiw2+LgB9D5ZpM3U5TQGF27czX62E6oO
 c6WHHx+qY4AjOeqNpufuaZtaSFrwemw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-598-zs94hTpQP9SSOvTo0sdseA-1; Mon, 26 Jul 2021 07:06:04 -0400
X-MC-Unique: zs94hTpQP9SSOvTo0sdseA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F206E8799EC;
 Mon, 26 Jul 2021 11:06:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B95C360C5F;
 Mon, 26 Jul 2021 11:06:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 656831800909; Mon, 26 Jul 2021 13:05:44 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/6] ui/cocoa: Fix the type of main's argv
Date: Mon, 26 Jul 2021 13:05:42 +0200
Message-Id: <20210726110544.1934386-5-kraxel@redhat.com>
In-Reply-To: <20210726110544.1934386-1-kraxel@redhat.com>
References: <20210726110544.1934386-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210708165619.29299-1-akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/cocoa.m | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 9f72844b0793..68a6302184ab 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1888,12 +1888,12 @@ static void *call_qemu_main(void *opaque)
     exit(status);
 }
 
-int main (int argc, const char * argv[]) {
+int main (int argc, char **argv) {
     QemuThread thread;
 
     COCOA_DEBUG("Entered main()\n");
     gArgc = argc;
-    gArgv = (char **)argv;
+    gArgv = argv;
 
     qemu_sem_init(&display_init_sem, 0);
     qemu_sem_init(&app_started_sem, 0);
-- 
2.31.1


