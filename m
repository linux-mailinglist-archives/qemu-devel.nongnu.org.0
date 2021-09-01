Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0D23FD89B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 13:20:48 +0200 (CEST)
Received: from localhost ([::1]:58430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLOIR-00081V-HM
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 07:20:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcd-0007ED-LY
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:36 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:35428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcW-00061e-RO
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:34 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 z9-20020a7bc149000000b002e8861aff59so4426863wmi.0
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 03:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=YfmS8KcbL5xTQ2x/y0zCDcF/pwktqOgewwCvAoUA9UE=;
 b=OMPkUxOBBK2ka76XaXJ1OSeXCIxuE8z1qVLZYjal3zkyDIdsNXKj0SjwbKnFJR5h2+
 ApUsvJP70Z1i4W35tekGVCDAgJf7gGxVz884MWgEgZPQsWiZZ49+E33m3PIOfPMbhdUy
 F3hy9uD6KGQol80GDyqKTuwPN9bhcFePNC0odMadZLR+hLe4alBTAa7l7eZcMfnDOWJM
 z7HSDmyq+El14pO8xLq62STGjCt34Jneaf+ted+z6v6EO1rX5hwHEB/ZGkuXJ2UOoWr+
 DnlOOR968I9L4aRTU+o0xaHq6uWXmZM0fpBUVDtRAbpc0z834C+WXpDGfH4wDiM2YUkp
 2HbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YfmS8KcbL5xTQ2x/y0zCDcF/pwktqOgewwCvAoUA9UE=;
 b=BcxbrArtxTydQctcSngSsmBbHBlrMVaGrzL9CAux/7aiBUDpZYWo+vxMdexUWCnk3O
 pPNGwltfR6qfjr4lxCT5a9XbXrsVgBiT3DneQ2njrInzgtZDcYoHzwpotWYHucxAX7V2
 1tefNk12uZFvFoo3fa48ia7NfVu8nCTURyokMf8FnLhv1/ErkqKYeCRbvL4CxUYq9t+v
 o5qILvTTF8bkk+tLL7zsWSymO4JUTsDauN/+gyQSkRtbpwQCz+249AJTIdDr2OST4GW8
 PxewLhiySB4/Mv2i0nq7VjucUxgrHc6hSiNofDf7z17YX2M959NTSkqToW9JY6LRT6Y/
 ydag==
X-Gm-Message-State: AOAM530YD+rRRIkRyhS0qJ8VN9aNKoRAcWc10aAvNgn4S+pv38ch9cFh
 wMLX5e0MdLtr+DljVw3MKWN+Wmvkyho0lQ==
X-Google-Smtp-Source: ABdhPJxGy0aBDavDq18kQHZEQpzZAxh7CqzTKFGbsro29QrIeKfNP+bKI4e9sDSXBr+bOqL/p2FTQA==
X-Received: by 2002:a1c:1b49:: with SMTP id b70mr9022646wmb.17.1630492647020; 
 Wed, 01 Sep 2021 03:37:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j207sm5494771wmj.40.2021.09.01.03.37.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 03:37:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 46/51] hw/arm/msf2-soc: Wire up refclk
Date: Wed,  1 Sep 2021 11:36:48 +0100
Message-Id: <20210901103653.13435-47-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901103653.13435-1-peter.maydell@linaro.org>
References: <20210901103653.13435-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Wire up the refclk for the msf2 SoC.  This SoC runs the refclk at a
frequency which is programmably either /4, /8, /16 or /32 of the main
CPU clock.  We don't currently model the register which allows the
guest to set the divisor, so implement the refclk as a fixed /32 of
the CPU clock (which is the value of the divisor at reset).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
Message-id: 20210812093356.1946-21-peter.maydell@linaro.org
---
 include/hw/arm/msf2-soc.h |  1 +
 hw/arm/msf2-soc.c         | 23 +++++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/include/hw/arm/msf2-soc.h b/include/hw/arm/msf2-soc.h
index 01f904cec47..ce417a6266a 100644
--- a/include/hw/arm/msf2-soc.h
+++ b/include/hw/arm/msf2-soc.h
@@ -59,6 +59,7 @@ struct MSF2State {
     uint64_t esram_size;
 
     Clock *m3clk;
+    Clock *refclk;
     uint8_t apb0div;
     uint8_t apb1div;
 
diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
index 0a1e594aee6..dbc6d936a76 100644
--- a/hw/arm/msf2-soc.c
+++ b/hw/arm/msf2-soc.c
@@ -76,6 +76,7 @@ static void m2sxxx_soc_initfn(Object *obj)
     object_initialize_child(obj, "emac", &s->emac, TYPE_MSS_EMAC);
 
     s->m3clk = qdev_init_clock_in(DEVICE(obj), "m3clk", NULL, NULL, 0);
+    s->refclk = qdev_init_clock_in(DEVICE(obj), "refclk", NULL, NULL, 0);
 }
 
 static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
@@ -92,6 +93,27 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
         return;
     }
 
+    /*
+     * We use s->refclk internally and only define it with qdev_init_clock_in()
+     * so it is correctly parented and not leaked on an init/deinit; it is not
+     * intended as an externally exposed clock.
+     */
+    if (clock_has_source(s->refclk)) {
+        error_setg(errp, "refclk must not be wired up by the board code");
+        return;
+    }
+
+    /*
+     * TODO: ideally we should model the SoC SYSTICK_CR register at 0xe0042038,
+     * which allows the guest to program the divisor between the m3clk and
+     * the systick refclk to either /4, /8, /16 or /32, as well as setting
+     * the value the guest can read in the STCALIB register. Currently we
+     * implement the divisor as a fixed /32, which matches the reset value
+     * of SYSTICK_CR.
+     */
+    clock_set_mul_div(s->refclk, 32, 1);
+    clock_set_source(s->refclk, s->m3clk);
+
     memory_region_init_rom(&s->nvm, OBJECT(dev_soc), "MSF2.eNVM", s->envm_size,
                            &error_fatal);
     /*
@@ -115,6 +137,7 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
     qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
     qdev_prop_set_bit(armv7m, "enable-bitband", true);
     qdev_connect_clock_in(armv7m, "cpuclk", s->m3clk);
+    qdev_connect_clock_in(armv7m, "refclk", s->refclk);
     object_property_set_link(OBJECT(&s->armv7m), "memory",
                              OBJECT(get_system_memory()), &error_abort);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->armv7m), errp)) {
-- 
2.20.1


