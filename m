Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 032AD320B3D
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 16:04:41 +0100 (CET)
Received: from localhost ([::1]:51316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDqHl-0000DB-Ie
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 10:04:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDpri-0000by-2U
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:37:42 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:39583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDprg-0003WI-DU
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:37:41 -0500
Received: by mail-wm1-x333.google.com with SMTP id v62so12044189wmg.4
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 06:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8x/mEIPP6SN5UeYnGwuR8cfhi2QpcZNzmhDjPXqrXro=;
 b=bZkAYYt4xqcWLIIuVW+YsHWKj2hfdYxNLXsk+r81R0E6i1hXpnicbKcU0sXfZG0vX1
 7YKheWgosr4fS/BsacsGHhDTXrYcNWZ74XDmV3uwUjnjBu1wzibjdhMguOCiwJSBrFHw
 goW5Si6pRH3zC6LS7on/ZcpegeFamrGemIv4liMpdIlSsdbVzrJbX/d3yuwMKSoVZe91
 ID0L9W3swP4H8fa/tiEIP4rxVQ/v0CYtoK7ashf/VBwQc28+fjaHIMMvK3MdSFQ4c8BA
 r97dIWyL8vi/jHy39AyXeApjQM04Ckd0n5pI8QO9srMrkRfqEVOG0z/tiLYlq/JgYwGt
 YMeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8x/mEIPP6SN5UeYnGwuR8cfhi2QpcZNzmhDjPXqrXro=;
 b=ML5QcyVlhTtCoGUZsiEP2mcrPqpNDlNNDLSuPQboM2DpmaH//YnsOgRVVQ8U87L4NB
 Fck/6+rWGEKkRW0y3n4srgAwepFr2Cw8KxWTcABBj6D32a7AtVrOWH/hVi92GDnAG0du
 zCnw9Wi7lVhIfIpW9dd+RM9a9kcmQjOVCnQrnSDopRPREJw4DwW9YT45ajd+LEVCphKF
 A3pxrVMsd9k4umb50S5fjrtBF7X5S7X84bWfYtsam/1Tt2V0cIOWf4EpoWvQMMcVCeVF
 An8aiigdKg6eB/EGFiHJR9xSJC4G1P5vrdo7AFTcTRGSj7MRoYbfdmZnnDuySrt9wUXa
 LeEw==
X-Gm-Message-State: AOAM531WTYhetmK0H7CCTnIufnV0f3UQ9bePqbdVj3UohSGordulI6PR
 2MB192JHh94zwyRUcjH8iXYSG0ClhRM=
X-Google-Smtp-Source: ABdhPJz7r0EjONDtIdNO3SwDc7gDDUKvSpmp5VJqc3SRZvP2vrDB7NyZNgMQfX15UKumEU90unIjvA==
X-Received: by 2002:a1c:4683:: with SMTP id t125mr16240100wma.75.1613918259015; 
 Sun, 21 Feb 2021 06:37:39 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id t16sm6602666wrq.53.2021.02.21.06.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 06:37:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 37/43] vt82c686: Simplify vt82c686b_realize()
Date: Sun, 21 Feb 2021 15:34:26 +0100
Message-Id: <20210221143432.2468220-38-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221143432.2468220-1-f4bug@amsat.org>
References: <20210221143432.2468220-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

Remove unneeded variables and setting value to 0 on zero initialised
data and replace check for error with error_fatal. Rationalise loop
that sets PCI config header fields read only.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <e4caf35ca10a68f5c74ae3f93fa0bcfa9457beea.1610223397.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/vt82c686.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 0e812c49241..7e5fa060f5f 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -363,24 +363,16 @@ static void vt82c686b_isa_reset(DeviceState *dev)
 static void vt82c686b_realize(PCIDevice *d, Error **errp)
 {
     VT82C686BISAState *s = VT82C686B_ISA(d);
-    uint8_t *pci_conf;
+    DeviceState *dev = DEVICE(d);
     ISABus *isa_bus;
-    uint8_t *wmask;
     int i;
 
-    isa_bus = isa_bus_new(DEVICE(d), get_system_memory(),
-                          pci_address_space_io(d), errp);
-    if (!isa_bus) {
-        return;
-    }
+    isa_bus = isa_bus_new(dev, get_system_memory(), pci_address_space_io(d),
+                          &error_fatal);
 
-    pci_conf = d->config;
-    pci_config_set_prog_interface(pci_conf, 0x0);
-
-    wmask = d->wmask;
-    for (i = 0x00; i < 0xff; i++) {
-        if (i <= 0x03 || (i >= 0x08 && i <= 0x3f)) {
-            wmask[i] = 0x00;
+    for (i = 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
+        if (i < PCI_COMMAND || i >= PCI_REVISION_ID) {
+            d->wmask[i] = 0;
         }
     }
 
-- 
2.26.2


