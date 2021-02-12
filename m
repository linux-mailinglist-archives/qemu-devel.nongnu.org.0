Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC84031A017
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 14:54:23 +0100 (CET)
Received: from localhost ([::1]:50536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAYtq-0004Ia-Rv
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 08:54:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAYrY-0002lQ-5V
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 08:52:01 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:43195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAYrW-0005wN-2F
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 08:51:59 -0500
Received: by mail-ed1-x535.google.com with SMTP id v7so10884119eds.10
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 05:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=WqCiZKf/bOd743/BAXPwMMt1kMi3GtNVDcGv11sQawY=;
 b=n8J29OrXolZflrfy2iZUoY3YoeJrFi6k0d34vfGicQN2P42oefyNhoNO+6szMJODEX
 m9zZTzHrjBrUpnJfSfKPjmGG/vWtEXiXN76G3c1Tu4GkktQQuYGUMyMg81/kDC+qQEPo
 Ma+NuXiCK8VKYuailRdx1T5dDP8WVUMQf9RWUMsajgq5d9jIJgVPbcAVVo8toqS1pfQU
 cNMWOgb7g7KRg+rzRi10kFIzdgTDb12Mdduh4tO1BRdYtZWtS5tOFevdUxvW+6bDRb62
 bMDNi2B720OUeRxG+NYxeMT3ve5WswdC52oGWiRkbidzn92aT+On5frHdxdTuzDiQ6YU
 GzaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=WqCiZKf/bOd743/BAXPwMMt1kMi3GtNVDcGv11sQawY=;
 b=StT1sRbaiMNU+Twk/fckwzasZ+Tmn3XeTtUj3i+d8igE+ywSRKyesv6I8xHRDtypJe
 lZ+tlQ6KcgmMneTgK2o80lqFxCekCHUKxlBIQqEntiAVjbfZ9LJW2B9F48CRMjT/QTso
 H0av/qk0FH9hYD9O420TCh2FrMsxY7T9YornGPVVqn1OUf9VyPh2yYbZvlZy/HIxv57Q
 ng4PXZjFA22RyKuHPkmxx1rY5Bd+Nr84XpU70q5x91LEaUDwq7zDIs1OIFyuncRkWDIA
 73b6WnR53yPzChs+qsJt4gfIEh6MK7t9IDwhnsIUds4wR5ZJJTSy2ZWvq+9rMJgYszVZ
 qbPA==
X-Gm-Message-State: AOAM530X3QsU+4eunClEZ/PpGXFQuJtwtT6w6/4iNsi6ApZuFqE2Q4Bl
 ywJLxaYEjk5EAKoXRXxorlPmTCMuU2FKf4MlfMrl+A==
X-Google-Smtp-Source: ABdhPJyEfVWBdfEjs+V9VSEM9zGc/Tnxw8wEyBK0rZDp8TGdCMnKStsgj6B9Gkz7KlRusKm/t0lwgAiNkdXbfrVArcE=
X-Received: by 2002:a05:6402:3494:: with SMTP id
 v20mr3589598edc.146.1613137915610; 
 Fri, 12 Feb 2021 05:51:55 -0800 (PST)
MIME-Version: 1.0
References: <20210205170019.25319-1-peter.maydell@linaro.org>
 <20210205170019.25319-8-peter.maydell@linaro.org>
In-Reply-To: <20210205170019.25319-8-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Feb 2021 13:51:44 +0000
Message-ID: <CAFEAcA-pDBHjZqswjEo4S9sLOao3vnOM05HdjRhJOGY4Q-GkiQ@mail.gmail.com>
Subject: Re: [PATCH 07/24] hw/arm/mps2-tz: Make FPGAIO switch and LED config
 per-board
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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

On Fri, 5 Feb 2021 at 17:00, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Set the FPGAIO num-leds and have-switches properties explicitly
> per-board, rather than relying on the defaults.  The AN505 and AN521
> both have the same settings as the default values, but the AN524 will
> be different.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Followon from the update to the previous patch, trivial rename
to squash in:

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 94618ae54d2..6e345cf1f09 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -80,7 +80,7 @@ struct MPS2TZMachineClass {
     uint32_t len_oscclk;
     const uint32_t *oscclk;
     uint32_t fpgaio_num_leds; /* Number of LEDs in FPGAIO LED0 register */
-    bool fpgaio_switches; /* Does FPGAIO have SWITCH register? */
+    bool fpgaio_has_switches; /* Does FPGAIO have SWITCH register? */
     const char *armsse_type;
 };

@@ -247,7 +247,7 @@ static MemoryRegion
*make_fpgaio(MPS2TZMachineState *mms, void *opaque,

     object_initialize_child(OBJECT(mms), "fpgaio", fpgaio, TYPE_MPS2_FPGAIO);
     qdev_prop_set_uint32(DEVICE(fpgaio), "num-leds", mmc->fpgaio_num_leds);
-    qdev_prop_set_bit(DEVICE(fpgaio), "have-switches", mmc->fpgaio_switches);
+    qdev_prop_set_bit(DEVICE(fpgaio), "has-switches",
mmc->fpgaio_has_switches);
     sysbus_realize(SYS_BUS_DEVICE(fpgaio), &error_fatal);
     return sysbus_mmio_get_region(SYS_BUS_DEVICE(fpgaio), 0);
 }
@@ -693,7 +693,7 @@ static void mps2tz_an505_class_init(ObjectClass
*oc, void *data)
     mmc->oscclk = an505_oscclk;
     mmc->len_oscclk = ARRAY_SIZE(an505_oscclk);
     mmc->fpgaio_num_leds = 2;
-    mmc->fpgaio_switches = false;
+    mmc->fpgaio_has_switches = false;
     mmc->armsse_type = TYPE_IOTKIT;
 }

@@ -713,7 +713,7 @@ static void mps2tz_an521_class_init(ObjectClass
*oc, void *data)
     mmc->oscclk = an505_oscclk; /* AN521 is the same as AN505 here */
     mmc->len_oscclk = ARRAY_SIZE(an505_oscclk);
     mmc->fpgaio_num_leds = 2;
-    mmc->fpgaio_switches = false;
+    mmc->fpgaio_has_switches = false;
     mmc->armsse_type = TYPE_SSE200;
 }

thanks
-- PMM

