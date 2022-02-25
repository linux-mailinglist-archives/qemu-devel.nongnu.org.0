Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 720734C4C2D
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 18:32:10 +0100 (CET)
Received: from localhost ([::1]:46606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNeRs-0008Eo-WB
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 12:32:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nNdqc-0002eP-GV
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 11:53:38 -0500
Received: from [2a00:1450:4864:20::134] (port=41829
 helo=mail-lf1-x134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nNdqX-00048c-Bn
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 11:53:37 -0500
Received: by mail-lf1-x134.google.com with SMTP id f37so10383882lfv.8
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 08:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jetbrains.com; s=googleapps;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rDzQ2Diu2otCXp2wF525auspdXUMMmhNmu89vlZY+2w=;
 b=XTWOXDPVDzIeVElfZaEZ021eV310vnr7rglD+tCvaFn1qXXm4P/1N6b+L0VT0bf+Np
 e5rCWLxaAKpMgCND/91Wof8x9HQkhytF5BrRFw/Wrf0bTPu5nSZisOoEAo8kaY1+nlAp
 JZ1yCkPYqj+drEDM53+Zi3rVgLskjaEdOH2Hk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rDzQ2Diu2otCXp2wF525auspdXUMMmhNmu89vlZY+2w=;
 b=bXk2smY4s2fq74HijRx1orsfUW1yClKW1SA4EEigafL182DMTgx9YnIZNgCrCXiYV6
 naiSQ4rTsG4KP+pmS7+2q3xtK8PnXSLxHjkofgBla1H0Kfonxq7VowokID5dzKYMJpcI
 /WYG7wztxFgIgpFqz+03xwO1E99tV0SzYEYySTWJ056TJG9EyTEmsBSSH0if8cAOZJQz
 NBKGQ1ZyCwC7YSrbNY+DOpwt8DJRm06g34sIPjEzHrZbozNa3ZlkkbVQ1qu1S3MGlwg6
 EmKy12LTFrK2B60voYGs5hqvqegyBZXD5VJ7uqffPfbpwL2/HwAReEYVDNRIN3URhg/7
 sZKQ==
X-Gm-Message-State: AOAM5314accdp6x23O/0nNjRx1xjHRzFprFGUZOpMuxfLIsQpgKJFPta
 UkjgtKFyZNXvKF6ViLDQ463otn7QVk2SRQ==
X-Google-Smtp-Source: ABdhPJwi/l/O2osmX0GyIGpybE3JHOY17fdDp57sZ+BmvGI36ZpBvtE6WMfDWZQoZW7Dm3IGEzvmnA==
X-Received: by 2002:ac2:549a:0:b0:443:f15d:e582 with SMTP id
 t26-20020ac2549a000000b00443f15de582mr5627998lfk.90.1645808011340; 
 Fri, 25 Feb 2022 08:53:31 -0800 (PST)
Received: from UNIT-808.lan ([2a02:2698:6c2a:768f:813e:378d:5c94:9b97])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a2e834b000000b00246308690e2sm309683ljh.85.2022.02.25.08.53.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 25 Feb 2022 08:53:30 -0800 (PST)
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
Subject: [PATCH v14 6/8] net/vmnet: update qemu-options.hx
Date: Fri, 25 Feb 2022 19:52:36 +0300
Message-Id: <20220225165238.63646-7-Vladislav.Yaroshchuk@jetbrains.com>
X-Mailer: git-send-email 2.34.1.vfs.0.0
In-Reply-To: <20220225165238.63646-1-Vladislav.Yaroshchuk@jetbrains.com>
References: <20220225165238.63646-1-Vladislav.Yaroshchuk@jetbrains.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::134
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=vladislav.yaroshchuk@jetbrains.com;
 helo=mail-lf1-x134.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 25 Feb 2022 12:16:18 -0500
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
index 094a6c1d7c..d2deab95d0 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2742,6 +2742,25 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
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
@@ -2761,6 +2780,9 @@ DEF("nic", HAS_ARG, QEMU_OPTION_nic,
 #endif
 #ifdef CONFIG_POSIX
     "vhost-user|"
+#endif
+#ifdef CONFIG_VMNET
+    "vmnet-host|vmnet-shared|vmnet-bridged|"
 #endif
     "socket][,option][,...][mac=macaddr]\n"
     "                initialize an on-board / default host NIC (using MAC address\n"
@@ -2783,6 +2805,9 @@ DEF("net", HAS_ARG, QEMU_OPTION_net,
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


