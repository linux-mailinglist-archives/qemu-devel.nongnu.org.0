Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF066017CA
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 21:38:15 +0200 (CEST)
Received: from localhost ([::1]:36762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okVwC-0007Ok-Td
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 15:38:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVfD-0001sw-1N; Mon, 17 Oct 2022 15:20:41 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36]:35687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVfA-0002t0-D9; Mon, 17 Oct 2022 15:20:37 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-134072c15c1so14423273fac.2; 
 Mon, 17 Oct 2022 12:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3MaFXDtvMfgPuGxU9NkFZrLJtYKk9f94dgmXFB6QH14=;
 b=kVPFhlaS3INXnFPAHt5WBLo+/JMp39HAtijbUiuLdNj5d4KydI0GgFJZtcVo9Qk91N
 cwy+/LBJ35wG+Y9Os7x+Gqq98cOQ+6S5oUabWzGlzrF45aw7m34BEGYFJmy9eyNWYzRI
 h/ciTBfDeIy3aZbWxXBerLiIFxLkW1m3yANXjb+W4aKtIG/j6HyDunH41XOLByGKbuvr
 rVYb7g2RzJbeCQnhPrFexpH6sWuPE0/gzeLvxR4HBz22GIfmguSH3BYpQE/BRNYjjzP6
 6k/UGAe8mhoQ8GxwGaEZzKy7Ak9Nz03DB6WaRL3MGV1CSD1UIw7gePuG+Jntlk+sdyGh
 zyTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3MaFXDtvMfgPuGxU9NkFZrLJtYKk9f94dgmXFB6QH14=;
 b=DWCvFNcgo2FpTwJ/IErdM6tiYHMQFXIir5JWqjimEybIEX9hdhklJ6NxqJk1B4A9Ww
 ngJK/ChAqbexdu/1GW9Yi8iiwZleA/+EwSPP+pxmqBL4FQMyKKOrviyOs1OozBEmcVPA
 n4wBx8y8F/dCUUb4joxjcV/lTkmPboNDo1lGDcIdltg48DSQ4DSgq9e99mBBoz6NzWe7
 nSPj5tcu8VkLblz/6Jjgevizw6pq6nSfe9NEJBVt7wdKi9XPiSSyZ9KX4jHpWU6SeTTI
 6jMZPy8XH3rSkPtTFOz4A/YkZ4kNMeKxs5Z2NSn5Vws5Nqa5M4ht5Y8mP4lBovLXo/xk
 W2NA==
X-Gm-Message-State: ACrzQf2lukNZmtPgsYI/FCEkvifRLMEHwWrACPs/BtIAkzqwdj5GtRVT
 iG3a1jNL1UNk+Y3Uatb9yttTWOMnnfo=
X-Google-Smtp-Source: AMsMyM7Q8fGAh2cbP8EOKqxoM9SMpCMIxh0Zb41npCo6S2ikSe92Sb197ZIgWgdONFgWhteaveSgdg==
X-Received: by 2002:a05:6870:3120:b0:132:7d08:7059 with SMTP id
 v32-20020a056870312000b001327d087059mr6580792oaa.226.1666034434533; 
 Mon, 17 Oct 2022 12:20:34 -0700 (PDT)
Received: from balboa.COMFAST ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 n132-20020aca408a000000b00342eade43d4sm4648005oia.13.2022.10.17.12.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 12:20:34 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 07/38] ppc440_bamboo: Add missing 4 MiB valid memory size
Date: Mon, 17 Oct 2022 16:19:38 -0300
Message-Id: <20221017192009.92404-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017192009.92404-1-danielhb413@gmail.com>
References: <20221017192009.92404-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x36.google.com
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

From: BALATON Zoltan <balaton@eik.bme.hu>

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <05836e38be84729c1c6b5b609e7aa2ea60435033.1664021647.git.balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc440_bamboo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index edfb8c9709..7ec7c7c43d 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -51,7 +51,7 @@
 #define PPC440EP_SDRAM_NR_BANKS 4
 
 static const ram_addr_t ppc440ep_sdram_bank_sizes[] = {
-    256 * MiB, 128 * MiB, 64 * MiB, 32 * MiB, 16 * MiB, 8 * MiB, 0
+    256 * MiB, 128 * MiB, 64 * MiB, 32 * MiB, 16 * MiB, 8 * MiB, 4 * MiB, 0
 };
 
 static hwaddr entry;
-- 
2.37.3


