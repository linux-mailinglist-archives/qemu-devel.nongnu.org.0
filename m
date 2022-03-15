Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9180E4DA3A6
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 21:02:44 +0100 (CET)
Received: from localhost ([::1]:41662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUDNT-0001Tu-Lk
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 16:02:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nUDKQ-00077q-NQ
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 15:59:34 -0400
Received: from [2a00:1450:4864:20::42a] (port=43759
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nUDKP-0001aq-88
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 15:59:34 -0400
Received: by mail-wr1-x42a.google.com with SMTP id e24so84443wrc.10
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 12:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jetbrains.com; s=googleapps;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TocqvUgt8oYqDt7ijO5+PrJ/oIA8D+p+ZMbp4ehOtYs=;
 b=I522WokXscARC4bGr3eEliOrBsGich+QQo1cMHMzUbaoGePBR0BdAgDE/GFCJFrVuO
 Ux0vdqCaft6H4vEyY8E5ivR4eC+eFhIrQqoMmriKPqxj/d758JE1V1+Os5Kko/s4ERup
 HhMqLdp88taRjz1PajTtkstFBsLlEcGi6SOoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TocqvUgt8oYqDt7ijO5+PrJ/oIA8D+p+ZMbp4ehOtYs=;
 b=nGGXbkbKFU10d4IRqI7pICTowASS5MnMYygRjssoCsD1tF4AFEm9lgr19Xmv4VQQqr
 GY7FuA62oa2uAVNiAZZM22p+p+TCSCPl6RIdeRQS0cnO8EVj2x5Z+LBcMhhqytI6joU/
 Y+q5ar5cLsztwg5hjYCwFB7GBAUWrcjQgrVLRSyuDZKyrFuDJTQbZ7tMs5UBiCg+QIk8
 VHCpVoE9qhaFcmOCt9zhk4kzObRPPxtCFumSTmh83WCfQlZUYeWavpiunmcKMxeXJF/I
 inf84oBFUy1u0iW4rS7CvLniXGQmUI+tx/CDgPgRfEUmwyHVPBWnWqebfYCRyp8dWKH1
 29Pw==
X-Gm-Message-State: AOAM533jWbOvl4wXxvYGiGwzA2iREyPuwv23O7rEBqaZ9bOfwyOeScJm
 4azcv8CZ67OUmp4C0GrjyfYDx40J340lQFFg
X-Google-Smtp-Source: ABdhPJxF326T2ZgLTiYx7OMK3snHSrWAtJ5Y5+YJ75xVCrzBu5h/pv56C6dOX6c/F/e0jnRlm5zDSw==
X-Received: by 2002:adf:f68d:0:b0:203:7b96:a7ff with SMTP id
 v13-20020adff68d000000b002037b96a7ffmr23242490wrp.101.1647374371679; 
 Tue, 15 Mar 2022 12:59:31 -0700 (PDT)
Received: from localhost.localdomain
 (ec2-3-121-162-165.eu-central-1.compute.amazonaws.com. [3.121.162.165])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a5d59ae000000b00203dcc87d39sm785211wrr.54.2022.03.15.12.59.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Mar 2022 12:59:31 -0700 (PDT)
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
Subject: [PATCH v18 6/7] net/vmnet: update qemu-options.hx
Date: Tue, 15 Mar 2022 22:59:13 +0300
Message-Id: <20220315195914.12107-7-Vladislav.Yaroshchuk@jetbrains.com>
X-Mailer: git-send-email 2.34.1.vfs.0.0
In-Reply-To: <20220315195914.12107-1-Vladislav.Yaroshchuk@jetbrains.com>
References: <20220315195914.12107-1-Vladislav.Yaroshchuk@jetbrains.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=vladislav.yaroshchuk@jetbrains.com;
 helo=mail-wr1-x42a.google.com
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


