Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EC049E798
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 17:33:36 +0100 (CET)
Received: from localhost ([::1]:41838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD7iJ-0004S3-Go
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 11:33:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD6zS-0006me-I3
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:47:14 -0500
Received: from [2a00:1450:4864:20::32c] (port=46791
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD6zH-0008OC-OE
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:47:14 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 c190-20020a1c9ac7000000b0035081bc722dso2142622wme.5
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 07:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D6RWfoE5VlE7/bSxhmZNiy91yop7RGn51a8FgJXH+HA=;
 b=U5Whb9jAbbzMGeoPE6Mc/6dKUyD4wFt6o+4N5inscDPj1V+AwELhc5hpwuGy0dnVGI
 J4HXkFUZW8aOqlHqHQjl1E7mK3sBEegxYVwAtFsjM6o/BZtZynV4b1EldG1HkmxeRdsX
 ZHQHliLIhVliIZkM4dEtJTzs27Qx+u5rN97/NbcyiNvlS+U5ZNY9Wo/VSOm3vz2qs2vo
 qAj9WKyrEf0d694f+bu9LD1RC2qg70juSvnPSlluQEj9RMdZfg4ejT4n/pmHa6PoSgTU
 skd9IclywmGluxkLwNQ/Yvs/1/EUp5JBfjhHU3PU2+SeNMp0yaf2LWUXWGX+8KyhtNcJ
 1emA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D6RWfoE5VlE7/bSxhmZNiy91yop7RGn51a8FgJXH+HA=;
 b=KQ0qyMlgrGVLyigR/lHZc8SOaHVLfk/HY1j+G8GF8l6Y3zDbTeWoUqyu1LaDJ58TKY
 5hrxvo2sJ312TACC4qBTFA4JO3aPcb/VI96zu1tuvPHHA8eK9F6T7CWRPyZpNNzn0Yy/
 PnWDg4FY/cWJYcLLyE1ktjbsTZsruJiTeoOhF0+EVb0tr79Yk+D8aNBFsW80r1iGy/pQ
 vLLUNZfjCWqLmzfvAjRJe4JJm83kc43YJRBmO+TgqU+QO/4js+klxRyTDi/T7begETqg
 e4MngdaEkqeK/CDNT5CK5oq2LvhpPVuGR9fSL06SQ7HFRuAG8qAUKEjhNHu6RtOo5cZe
 vnag==
X-Gm-Message-State: AOAM533ZQ6km6u/S3Q/Ew2n+bUtbywx1AxXq/xcVgwkPvSeZKBFUFGhV
 14Kcfzkk49wYbi61GNaW1D6QXw==
X-Google-Smtp-Source: ABdhPJxnH55UMhtpZ+RG1OpRccLW2+g/jlBNhXv85/JBpEPvgsBceKDF0IUYNY3JYWNUpHHmMwWn9g==
X-Received: by 2002:a05:600c:3d06:: with SMTP id
 bh6mr12232366wmb.87.1643298421833; 
 Thu, 27 Jan 2022 07:47:01 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id w9sm6687667wmc.36.2022.01.27.07.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 07:47:01 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 09/16] hw/arm: highbank: For EL3 guests, don't enable PSCI,
 start all cores
Date: Thu, 27 Jan 2022 15:46:32 +0000
Message-Id: <20220127154639.2090164-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127154639.2090164-1-peter.maydell@linaro.org>
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Rob Herring <robh@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Andre Przywara <andre.przywara@arm.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Yanan Wang <wangyanan55@huawei.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Change the highbank/midway boards to use the new boot.c functionality
to allow us to enable psci-conduit only if the guest is being booted
in EL1 or EL2, so that if the user runs guest EL3 firmware code our
PSCI emulation doesn't get in its way.

To do this we stop setting the psci-conduit and start-powered-off
properties on the CPU objects in the board code, and instead set the
psci_conduit field in the arm_boot_info struct to tell the common
boot loader code that we'd like PSCI if the guest is starting at an
EL that it makes sense with (in which case it will set these
properties).

This means that when running guest code at EL3, all the cores
will start execution at once on poweron. This matches the
real hardware behaviour. (A brief description of the hardware
boot process is in the u-boot documentation for these boards:
https://u-boot.readthedocs.io/en/latest/board/highbank/highbank.html#boot-process
 -- in theory one might run the 'a9boot'/'a15boot' secure monitor
code in QEMU, though we probably don't emulate enough for that.)

This affects the highbank and midway boards.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/highbank.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index 4210894d814..048f8550cb9 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -271,12 +271,6 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
         object_property_set_int(cpuobj, "psci-conduit", QEMU_PSCI_CONDUIT_SMC,
                                 &error_abort);
 
-        if (n) {
-            /* Secondary CPUs start in PSCI powered-down state */
-            object_property_set_bool(cpuobj, "start-powered-off", true,
-                                     &error_abort);
-        }
-
         if (object_property_find(cpuobj, "reset-cbar")) {
             object_property_set_int(cpuobj, "reset-cbar", MPCORE_PERIPHBASE,
                                     &error_abort);
@@ -397,6 +391,7 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
     highbank_binfo.board_setup_addr = BOARD_SETUP_ADDR;
     highbank_binfo.write_board_setup = hb_write_board_setup;
     highbank_binfo.secure_board_setup = true;
+    highbank_binfo.psci_conduit = QEMU_PSCI_CONDUIT_SMC;
 
     arm_load_kernel(ARM_CPU(first_cpu), machine, &highbank_binfo);
 }
-- 
2.25.1


