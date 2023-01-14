Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D82A566A937
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 05:27:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGXiA-0008PF-Ed; Fri, 13 Jan 2023 23:00:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pGXi3-0008JF-Py
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 23:00:02 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pGXi1-0005Hx-QQ
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 22:59:59 -0500
Received: by mail-pl1-x631.google.com with SMTP id k18so1284284pll.5
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 19:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9PWo/3yuXwCzGwiugSwLMDSJ6LiuTMrmM+EjkJDwWIM=;
 b=JrvQWGn7Kxdl8VjWLbjPV2FcphQxxIVyDQMZjvLZAYwjo5Iuv2IQf6Gg6g8591cJGO
 L3NHBU2XTncX466mUZ3w9jRkmqPK8AagOch1XrJhwPvwfb9zYk9Z5dxspD7WIpOnFBFO
 ZBDEMiNfmk4HgZog8XTkiKICO7PtkyhTpQL05wX+wCJwnYLUk3v0kJxd4ob2iBQJPmUM
 T5sGwYXMUr01db3QgKGI+wKQk78pfuwFOsZuoAx1avIoIknqz0wmCbIdzfTakQNkiSI/
 JbpyZKQ0e0OncnnI7PHf/q80pcnMYSE2xRcG5cP/FZ567FC7LrMSdcJZ6YWxQbux4Ec7
 BhQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9PWo/3yuXwCzGwiugSwLMDSJ6LiuTMrmM+EjkJDwWIM=;
 b=c8Eu+Eah8jDxgEDpn4hGYVpu9nhTIdhXRj21GSYzzpVC4IAIvWlBfFbx1gUhNqrpDW
 rE/sEF5q4xBcISNjZBkiswL798l5ITYltKk2nj20CYrBn5lveVdkozGIQaMllB2XJ0dX
 rHt4vQEGWJFJQl11czCq14c/gSZsV0pTod7k/xRwfrtfdKiX7GH92DBgqMUV9e4oNgs8
 h9OUdizz428SFBap35mYNQk3W15Y6D0c1iTGUFYzefDzH/jKBcjkKg3tSPFYmFwmGuT+
 dr+0IvPgwoYaTeeLvu7V+ea2xMreerNCYgZZQ9wvuhpZ+Cq0C4jxshA5csovt6F64twP
 79pg==
X-Gm-Message-State: AFqh2kpsGEPuZw5vCuhIH/qC1JwAak2xliz4D8ul1LEh8uk/qHNnSi1k
 YxCmKCKS1hC4Z2sEtaYRdxzzO9Q+cqU0b/67
X-Google-Smtp-Source: AMrXdXudTD2WJ4d3HYtOvK5ure7cttTqkZ4Ou25x69uwwqCmvyk9Fd37pD7DjcSWO70Y1GnwYDr1yQ==
X-Received: by 2002:a17:902:7d89:b0:191:420e:e6b1 with SMTP id
 a9-20020a1709027d8900b00191420ee6b1mr12148754plm.32.1673668796524; 
 Fri, 13 Jan 2023 19:59:56 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a170902868f00b00189fdadef9csm910894plo.107.2023.01.13.19.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 19:59:56 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 02/19] hw/net: Add more MII definitions
Date: Sat, 14 Jan 2023 12:59:02 +0900
Message-Id: <20230114035919.35251-3-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230114035919.35251-1-akihiko.odaki@daynix.com>
References: <20230114035919.35251-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::631;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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


