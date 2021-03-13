Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5006B339F77
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 18:26:01 +0100 (CET)
Received: from localhost ([::1]:55912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL81Y-0000IB-CM
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 12:26:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL7dy-0003VA-SE; Sat, 13 Mar 2021 12:01:38 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:42766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL7dx-0004nZ-Cp; Sat, 13 Mar 2021 12:01:38 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 b2-20020a7bc2420000b029010be1081172so16949485wmj.1; 
 Sat, 13 Mar 2021 09:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1zohvJ6sxOOfnWcGj8WNa9DGoLyrIMi2NDlIWklnQZ0=;
 b=OM6pQwt/kkccbZR3cVt4ymTr8LOkJ8w7VVGXpd73Hm4EJmFvQodROi/Q7d/R8JrxWr
 +ehjto8shw4J/qM6FSPAkFlg0rbBYX4YvpP9Kv3fwuRt7CKmBqUCTu3p29KG/xjScHQE
 6npQ4Tn2Tbn8lKFOjMElKMSsFDOwB+pDjpmq3S9lSsO1XRQehwygrTiUAEFsZFDVu4MO
 hCGEwK+n3De6xEYE3RMXlxxBSipkEQup0/J1BihMn1n3pAtwUGcrUV/zfSXIe0bxN/YI
 Uhpqv9bok9fFDcb/6M9QdKt1ziqZ0ATVLhFOzcGSIhgExZf2cCLwhAzyKQct68LJLzcV
 mdTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=1zohvJ6sxOOfnWcGj8WNa9DGoLyrIMi2NDlIWklnQZ0=;
 b=G9bAKyZm6OPyJDdI4bEnRZi2KiYerjyLnJJvzE00vJphq5OTmreDES/QjJ2TRSx4lK
 uQ1IdCNbQ8xj3Jr+ntsrlegYC8vqk+g+dP1mZNXSuusaRMAsaunZazCGxtv7skrpYE0j
 Eyga+li4269HN31b5HQDyz0PY013QPZRZJ4MV/qe8KJZ/mqEMCqI1S9C0N8fWj9v/+AO
 gxDVii28aCU/ymZj5QiI7/J5xelBZ02Nt0GkZ9REqw3K0wc7ypP1AUw+kKx/lFP84v6k
 9chk8OW6QCVSF0EJBCwQn4Qe6JaOm3L92plgzjxQTYficR6SE3mKCWZjHdHxmdncTklE
 gz4Q==
X-Gm-Message-State: AOAM532dn3AFeJXOy9gH2XAkYjmaLUNPcXUaIh+CZH4ALZWYRCfz+Dk2
 XRaFAmELvAH2z1iji99JcpVEsFlFft+r5Q==
X-Google-Smtp-Source: ABdhPJx6sVPibfoGBxIEe2KVQLhSQoQ5bmSGpN3Jj4zad1dNH2ixwWo4HL8kjZZaVNHvqSKMbbycfw==
X-Received: by 2002:a1c:e041:: with SMTP id x62mr18173662wmg.95.1615654893887; 
 Sat, 13 Mar 2021 09:01:33 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id x13sm12537825wrt.75.2021.03.13.09.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 09:01:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/display/bcm2835_fb: Remove DeviceReset() call in
 DeviceRealize()
Date: Sat, 13 Mar 2021 18:01:31 +0100
Message-Id: <20210313170131.2116837-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When QDev objects have their DeviceReset handler set, they
shouldn't worry about calling it at realization stage (it
is handled by hw/core/qdev.c::device_set_realized).

Remove the pointless/confusing bcm2835_fb_reset() call.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/display/bcm2835_fb.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
index 2be77bdd3a0..445e8636770 100644
--- a/hw/display/bcm2835_fb.c
+++ b/hw/display/bcm2835_fb.c
@@ -424,8 +424,6 @@ static void bcm2835_fb_realize(DeviceState *dev, Error **errp)
     s->dma_mr = MEMORY_REGION(obj);
     address_space_init(&s->dma_as, s->dma_mr, TYPE_BCM2835_FB "-memory");
 
-    bcm2835_fb_reset(dev);
-
     s->con = graphic_console_init(dev, 0, &vgafb_ops, s);
     qemu_console_resize(s->con, s->config.xres, s->config.yres);
 }
-- 
2.26.2


