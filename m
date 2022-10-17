Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 678146017DF
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 21:40:30 +0200 (CEST)
Received: from localhost ([::1]:58206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okVyO-0004UV-Gk
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 15:40:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVfu-0002jS-Sq; Mon, 17 Oct 2022 15:21:26 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:42599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVfs-0002yB-8k; Mon, 17 Oct 2022 15:21:21 -0400
Received: by mail-oi1-x22f.google.com with SMTP id p127so12571873oih.9;
 Mon, 17 Oct 2022 12:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oxx+t+Q670EmUPuBO6yT51edHFCy2D4FS62HYiFc8Dw=;
 b=HtRTy4SDeJPH+7FOgqR3HmVg2emvtwvzEPShtk/n+Ci+jtpaXUSUlC7+fR/kVmf/uz
 hcf2wW2bs3WSk+SsUR1AxUJZ4alvGAqyA5Omglp10f3CTaMsRpvZZk9whzFIsHy+KGxR
 HLRkFGg3guI4d/l5Ys0E0CbFsAid8Yn8QsP7cH5G6snHtBZqV+U34m4oSawqC1gfsKL2
 hHbFSMswlj6LiW88CPAR7wJOJiSfNi0k1mgTk5+kRh/mNfUe+XFdO3YSV+k/5nAXVHIy
 53j7gPWFOCpQVo3KoGnEpY7SPgWTglPrydNnk+22TrAEIe5oZcQfKAQXjvP6y8lgorE4
 sDKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oxx+t+Q670EmUPuBO6yT51edHFCy2D4FS62HYiFc8Dw=;
 b=CJYGvu0CSAypnta1fL2nrAtrBxFDb1RuLmzPdOchHuRqN9sThJgoMg+4hDcLK6CQr+
 TRga/DqhxD3/dSuAK6/gwfKthpxpBw9p1A6XVnCq0yRG/PDfPfIatRr/Al4eWE3vprxv
 Hk3nF48fIm+2GYrpsylrDheXzMHHS1AIPiQHB5SrsqwfF9ZiTB62s5weNTVopbExWEtK
 sV2varOMg82K2AIJSmQ82HlIzE3TVYaXTCsZsBypvk3PrvwpEzPRysHsH2N76yyQY2Ia
 gdRMisu8ZddbtYpBqiBvmQLke3sguoDkDKNVNSKjCBt0PT9zteVav+1PmaCMtVOut4W3
 LpAA==
X-Gm-Message-State: ACrzQf0+Z8W7rVyav2IrK1i44UBpNjsV6zEc5pmoCqHkuJeNSE8I3lKy
 l69SKeZPTCQJWQotOH+B73ucFyQAnpw=
X-Google-Smtp-Source: AMsMyM5edoHW9Wwg3FekKbknrlNuL4ysT+gcs299HXfvlt+cKrgtgnXW6vl9tV3Ri/pEGGBzuiUkiA==
X-Received: by 2002:a05:6808:1717:b0:333:513e:650e with SMTP id
 bc23-20020a056808171700b00333513e650emr5640982oib.23.1666034478427; 
 Mon, 17 Oct 2022 12:21:18 -0700 (PDT)
Received: from balboa.COMFAST ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 n132-20020aca408a000000b00342eade43d4sm4648005oia.13.2022.10.17.12.21.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 12:21:18 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bin Meng <bmeng.cn@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 23/38] hw/ppc/e500: Reduce usage of sysbus API
Date: Mon, 17 Oct 2022 16:19:54 -0300
Message-Id: <20221017192009.92404-24-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017192009.92404-1-danielhb413@gmail.com>
References: <20221017192009.92404-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bernhard Beschow <shentey@gmail.com>

PlatformBusDevice has an mmio attribute which gets aliased to
SysBusDevice::mmio[0]. So PlatformbusDevice::mmio can be used directly,
avoiding the sysbus API.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20221003203142.24355-5-shentey@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/e500.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 32495d0123..496c61b612 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -1023,7 +1023,7 @@ void ppce500_init(MachineState *machine)
 
         memory_region_add_subregion(address_space_mem,
                                     pmc->platform_bus_base,
-                                    sysbus_mmio_get_region(s, 0));
+                                    &pms->pbus_dev->mmio);
     }
 
     /*
-- 
2.37.3


