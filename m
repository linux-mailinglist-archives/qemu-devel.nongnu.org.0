Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD82678F50
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 05:36:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKAya-0002HZ-SB; Mon, 23 Jan 2023 23:32:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKAyY-0002Gm-Dw
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 23:32:02 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKAyW-0002LU-Ox
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 23:32:02 -0500
Received: by mail-pl1-x630.google.com with SMTP id jl3so13571354plb.8
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 20:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9PWo/3yuXwCzGwiugSwLMDSJ6LiuTMrmM+EjkJDwWIM=;
 b=JVAt81e9UvMSonYRkhin1kqOKWnk258zAnSkpWL4K2gH+u3IZHhfFwANRsjc5fNops
 xKpcG4XF+R9NuHVg2c6/J/Z+PnIsaw2xWgcQyLqmSYSNERhpHqWoSJ+/saumCSYZVW/f
 uy4pWjawJK6BR0XC9rVnGtv6LqwizfKLP92DosOqySAs8UWBPidTfxOc3hX6nIOEeNLT
 MGFxgeEpMQCsqpVSZwvcUCwqt11dKzlPk8b8GtSUVJstKGX2IVVH4NeZKLD9AaDyfN4i
 hUH3zYrM1C4r3rVVwVfEL4sBFZztoN5wEmYUpHFC0DlBxVOA61iyb973wQLc3nlpegFE
 YqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9PWo/3yuXwCzGwiugSwLMDSJ6LiuTMrmM+EjkJDwWIM=;
 b=5HuGq0uPTx9EG4wYz3tXVoGBRluOpsiOB9ppDV9pVnsZxMKmEMjjGdCBc9jOnoIsy7
 nM72gHWzuVS7/uCeqbhIUPVwL5XxgLRPf0J57mIkKCM/ULrdcoo5cm292YZ3AxqDGBWW
 YKEnxk4DJqD1F58lj/Jv6A833CZxX2JH4m7mtzWh96ksadu6yNULbBzs6dAE+KGa24Mr
 cJt2SRXjvxSuAWHJncdbVuzjPz50SlaKRkEmfDPTpx8udp1ktVInaSxki7G5i8/7b0Qn
 pnaLIJyOVHKbnIhJcYVrHx8aXPxvM3wJbEIZdRUlbRPQ6gb7LCB3u5CwFFdW6BzVsYQ2
 zXnw==
X-Gm-Message-State: AFqh2kpegh8x27ZpkQUmEHFrEXdu2V3bGc2fdZnoEoFEu36ORbuGBeHU
 MYYNjljpZnC7VtTB0amA9SpvXw==
X-Google-Smtp-Source: AMrXdXtzWUtXw3kVcdekZ9K+DhNBK2PCfC16gsYa55dk0z1uGpFulc/lBZ7B2Ghcc9D0eHO2jxCVhQ==
X-Received: by 2002:a17:903:32c1:b0:194:7c95:dc3c with SMTP id
 i1-20020a17090332c100b001947c95dc3cmr37583208plr.12.1674534719617; 
 Mon, 23 Jan 2023 20:31:59 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a170902708500b00196030312ccsm548033plk.78.2023.01.23.20.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 20:31:59 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v2 02/26] hw/net: Add more MII definitions
Date: Tue, 24 Jan 2023 13:31:19 +0900
Message-Id: <20230124043143.5515-3-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124043143.5515-1-akihiko.odaki@daynix.com>
References: <20230124043143.5515-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::630;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The definitions will be used by igb.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 include/hw/net/mii.h | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/hw/net/mii.h b/include/hw/net/mii.h
index 4ae4dcce7e..c6a767a49a 100644
--- a/include/hw/net/mii.h
+++ b/include/hw/net/mii.h
@@ -81,20 +81,31 @@
 #define MII_ANLPAR_ACK      (1 << 14)
 #define MII_ANLPAR_PAUSEASY (1 << 11) /* can pause asymmetrically */
 #define MII_ANLPAR_PAUSE    (1 << 10) /* can pause */
+#define MII_ANLPAR_T4       (1 << 9)
 #define MII_ANLPAR_TXFD     (1 << 8)
 #define MII_ANLPAR_TX       (1 << 7)
 #define MII_ANLPAR_10FD     (1 << 6)
 #define MII_ANLPAR_10       (1 << 5)
 #define MII_ANLPAR_CSMACD   (1 << 0)
 
-#define MII_ANER_NWAY       (1 << 0) /* Can do N-way auto-nego */
+#define MII_ANER_NP         (1 << 2)  /* Next Page Able */
+#define MII_ANER_NWAY       (1 << 0)  /* Can do N-way auto-nego */
 
+#define MII_ANNP_MP         (1 << 13) /* Message Page */
+
+#define MII_CTRL1000_MASTER (1 << 11) /* MASTER-SLAVE Manual Configuration Value */
+#define MII_CTRL1000_PORT   (1 << 10) /* T2_Repeater/DTE bit */
 #define MII_CTRL1000_FULL   (1 << 9)  /* 1000BASE-T full duplex */
 #define MII_CTRL1000_HALF   (1 << 8)  /* 1000BASE-T half duplex */
 
+#define MII_STAT1000_LOK    (1 << 13) /* Local Receiver Status */
+#define MII_STAT1000_ROK    (1 << 12) /* Remote Receiver Status */
 #define MII_STAT1000_FULL   (1 << 11) /* 1000BASE-T full duplex */
 #define MII_STAT1000_HALF   (1 << 10) /* 1000BASE-T half duplex */
 
+#define MII_EXTSTAT_1000T_FD (1 << 13) /* 1000BASE-T Full Duplex */
+#define MII_EXTSTAT_1000T_HD (1 << 12) /* 1000BASE-T Half Duplex */
+
 /* List of vendor identifiers */
 /* RealTek 8201 */
 #define RTL8201CP_PHYID1    0x0000
-- 
2.39.0


