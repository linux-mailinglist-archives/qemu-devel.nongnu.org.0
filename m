Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EECF6F19A1
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 15:33:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psOAX-0007hr-Kf; Fri, 28 Apr 2023 09:29:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nks.gnu@gmail.com>)
 id 1psO4O-0005tQ-Eu; Fri, 28 Apr 2023 09:23:28 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nks.gnu@gmail.com>)
 id 1psO4M-0001bW-Nk; Fri, 28 Apr 2023 09:23:28 -0400
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4ec8133c59eso10419475e87.0; 
 Fri, 28 Apr 2023 06:23:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682688204; x=1685280204;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PWg7dbBSLXQiktpYCfC7aOZgN6P0Noe5N48ZAxcL6IQ=;
 b=BgCgqHVOYKVI/4Bpq1KHEp4u3OCTTHmtoULWr5jE12A5+69PLKb3+4RZutkXhC3A1B
 ctt05T9S2Vc7vBXaNPVbq6jBvZAVxLtRUwJGbn0lzLEvkXf06ZHaWPJ5Huhr5VTQmdhG
 TI3PiOvN1WNUkfx0KlTFpPoZfuf2y8sHyUl1AYROfuumxnSw9SiX7WU0l3XBPKxTjAfI
 laG/cPrFkrN1EmbJGxYlaalEW5LPR1MumRJxqboHBvqQ0bMXDA/VUsihwYyWTdXeMB+P
 VWVKcyXA3G1Z/+Do9gpG9s4gQA/24Zo9uNDysid9JrPNsu3VvvNScvZYayorM3zhNTus
 6xuA==
X-Gm-Message-State: AC+VfDzM3YTd95F6FMiUdABMSTTPq3nUT8vE7d3PlBTVaXC65/K6e5oQ
 VH/VCu4VNmkysYTb8BED6tv15S3Ev57UTcrJ
X-Google-Smtp-Source: ACHHUZ5a/Yh/9okg5+/5rIfPF8MRV02lgIXLe6HzvyBuJvE1I3+CqZs2KYzFhMBVoRxSvrqRxhypcA==
X-Received: by 2002:ac2:48a9:0:b0:4eb:3b4c:50ab with SMTP id
 u9-20020ac248a9000000b004eb3b4c50abmr1647368lfg.64.1682688204677; 
 Fri, 28 Apr 2023 06:23:24 -0700 (PDT)
Received: from flawful.org (c-fcf6e255.011-101-6d6c6d3.bbcust.telenor.se.
 [85.226.246.252]) by smtp.gmail.com with ESMTPSA id
 r16-20020ac252b0000000b004edc9e9eec5sm3357882lfm.138.2023.04.28.06.23.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 06:23:24 -0700 (PDT)
Received: by flawful.org (Postfix, from userid 112)
 id 6CD76341; Fri, 28 Apr 2023 15:23:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=flawful.org; s=mail;
 t=1682688203; bh=V2Qa9eatCpj+aaqd6Gy2Q46YiIUq2dXD5ylvC/xVRsM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f/C1TDKAr8m3hCI4jcugAUMlSFSBsXClmiChlDgeg9vYaIjB3iPaujVHegNQwd/JT
 73N/DyM1kBLpuHGQ954gQnQ0n3PfP0ody8XkUgiVoShe2s3NHmzH6vMl6Yh3joVyAF
 aFa5f20eB3aL1h864vXUlMYTW8V5cq52x2TyQYf8=
Received: from x1-carbon.lan (OpenWrt.lan [192.168.1.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by flawful.org (Postfix) with ESMTPSA id 0C2FE739;
 Fri, 28 Apr 2023 15:21:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=flawful.org; s=mail;
 t=1682688102; bh=V2Qa9eatCpj+aaqd6Gy2Q46YiIUq2dXD5ylvC/xVRsM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KdOr0YtTpSDi7niWgRKm8qjnMczr+csibMyu4Kis8QjMjjDNuZgn6U4dCR3icjg4t
 wuBVyUlmjGx4RBXW2dCMxcwV+qBX18K74RmNW3bwjl2xc2hRvQ/BB/24MEM0b15ne0
 cQQuwFKtRdvT00yV2mo0mvyk3VH3DogwfBWiCuTU=
From: Niklas Cassel <nks@flawful.org>
To: John Snow <jsnow@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <niklas.cassel@wdc.com>
Subject: [PATCH 7/9] hw/ide/ahci: trigger either error IRQ or regular IRQ,
 not both
Date: Fri, 28 Apr 2023 15:21:22 +0200
Message-Id: <20230428132124.670840-8-nks@flawful.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230428132124.670840-1-nks@flawful.org>
References: <20230428132124.670840-1-nks@flawful.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=nks.gnu@gmail.com; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 28 Apr 2023 09:29:45 -0400
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

From: Niklas Cassel <niklas.cassel@wdc.com>

According to AHCI 1.3.1, 5.3.8.1 RegFIS:Entry, if ERR_STAT is set,
we jump to state ERR:FatalTaskfile, which will raise a TFES IRQ
unconditionally, regardless if the I bit is set in the FIS or not.

Thus, we should never raise a normal IRQ after having sent an error
IRQ.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
---
 hw/ide/ahci.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 2a59d0e0f5..d88961b4c0 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -891,11 +891,10 @@ static bool ahci_write_fis_d2h(AHCIDevice *ad, bool d2h_fis_i)
     pr->tfdata = (ad->port.ifs[0].error << 8) |
         ad->port.ifs[0].status;
 
+    /* TFES IRQ is always raised if ERR_STAT is set, regardless of I bit. */
     if (d2h_fis[2] & ERR_STAT) {
         ahci_trigger_irq(ad->hba, ad, AHCI_PORT_IRQ_BIT_TFES);
-    }
-
-    if (d2h_fis_i) {
+    } else if (d2h_fis_i) {
         ahci_trigger_irq(ad->hba, ad, AHCI_PORT_IRQ_BIT_DHRS);
     }
 
-- 
2.40.0


