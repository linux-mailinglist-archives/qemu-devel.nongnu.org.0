Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11440204A02
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 08:35:26 +0200 (CEST)
Received: from localhost ([::1]:48730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jncWj-0002H6-5U
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 02:35:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jncSz-00065L-Kl; Tue, 23 Jun 2020 02:31:33 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:38424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jncSy-0008J5-0w; Tue, 23 Jun 2020 02:31:33 -0400
Received: by mail-wm1-x341.google.com with SMTP id f18so1921861wml.3;
 Mon, 22 Jun 2020 23:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LTOxNe5hVvJd7RdtO7PCzxTxXTp7qC8fY58BTaDRB40=;
 b=DcOW2iG3Nl1eQsPhhRK9Jksz4FGA4EtedNc1lUPij9anzxtzIaIIaOrJvNUjPYVVEh
 sAd/Ih/nB/NbNlKJB1T9Atk4edbxeWY3xnjfmfo2SuoYmk+MMvt4nxGMmFyfuePYDvYm
 Df/D7FvSAmIpO6amByVwvDa8tqwMbH96tTMECnZWsPetVSAoVkdxZkBj66QJUQcx8R67
 fkpjg7g+A51dZ5NWzUtfilJMoKhJXcb0FgXwXwGI8oFY4gXmMEi5tfl48BWyhe/FvJ7V
 PodIKMYDOsyrzMaw0jj5h281lfa7iwg3I7DtEu/YedeqhjQ07/j60QNnlw2XDn2tB+G+
 u6Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LTOxNe5hVvJd7RdtO7PCzxTxXTp7qC8fY58BTaDRB40=;
 b=Z9sxm7d/6DBiJ09q03GnQbjA1PFLAAILb03e+TrLOUWfUIZvSyWrZveUMZStihp4C5
 kVHMhAx+Lo7TFAPXtgIhhb3gjxnartHwx2KLbaG/os2V8giu0teupa6R3evsWe0arQOz
 W/gBGnKldeaAsMSmRtuQX3aMf9szZQVn2MVXRK9IjAho8D6f32rUjWgTkxnVSfidPgMH
 e1hMnauXDmjJtWL+wiRRia3hmS18L42U7gwMGuVU2vSKpmQsbIMvfCBeKG6s25YymY2x
 6FuJ3zHXRP2nEZLTHddelQjyL14k8SrHtuS2QezhbNRuHhJW1wz3Na4IoFfDgkM44JNf
 9/UQ==
X-Gm-Message-State: AOAM531K1QktQB6n7P/+2u49h0+ejBS2/MBcZ1YU3p6yiUkQIOJj2RmN
 PTw7ezu0caECi4ai4+WIbPob3OjE
X-Google-Smtp-Source: ABdhPJxBu9/a+0p/hd/brJ0NXC3DhelpS6yVWpse2dQkJks3tGJNbsNBaLEBfM1EzPws2FE9zVcy4A==
X-Received: by 2002:a1c:55c4:: with SMTP id
 j187mr20471342wmb.120.1592893889940; 
 Mon, 22 Jun 2020 23:31:29 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id x205sm2407188wmx.21.2020.06.22.23.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 23:31:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Subject: [RFC PATCH v2 3/3] hw/misc/auxbus: Fix MOT/classic I2C mode
Date: Tue, 23 Jun 2020 08:31:23 +0200
Message-Id: <20200623063123.20776-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200623063123.20776-1-f4bug@amsat.org>
References: <20200623063123.20776-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Frederic Konrad <konrad@adacore.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since its introduction in commit 6fc7f77fd2 i2c_start_transfer()
uses incorrectly the direction of the transfer. Fix it now.

Fixes: 6fc7f77fd2 ("introduce aux-bus")
Reported-by: BALATON Zoltan <balaton@eik.bme.hu>
Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
RFC because untested (probably never was anyway)
Cc: Frederic Konrad <konrad@adacore.com>
Cc: Alistair Francis <alistair@alistair23.me>
Cc: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/auxbus.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
index cef0d0d6d0..dc4a5dd10d 100644
--- a/hw/misc/auxbus.c
+++ b/hw/misc/auxbus.c
@@ -141,7 +141,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
             i2c_end_transfer(i2c_bus);
         }
 
-        if (i2c_start_transfer(i2c_bus, address, is_write)) {
+        if (i2c_start_transfer(i2c_bus, address, !is_write)) {
             ret = AUX_I2C_NACK;
             break;
         }
@@ -172,7 +172,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
             /*
              * No transactions started..
              */
-            if (i2c_start_transfer(i2c_bus, address, is_write)) {
+            if (i2c_start_transfer(i2c_bus, address, !is_write)) {
                 break;
             }
         } else if ((address != bus->last_i2c_address) ||
@@ -181,7 +181,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
              * Transaction started but we need to restart..
              */
             i2c_end_transfer(i2c_bus);
-            if (i2c_start_transfer(i2c_bus, address, is_write)) {
+            if (i2c_start_transfer(i2c_bus, address, !is_write)) {
                 break;
             }
         }
-- 
2.21.3


