Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 884D337705D
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 09:24:08 +0200 (CEST)
Received: from localhost ([::1]:48430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfHJn-0000aX-Gi
	for lists+qemu-devel@lfdr.de; Sat, 08 May 2021 03:24:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lfHF7-0007f9-H5
 for qemu-devel@nongnu.org; Sat, 08 May 2021 03:19:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lfHF4-0003Wl-I6
 for qemu-devel@nongnu.org; Sat, 08 May 2021 03:19:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620458353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tu3xj+P5G+P+qA7gb1FXdnImzi6Dqow/Zz0ymRZgnAo=;
 b=AdEeX520iqlCi/hMc0J2DMJx/YUKdhh7pWb9MLQx9T1w/bvqv7M2mBGap0S5wtGkp5nY1+
 YwMrw0SSDFlnmaKALMWPA/Q4mes031PAkAWH7PbTw7d10+ZXhiG68PouZBeOQ8x5wLgHZT
 9Xv8y90yo2LTUVxEAhYMHKAhw5tP8CA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364--HlWHDD7NcabNNQjT0NqmA-1; Sat, 08 May 2021 03:19:09 -0400
X-MC-Unique: -HlWHDD7NcabNNQjT0NqmA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4B826D581;
 Sat,  8 May 2021 07:19:08 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-13-172.pek2.redhat.com
 [10.72.13.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B92BC5C3FD;
 Sat,  8 May 2021 07:19:06 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL 08/10] hw/net/imx_fec: return 0xffff when accessing
 non-existing PHY
Date: Sat,  8 May 2021 15:18:37 +0800
Message-Id: <1620458319-5670-9-git-send-email-jasowang@redhat.com>
In-Reply-To: <1620458319-5670-1-git-send-email-jasowang@redhat.com>
References: <1620458319-5670-1-git-send-email-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Guenter Roeck <linux@roeck-us.net>

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
Reviewed-by: Philippe Mathieu-Daud茅 <f4bug@amsat.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/imx_fec.c    | 8 +++-----
 hw/net/trace-events | 2 ++
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index f03450c..9c7035b 100644
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
index baf25ff..78e8566 100644
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
2.7.4


