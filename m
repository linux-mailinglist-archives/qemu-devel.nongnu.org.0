Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B754C4C2E
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 18:32:36 +0100 (CET)
Received: from localhost ([::1]:46932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNeSI-0008Sr-QU
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 12:32:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nNeAc-0007HN-12
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:14:18 -0500
Received: from [2a00:1450:4864:20::233] (port=45569
 helo=mail-lj1-x233.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nNeAZ-0000Sc-N9
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:14:17 -0500
Received: by mail-lj1-x233.google.com with SMTP id e2so8246041ljq.12
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 09:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jetbrains.com; s=googleapps;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rDzQ2Diu2otCXp2wF525auspdXUMMmhNmu89vlZY+2w=;
 b=HVNEyzDayo1C7xy1KBR6MNcIkjHoZoMFgLkcthZwAaAPHRYIEWtFSxFREPHhALAVcH
 EbYS063YlZ9JD2wzFxaF6czwOc3Nf2+z8GIiJ0L7aMPpanx5lZi4w1ig7l+LNHIIi32C
 Uj7cui8Am+be69Uma94BQUQizmBQP9KqLywQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rDzQ2Diu2otCXp2wF525auspdXUMMmhNmu89vlZY+2w=;
 b=rwOkFoCVeRyAKtaTjbs595OP9v48mPOjzFvCry2kjRatQ97edo3PG3eXUHrmlYiOI5
 D0oaW4CwjklgOgO0x9IEi6dGqRVH46rkpHSJHEtTURbpl/IldmuCRmJk3+RXjtXFnleN
 scD6vqxifVXKBQiUblj5tyrI0mcSd0M+pSvHHeQyK6kH/15yu8zWo3SxKNktHJ1cbR4/
 MHbGCEgArJ31QWwHp/5gvsx0wlRAgvsl4Z34xIuX0g8AyWR7ZyPOSkXy1MUHhfXPJ/6j
 08TiOsCs9K0C0yAIRVk31O8K1DWos+q1GcE3amxoAfIHsurnLm0iSCKLyt5iI2fpr9K/
 hKzg==
X-Gm-Message-State: AOAM533p7dN6oUiwDn7C2rwza+cV1yBBhFj57eMsTKlBB0M6FHj1KY1+
 LalEWPvZXq0EC1D8Uk+Wz6jA1K+Vbq7Cvg==
X-Google-Smtp-Source: ABdhPJwWfx2DR6bWusD392Oq9SycW36MSuQdjkKQmHuPtQSSyrypp4O6LxfHTaMZp9fjaxrnKh2kBw==
X-Received: by 2002:a2e:3c0b:0:b0:245:f5f8:3f4a with SMTP id
 j11-20020a2e3c0b000000b00245f5f83f4amr5871912lja.483.1645809253944; 
 Fri, 25 Feb 2022 09:14:13 -0800 (PST)
Received: from UNIT-808.lan ([2a02:2698:6c2a:768f:813e:378d:5c94:9b97])
 by smtp.gmail.com with ESMTPSA id
 bq5-20020a056512150500b004433c791651sm252024lfb.69.2022.02.25.09.14.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 25 Feb 2022 09:14:13 -0800 (PST)
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
Subject: [PATCH v15 6/8] net/vmnet: update qemu-options.hx
Date: Fri, 25 Feb 2022 20:14:00 +0300
Message-Id: <20220225171402.64861-7-Vladislav.Yaroshchuk@jetbrains.com>
X-Mailer: git-send-email 2.34.1.vfs.0.0
In-Reply-To: <20220225171402.64861-1-Vladislav.Yaroshchuk@jetbrains.com>
References: <20220225171402.64861-1-Vladislav.Yaroshchuk@jetbrains.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::233
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=vladislav.yaroshchuk@jetbrains.com;
 helo=mail-lj1-x233.google.com
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


