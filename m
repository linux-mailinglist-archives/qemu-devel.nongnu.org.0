Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 497333ECCEB
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 05:00:59 +0200 (CEST)
Received: from localhost ([::1]:53930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFSry-00068v-Cb
	for lists+qemu-devel@lfdr.de; Sun, 15 Aug 2021 23:00:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1mFSqP-0004b7-GD; Sun, 15 Aug 2021 22:59:21 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:40750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1mFSqN-00081b-Mk; Sun, 15 Aug 2021 22:59:21 -0400
Received: by mail-oi1-x22d.google.com with SMTP id r5so24881372oiw.7;
 Sun, 15 Aug 2021 19:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xte1c4gNT9wi+XoKUkRa6xmff7q9jFgfOLEpH53hWwE=;
 b=CU6ae9FJu0sG3qcfQEW4/YcBgJFRrep2SufXZxLo0HPzFW21AkgiLqhkmh2JPVc59D
 +N5vZkHpy3Rr2aVye9xd/ZH+N311msKwCAdYOnBf9oBJykr9+1+t1I8hBaSOpR35iYLy
 Qx8nxGGU3c8JvHda9dVQrJ4q5oS+wxIgCVRfOJYpeCQ3b3Et+srkAG2jsg07RCP/W1KV
 WQqYvob25dzckpID7CndRsHG0pp0rWIg4zqiegLHAbLFe1vQP3sJJFppOajT/VJXYCNI
 jLulyoEUeCMtrpdCmlZ86tRzQuRVVuU3/kA90xRAUwsHIwEpuR3id5TIw1diQYv4aZHD
 CfXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Xte1c4gNT9wi+XoKUkRa6xmff7q9jFgfOLEpH53hWwE=;
 b=NSDtstPSeEqM5VF5/tByIKR051Bhh7oIG6skPh4vJaAcuU7avgmgAHva5iDiqSgRPh
 As1Mhf2Ot4j7HIIurIAiS4GyQRNK80HfQWdLtjxJoGlqiSrAKKhulcxmKOaq3iWEF0aY
 VkgkXHSkms3wO4+n9kpZ3SC4GLgfugP+izZkqeAZepyPdi3zAaKlwNNUKv6V+P4QOYGg
 vx0RBMKOg4KQx2GOLg5abe5qBj0sJvXlrR4vnuwOW9+2plB0Jpyc7PaqZIbCBNy1soc9
 ylnO4ndmz0Q3/Gpjd1nEunRezHbMmzal+HLAoisiEEHZKMTNIyKD32ddCF21azMGldeE
 WwCg==
X-Gm-Message-State: AOAM5329umBIoztzjG9CymX95bk4fSCx/STfzTLMtqVHvzBcpKYDRBpt
 mNQq5oCAKsAeKV1pRLiF7pQ=
X-Google-Smtp-Source: ABdhPJwh7LMpTE7hckqT0H4QZvkNGYtmJ+9SpN8d2uckFhOKM1MFuwxCvAG/30/legBrs2XP172img==
X-Received: by 2002:aca:a996:: with SMTP id s144mr9867358oie.175.1629082757659; 
 Sun, 15 Aug 2021 19:59:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id t1sm319578otp.9.2021.08.15.19.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Aug 2021 19:59:17 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH] hw: ppc: sam460ex: Disable Ethernet devicetree nodes
Date: Sun, 15 Aug 2021 19:59:15 -0700
Message-Id: <20210816025915.213093-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=groeck7@gmail.com; helo=mail-oi1-x22d.google.com
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
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 Guenter Roeck <linux@roeck-us.net>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

IBM EMAC Ethernet controllers are not emulated by qemu. If they are
enabled in devicetree files, they are instantiated in Linux but
obviously won't work. Disable associated devicetree nodes to prevent
unpredictable behavior.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 hw/ppc/sam460ex.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 0737234d66..feb356e625 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -194,6 +194,14 @@ static int sam460ex_load_device_tree(hwaddr addr,
         _FDT(fdt_nop_node(fdt, offset));
     }
 
+    /* Ethernet interfaces are not emulated */
+    offset = fdt_node_offset_by_compatible(fdt, -1, "ibm,emac-460ex");
+    while (offset >= 0) {
+        _FDT(fdt_setprop_string(fdt, offset, "status", "disabled"));
+        offset = fdt_node_offset_by_compatible(fdt, offset, "ibm,emac-460ex");
+    }
+
+
     /* set serial port clocks */
     offset = fdt_node_offset_by_compatible(fdt, -1, "ns16550");
     while (offset >= 0) {
-- 
2.25.1


