Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B0850A13E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 15:53:16 +0200 (CEST)
Received: from localhost ([::1]:56586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhXFC-0006OU-8A
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 09:53:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhXCi-00032D-8s
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:50:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhXCf-00066V-PQ
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:50:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650549037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VW2WuG4lnR4Kxa/wGkb3wXczkUMY9GdPr7caoZt/VsY=;
 b=cbrvKaVHYXqJZlma3xcYTLKn+E+bq20d5R6bQNMMGxMzyhzgWnJ57dUlyDukVwNy2hziA4
 /f0Dn4awgYf5SyANkO68GJDK8APKKAL5bFF/zBmked4CIfwxrUKsmx2E9fXw4YRdXb8CLE
 O2qwUkLmbF9lYdLlLkuo/mcwBv1eJ18=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-245-y7SOFaFjM2CuDBBgo4ikDQ-1; Thu, 21 Apr 2022 09:50:33 -0400
X-MC-Unique: y7SOFaFjM2CuDBBgo4ikDQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 711613C37F24;
 Thu, 21 Apr 2022 13:50:33 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F28F09D46;
 Thu, 21 Apr 2022 13:50:22 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 09/30] arm/allwinner-a10: replace snprintf() with
 g_strdup_printf()
Date: Thu, 21 Apr 2022 17:49:19 +0400
Message-Id: <20220421134940.2887768-10-marcandre.lureau@redhat.com>
In-Reply-To: <20220421134940.2887768-1-marcandre.lureau@redhat.com>
References: <20220421134940.2887768-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "open list:Allwinner-a10" <qemu-arm@nongnu.org>, richard.henderson@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Also fixes a GCC 12.0.1 false-positive:
../hw/arm/allwinner-a10.c: In function ‘aw_a10_realize’:
../hw/arm/allwinner-a10.c:135:35: error: ‘%d’ directive writing between 1 and 11 bytes into a region of size 8 [-Werror=format-overflow=]
  135 |             sprintf(bus, "usb-bus.%d", i);
      |                                   ^~

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220420132624.2439741-15-marcandre.lureau@redhat.com>
---
 hw/arm/allwinner-a10.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index 05e84728cb34..79082289ea5b 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -130,9 +130,7 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
         int i;
 
         for (i = 0; i < AW_A10_NUM_USB; i++) {
-            char bus[16];
-
-            sprintf(bus, "usb-bus.%d", i);
+            g_autofree char *bus = g_strdup_printf("usb-bus.%d", i);
 
             object_property_set_bool(OBJECT(&s->ehci[i]), "companion-enable",
                                      true, &error_fatal);
-- 
2.36.0


