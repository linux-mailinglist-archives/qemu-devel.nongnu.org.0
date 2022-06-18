Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C82ED55042C
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Jun 2022 13:12:55 +0200 (CEST)
Received: from localhost ([::1]:36046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2WNq-0008Bv-UQ
	for lists+qemu-devel@lfdr.de; Sat, 18 Jun 2022 07:12:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o2WDo-0007tq-6i; Sat, 18 Jun 2022 07:02:32 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:45725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o2WDm-0005gL-PE; Sat, 18 Jun 2022 07:02:31 -0400
Received: by mail-oi1-x230.google.com with SMTP id u9so8219829oiv.12;
 Sat, 18 Jun 2022 04:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O27ma9UfDqSDwWIQr1tkTTbTWNQtnhkNtSvsm18kXE0=;
 b=bRbzcYiAQH0HJK9/XzkFqIIQXd8YgE6qpWEtGKyqoSyX9oz48hfEwvK591EwK9KbrC
 0e6cP/MQVN6Xf4CrdeR/X7KBjPWFph/y3nOFjsvBJpZdC9TrDXc1cnjdA3z5PXbY5PTy
 c01VhJnt0Tk3jG8Get++viUQGrtD0cmyOZSVrDqb1znhzYIlSwXYVkjknHDEcRc2mMaR
 XDvh9gClJ9pVKsFNnVlaJxafp45PvbfQV/40uvRT73vqC+p1tvpZ0Wl6dtNY7VbRyeL5
 15bpl9BGZVvHINwVMEX0BeKOrMVeqGvmz9FXCFSbIsU72SBw3ECBTiSXiIp6RCd83dcl
 V4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O27ma9UfDqSDwWIQr1tkTTbTWNQtnhkNtSvsm18kXE0=;
 b=TN2WjJlbPvjK2ORmGc4l7W30LD2FDi84yOTV5d4abZkhKoow+uxF4p36gpN10iXUsF
 u/lFZ3at0+yvcK7VbKpqHzH0xm4oldmIkYt5s6Z44uzd0k9JtWxh4l3LaUCbpSVySmEk
 oixO2vxapeRxPxhMiVtMZyoRJvxxt7M0mw3RjkVcsbQjJROw03xYSVYbILO+phbV9oMT
 6xCgZ0Fqpwrs/V/6tPoQ9ZGvcC7fqdQaQdbVsXlVokj41msVwbfJ6B47gdV9Ws3Ur5jI
 iSZFLRdDZ0HOinIe7trSiq+tllDxWEil6xuEtzHuz3Z4kBIODiK9iCgCuoY76mHDNIUL
 isXw==
X-Gm-Message-State: AOAM5327WU4Q3PlLAvjSLN7dBv6VQ+B+xh+azt3Mfcv9nLBzrRgItUiP
 5buruoCtqA4Es4wxQQCkHYsWBpxgWRA=
X-Google-Smtp-Source: ABdhPJzo1Vq3Co2xkjuvbyQUx6qSuFBg+QamjhvEUzSBnuEuK1/wGxG9F7e7hJUqbdHrBCZu0rmw+w==
X-Received: by 2002:a05:6808:4cc:b0:32a:f4d8:932a with SMTP id
 a12-20020a05680804cc00b0032af4d8932amr12570115oie.109.1655550148764; 
 Sat, 18 Jun 2022 04:02:28 -0700 (PDT)
Received: from balboa.ibmmodules.com ([2804:431:c7c6:ccc8:8e07:268b:a09:2834])
 by smtp.gmail.com with ESMTPSA id
 w16-20020a9d5a90000000b0060603221280sm4075456oth.80.2022.06.18.04.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jun 2022 04:02:28 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v2 9/9] ppc/pnv: remove 'INTERFACE_PCIE_DEVICE' from phb4 root
 bus
Date: Sat, 18 Jun 2022 08:02:02 -0300
Message-Id: <20220618110202.87735-10-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220618110202.87735-1-danielhb413@gmail.com>
References: <20220618110202.87735-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x230.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

It's unneeded. No other PCIE_BUS implements this interface.

Fixes: 4f9924c4d4cf ("ppc/pnv: Add models for POWER9 PHB4 PCIe Host bridge")
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 61b45fe33c..81f7c1fe8f 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1751,10 +1751,6 @@ static const TypeInfo pnv_phb4_root_bus_info = {
     .name = TYPE_PNV_PHB4_ROOT_BUS,
     .parent = TYPE_PCIE_BUS,
     .class_init = pnv_phb4_root_bus_class_init,
-    .interfaces = (InterfaceInfo[]) {
-        { INTERFACE_PCIE_DEVICE },
-        { }
-    },
 };
 
 static void pnv_phb4_root_port_reset(DeviceState *dev)
-- 
2.36.1


