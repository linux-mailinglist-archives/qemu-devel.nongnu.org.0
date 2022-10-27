Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB9060F077
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 08:42:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onwYY-0002AT-1P; Thu, 27 Oct 2022 02:39:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onwWW-0003IE-Gv
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 02:37:53 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onwWS-0003Cx-Tz
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 02:37:52 -0400
Received: by mail-pj1-x1029.google.com with SMTP id m2so640013pjr.3
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 23:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=229FhV+0QZxAtJMQNpfAmKK2UoQv87tcNzSVNIW4T3g=;
 b=ogMJ6NQ5ho+fPLR6HJr1WK0VdB1Q3tzMTFJhcl1OU2PEvGpTIMg+CQu1u4jwcjL9IV
 zMHFeDXZ6G0DBKgjhgZ7TY9OJGd4GU9XzvAqPje/rfUvXy27QuuWwxE5UTnQzB/sGmVh
 edi3RBbhYxxH02Oyzhae9hLpc3hQ6istL1snma6FJVAT0N/nEHG9X57WrdNy+Wse9a+w
 VESVwuptr2/vyBcQM/v03WD1YIeypmgUXUPgXHWLiZ/2mMb7GHTV5KCj7b3o8wP8GXvl
 v5KMLmG/lduwxJ5POB6X7nKAIxuDM/jBfYsqt0yLFQzZC+f4e35rbLdGDv60u27UJawz
 scMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=229FhV+0QZxAtJMQNpfAmKK2UoQv87tcNzSVNIW4T3g=;
 b=6R8hY+GzfAcIdCPsjLGVR3lXp2b7jJsSbauh6SsC5PmiJgIEp4T+KcTeplqgZJH2UU
 F58Zdg0xuNMLVOTcXiKB1sSxnmHSZVootn4HrMyKsPYqccu1xsFgXFJDbPLjphIBtW79
 VoTn/cls1OJjrcvBgtoZrgjmnOYyQzbTZfA1NatOwoSAe7BAAo9qA6ZZO5MLRGwSsR5a
 C2LuRMEleOLdge8RLKPbuSvP0NLRuFClZBctkiu/TdCS5YkdpsVWS08ARwjDXUAG+ClX
 jDj1hCSq3zckui4Ezk4qDtX3B8jSesK5OKpBfd2LGNv5cY4laBIalL9kY5nQEIAvJr+A
 jSyg==
X-Gm-Message-State: ACrzQf2rhng6k6RE2/Ot2TgN/HG/saN30tyBlptbjUcp9DZFvhKPp8BR
 7aeD7nDzDk8Sj3OfQRLJaZuvUQ==
X-Google-Smtp-Source: AMsMyM5+qjmTXSGqLpxZGpYaMu2rDALIDl0eIcjTEtYYxiNyB5LfnYN94GBzbw9s5/QAtklCjIGUNw==
X-Received: by 2002:a17:902:e74a:b0:186:a094:1d3 with SMTP id
 p10-20020a170902e74a00b00186a09401d3mr20907310plf.153.1666852666042; 
 Wed, 26 Oct 2022 23:37:46 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 z17-20020aa79491000000b0056b818142a2sm448872pfk.109.2022.10.26.23.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 23:37:45 -0700 (PDT)
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
Subject: [PATCH v4 06/17] eepro100: Omit errp for pci_add_capability
Date: Thu, 27 Oct 2022 15:36:54 +0900
Message-Id: <20221027063705.4093-7-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221027063705.4093-1-akihiko.odaki@daynix.com>
References: <20221027063705.4093-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1029;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1029.google.com
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

Omitting errp for pci_add_capability() causes it to abort if
capabilities overlap. This behavior is appropriate here because all of
the capabilities set in this device are defined in the program and
their overlap should not happen unless there is a programming error.

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


