Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB2E60846F
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Oct 2022 07:08:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1om6KQ-0005Qr-BO; Sat, 22 Oct 2022 00:41:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6KJ-0005PR-NV
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 00:41:39 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6KH-0003jh-4k
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 00:41:38 -0400
Received: by mail-pl1-x62a.google.com with SMTP id d24so4083629pls.4
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 21:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GHs3FIVgg/OfZMJJpCzpOV6oBMUZOjvUGwJM42Wh0Q4=;
 b=u3DYI60M2qZVmc69+BldTMJV9xDoHgWxZaPPUuIo+83+mW59eBOfPKk2q4wX3t5afA
 0v1nc19sbEdBIjHOxQ5bc7t5fK1qfVg1P8HZXVZ7YwY0VkRdNqghqAhC2GzxT1ndVQsb
 AKv7Lpw4M4qYshmsSquDpqICSjiJax/slgWJO18TbqgcYvmqr0spwpCHu5Ikk2sTPpST
 VofEmyQYlbBW68aN+wEACHM3r6PWI8gGvj64tcZxaSJq+QohcdTEXFn6jHf1C2pTKXFK
 6IioBMQMp8r2ICz4sA8y9OwHCnoLE472c7tDVFxakO1pR9ZZtODm98XQA8y/4q1J8gnf
 sTdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GHs3FIVgg/OfZMJJpCzpOV6oBMUZOjvUGwJM42Wh0Q4=;
 b=rd00rNTsFomO+ZZi+ivPH9184onNLAV5tQtUYMYN5ck3QGtYL9xjtk5LQMLDk/aR9B
 2qibWGTPNlosJtjekRreqZC0mUjfY+vMo6igQ8VDAj6Nf/ok2kV+FzTVsc9s6QaaxDEF
 YE2R5UGGI7vL+45QVi9vKprhxIzsR+2cCFeTX5rFIVYCOl0OmFm6KhxDg+fndvDwNPPx
 +M8USFerQiJqAPIoNEPg1IyTeqGxQZ8gksHviEqi8RBNyXJ+MDsRq5uQpZvLlZD/kQxh
 Wq4PKCl1bS6uoKnxmSpMtef1TCbfzSMMz6/Grq23Vgd6fxuAmlD6Yikys5E6xjSP2M20
 NOCA==
X-Gm-Message-State: ACrzQf3CiY+T2Kk/G6GghRmUAgqioWF0f1Izyx94IaRnAX/WnY6uWrF0
 fp1UPp7/3VZ9FDT4YMbrKRAQ1A==
X-Google-Smtp-Source: AMsMyM5sDvUhVHMBsbIeGtkBprttLWA2P4a40Z70stcN3iyVI5Dqi/V5rbAg4LgnUlFwXfQTsOBsBQ==
X-Received: by 2002:a17:902:e846:b0:185:2f:c52 with SMTP id
 t6-20020a170902e84600b00185002f0c52mr22629702plg.69.1666413695443; 
 Fri, 21 Oct 2022 21:41:35 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a17090264d000b001868d4600b8sm178049pli.158.2022.10.21.21.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 21:41:34 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v2 05/17] eepro100: Omit errp for pci_add_capability
Date: Sat, 22 Oct 2022 13:40:41 +0900
Message-Id: <20221022044053.81650-6-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221022044053.81650-1-akihiko.odaki@daynix.com>
References: <20221022044053.81650-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62a;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/eepro100.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index 679f52f80f..bf2ecdded9 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -549,12 +549,7 @@ static void e100_pci_reset(EEPRO100State *s, Error **errp)
     if (info->power_management) {
         /* Power Management Capabilities */
         int cfg_offset = 0xdc;
-        int r = pci_add_capability(&s->dev, PCI_CAP_ID_PM,
-                                   cfg_offset, PCI_PM_SIZEOF,
-                                   errp);
-        if (r < 0) {
-            return;
-        }
+        pci_add_capability(&s->dev, PCI_CAP_ID_PM, cfg_offset, PCI_PM_SIZEOF);
 
         pci_set_word(pci_conf + cfg_offset + PCI_PM_PMC, 0x7e21);
 #if 0 /* TODO: replace dummy code for power management emulation. */
-- 
2.37.3


