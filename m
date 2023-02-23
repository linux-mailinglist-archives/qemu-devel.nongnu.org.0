Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDCE6A05F5
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 11:22:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV8ie-0005tO-9u; Thu, 23 Feb 2023 05:20:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8ib-0005sn-9d
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:20:54 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8iZ-00016b-RP
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:20:53 -0500
Received: by mail-pl1-x62b.google.com with SMTP id l15so13372528pls.1
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 02:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mc6N+3X4DyWhP6LHvz3xiMiOtzW5YFnluXUsmSP0zdw=;
 b=bXdx5tZURqiMcloATSuB+Fi8uaKCVz2icK42YkcP2huR1AECt0IsatlmdBb/7LQW0O
 6d13Flbs6OuHM+2/lQk1xWpx/sslCvjFgDhzqz0F32FfRPaASdjGBzxB2M6XYPZ+f097
 hYYlhRIj62yasnZ8G2PBBb1Xwzh7W0yTKyzwn+EkMKHxTzW87EfixLhr6LZS/NvekkPC
 eAryowJP4cfAbWrLob5Eyiox8ReMr2+TjFqBvBaogXBm4pwx2AYkR36iHGPdVlR0xdY5
 5lg31P4czWwa++3WZYGKWjhf2bneBahGxQ5oAmIN1gxC+1DTbBtlLDvAsgnmwDfWWFd2
 HH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mc6N+3X4DyWhP6LHvz3xiMiOtzW5YFnluXUsmSP0zdw=;
 b=XAYyjU4bA53kAs0oG/55fPydbXIGEmtGnstzCNYw3QW4kI2xt6V8nmiRQba/FaTLo9
 qJleFgJBn99i9+zBky4bwsJlQSpnRXtoIveBb2ULFB7Vb5qKuw75Dyfa71nqFd8VXfyb
 rJCmcYKdxA6xmgZmUMNWcCrCiS+kJ/rQoTB9PYFNaTQC1rd+DJU26KPmf/CTJRQHvG7+
 PPA6dpB+Le7kYRoIu0M/DAX+92hiS+EaoZG5c1UCs6GzZzQcxS1oeoyZGAQFqqqvJ1cg
 /TAPubw6wxEDYeA1/nyijfGpFjniBc7Gj18zuKg8Xc2rby81r9ZK2xJeDjcZXw5lJrwe
 r/Ew==
X-Gm-Message-State: AO0yUKW8nHizTQ4u8vby9cSZa3NMOJaNpWLQsMleA7lFBeR2kMfukAp4
 ZBD6L328FbW6l2R3JeIDzMp0qQ==
X-Google-Smtp-Source: AK7set8zQYzO7YDWmw20LUJkXD4UOE2Y7FdYnH41bMoxLJVaph45tUwqGWDR5sk3yxEwNcWe2TGBlQ==
X-Received: by 2002:a17:903:124a:b0:196:8d33:f083 with SMTP id
 u10-20020a170903124a00b001968d33f083mr13764226plh.28.1677147650408; 
 Thu, 23 Feb 2023 02:20:50 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 c20-20020a170902c1d400b00196217f1219sm4107734plc.70.2023.02.23.02.20.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 02:20:50 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Alexander Bulekov <alxndr@bu.edu>, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v6 02/34] hw/net: Add more MII definitions
Date: Thu, 23 Feb 2023 19:19:46 +0900
Message-Id: <20230223102018.141748-3-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223102018.141748-1-akihiko.odaki@daynix.com>
References: <20230223102018.141748-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62b.google.com
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
2.39.1


