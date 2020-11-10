Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FCA2ACE75
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 05:14:54 +0100 (CET)
Received: from localhost ([::1]:44164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcL3V-00037t-C5
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 23:14:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=57671029a=alistair.francis@wdc.com>)
 id 1kcKy3-0004yY-N0
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 23:09:15 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:21673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=57671029a=alistair.francis@wdc.com>)
 id 1kcKxx-0000VN-QK
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 23:09:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604981602; x=1636517602;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L7ffLp3uieamQiOIYGo+Z1o4cytTVwbTBqJtRaVtWtM=;
 b=SFU1K4z2KNptRxAVF5+ihbYeFjBquHoPcYNzqcqkctsK3v77217NJFeJ
 rKC58Wi50cg0cYe0m6wfDQEHpKOMz10ByzkEiyyBedtO182EyZ6K6eXu2
 h3neyl1ll2N1FRa+I3BUjLvlOsw8k9fXmIt8N46XMf4d+mQcCoq29cX7p
 i8lAYQ/JBbSNzcWXjTGOnPS9+V2EuhM29pQCIpBm+obMQED9TtMOIPqHb
 tkxyUAnqEduSN/IYNmYP3oSbpxaeT5w82kzKKMKtzUX1UkJPev8IkS53z
 7tBp9mkCdRoEhf2OcUCCzm5LCHRR7EqBW9328iAyPPxTxTCHaOSeq76ix w==;
IronPort-SDR: HCbRacIzr3QaSZe50fCc5IzTtNnYL76hLqNjf/xnUnPWovxv15DGvSPqshZ+EJj4XV/HZxNgy+
 nS10qlbOWxN/M6g1ua4Ff7yqaFvxCcriiyXbXDbZ+LfHHnB6KsurjaM01ZGkxna88nNhmfeTPi
 cU7Lg5SyBo64qaYbGScKDNMqa1K0fXkNyM8p13lEC2r5megx2zL3H45AZZY0Jj+NlBwwloLxvd
 h2ViliPFUpeIgnnDFGVnveuOfLU1gTKTSYbgLa4ZdLIzb2yONge7d1zAj5smKXBfsYO04Qnokg
 ikw=
X-IronPort-AV: E=Sophos;i="5.77,465,1596470400"; d="scan'208";a="255803605"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Nov 2020 12:13:09 +0800
IronPort-SDR: kU4N0Annb4Ia8a8HH9S/t5tw23W+LxHs3JJbQS8bu+NrpaDtvdwrh7cz7eOaD0I5YFHqnHARmu
 E0uH47YYsEqGUYmGDkt56+6rEeD5eXxyBy+9kkyYkAhSLnDZJcIWawri8Uf6VifMaVSA3Ax4bC
 qp6+5gkaDDlkgTvC1jbnnxTn2RCnT6XhBFvCUfEL0dy/l+icdJaO2tmWLgsb2VOT1hjBwXrs3O
 3h3XMGoTur1Gm8dBeg7VRj6nYvH8iYKWya6/RT6TaN96RHKBkuaDc3UjN/rE3gIi+k4NEohlju
 RcDbEwiTlbiGFzIOP9OEnF3V
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2020 19:55:02 -0800
IronPort-SDR: rO0XqHEz9/pkAUhchlyGz1p8E7DH31COg352P1T+ncWxJX3/xP+cAH0Dn+C/nfgaA5XGe6ITnc
 DGLGab/O7s7IOfEgotMJ6WtdOn8G8whkujkfXoIMZwGqtPzTwaJ76cdJz50ewvSuxUDiGSIs6F
 JOjqEdbGis05xAsH9B9Z5y+EeXJeWlu0wiWFqflW/sfUxFGYAwl0US6Wm41eouv2sTkS546mfj
 yJdb8DyKQX68gJhAE6gSCplrv4lPIvcHkXqFfUImyolJyoY5Vd1r3fNDBY5EF3CysU95MJaXlq
 tQo=
WDCIronportException: Internal
Received: from usa001882.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.60.209])
 by uls-op-cesaip01.wdc.com with ESMTP; 09 Nov 2020 20:09:00 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 6/6] hw/intc/ibex_plic: Clear the claim register when read
Date: Mon,  9 Nov 2020 19:57:03 -0800
Message-Id: <20201110035703.83786-7-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201110035703.83786-1-alistair.francis@wdc.com>
References: <20201110035703.83786-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=57671029a=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 23:09:00
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After claiming the interrupt by reading the claim register we want to
clear the register to make sure the interrupt doesn't appear at the next
read.

This matches the documentation for the claim register as when an interrupt
is claimed by a target the relevant bit of IP is cleared (which we already
do): https://docs.opentitan.org/hw/ip/rv_plic/doc/index.html

This also matches the current hardware.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 68d4575deef2559b7a747f3bda193fcf43af4558.1604629928.git.alistair.francis@wdc.com
---
 hw/intc/ibex_plic.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/intc/ibex_plic.c b/hw/intc/ibex_plic.c
index f49fa67c91..235e6b88ff 100644
--- a/hw/intc/ibex_plic.c
+++ b/hw/intc/ibex_plic.c
@@ -139,6 +139,9 @@ static uint64_t ibex_plic_read(void *opaque, hwaddr addr,
         /* Return the current claimed interrupt */
         ret = s->claim;
 
+        /* Clear the claimed interrupt */
+        s->claim = 0x00000000;
+
         /* Update the interrupt status after the claim */
         ibex_plic_update(s);
     }
-- 
2.29.2


