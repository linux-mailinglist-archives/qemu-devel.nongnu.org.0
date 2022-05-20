Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FCF52EC89
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 14:48:06 +0200 (CEST)
Received: from localhost ([::1]:55114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns232-00033V-De
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 08:48:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <uwu@icenowy.me>)
 id 1ns1xX-0000UZ-NZ; Fri, 20 May 2022 08:42:26 -0400
Received: from sender4-op-o18.zoho.com ([136.143.188.18]:17846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <uwu@icenowy.me>)
 id 1ns1xV-00044C-Qu; Fri, 20 May 2022 08:42:23 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1653050535; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=W8GaDLRNwTTJH4lL3dpvyJwn9tbhlDT3YQeyQyAfCVhspa7KvI9Mxqs3GJdflMMbuBaufvY8FzoY0XaDrbr3q6gTTvV2uZMWRFRJ6ROfVnUua/9atHU3OvYaf11tcy1d/jK9DEfu/k0bjkAboveVIDySrtiuFCbDToOtaVEbiqc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1653050535;
 h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
 bh=gBXY50Hr95KuxeUxlVOTZnaUhvHZ5Aw8fPCec2+svQA=; 
 b=cNlouEBNcNkJOHwG0iHLAfFydWo2QfFRROLxAmdjsJhX5YqW31L77p+D66OUTsiU5JHkQrmwCFf1KzQ+9BB9eYJX+cwdgo3K5ZRFmc9GKCdnQtaAgSKHJlSFxKHiH9ojhv9LiPaec7mzpiuKqYD5EqiLKTc9IczwaHlHNHMG8qk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1653050535; 
 s=zmail; d=icenowy.me; i=uwu@icenowy.me;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
 bh=gBXY50Hr95KuxeUxlVOTZnaUhvHZ5Aw8fPCec2+svQA=;
 b=YKAOFVrXIhNjMqXZSRb8klhBYjJL6kIupO+d5jYLNJxZD1jTgABgzwKG/P3RsAEz
 DNSR4/Vu9HKe5TNS/KQLjT8mEgQ8ayRr1rlldpBB1ezsL2DKB+VTt4jgYwSjESrVgMf
 BGSEEri6D7PbTd9Fmms+RS/rN7jEaM+VsXbW9l00=
Received: from edelgard.icenowy.me (59.41.160.101 [59.41.160.101]) by
 mx.zohomail.com with SMTPS id 1653050532902282.85132173993804;
 Fri, 20 May 2022 05:42:12 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH] hw/sd/allwinner-sdhost: report FIFO water level as 1 when
 data ready
Date: Fri, 20 May 2022 20:42:00 +0800
Message-Id: <20220520124200.2112699-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.18; envelope-from=uwu@icenowy.me;
 helo=sender4-op-o18.zoho.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

U-Boot queries the FIFO water level to reduce checking status register
when doing PIO SD card operation.

Report a FIFO water level of 1 when data is ready, to prevent the code
from trying to read 0 words from the FIFO each time.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 hw/sd/allwinner-sdhost.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/sd/allwinner-sdhost.c b/hw/sd/allwinner-sdhost.c
index 041e45c680..b66fd9bce7 100644
--- a/hw/sd/allwinner-sdhost.c
+++ b/hw/sd/allwinner-sdhost.c
@@ -114,7 +114,9 @@ enum {
 };
 
 enum {
+    SD_STAR_FIFO_EMPTY      = (1 << 2),
     SD_STAR_CARD_PRESENT    = (1 << 8),
+    SD_STAR_FIFO_LEVEL_1    = (1 << 17),
 };
 
 enum {
@@ -467,6 +469,11 @@ static uint64_t allwinner_sdhost_read(void *opaque, hwaddr offset,
         break;
     case REG_SD_STAR:      /* Status */
         res = s->status;
+        if (sdbus_data_ready(&s->sdbus)) {
+            res |= SD_STAR_FIFO_LEVEL_1;
+        } else {
+            res |= SD_STAR_FIFO_EMPTY;
+        }
         break;
     case REG_SD_FWLR:      /* FIFO Water Level */
         res = s->fifo_wlevel;
-- 
2.36.0


