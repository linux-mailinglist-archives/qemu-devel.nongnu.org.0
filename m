Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D257A370DCB
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 18:07:14 +0200 (CEST)
Received: from localhost ([::1]:55298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldEcf-0004ks-VK
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 12:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1ldEZB-0003Q2-2r; Sun, 02 May 2021 12:03:34 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:34374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1ldEZ9-0001wh-8z; Sun, 02 May 2021 12:03:32 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 x54-20020a05683040b6b02902a527443e2fso2985764ott.1; 
 Sun, 02 May 2021 09:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GXLZKDWHwAWGFvMF36BqtI9mjtBl2Wm+SvCo5t4JnnY=;
 b=uWuf0ic9uOnNwPT6JBBQJmJ7yoDI2qi+ZQq46vD1vWtLVkEZBBNYDp1itEF3Arc0FR
 sReYQR/ciDqp0FXF4o42PVHnFAVo47mpJ8bwBgP8zPOytFk4z5Xphnf8ZWHxNOykpsxb
 6WmOxAXXkuY1PBui7UqK3fvw+TnsTDRWExEWeuGTpMfTkL6wCUEB9lNDJscBy9loH01+
 i6YldVIdG+6j8UD+oiRUYTpEuJbdHdPNHn4DfZdU5Pr1HBU80wzeEZaZoFm4iW5oIZzN
 Q39NsainCpJtOaKaOUBbadJmUIZ3xhs/HCMho2ajScTuNdBymwfVSyKoOgWI5vVboqLe
 rB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=GXLZKDWHwAWGFvMF36BqtI9mjtBl2Wm+SvCo5t4JnnY=;
 b=h4w4uAgw4zex0Js9629ms0rLlq2nLZSSsoMVu6DMJrQ23LB1zp11Br0UCFnBQmxsB3
 7da3ysCvA/av+gNyXeEExTH8XMaxjF7UA5AyJ9YgECKzyo3Nn3mSTljpyu208/4K19et
 +M5q0kO4pV+rbylNi0uqBlBD5b2uIvnU3w46T1UroBtekzRsUadSJucALAU/EaYX6FJ+
 JpeHj1jQpeNQnYiDNezJVuM/ZbNYfbizPDQ1RG/Y2AJ3d/Uvpuf6wE0OLXEw6Aw7haK9
 QcRt4lUNI1zUDHEtNx6i0BMhS3dMBUe1pw2Y2hrEzKxTguAEUs3+0jaE43NyOcM83RDi
 XPEw==
X-Gm-Message-State: AOAM531T3oC+VJFbJMX6cP0EJpz9GsEeXNxGey3pR6GFfZsTso9M3gSp
 d+Rr/lOcMYYAPwU7ZoJhloA=
X-Google-Smtp-Source: ABdhPJxkEcH2uMpbffzueZ19rfxF6WRZfSwassBfduqzm2jEXv4lHaXPOlUezkteaUSkYOaDFTgKqQ==
X-Received: by 2002:a05:6830:781:: with SMTP id
 w1mr11400345ots.300.1619971408703; 
 Sun, 02 May 2021 09:03:28 -0700 (PDT)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net.
 [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id 88sm2230946otx.2.2021.05.02.09.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 09:03:28 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] hw/net/imx_fec: return 0xffff when accessing non-existing PHY
Date: Sun,  2 May 2021 09:03:26 -0700
Message-Id: <20210502160326.1196252-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=groeck7@gmail.com; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
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
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
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
index baf25ffa7e..ee77238d9e 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -413,8 +413,10 @@ i82596_set_multicast(uint16_t count) "Added %d multicast entries"
 i82596_channel_attention(void *s) "%p: Received CHANNEL ATTENTION"
 
 # imx_fec.c
+imx_phy_read_num(int phy, int configured) "read request from unconfigured phy %d (configured %d)"
 imx_phy_read(uint32_t val, int phy, int reg) "0x%04"PRIx32" <= phy[%d].reg[%d]"
 imx_phy_write(uint32_t val, int phy, int reg) "0x%04"PRIx32" => phy[%d].reg[%d]"
+imx_phy_write_num(int phy, int configured) "write request to unconfigured phy %d (configured %d)"
 imx_phy_update_link(const char *s) "%s"
 imx_phy_reset(void) ""
 imx_fec_read_bd(uint64_t addr, int flags, int len, int data) "tx_bd 0x%"PRIx64" flags 0x%04x len %d data 0x%08x"
-- 
2.25.1


