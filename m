Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7B14D8C55
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 20:25:44 +0100 (CET)
Received: from localhost ([::1]:35220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTqK8-0005VG-2i
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 15:25:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nTqFA-0002Mn-2Q
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 15:20:37 -0400
Received: from [2a00:1450:4864:20::12f] (port=40846
 helo=mail-lf1-x12f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nTqF5-0007dT-IF
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 15:20:35 -0400
Received: by mail-lf1-x12f.google.com with SMTP id 3so29013759lfr.7
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 12:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jetbrains.com; s=googleapps;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TocqvUgt8oYqDt7ijO5+PrJ/oIA8D+p+ZMbp4ehOtYs=;
 b=LwMTvyvKnV7go2Nh4NkDhwtxl9LPiSFlyfMGdn8xv3qaW3TxCv4yPzynf+Q/Zi6qQ2
 N0JarO2CkubgR7KGjst1sn73F5iAGRkpkxTRbr/qAK1+70ATxoiLhWANckOf8XYNiBgK
 Py5jpfK3ik6v8iwgJ6jrlQorIXqw78ywSDiZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TocqvUgt8oYqDt7ijO5+PrJ/oIA8D+p+ZMbp4ehOtYs=;
 b=mVJ/CXDp7/ZbBQY+QAGFeE/iWsCcgm7ptM5GCElkBN1h5xHKjNObqk2aDwjen81vc5
 vXfDyxHz4QWyMj7Ib7ZuGes/ZerSLoS8ZKgqonJG16AJ6OGrFqPd+m+azbWZPZPpzmU6
 Rn12bwOr6yjcwT9QgxiW5GxSq6kwTTXKiSQ3LHIPeei/SEdp1jlVBAcJ/aX2V3wrOQkl
 /so4jMjCK7uCXfGBG7S7R2CTHw86XjT0cXAxvU3WsVh6KlARP0Usvs3NN7Ya0Q8OrxCe
 IkuFsg9u/2NGtBiCBI0mYxudHDVy5b6+3qRl8M+/ZKUm2IcCCJXOTvKodK73px8wonU7
 SHPQ==
X-Gm-Message-State: AOAM530tQD9+hQuUzGmyW9fRlwDbqwTD3Sa4Zq10yGVCnzl+US1EjvWT
 tAarPiT9U3J9kkkVatjEF6WqhMEe1KXIKdOv
X-Google-Smtp-Source: ABdhPJylA+7di+oxKakJSkAGr1BX3uyh5OMSbh3rQFINqVFP2EtKZ8lYOMjtP4Hn53/lsAOf4FObFA==
X-Received: by 2002:ac2:4e52:0:b0:443:b1a0:1c2 with SMTP id
 f18-20020ac24e52000000b00443b1a001c2mr14810265lfr.444.1647285628100; 
 Mon, 14 Mar 2022 12:20:28 -0700 (PDT)
Received: from UNIT-808.labs.intellij.net ([91.132.204.20])
 by smtp.gmail.com with ESMTPSA id
 j15-20020a196e0f000000b0044827945789sm3414454lfc.155.2022.03.14.12.20.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 14 Mar 2022 12:20:27 -0700 (PDT)
From: Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com>
X-Google-Original-From: Vladislav Yaroshchuk
 <Vladislav.Yaroshchuk@jetbrains.com>
To: qemu-devel@nongnu.org
Cc: jasowang@redhat.com, r.bolshakov@yadro.com, eblake@redhat.com,
 phillip.ennen@gmail.com, phillip@axleos.com, akihiko.odaki@gmail.com,
 armbru@redhat.com, hsp.cat7@gmail.com, hello@adns.io, roman@roolebo.dev,
 peter.maydell@linaro.org, dirty@apple.com, f4bug@amsat.org,
 agraf@csgraf.de, kraxel@redhat.com, alex.bennee@linaro.org,
 qemu_oss@crudebyte.com,
 Vladislav Yaroshchuk <Vladislav.Yaroshchuk@jetbrains.com>
Subject: [PATCH v16 6/7] net/vmnet: update qemu-options.hx
Date: Mon, 14 Mar 2022 22:15:44 +0300
Message-Id: <20220314191545.81861-7-Vladislav.Yaroshchuk@jetbrains.com>
X-Mailer: git-send-email 2.34.1.vfs.0.0
In-Reply-To: <20220314191545.81861-1-Vladislav.Yaroshchuk@jetbrains.com>
References: <20220314191545.81861-1-Vladislav.Yaroshchuk@jetbrains.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=vladislav.yaroshchuk@jetbrains.com;
 helo=mail-lf1-x12f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Vladislav Yaroshchuk <Vladislav.Yaroshchuk@jetbrains.com>
---
 qemu-options.hx | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/qemu-options.hx b/qemu-options.hx
index 5ce0ada75e..ea00d0eeb6 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2743,6 +2743,25 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
 #ifdef __linux__
     "-netdev vhost-vdpa,id=str,vhostdev=/path/to/dev\n"
     "                configure a vhost-vdpa network,Establish a vhost-vdpa netdev\n"
+#endif
+#ifdef CONFIG_VMNET
+    "-netdev vmnet-host,id=str[,isolated=on|off][,net-uuid=uuid]\n"
+    "         [,start-address=addr,end-address=addr,subnet-mask=mask]\n"
+    "                configure a vmnet network backend in host mode with ID 'str',\n"
+    "                isolate this interface from others with 'isolated',\n"
+    "                configure the address range and choose a subnet mask,\n"
+    "                specify network UUID 'uuid' to disable DHCP and interact with\n"
+    "                vmnet-host interfaces within this isolated network\n"
+    "-netdev vmnet-shared,id=str[,isolated=on|off][,nat66-prefix=addr]\n"
+    "         [,start-address=addr,end-address=addr,subnet-mask=mask]\n"
+    "                configure a vmnet network backend in shared mode with ID 'str',\n"
+    "                configure the address range and choose a subnet mask,\n"
+    "                set IPv6 ULA prefix (of length 64) to use for internal network,\n"
+    "                isolate this interface from others with 'isolated'\n"
+    "-netdev vmnet-bridged,id=str,ifname=name[,isolated=on|off]\n"
+    "                configure a vmnet network backend in bridged mode with ID 'str',\n"
+    "                use 'ifname=name' to select a physical network interface to be bridged,\n"
+    "                isolate this interface from others with 'isolated'\n"
 #endif
     "-netdev hubport,id=str,hubid=n[,netdev=nd]\n"
     "                configure a hub port on the hub with ID 'n'\n", QEMU_ARCH_ALL)
@@ -2762,6 +2781,9 @@ DEF("nic", HAS_ARG, QEMU_OPTION_nic,
 #endif
 #ifdef CONFIG_POSIX
     "vhost-user|"
+#endif
+#ifdef CONFIG_VMNET
+    "vmnet-host|vmnet-shared|vmnet-bridged|"
 #endif
     "socket][,option][,...][mac=macaddr]\n"
     "                initialize an on-board / default host NIC (using MAC address\n"
@@ -2784,6 +2806,9 @@ DEF("net", HAS_ARG, QEMU_OPTION_net,
 #endif
 #ifdef CONFIG_NETMAP
     "netmap|"
+#endif
+#ifdef CONFIG_VMNET
+    "vmnet-host|vmnet-shared|vmnet-bridged|"
 #endif
     "socket][,option][,option][,...]\n"
     "                old way to initialize a host network interface\n"
-- 
2.34.1.vfs.0.0


