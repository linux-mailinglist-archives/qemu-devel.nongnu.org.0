Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB5F4D99C0
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 11:57:48 +0100 (CET)
Received: from localhost ([::1]:39936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU4s7-0002CK-V3
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 06:57:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nU412-0007d2-1x
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 06:02:56 -0400
Received: from [2a00:1450:4864:20::235] (port=46897
 helo=mail-lj1-x235.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nU40w-00017J-Oq
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 06:02:55 -0400
Received: by mail-lj1-x235.google.com with SMTP id u7so25638215ljk.13
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 03:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jetbrains.com; s=googleapps;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TocqvUgt8oYqDt7ijO5+PrJ/oIA8D+p+ZMbp4ehOtYs=;
 b=PTEdc/pWcjmWItcAwKZlzkhs+sjCd9nf/tVtJ5iwwyu5ggT6DRZVgxM84T+IPysQXX
 5Oho4hwpOC/M5AFGpZqfR/120hUDEscILtvHZwCA13mNSl8epHMW/yyz9xbeGf0roSoY
 MY4rb84Hv+VhcKGdODebZmrHvS28wZduQ3YHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TocqvUgt8oYqDt7ijO5+PrJ/oIA8D+p+ZMbp4ehOtYs=;
 b=IZgoAp40KI0RQvm2qOxUGW9/BSJMu+Wk9XZWjN9K0FA/zbJl15EaP4/t3R/U0r1AUj
 2qPXmYf/+8mHcrq+CTKGpmK84JWh0w487TXFEQ2XvvURdG1HOt7oYLu0RmQSYrzV3oTA
 HqCKuuyNbkq+9REK2uFFAfS+6tmng51HWMC82a5rdUAL7oiwXK2P0Q2soZtLi7t+mIFO
 6GayzdkrJ64akstkhVvne6Yy+8P8KulJJ/8GN1gKh5azYIyUwThLFlon3pFxFTsdJynj
 ta15JkmWVjUIC5KStO+cwGvm5MicroEnHaL2Nu67SL563YVQX3L9W9UX+wz0W2PPlCuY
 qdKA==
X-Gm-Message-State: AOAM530tN8jOvs7zfUsVYbCGwrMqML9i4RT4aVTcXbdEinl/fLPyxDS8
 leZQ25RsNhvIGtU81FnyHi0dmHVrExQteB5Y
X-Google-Smtp-Source: ABdhPJyFRcu+yJFgeuKW946ev8d1aaiZQHxgZJo6itRHOXju6bjD3gE1sRMScVGkyc+q/NF7DJYW8w==
X-Received: by 2002:a2e:b5b0:0:b0:248:47d:6abe with SMTP id
 f16-20020a2eb5b0000000b00248047d6abemr16366856ljn.75.1647338568791; 
 Tue, 15 Mar 2022 03:02:48 -0700 (PDT)
Received: from UNIT-808.lan ([188.187.49.32]) by smtp.gmail.com with ESMTPSA id
 y23-20020a2e95d7000000b00247e4e386aasm4339993ljh.121.2022.03.15.03.02.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Mar 2022 03:02:48 -0700 (PDT)
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
Subject: [PATCH v17 6/7] net/vmnet: update qemu-options.hx
Date: Tue, 15 Mar 2022 13:02:38 +0300
Message-Id: <20220315100239.2914-7-Vladislav.Yaroshchuk@jetbrains.com>
X-Mailer: git-send-email 2.34.1.vfs.0.0
In-Reply-To: <20220315100239.2914-1-Vladislav.Yaroshchuk@jetbrains.com>
References: <20220315100239.2914-1-Vladislav.Yaroshchuk@jetbrains.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::235
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=vladislav.yaroshchuk@jetbrains.com;
 helo=mail-lj1-x235.google.com
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


