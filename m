Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C1F67C903
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 11:49:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKzni-0002xv-W7; Thu, 26 Jan 2023 05:48:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKzmx-0002Zt-IQ
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 05:47:35 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKzmv-0005Jc-Vh
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 05:47:27 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 b24-20020a17090a551800b0022beefa7a23so4856615pji.5
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 02:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9PWo/3yuXwCzGwiugSwLMDSJ6LiuTMrmM+EjkJDwWIM=;
 b=n8MfkFq3SNDnliPk1KhbllcaFuOWba52bAchN1CTWPfb9gcjCF2cPWWsStWii1tb6h
 JrKPsPj6Dsdf0OcoMSRhNcJz3ng/ehrshpvZZa2dveru8C8zZ7VsTTPpZGkX71ylvVWW
 NJYvJJ+x5SjjZi85XvEpGxOHYPT3w00BDxyCo74gVsvjO1tdbE/ZeVBI7QGhORkuCYN0
 eX3fipJHVjw3sn4NRsOka1IUFxM5PYqPk7I2vx8t44E/2dItEzxMIDzJJNYyTFZMhU0t
 isUs8S3gVA7fbzFhb8KX9gpc0G7ncjycLBqysUjAp8LDDCtIUYj1QEMpjVj8gYBzrEDQ
 MuKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9PWo/3yuXwCzGwiugSwLMDSJ6LiuTMrmM+EjkJDwWIM=;
 b=RnTatWnnVim3fFisnqWF3ZxMRvbsY3He0/h4IsR6dLfwGMdmae8Xyj8NXTjuL0IwPc
 qRHLNAqqyPPll1V0FDGoVq3iBO6N3aVNjcvhU8AQ5rgI/5ZVxoNCc9nQQc5n21Jbwesy
 ms1aICbW4uQG9uIiFaxLLPKmaA9UnYJ9OtDrPKc5l4QPF2365LhChuKxR3E+sbP+nQNa
 +pEpEAZG1oICDdCYN1G3h+fy8r22zQBVm2uXMdllnSFwCmgns1pU5aUtACeeB6g7axMd
 oGAjgvisKCzR6iBkEugzIXsb+d+qrI8RhixPOurKfRpbAX/n8kjzw1Wj/3VOd/tsH5n6
 JStw==
X-Gm-Message-State: AFqh2koNI3bbOiqR/E0ERNkosCLrPM+AITXF2zRnGmgxo3ej5H2q4vkS
 o5KfdAVXCh+Zx600e2x8w1FP5A==
X-Google-Smtp-Source: AMrXdXtwnimqxkSlrL092cogwsPs8l5+JHHVIbMPdvRB/dNw/jMt1vxhpyTuc0UHZEX3jwEhpWP+Xg==
X-Received: by 2002:a05:6a21:339a:b0:b6:4270:6dfc with SMTP id
 yy26-20020a056a21339a00b000b642706dfcmr46161246pzb.6.1674730044545; 
 Thu, 26 Jan 2023 02:47:24 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a63af48000000b0046b1dabf9a8sm496789pgo.70.2023.01.26.02.47.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 02:47:24 -0800 (PST)
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
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v3 02/26] hw/net: Add more MII definitions
Date: Thu, 26 Jan 2023 19:46:41 +0900
Message-Id: <20230126104705.35023-3-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126104705.35023-1-akihiko.odaki@daynix.com>
References: <20230126104705.35023-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1035;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1035.google.com
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


