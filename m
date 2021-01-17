Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2A42F94F6
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 20:41:13 +0100 (CET)
Received: from localhost ([::1]:53470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1DvE-0006oL-TN
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 14:41:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Dfy-0007qJ-4G; Sun, 17 Jan 2021 14:25:28 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Dfw-00058Q-Ph; Sun, 17 Jan 2021 14:25:25 -0500
Received: by mail-wr1-x42f.google.com with SMTP id w5so14425576wrm.11;
 Sun, 17 Jan 2021 11:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B4YUxFFcqfLKGc47lrHSN4rEV4rWS7YudCY+3T61Wdo=;
 b=Hw+879i6FA5pURTaL7CQP+GLpMvdsoTGDwnuQ+9kmBYGhIiHk1hqFo/fNuYG49S7Wl
 2VviseMlvQfKy4hIX/zQDtdlIVAsWtfX+WMiImMd5c+/kdHvARiAQxuSb8t+GEJOV7QL
 Y5ZZzst3Q4Y1CXWklRHxqOOlpl3jwMDJ1hqORJP9N1QFTFnFc1Haq4r/FPLUOttFlGO1
 0v0F7W3WXOL5BWGK5dKbCN3NbtqsMULQMiAhSmBAuJ1bA4Dr3UWI4Pdy+4c2o4/MZrhK
 QC5cbq9CHb1EvOgXzYwwizz0TGeOI11Uvv0kfmwo9V9odEnabftjxLlu6nRGtwTlUPVl
 NGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=B4YUxFFcqfLKGc47lrHSN4rEV4rWS7YudCY+3T61Wdo=;
 b=L3NPhxW5pTRqxaudwRgHXW/IpNe1SZkozztDOzrYOME16qlaFB0QWWiYPH+tH8Pedk
 GXDbufQPSAr1K1F1axtFLqPDsmMiq2agNYjpYX1n0a5zRyQ9UdT9bt4yObjh/StWtSHO
 URwB5n0PjiUx3ro6FE+cXqYZan/fgAQEsdqvOft/oeNf84YyxQKyFc7aikOWGagU3P5v
 WiEjcpFTuFAUjotX8qsiH70w18OdsiO6vocd0ixj5zo6tjWbdDiY/sw9ANqSnlYZP053
 S0U8mRSkGVo4mIsVOwRQLNf+eEHfnVdBPRdukDFnvyjh540T/QbupJY9s+SIBHlwDL59
 zf/Q==
X-Gm-Message-State: AOAM530U5doEn7uubbctF9R4ph3HbY7kjCzOBTYvsXJVBCJk3ysv0AQH
 XEHRwxKTxgrrd27p79ze78w=
X-Google-Smtp-Source: ABdhPJzt3Ub4O6C1NHK9bPfWUH2XZrh4/Rf1HIK/DEOyPDqUSdDuIUBDsNoaJDyOIgQVxwVn3BdzXw==
X-Received: by 2002:a5d:47c3:: with SMTP id o3mr17313895wrc.175.1610911523243; 
 Sun, 17 Jan 2021 11:25:23 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id c11sm22974584wmd.36.2021.01.17.11.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 11:25:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH v2 06/20] hw/arm/msf2-soc: Mark the device with no
 migratable fields
Date: Sun, 17 Jan 2021 20:24:32 +0100
Message-Id: <20210117192446.23753-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117192446.23753-1-f4bug@amsat.org>
References: <20210117192446.23753-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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

Add a more descriptive comment to keep a clear separation
between static property vs runtime changeable.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/arm/msf2-soc.h | 11 ++++++-----
 hw/arm/msf2-soc.c         |  1 +
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/include/hw/arm/msf2-soc.h b/include/hw/arm/msf2-soc.h
index d4061846855..41a328c77f9 100644
--- a/include/hw/arm/msf2-soc.h
+++ b/include/hw/arm/msf2-soc.h
@@ -52,6 +52,12 @@ struct MSF2State {
 
     ARMv7MState armv7m;
 
+    MSF2SysregState sysreg;
+    MSSTimerState timer;
+    MSSSpiState spi[MSF2_NUM_SPIS];
+    MSF2EmacState emac;
+
+    /* Properties */
     char *cpu_type;
     char *part_name;
     uint64_t envm_size;
@@ -60,11 +66,6 @@ struct MSF2State {
     uint32_t m3clk;
     uint8_t apb0div;
     uint8_t apb1div;
-
-    MSF2SysregState sysreg;
-    MSSTimerState timer;
-    MSSSpiState spi[MSF2_NUM_SPIS];
-    MSF2EmacState emac;
 };
 
 #endif
diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
index d2c29e82d13..2d163710f54 100644
--- a/hw/arm/msf2-soc.c
+++ b/hw/arm/msf2-soc.c
@@ -224,6 +224,7 @@ static void m2sxxx_soc_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->realize = m2sxxx_soc_realize;
+    dc->vmsd = vmstate_qdev_no_state_to_migrate;
     device_class_set_props(dc, m2sxxx_soc_properties);
 }
 
-- 
2.26.2


