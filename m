Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4828C2D7031
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 07:30:38 +0100 (CET)
Received: from localhost ([::1]:34558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knbwq-0002w5-J1
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 01:30:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1knbuk-0001GU-3J; Fri, 11 Dec 2020 01:28:26 -0500
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:34282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1knbug-0003iC-5G; Fri, 11 Dec 2020 01:28:25 -0500
Received: by mail-io1-xd41.google.com with SMTP id i18so8355022ioa.1;
 Thu, 10 Dec 2020 22:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=8CiZONs/0FUs0PRSAs0b/ZuLxjy8qQPfIAgJKkHywgk=;
 b=VNJ3LDkvIFD/hwJwb2/ynca3hMKVeG6kEQzUR4hVAAXwL9uCaRtEMyb6SMdlzNxBMK
 u7dEhQvJ102ijzK6BoBcu+GXsoU9Aj8b7oG9AYrCNW/ouO/Dskwe3rgVllnPa2GmO5lq
 B1IA4vrbki8r5Yh6bp8IXOVSn0sOGMjodRBcKiZ8FX1FAflQ9snryHlpDgB2c1fm6Pl8
 RAq5AZk6EjMjwTlI03wwjPVaoA4Rg8Q8nn+pvP8xqa4NFsIBZ0l6rAWs3I7D3u2+lEz5
 UMqBS7+uxs2Lfg/kClfNcIHVq4ojHOqUQIG8i/Ip+xixrMJWS9uV9QqzhU6hYJHxSHXN
 AFvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=8CiZONs/0FUs0PRSAs0b/ZuLxjy8qQPfIAgJKkHywgk=;
 b=FqiHwaiifwOLD8ZB6lM8+8P2PB1PGDnk/6qBhaarATNmXicITrxVSh98QKiAC550B+
 eJ3VzyCSiXLmk8TrTj53EvvEUduaig5DJRQoWhYGP34zYEbVu479zv+pkwPEwYI8WkMI
 TNAv7xS9npGTEFjIehB9/svXoX+kOPuMXQDMSVwt+ClDRxPgYe5K9V2TSMQ4MwRrTnCd
 oSOEYDXpe4QlzSqZNdUtgaFPOjXWWl7sy9SOnhGkg5+qV9gEIVYqg/VrLJIU1KH35Tu7
 cSm0ttfKh6kX6Y+EsUdVO43dCtHT1YgTsWUqzNJdpB5BoV+CX2dKznBHT1nYAuFie46h
 wpwQ==
X-Gm-Message-State: AOAM5315aumry3sYioJldrf/iKrRHVz6li90VlOzae6S0VYZPOWcU3pD
 B201GkI1iURpFmEjdWHCYcE=
X-Google-Smtp-Source: ABdhPJz55u2Q+RysUGJ+YYkb1be1Yc84CcIIn9OD2Ryh6d5eK6T7QhkWEyaYQpMG1yXUsv8t6in+IQ==
X-Received: by 2002:a6b:3118:: with SMTP id j24mr13017366ioa.171.1607668100352; 
 Thu, 10 Dec 2020 22:28:20 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com.
 [147.11.124.94])
 by smtp.gmail.com with ESMTPSA id e25sm3672262iom.40.2020.12.10.22.28.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Dec 2020 22:28:19 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] hw/block: m25p80: Don't write to flash if write is
 disabled
Date: Fri, 11 Dec 2020 14:28:10 +0800
Message-Id: <1607668091-33396-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=2607:f8b0:4864:20::d41;
 envelope-from=bmeng.cn@gmail.com; helo=mail-io1-xd41.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

When write is disabled, the write to flash should be avoided
in flash_write8().

Fixes: 82a2499011a7 ("m25p80: Initial implementation of SPI flash device")
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v2:
- new patch: honor write enable flag in flash write

 hw/block/m25p80.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 483925f..236e1b4 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -594,6 +594,7 @@ void flash_write8(Flash *s, uint32_t addr, uint8_t data)
 
     if (!s->write_enable) {
         qemu_log_mask(LOG_GUEST_ERROR, "M25P80: write with write protect!\n");
+        return;
     }
 
     if ((prev ^ data) & data) {
-- 
2.7.4


