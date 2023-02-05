Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F96268AF3D
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 11:07:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pObuF-0001pt-Oe; Sun, 05 Feb 2023 05:05:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pObtd-00011Z-0d; Sun, 05 Feb 2023 05:05:17 -0500
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pObtZ-0005Jz-K2; Sun, 05 Feb 2023 05:05:14 -0500
Received: by mail-oi1-x229.google.com with SMTP id r9so7588720oig.12;
 Sun, 05 Feb 2023 02:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J/l5LLpkPmSWg3Y06zvVCIhudPj7GpVJB1dY94JYcyA=;
 b=kJqe/dNTDEwpW/riQSoodu+YFkc6Vy8zDbizucv0YXWMCqDRY75tQHPKUHd1mv3Ruw
 kd/UapXFeSTDq7CM40fh7e1GP+CHSYbETFU0o7iLUptFcRCXBK5ja0EtEzV6fB92ChuZ
 yT0rKwRzbkDOiJKGg7dbyd82H/pLBztbRNgKiFx0YMFhvacZQK3spcYEFiVULFOoD3CK
 N4RpHBwtADq2L4yC45sG8d4LpUiyswoWuL0kcFFeoWIDZl13nVMP8tMwfEWxzWsTKx70
 q9FHRYbxqN4rM4RXCAvANp6hgQk81AMEpyiglkOmqHNifanmUOJnK3ZdI+snMnMjht5V
 vwww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J/l5LLpkPmSWg3Y06zvVCIhudPj7GpVJB1dY94JYcyA=;
 b=F8E0I0f3AxYAY7tbq9574jgpgC3rOFic1OuzNxBNJC9QVJAEUn7MnDrxnXMmg+fhq+
 Of70yMUnwa7c71VVR9OAL3nHpcc8o/FG7idnj9/hoY/QQYgzvEq8MEsrk6JM5jj8PzEY
 qSYbreKraQd8J+mK4bbmoSzL9tgy4APSF8DyjdqpuoxgVOoz091cpWFRfpdeAfOmAhnE
 7IUbaQrkXNFPH7uxQ+EtQc4fJEbCzxx7gdQRRdajOt4mhWWniwMXPn6tx2HgRL7xTTkD
 0AXKLVKK0zfi8NT+lbnOWY6DLIBHK+rGnOiFzNL5woCIL0hMMBOEs7doIGxnKC2ifYaG
 UPBQ==
X-Gm-Message-State: AO0yUKUoppAb3Ye1XUumux7OvYU2Alb0qOfW4XZ33RH+Gm873fX6fIno
 KUDVwFtDHqeJedrbYPvGRPJJWL85lIM=
X-Google-Smtp-Source: AK7set/5akKL2SnMQXq4RagWClilvE15Yppfo4LhVZLWsZl9Lyyyj6hwkbTVIwrUEwL03LDGeZMNvg==
X-Received: by 2002:a54:4196:0:b0:37b:1c79:1adc with SMTP id
 22-20020a544196000000b0037b1c791adcmr359349oiy.59.1675591511453; 
 Sun, 05 Feb 2023 02:05:11 -0800 (PST)
Received: from grind.. ([191.19.125.138]) by smtp.gmail.com with ESMTPSA id
 s191-20020acaa9c8000000b003631fe1810dsm2730924oie.47.2023.02.05.02.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Feb 2023 02:05:11 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 08/16] hw/ppc/e500.c: Attach eSDHC unimplemented region to
 ccsr_addr_space
Date: Sun,  5 Feb 2023 07:04:41 -0300
Message-Id: <20230205100449.2352781-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230205100449.2352781-1-danielhb413@gmail.com>
References: <20230205100449.2352781-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bernhard Beschow <shentey@gmail.com>

Makes the unimplemented region move together with the CCSR address space
if moved by a bootloader. Moving the CCSR address space isn't
implemented yet but this patch is a preparation for it.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230125130024.158721-5-shentey@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/e500.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index e3b29d1d97..117c9c08ed 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -1022,9 +1022,13 @@ void ppce500_init(MachineState *machine)
 
     /* eSDHC */
     if (pmc->has_esdhc) {
-        create_unimplemented_device("esdhc",
-                                    pmc->ccsrbar_base + MPC85XX_ESDHC_REGS_OFFSET,
-                                    MPC85XX_ESDHC_REGS_SIZE);
+        dev = qdev_new(TYPE_UNIMPLEMENTED_DEVICE);
+        qdev_prop_set_string(dev, "name", "esdhc");
+        qdev_prop_set_uint64(dev, "size", MPC85XX_ESDHC_REGS_SIZE);
+        s = SYS_BUS_DEVICE(dev);
+        sysbus_realize_and_unref(s, &error_fatal);
+        memory_region_add_subregion(ccsr_addr_space, MPC85XX_ESDHC_REGS_OFFSET,
+                                    sysbus_mmio_get_region(s, 0));
 
         /*
          * Compatible with:
-- 
2.39.1


