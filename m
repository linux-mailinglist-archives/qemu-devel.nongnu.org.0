Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB822F94E9
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 20:33:33 +0100 (CET)
Received: from localhost ([::1]:59006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Dno-0005dG-Ng
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 14:33:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1DgP-00080G-L6; Sun, 17 Jan 2021 14:25:53 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:38732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1DgO-0005Iv-5u; Sun, 17 Jan 2021 14:25:53 -0500
Received: by mail-wr1-x435.google.com with SMTP id a9so11001436wrt.5;
 Sun, 17 Jan 2021 11:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z6fdnKTIA2Uc0MDNjyGFMUBSbkvaU7MEUTklOzizagw=;
 b=i831de7ev0B0ka/oKIaU7WcweUF8wA6VKEUx3FYesxBXhAhi8O2BP9AKIfHV6h2Zdb
 /KdQ2Qhs5o3gouffIc31QonCGidlp9UD+KBva0GCd9KslDqfyEwLCfCg6OHWsgCVeaip
 qYZncpxH3yJ3U0zQiedGxfG3Jt6bg4lry0ZcjuRWV1xUydMHr6Nlzh5mx+R4sZX6/Jn0
 1mOgQNwgDuhqBH/shdu1RCmylc4/KJyLr1/uFhom5rx6HzokXlYUnodFYfe2etd6a7V/
 ONu3ivBrmll+MpFjeawgRm4QOAuLvq5Ez8e3vITnBoCI3T4vLZ/BZa8PEz0fYwD/AW/c
 pHZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Z6fdnKTIA2Uc0MDNjyGFMUBSbkvaU7MEUTklOzizagw=;
 b=TUR/82hrUKAX9jP+BDoLLh6yI3wtJgZDRkR7b7RKPoPXAC2IGt3r8sqDWF9BSEdPMz
 +yr3UUuSx68qNsF4jDlVB34T2E4/y/dYGI6fVD3GSvVYauBlTJZJHna6bCyBINY9Sqcf
 xRn6isqDI/tWVbtIijnURyMMkKhJrHytMN8AKZimgaA7M62RydGYGLWWyVS/QzOmYfcX
 N5Drs9jVb2WRW8bG31xa5GX/2rtaOmMNtq5iQeIlLi1ypp3G5mh54WYNbe0HfpyVnnCL
 7hTKAAML9rL7x/pWFF7ZrNMb6alMz9qEo7qAtNt+Ut7pQMIhHbXM5zNcsYxzd9mc20Ij
 ng0A==
X-Gm-Message-State: AOAM531LutsHxrxHhJsxHU1g9mAk1wfNyUOfg9KpKiaUbTgJtXpzuAJ4
 yMujdEYX2dqtwRcGb9X1fnc=
X-Google-Smtp-Source: ABdhPJxWmbI7JojtrE4OgQhnrClZGqIaWR+FS2o3uA3TmpANaN2WRmhoOGuP+gy12dgSvAnRLi6ROQ==
X-Received: by 2002:adf:cc81:: with SMTP id p1mr22516009wrj.339.1610911550627; 
 Sun, 17 Jan 2021 11:25:50 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id p17sm1553314wmg.46.2021.01.17.11.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 11:25:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH v2 11/20] hw/intc/arm_gicv2m: Mark the device with no
 migratable fields
Date: Sun, 17 Jan 2021 20:24:37 +0100
Message-Id: <20210117192446.23753-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117192446.23753-1-f4bug@amsat.org>
References: <20210117192446.23753-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
 hw/intc/arm_gicv2m.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/intc/arm_gicv2m.c b/hw/intc/arm_gicv2m.c
index d564b857eba..664cc9fb032 100644
--- a/hw/intc/arm_gicv2m.c
+++ b/hw/intc/arm_gicv2m.c
@@ -55,6 +55,7 @@ struct ARMGICv2mState {
     MemoryRegion iomem;
     qemu_irq spi[GICV2M_NUM_SPI_MAX];
 
+    /* Properties */
     uint32_t base_spi;
     uint32_t num_spi;
 };
@@ -182,6 +183,7 @@ static void gicv2m_class_init(ObjectClass *klass, void *data)
 
     device_class_set_props(dc, gicv2m_properties);
     dc->realize = gicv2m_realize;
+    dc->vmsd = vmstate_qdev_no_state_to_migrate;
 }
 
 static const TypeInfo gicv2m_info = {
-- 
2.26.2


