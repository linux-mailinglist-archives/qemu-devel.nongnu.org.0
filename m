Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E466D60181D
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 21:56:04 +0200 (CEST)
Received: from localhost ([::1]:53858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okWDU-00082Y-0P
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 15:56:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVg6-0002vA-SP; Mon, 17 Oct 2022 15:21:34 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:40577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVg5-0002z2-3f; Mon, 17 Oct 2022 15:21:34 -0400
Received: by mail-oi1-x235.google.com with SMTP id l5so13223031oif.7;
 Mon, 17 Oct 2022 12:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pnZp3+RtVWl+Up+vzDAkuOjXA76TOhGWF6jmK21fauw=;
 b=cYzBEpa7KcXCw2a2qUjb1+t/XHQtMUlaC08HHe25Ixlu4VVFCIDbNRWKJ0Xk3UWUom
 2+/0grOf3c40Vz1ie7i5w5SHzjUFOVB22goRkPxuUJwHWgXzmfeVa7AUcpZs/lA5/6pw
 RNwxhWu7nLKRHU3DePl1FlcFNO295W8ghKuvo7XQgZT0UA+G6B4hndOnKPZQf45JL3zf
 Ks7o3Dbc066ABXlKMp8l7HwIZ8rEzt3lc/+/AhCaqBQ1Ns4evylJ8j/e/PSPyCeuYd7+
 60FIQ3XKYWB8u5lzIqd3fa1BT03pvUemdv6tz0UjwQVERcO5tGpY9JBhEl2bJVrmHs9B
 Xc8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pnZp3+RtVWl+Up+vzDAkuOjXA76TOhGWF6jmK21fauw=;
 b=J9V3zJBVdLftNOF9cYU0vGhXzNKzNRa98IYZzE9b09jy9dK/uPdDaoCGDEEjaofpw6
 vxxKrK4cTr79VW/qiBE6azCD3SEXyPFrpqMyAOUiK9dpokn+vQXBOz214oAESuIyJvqA
 2Cr/UkFntYVqFd2vBqR8D9wTJjwaUAf2saBQqEkYhxgfvSxsKDPDEYO44wRHqpNc6K3Q
 g0f/+3ZWVZlUfU44yoFxeBaoUFQTNfREl0JwGv4cFqYk/GFYaTgmrK72M0WyATIV59dQ
 8exhwHbL0QkbN/A3STK02Du2D88nEOuNLovn2aOffiYHQckfUGlBRYFXn2EgkKc26L6V
 poDQ==
X-Gm-Message-State: ACrzQf1oSDHhRL10Pr8gsa4+1UKm5ohwChr/aJJ7Eww1gMoYsu98yzVP
 3Z3LkbJ6aK2jei7CJljMqL7fmaQK3m8=
X-Google-Smtp-Source: AMsMyM5k1yAtdTZSRqSVjhG0F75rVKDZOT1ObLLAMdKQhiJVgW1v5wweBCAiSsDIdoru+nGbxO78yA==
X-Received: by 2002:a05:6808:11cb:b0:353:f841:e390 with SMTP id
 p11-20020a05680811cb00b00353f841e390mr5533863oiv.149.1666034491861; 
 Mon, 17 Oct 2022 12:21:31 -0700 (PDT)
Received: from balboa.COMFAST ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 n132-20020aca408a000000b00342eade43d4sm4648005oia.13.2022.10.17.12.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 12:21:31 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 28/38] hw/ppc/spapr_pci.c: Use device_cold_reset() rather than
 device_legacy_reset()
Date: Mon, 17 Oct 2022 16:19:59 -0300
Message-Id: <20221017192009.92404-29-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017192009.92404-1-danielhb413@gmail.com>
References: <20221017192009.92404-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x235.google.com
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

From: Peter Maydell <peter.maydell@linaro.org>

In spapr_phb_children_reset() we call device_legacy_reset() to reset any
QOM children of the SPAPR PCI host bridge device. This will not reset
any qbus such a child might own. Switch to device_cold_reset(), which will
reset both the device and its buses. (If the child has no qbuses then
there will be no change in behaviour.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20221014142841.2092784-1-peter.maydell@linaro.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 57c8a4f085..7b7618d5da 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -2045,7 +2045,7 @@ static int spapr_phb_children_reset(Object *child, void *opaque)
     DeviceState *dev = (DeviceState *) object_dynamic_cast(child, TYPE_DEVICE);
 
     if (dev) {
-        device_legacy_reset(dev);
+        device_cold_reset(dev);
     }
 
     return 0;
-- 
2.37.3


