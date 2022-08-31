Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 341D35A868E
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:16:57 +0200 (CEST)
Received: from localhost ([::1]:60582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTTCq-0003Op-0S
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:16:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSov-00047b-Jf; Wed, 31 Aug 2022 14:52:13 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a]:35767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSou-00088T-2c; Wed, 31 Aug 2022 14:52:13 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1225219ee46so1584694fac.2; 
 Wed, 31 Aug 2022 11:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Anc1w1CQ/MerJF77nBxH9FmJtQaXv6rK9mp9VdCq9j4=;
 b=d9t9Z24RCHNtRsvdJ9fZXEiaC+iS1okWkquJF9YZ2zNiUL6mrxspI6ZIn2/G8jdpem
 k9dDCotqACMRUhgB+yUSoK8qqUwCjp9Xn8Y13UNzBA1z8sOrVfJ602UNr2dVTs+324Pt
 AD1ClNcha9+J+xjT1/lVXjMe5OPgw14dKsnxjrqg+qqn/MV1r3j9vy0gcvrBIrT4zfT7
 GOIsV1XiiA+xjeUQMaBms+Gsh26Mt9Tt8NPFEFR4CBFLTkUnEQjdKV+oaplWxIbkPuAG
 /qhZkIB3DmuAPRSZYMglnGD2EFAxY7El+Flw82ntNvJU+K3wX0BQ/iR8/eIhPeZoILw0
 le0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Anc1w1CQ/MerJF77nBxH9FmJtQaXv6rK9mp9VdCq9j4=;
 b=wZ0dhNHbsIfzh21I4wtwPfPKnGo7+bFxdAS+PsJ8eiqyTA3Emi3gLFZvp2TcHYHOy/
 4z1VmMEUc5jDGp8gS8+uGz6/Hse1XjeXB/gXcpFIFrV7e1buBN2Mb/GMCY0Z/BDS4p7A
 xdu/c0q84eU5Wf+EKuhwhZzClHQfIJQ+J9CV/mZz87oTR6sEKuYEdujn5AKa1cPIkSPb
 R7m4SW7b5Jmvnt960uvq3tgcUVQyeGbHWZJunQIWGv0QSeI+FxObswqNSiksDfxHAoOc
 Bj6Z9+rO4RaDqVJ1KeHlJyfsNimS2PBIhE8I2e3yOL6oU6gM0mBnz74SlqAQuf5qWGtC
 y5mA==
X-Gm-Message-State: ACgBeo1S3bWYp8SESqrLn5zrYdlGY6yHE321GXVbyf/1+X9zRRQhzakb
 FYINDl3cfv1ZD8eIZV572yfHh6SObuk=
X-Google-Smtp-Source: AA6agR5FmlR3elTNGXFyVw5Y/ZfAcYfJV3yCUOrGuiRDK+oc4dHAEc18bLYdwxh6jtm/l0dOKAXv4g==
X-Received: by 2002:a05:6870:4597:b0:11c:ab4e:9fe8 with SMTP id
 y23-20020a056870459700b0011cab4e9fe8mr2267203oao.123.1661971930414; 
 Wed, 31 Aug 2022 11:52:10 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.52.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:52:09 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PULL 31/60] ppc/ppc405: Introduce a PPC405 generic machine
Date: Wed, 31 Aug 2022 15:50:05 -0300
Message-Id: <20220831185034.23240-32-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

We will use this machine as a base to define the ref405ep and possibly
the PPC405 hotfoot board as found in the Linux kernel.

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220809153904.485018-3-clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc405_boards.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index 1a4e7588c5..96700be74d 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -50,6 +50,15 @@
 
 #define USE_FLASH_BIOS
 
+#define TYPE_PPC405_MACHINE MACHINE_TYPE_NAME("ppc405")
+OBJECT_DECLARE_SIMPLE_TYPE(Ppc405MachineState, PPC405_MACHINE);
+
+struct Ppc405MachineState {
+    /* Private */
+    MachineState parent_obj;
+    /* Public */
+};
+
 /*****************************************************************************/
 /* PPC405EP reference board (IBM) */
 /* Standalone board with:
@@ -332,18 +341,34 @@ static void ref405ep_class_init(ObjectClass *oc, void *data)
 
     mc->desc = "ref405ep";
     mc->init = ref405ep_init;
-    mc->default_ram_size = 0x08000000;
-    mc->default_ram_id = "ef405ep.ram";
 }
 
 static const TypeInfo ref405ep_type = {
     .name = MACHINE_TYPE_NAME("ref405ep"),
-    .parent = TYPE_MACHINE,
+    .parent = TYPE_PPC405_MACHINE,
     .class_init = ref405ep_class_init,
 };
 
+static void ppc405_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    mc->desc = "PPC405 generic machine";
+    mc->default_ram_size = 128 * MiB;
+    mc->default_ram_id = "ppc405.ram";
+}
+
+static const TypeInfo ppc405_machine_type = {
+    .name = TYPE_PPC405_MACHINE,
+    .parent = TYPE_MACHINE,
+    .instance_size = sizeof(Ppc405MachineState),
+    .class_init = ppc405_machine_class_init,
+    .abstract = true,
+};
+
 static void ppc405_machine_init(void)
 {
+    type_register_static(&ppc405_machine_type);
     type_register_static(&ref405ep_type);
 }
 
-- 
2.37.2


