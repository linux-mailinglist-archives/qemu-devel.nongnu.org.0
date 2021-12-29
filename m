Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 923034810D3
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 08:59:28 +0100 (CET)
Received: from localhost ([::1]:45342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2Trr-0003sE-35
	for lists+qemu-devel@lfdr.de; Wed, 29 Dec 2021 02:59:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1n2Tqi-0003Bs-5d
 for qemu-devel@nongnu.org; Wed, 29 Dec 2021 02:58:16 -0500
Received: from [2607:f8b0:4864:20::62c] (port=36860
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1n2Tqg-0000dv-Ev
 for qemu-devel@nongnu.org; Wed, 29 Dec 2021 02:58:15 -0500
Received: by mail-pl1-x62c.google.com with SMTP id p14so15349843plf.3
 for <qemu-devel@nongnu.org>; Tue, 28 Dec 2021 23:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=tIWSwSdlTmlnUWR+2oEQe/x0cST0/CfeY0dvfaKO4+Y=;
 b=TmZyO4L2GYLgkebkfvdlyu6U/q7VTmKqhO4FopeP1efwBdmBkhJhvzu8Mt26q/+94g
 5AimEJ7I3NyK+Kff8NY3/QiCj01yrTTSF33SRwUoM4b3Lsv1pDLJZCn6bAYOmZy0vzpf
 OYa64c8rJc9amV680pbaUw0uLxcb0tlczN49yE2MqsSeAOlg+BglOvauR+evDM9iLG3c
 RmtH5ZOmBqQG0vaSCFysojl5wwvf5DSk6e6vPtmHvRVpSFGX3dqVOrrMLNUkG7DQ1RD1
 FAlC1FTrxVSLkyrfsxQW0QlFd6jxMTcnm4iW3+sUyj566xPgLP4eTN5bd0W7j1cMv7ej
 vjTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=tIWSwSdlTmlnUWR+2oEQe/x0cST0/CfeY0dvfaKO4+Y=;
 b=sUIyAdztNPh/4iUFeIPQ5SLaa8bBMk4sMC34PwsNju/YCp88KJ/KC2iLj9KmAoMgMT
 rTuUNzyklgVIZv9IqsQavfE7wXdDMclNLHTtIEpNiNrTtiMZnKaRN1OIx5Gppn3DxjZs
 RzTRBtnThHpB4qeK3iHY4tccm08D/2pmQlEmeD8Ch+6SSqIdE/B5n01hiLzf3UCKgEaJ
 iAr3882xMaKphIcoh/l8fSGHxvbUTKQo3pihGbUMUNqMj00U7ab5h5+uurHiGMFVqbHs
 eA1k3v0z0gcNBDX8PfGbKOXa4lMD5e1ZHMwIBl9Ox0xm5vmDb9F1PusM1glLy4LgeMu2
 BW3w==
X-Gm-Message-State: AOAM531zUSz/inRDBeXdSDIIyn/JINfUW4Rk5fVH3NIOYX6YRxpg7hYN
 GirOepZghwaiZ0S2KqprCtC/tA==
X-Google-Smtp-Source: ABdhPJwW85JJ04K57WUz5P3MNMLZX0wSLC8AkU7L7eND+sRSpVBO/XVC3I2iMYGhoGL5IGjoB/+kxg==
X-Received: by 2002:a17:903:281:b0:148:a3f4:1ec4 with SMTP id
 j1-20020a170903028100b00148a3f41ec4mr25220936plr.158.1640764692237; 
 Tue, 28 Dec 2021 23:58:12 -0800 (PST)
Received: from localhost.localdomain ([203.163.235.52])
 by smtp.googlemail.com with ESMTPSA id w6sm757334pga.25.2021.12.28.23.58.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 28 Dec 2021 23:58:11 -0800 (PST)
From: Anirban Sinha <ani@anisinha.ca>
X-Google-Original-From: Anirban Sinha <ani@anirban.org>
To: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>
Subject: [PATCH] acpihp: simplify acpi_pcihp_disable_root_bus
Date: Wed, 29 Dec 2021 13:27:53 +0530
Message-Id: <1640764674-7784-1-git-send-email-ani@anirban.org>
X-Mailer: git-send-email 2.6.3
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::62c;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ani Sinha <ani@anisinha.ca>

Get rid of the static variable that keeps track of whether hotplug has been
disabled on the root pci bus. Simply use qbus_is_hotpluggable() api to
perform the same check. This eliminates additional if conditional and
simplifies the function.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 hw/acpi/pcihp.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 30405b5113..e497f66ff6 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -128,20 +128,15 @@ static void acpi_set_pci_info(void)
 
 static void acpi_pcihp_disable_root_bus(void)
 {
-    static bool root_hp_disabled;
     Object *host = acpi_get_i386_pci_host();
     PCIBus *bus;
 
-    if (root_hp_disabled) {
-        return;
-    }
-
     bus = PCI_HOST_BRIDGE(host)->bus;
-    if (bus) {
+    if (bus && qbus_is_hotpluggable(BUS(bus))) {
         /* setting the hotplug handler to NULL makes the bus non-hotpluggable */
         qbus_set_hotplug_handler(BUS(bus), NULL);
     }
-    root_hp_disabled = true;
+
     return;
 }
 
-- 
2.25.1


