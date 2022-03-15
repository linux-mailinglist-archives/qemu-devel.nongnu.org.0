Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FC04DA40A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 21:33:07 +0100 (CET)
Received: from localhost ([::1]:54784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUDqs-0005bx-9b
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 16:33:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nUDmW-0006kF-Gi
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 16:28:36 -0400
Received: from [2a00:1450:4864:20::435] (port=36769
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nUDmU-000672-Sz
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 16:28:36 -0400
Received: by mail-wr1-x435.google.com with SMTP id r10so216042wrp.3
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 13:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jetbrains.com; s=googleapps;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TocqvUgt8oYqDt7ijO5+PrJ/oIA8D+p+ZMbp4ehOtYs=;
 b=bBpLADU6XEv1k1pqXeY4QJj9RzRpHXh8ghWietwJTbZ8smyDN61HQeEKA5UpJPPrA9
 9Xi96OreD5ybkmfm96MQ9pfbGARy16YZ2dbmq26kTvBW4cflnszDFLAZCo2slit2w8GD
 kCf8m92lrmOAwrRpAoDdmYKbn/j5Ul4+9612o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TocqvUgt8oYqDt7ijO5+PrJ/oIA8D+p+ZMbp4ehOtYs=;
 b=AJGrJ4k6b9fxUW3q1SG1ADNGVH29tSU65VD2VuPqibSOgLgi7lez0XiCX5kg+izuUN
 NKxamRUPkJOGVdojGyYhSolT4Ogo6+z3PK3PBq3eACEVoQ6pokIXgRznw8/87dquBF5Y
 Tq84KBidinQVIZzgaWZaz0m/DEH7fMDKU9+dGidqxN73noPfz/nb+VSY0nMSJ1VQyuxG
 tZ8J8eIs5XX/q4WbzfPl8xMz6cxRrZsUFuo22YFOCdOTmeazIhqftQVXZjDugpNyj/bw
 cSoEp7W8EAgGCRmJxY8xROnYnqKbzjHejRYI5ozLzOk5MP4UC29hjXxYPaRFiUdsfjqb
 oC1A==
X-Gm-Message-State: AOAM531B2g7RwFxVzudotF2FWQhTPEbbZcIZ/qOC/ixkZBT2AKbVxyxa
 2ZD1jgyCLMCCTxiec3dprr6fVGODY8IjfrTS
X-Google-Smtp-Source: ABdhPJxINUy8EMLg5HEh8Rm3kmpkTmqcCKpb7Gc2hrKDFL8aKL/b2iW3AsMtNIiZtxsfAy/b0jv/vw==
X-Received: by 2002:a5d:55c5:0:b0:1f0:7672:637d with SMTP id
 i5-20020a5d55c5000000b001f07672637dmr22171383wrw.170.1647376113214; 
 Tue, 15 Mar 2022 13:28:33 -0700 (PDT)
Received: from localhost.localdomain
 (ec2-3-121-162-165.eu-central-1.compute.amazonaws.com. [3.121.162.165])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a056000178a00b0020393321552sm13378166wrg.85.2022.03.15.13.28.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Mar 2022 13:28:32 -0700 (PDT)
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
Subject: [PATCH v19 6/7] net/vmnet: update qemu-options.hx
Date: Tue, 15 Mar 2022 23:27:03 +0300
Message-Id: <20220315202704.18263-7-Vladislav.Yaroshchuk@jetbrains.com>
X-Mailer: git-send-email 2.34.1.vfs.0.0
In-Reply-To: <20220315202704.18263-1-Vladislav.Yaroshchuk@jetbrains.com>
References: <20220315202704.18263-1-Vladislav.Yaroshchuk@jetbrains.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=vladislav.yaroshchuk@jetbrains.com;
 helo=mail-wr1-x435.google.com
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


