Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B73371648
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 15:54:08 +0200 (CEST)
Received: from localhost ([::1]:54570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldZ1T-0006Ig-Ff
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 09:54:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1ldZ0Y-0005Yc-7U; Mon, 03 May 2021 09:53:12 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:45016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1ldZ0U-0006ir-D4; Mon, 03 May 2021 09:53:08 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 r26-20020a056830121ab02902a5ff1c9b81so1110136otp.11; 
 Mon, 03 May 2021 06:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m6EN8DcawZU/FGXw/PDaUJMKbLO5HoyLQ5YWRVcHSQs=;
 b=iZVg+h5EN7S2CaE1ufyMjzmWh25VYaIc4mUK519KrU/P2RWvClII1QB36Z59qYaWzL
 xErNlENbGiBJQkrJ5dh7GXWNPo5f6Kt8zzR88JsmZlpgyrK2xm4KMaTt3RlkVJs940Hd
 MxCigZVoW3mi1udmIh1l5oft5NXzXstshR5hQGUGrzX6o5peGQpWYGJFv0NO/2p+QbyI
 C3lBuHOp9hRpq+akSbdJ8GGCCpM1a7MosxtyMXAPaFqt47K8dN+fy2Uy8LG9tbCRKxvY
 F9zuZG5nEtCgItv30lDbkiyXkRyxKrWsySPs2zCxHZdqAfY2RqLzfm45ascHIW2dsE3i
 8/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=m6EN8DcawZU/FGXw/PDaUJMKbLO5HoyLQ5YWRVcHSQs=;
 b=i5KQzCDOoQUL2n3Fc5c64qYVBpXUQfrHtcu/OXGlXj0NiKaPQmJBt2zG5YcP1vRclr
 xU/HBRgzS34bq5k7D8JVTdRkdvHbQyPBDcUSaGM8KgGyXi/5AxbKfcjlR1h0u8y4Bh5u
 FDOX0snPkH8Kji6+GFJiHDV/cgVLBbeGYj7xFltReSx5JzwXDkIpqCZXn8oTDKdhVkRm
 efJFPoAuaZgwlozNssEe4pFMKTs7BwBaM0rz9Xqr0jU23vg4qE7osquiU8uHDf3FixE3
 uP4WwTB+4zuEeJQ03RJSPvTysW16EgtV9uxAm5Nypc+nK7dqwPbQHVzjyN8EBxv2UWXu
 bnZQ==
X-Gm-Message-State: AOAM532TRt06O57My8lUAopw2c3WWkz2uwcRt9RH3cmyY+xQ/IGgPkjA
 tm4Qtse1pzfYTCYk6jLooMA=
X-Google-Smtp-Source: ABdhPJwgrVEa9PwE4AUZd8adW/OvaNaq6Y1eVdxlHkXUCyw6aye3mvm5bOzC8JDM0Q/zOVq2neOBsg==
X-Received: by 2002:a05:6830:16ca:: with SMTP id
 l10mr13932056otr.240.1620049984253; 
 Mon, 03 May 2021 06:53:04 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id h184sm2783856oia.1.2021.05.03.06.53.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 06:53:03 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2] hw/net/imx_fec: return 0xffff when accessing non-existing
 PHY
Date: Mon,  3 May 2021 06:53:00 -0700
Message-Id: <20210503135300.3242369-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=groeck7@gmail.com; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Bin Meng <bmeng.cn@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If a PHY does not exist, attempts to read from it should return 0xffff.
Otherwise the Linux kernel will believe that a PHY is there and select
the non-existing PHY. This in turn will result in network errors later
on since the real PHY is not selected or configured.

Since reading from or writing to a non-existing PHY is not an emulation
error, replace guest error messages with traces.

Fixes: 461c51ad4275 ("Add a phy-num property to the i.MX FEC emulator")
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Reordered imx_phy_read/imx_phy_read_num in trace_events
    Added Reviewed-by:/Tested-by: tags

 hw/net/imx_fec.c    | 8 +++-----
 hw/net/trace-events | 2 ++
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index f03450c028..9c7035bc94 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -283,9 +283,8 @@ static uint32_t imx_phy_read(IMXFECState *s, int reg)
     uint32_t phy = reg / 32;
 
     if (phy != s->phy_num) {
-        qemu_log_mask(LOG_GUEST_ERROR, "[%s.phy]%s: Bad phy num %u\n",
-                      TYPE_IMX_FEC, __func__, phy);
-        return 0;
+        trace_imx_phy_read_num(phy, s->phy_num);
+        return 0xffff;
     }
 
     reg %= 32;
@@ -345,8 +344,7 @@ static void imx_phy_write(IMXFECState *s, int reg, uint32_t val)
     uint32_t phy = reg / 32;
 
     if (phy != s->phy_num) {
-        qemu_log_mask(LOG_GUEST_ERROR, "[%s.phy]%s: Bad phy num %u\n",
-                      TYPE_IMX_FEC, __func__, phy);
+        trace_imx_phy_write_num(phy, s->phy_num);
         return;
     }
 
diff --git a/hw/net/trace-events b/hw/net/trace-events
index baf25ffa7e..78e85660bf 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -414,7 +414,9 @@ i82596_channel_attention(void *s) "%p: Received CHANNEL ATTENTION"
 
 # imx_fec.c
 imx_phy_read(uint32_t val, int phy, int reg) "0x%04"PRIx32" <= phy[%d].reg[%d]"
+imx_phy_read_num(int phy, int configured) "read request from unconfigured phy %d (configured %d)"
 imx_phy_write(uint32_t val, int phy, int reg) "0x%04"PRIx32" => phy[%d].reg[%d]"
+imx_phy_write_num(int phy, int configured) "write request to unconfigured phy %d (configured %d)"
 imx_phy_update_link(const char *s) "%s"
 imx_phy_reset(void) ""
 imx_fec_read_bd(uint64_t addr, int flags, int len, int data) "tx_bd 0x%"PRIx64" flags 0x%04x len %d data 0x%08x"
-- 
2.25.1


