Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BED5BF1E3
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 02:21:29 +0200 (CEST)
Received: from localhost ([::1]:35714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oanUW-0006jq-24
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 20:21:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oaj91-0001T6-Mf; Tue, 20 Sep 2022 15:43:04 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a]:44901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oaj8z-0001tc-Eb; Tue, 20 Sep 2022 15:42:59 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-11eab59db71so5779617fac.11; 
 Tue, 20 Sep 2022 12:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=C1wU4yyWWMzQRNVchCrZBZAobMY3CUMb0pl22svBrCc=;
 b=pN5n8ryZelxOlqEO1wjCLR1XPIVKDWW2MP/QyF3UQLHRxLVBZ9M1sKNv60ctKfE1sv
 NuSdyKOBQd3M1YuQbJQGxAmM5TOe8+uin7f0r54mQtUKJbNCoOINbpWzFzYdLyxOIbqL
 RvTEL3RRuuGFd2FgZ8DJHWp+WtgPgri20cX1pfh64CK0kL5SlGA6N3YzpCsEDPlJqMva
 +GKN+xU1a3m2wExGcdYFccvoH4uHFUmsIE+XXl8LFBS1LyBodqehql0g3hFmXJnXJR4K
 c+SWhpjkSHhGLvtPHfpXLcZwxaJ6Fdnuo3Qr16IjN9NMHscezOGS6MIUmUHgIBVteW4V
 oqOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=C1wU4yyWWMzQRNVchCrZBZAobMY3CUMb0pl22svBrCc=;
 b=HCKqax/z+Z5AWFAB3Up/tcBYq9AUnAS5h+/GwhrbYPasuWBTyx1ZlxInZp3RDZ9/Mt
 SikxX56xlzBvY1qd5CUPddpBQnY1zSHcDUpFQrSTPAs3QXniDn7/HU7Gvxjs76qW8l9R
 Fbu8Eag0k2sa8iT+qBtojjaGIlTb6gg2JV3lEJkNxm823O6EMijY6nyN7/hc9DE67nPE
 v8Hh4DFS49pnHUE6n7c8WSioN+rKLoeKpS4YKujaTj05IuzyJB0kF1qsi+4jF46iGXeh
 iynchdKkgDgR0Ktlay3629CvRf2lVdT6Tgbeedep/BOaLafm1J1FHtGR+XedsiF34Uo+
 xUeA==
X-Gm-Message-State: ACrzQf0Gk7srF6fOdlh0XovF/uogl6JpcZ3Z8VXtSBsgBRop8SZn8qVc
 1k3FxzJva/jYzT6qrxt3a4iThUjJgJg=
X-Google-Smtp-Source: AMsMyM4yj4IS27Yg/RLA7ww61Ii2ptNgEuCmxQQi3PxNUXkCI9h2EeXp+PBtO7G13h01pdpnfOCLHA==
X-Received: by 2002:a05:6870:4711:b0:12c:82d2:bca2 with SMTP id
 b17-20020a056870471100b0012c82d2bca2mr2987865oaq.153.1663702972541; 
 Tue, 20 Sep 2022 12:42:52 -0700 (PDT)
Received: from balboa.COMFAST ([191.193.2.69])
 by smtp.gmail.com with ESMTPSA id
 e33-20020a05687023a100b0012763819bcasm333808oap.50.2022.09.20.12.42.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 12:42:52 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 16/17] hw/pci-host: pnv_phb{3,
 4}: Fix heap out-of-bound access failure
Date: Tue, 20 Sep 2022 16:42:01 -0300
Message-Id: <20220920194202.82615-17-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920194202.82615-1-danielhb413@gmail.com>
References: <20220920194202.82615-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

pnv_phb3_root_bus_info and pnv_phb4_root_bus_info are missing the
instance_size initialization. This results in accessing out-of-bound
memory when setting 'chip-id' and 'phb-id', and eventually crashes
glib's malloc functionality with the following message:

  "qemu-system-ppc64: GLib: ../glib-2.72.3/glib/gmem.c:131: failed to allocate 3232 bytes"

This issue was noticed only when running qtests with QEMU Windows
32-bit executable. Windows 64-bit, Linux 32/64-bit do not expose
this bug though.

Fixes: 9ae1329ee2fe ("ppc/pnv: Add models for POWER8 PHB3 PCIe Host bridge")
Fixes: 4f9924c4d4cf ("ppc/pnv: Add models for POWER9 PHB4 PCIe Host bridge")
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Message-Id: <20220920103159.1865256-29-bmeng.cn@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb3.c | 1 +
 hw/pci-host/pnv_phb4.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index af8575c007..9054c393a2 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -1169,6 +1169,7 @@ static void pnv_phb3_root_bus_class_init(ObjectClass *klass, void *data)
 static const TypeInfo pnv_phb3_root_bus_info = {
     .name = TYPE_PNV_PHB3_ROOT_BUS,
     .parent = TYPE_PCIE_BUS,
+    .instance_size = sizeof(PnvPHB3RootBus),
     .class_init = pnv_phb3_root_bus_class_init,
 };
 
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 824e1a73fb..ccbde841fc 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1773,6 +1773,7 @@ static void pnv_phb4_root_bus_class_init(ObjectClass *klass, void *data)
 static const TypeInfo pnv_phb4_root_bus_info = {
     .name = TYPE_PNV_PHB4_ROOT_BUS,
     .parent = TYPE_PCIE_BUS,
+    .instance_size = sizeof(PnvPHB4RootBus),
     .class_init = pnv_phb4_root_bus_class_init,
 };
 
-- 
2.37.3


