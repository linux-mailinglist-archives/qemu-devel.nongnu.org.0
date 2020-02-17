Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 002E3161C72
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 21:50:36 +0100 (CET)
Received: from localhost ([::1]:52746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3nLg-0008Kn-2p
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 15:50:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38228)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1j3nJV-0005Zt-Gv
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 15:48:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1j3nJU-0007Rg-HQ
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 15:48:21 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:43827)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1j3nJS-0007QG-Iz; Mon, 17 Feb 2020 15:48:18 -0500
Received: by mail-pg1-x544.google.com with SMTP id u12so9468965pgb.10;
 Mon, 17 Feb 2020 12:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=hdyy5mzVQwTZ4ysWQDKS3IsSlEm90LXUWXOGjwvknKU=;
 b=W41gQYMP8CCoDZzt0wEPFrUIZf0A9EEcS/ZLfEmAmAilOMFypwhhwzGb8PXJVBuUFz
 ZWP67I6EBb10VR+SkYJpH7oYbrkupGeXRP1OE9sA3GsA7zgvP3Bqa0sVa/gRnjEHEAmd
 foDdK+sstX+rARtHAnU/xcbnRy529JhSMf+WafNuHQNQVTw07ERH/bSf7fbYZOJ5c6Ny
 Y2UKkdLQxxltqyLIXzc/a4Vm/do5tcgnjgzpK59UDYcKWYi+SBe/0D5zWDg0s52nj1f5
 UhXt9R3TTdKUR0jnEQpK+gaD61djgqddeZasRIuX14fCVT/FV1+7AqrgY9R8kZLMgMYc
 AW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=hdyy5mzVQwTZ4ysWQDKS3IsSlEm90LXUWXOGjwvknKU=;
 b=ZXUOIu6vDgf2Lakn2CqIbIBrt8qYfpVocP5Gp9J7gVxOEovwLIJCUAILaC/jBlbct5
 rfdtKrsV6ntWuzQpwbn3cQXsaghZt1m5Dvk3017yiyRJYrU2Ob4UvIPPM98oer54NX3s
 qZvSS2oNlKU4kaEENr5FMx9JkWz5GV4Ts7RvCejz8MVdvzR6C1uKpdbkKwXPMOrwaUgy
 QjaajW3wBZ2KgA5sbY7oudMC4rZdJoGJ0cwmZ6s4etRJP3WcMykDsC9yu6lgCOGrMQRY
 CG2A65MCuto+u3FBU60CBvcLAvDVSsv/CGDJHcRARm09E7jBZkrVxJass5aS/SP+XlAL
 Vhtg==
X-Gm-Message-State: APjAAAWcm9hLwJ6xxl29AL2Y54vpwAJ1B2IrAIWHW+XGA+Hvvs2q4ECu
 kcy96VmREKn5HTg7Aho9RD1hEXJy
X-Google-Smtp-Source: APXvYqwkFbRMkqJu8fWWWzCi7GL4oQq2HAek/5vBz49+HIedXjqlxRH3w570d1YOo6nSUPO8btFwUQ==
X-Received: by 2002:a62:7b54:: with SMTP id w81mr18183240pfc.127.1581972497734; 
 Mon, 17 Feb 2020 12:48:17 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id 144sm1409481pfc.45.2020.02.17.12.48.17
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 17 Feb 2020 12:48:17 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 2/3] hcd-ehci: Introduce "companion-enable" sysbus property
Date: Mon, 17 Feb 2020 12:48:11 -0800
Message-Id: <20200217204812.9857-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200217204812.9857-1-linux@roeck-us.net>
References: <20200217204812.9857-1-linux@roeck-us.net>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We'll use this property in a follow-up patch to insantiate an EHCI
bus with companion support.

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v3: Rebased to master
    Added Gerd's Reviewed-by: tag
v2: Added patch

 hw/usb/hcd-ehci-sysbus.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/usb/hcd-ehci-sysbus.c b/hw/usb/hcd-ehci-sysbus.c
index 8d4738565e..b22fb258be 100644
--- a/hw/usb/hcd-ehci-sysbus.c
+++ b/hw/usb/hcd-ehci-sysbus.c
@@ -33,6 +33,8 @@ static const VMStateDescription vmstate_ehci_sysbus = {
 
 static Property ehci_sysbus_properties[] = {
     DEFINE_PROP_UINT32("maxframes", EHCISysBusState, ehci.maxframes, 128),
+    DEFINE_PROP_BOOL("companion-enable", EHCISysBusState, ehci.companion_enable,
+                     false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.17.1


