Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 600B72F94F8
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 20:44:06 +0100 (CET)
Received: from localhost ([::1]:59572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Dy1-00010G-EV
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 14:44:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Dgr-0008PJ-Pn; Sun, 17 Jan 2021 14:26:21 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:33197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Dgo-0005Tv-Vv; Sun, 17 Jan 2021 14:26:20 -0500
Received: by mail-wm1-x32c.google.com with SMTP id s24so3914301wmj.0;
 Sun, 17 Jan 2021 11:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bx350E5m3VyPci30nthMcxfcvDfYIGiblZKZEeXM5tA=;
 b=HDL1cOYRAppqKDmt0+6iCG+tyRa20Vszx0WdmS5WO4jtkTwdghRo7ux+0D8e69Uuiw
 5Q/xpoa4zO6PZxWg34I8XAcOCHbo09E8+8AymMWcJ+19VUo/dFWq072XbTkgYlap/Iv4
 34tjuUMRZkwuhTEq75obgsagYTcucmWPEESKu4unh5QY05yV8W4ImCOJaL2TdlgfmTn7
 Paoui5pA9tXlupK38Io8YVI1ozZL8qLn/V6PAUOonYkcOiE8KWeocwhDD009rHjUedXq
 edFMLdbiI4AM33Wp2tryl8IrOQ8fOhStobBacJ+f63I31IVazo4JE8UW7WPcbt7zFtCZ
 wpxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Bx350E5m3VyPci30nthMcxfcvDfYIGiblZKZEeXM5tA=;
 b=ioFa+DBgLbQPN3klRzQqZlVpaAmyIWkrmSly+cy63Mk9OQYITiZd5Q/H49s91FbkOY
 fzvmoAm5fR5G9r0vrlqTUQZRFySTVWzM0vEhV1ddHb+5QDFh6HZrcgK7TwI496fnf7GX
 XH3LiWyEzoZL7zaaxrNHTaknWqUQsRKUdWlhO1Zr4p7iVSIZomezOLcz12R1rZI4M6VO
 LWGb27D/pWEKPic/miu4vMVW9DKDO6Efp5YC3xCYW7hrJBVtuZYI12w1KMQnucpdB0C6
 U3Z+i9pb1s1jm02DpZwpeSOswhhhOI6BNSj3gLIq2jJp1AI93mUkdgvuvUVthXvxc+lr
 9odA==
X-Gm-Message-State: AOAM533q66OjPd9Zvpiknj9JPX2wgnbYETKT5Dcb7RDKXXtJO7kA3dVi
 N7wcT3a3x8gTf9/mZRnee9I=
X-Google-Smtp-Source: ABdhPJwOdTStGNdd9lQ6Q15iSvEbhn8d+kx24B0aMkfbK/kzK64HdGME4mUFDC/bS4yOg2dAnQX5dA==
X-Received: by 2002:a1c:984a:: with SMTP id a71mr11036888wme.175.1610911577485; 
 Sun, 17 Jan 2021 11:26:17 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id a24sm15013983wmj.17.2021.01.17.11.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 11:26:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH v2 16/20] hw/sparc64/sun4u: Mark devices with no
 migratable fields
Date: Sun, 17 Jan 2021 20:24:42 +0100
Message-Id: <20210117192446.23753-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117192446.23753-1-f4bug@amsat.org>
References: <20210117192446.23753-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Joel Stanley <joel@jms.id.au>, Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These devices don't have fields to migrate. Be explicit
by using vmstate_qdev_no_state_to_migrate.

Add a more descriptive comment to keep a clear separation
between static property vs runtime changeable.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sparc64/sun4u.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index 0fa13a73302..fdf0aa875be 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -84,12 +84,15 @@ struct hwdef {
 struct EbusState {
     /*< private >*/
     PCIDevice parent_obj;
+    /*< public >*/
 
     ISABus *isa_bus;
     qemu_irq isa_bus_irqs[ISA_NUM_IRQS];
-    uint64_t console_serial_base;
     MemoryRegion bar0;
     MemoryRegion bar1;
+
+    /* Properties */
+    uint64_t console_serial_base;
 };
 
 #define TYPE_EBUS "ebus"
@@ -386,6 +389,7 @@ static void ebus_class_init(ObjectClass *klass, void *data)
     k->device_id = PCI_DEVICE_ID_SUN_EBUS;
     k->revision = 0x01;
     k->class_id = PCI_CLASS_BRIDGE_OTHER;
+    dc->vmsd = vmstate_qdev_no_state_to_migrate;
     device_class_set_props(dc, ebus_properties);
 }
 
-- 
2.26.2


