Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C8A2F94EF
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 20:37:09 +0100 (CET)
Received: from localhost ([::1]:39752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1DrI-00019y-JL
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 14:37:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Dfq-0007eZ-2C; Sun, 17 Jan 2021 14:25:18 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Dfo-00052P-NO; Sun, 17 Jan 2021 14:25:17 -0500
Received: by mail-wr1-x430.google.com with SMTP id v15so10793792wrx.4;
 Sun, 17 Jan 2021 11:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AlGU2nsRUdTo0zfYKpVmo6pCOia5Vbf+z0yVnRjS/M8=;
 b=nqSVOhr4bDYAHt6sQopLvtMo2XRxmB7nW0+Z1zomvfYV2slp8usJZmsPVYy7XO/RCj
 n3gczAXJS8UT9Ac7MpiUJV6xB70/EK7cgaVOFSrgeppH/eXe9XFDFZvhUtSW3zY+r4wM
 DdZ0YD3KPsflQeXWaMffKZMYb/4TP8bUiw9sSDgYyqlF0GnTx4rjBhWT8xozR5MzpuCe
 sPOOLYtd//1aP1HFMxGHbHKO3YIVJDf+8skD0DFPAgw7kZNUCuymgrU9oaUo5mQgffo9
 qpVd/5qR4Seyx+OUa/Kdkbfrd9qcgUsWjefN6zYTFz2EY0OxQOlVaCzkz1AwhtadLp53
 wNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AlGU2nsRUdTo0zfYKpVmo6pCOia5Vbf+z0yVnRjS/M8=;
 b=ulNvk3NcaZXRZp7U69y6W7kNs+AyLfvLcxNKKfIPhTX2aw2wiE8Du6L1hFmDuxpYvs
 GBk67c6fif/cgKk8WDy5SmbG93LPqFDkwrhdSAqkoHrgWdZN5LyT7yuTteMIGxYN68pV
 YaZa1RAs9eZm9O84rfySy2BBGQFOOisGfBkH2TDqGYbiQp0zybC+2N9OtfbhzSD+t1Dj
 70ElO49Yaf8N+FaSAmOxrUrORa91vfr8nMzu5ezUnJSgh+OwfY7xcrSfGQc/xhOq5ArT
 ApCo3Ih2c0u9Qogvu9nW0e//KB1uswKHFIhzuyHMrzUiJ3SDxc2ZRU49Ix4joHYbGcIK
 MGlQ==
X-Gm-Message-State: AOAM533/5lKCjP7t/2muNgdqv6QotVqT4d+N4whd2fkHtavCcs+gV4/D
 KpDqIuPJWZ/1vS2DyE8h8Bw=
X-Google-Smtp-Source: ABdhPJxYeHFxMVKx/TiAvFU8LTxUHEZIh5DFiDksj3H0CaaNJpfUMZd4E+qInreiVIbCr9q5WR/nLA==
X-Received: by 2002:a05:6000:185:: with SMTP id
 p5mr22521077wrx.403.1610911512273; 
 Sun, 17 Jan 2021 11:25:12 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id r2sm25630352wrn.83.2021.01.17.11.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 11:25:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH v2 04/20] hw/arm/aspeed_soc: Mark the device with no
 migratable fields
Date: Sun, 17 Jan 2021 20:24:30 +0100
Message-Id: <20210117192446.23753-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117192446.23753-1-f4bug@amsat.org>
References: <20210117192446.23753-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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

This device doesn't have fields to migrate. Be explicit
by using vmstate_qdev_no_state_to_migrate.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/aspeed_soc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 7eefd54ac07..b503d32fef6 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -407,6 +407,7 @@ static void aspeed_soc_class_init(ObjectClass *oc, void *data)
     dc->realize = aspeed_soc_realize;
     /* Reason: Uses serial_hds and nd_table in realize() directly */
     dc->user_creatable = false;
+    dc->vmsd = vmstate_qdev_no_state_to_migrate;
     device_class_set_props(dc, aspeed_soc_properties);
 }
 
-- 
2.26.2


