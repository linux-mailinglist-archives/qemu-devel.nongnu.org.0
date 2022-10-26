Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 745EA60EA38
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 22:24:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onmpy-0002Tj-LZ; Wed, 26 Oct 2022 16:17:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onmov-0001ZB-4X
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:16:15 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onmoo-00035F-OO
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:16:09 -0400
Received: by mail-pg1-x536.google.com with SMTP id e129so16027474pgc.9
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 13:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MZ0hVa8YtJYr6wiX8WDzq4IS/4ZL7pxBfATieBVFI+M=;
 b=MA+9RUiQydqT4Ib0KZ98vOFSDziOeoEgNqGx7PAt8EwttVRRCC+rRjydRz+peoYu0A
 26fR0PJayLkNBVWcuYa9m7SjBoVWsU07/8ykBZMgurEegOJ1VYoC+QoJYI3Z88bzmKVz
 LK5ebZj5FlgwZGrOQKkrEJux1ZX7uKX7vrAwfDgURHxEfBAZnOKOT/z9fL6yWsSvPSZI
 OiO/P85iMZyNGfUzmip1sJ//XmG4mc3kssabC2P6O5J+SRYXK9jcMkYwlSu5ibSCZRzb
 KMZtEHak+KHTgO1TI2ayQnbhfdIvMvoduhCfbsWJW+aUhAhL19UQw4aWPC/izDhzKIVs
 +D+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MZ0hVa8YtJYr6wiX8WDzq4IS/4ZL7pxBfATieBVFI+M=;
 b=P+okfDNLthKEdDXuZVL1i7GOMS0kYVnVGudC/DVboyelxMPN/AcOIbYlyGLGFhdzRt
 XviXyaHqQAvGFT9NrRE8n7bIrHGeeeTjLHb9VUGmFLE444/XJ7HA26jmbyjCv5Phb5Ew
 9Yf1XvW/rd/8QwleyycYEOHDaeQ6/gAIX0PLYldaktVwBI/hO8fPFp9hYQUNGKypK9Pu
 xD+zjHqLWFpUlCPsz6TeOyJhKzBXdRAvuPmc9bSwniMCtP5eCjWRDSMOwfQh2yp2qlVp
 UV5e906/oW5SNJUzn5hEeQCKlDtqIz0A/4hP/JnzPuM/gpEEVWBH+Z9tZPkFU1tNExVj
 5z2w==
X-Gm-Message-State: ACrzQf2ELVHCXdE61aiXWy3TLvX1jYBAFJGcuk71sguUnQjycdW+TsNh
 g+jQtnibXwjw+FYIWFS352zFqA==
X-Google-Smtp-Source: AMsMyM5gjXLTq6nHFyBfKH7unZFbb4xv1JNuuJFR3vSETZ0mArxydC0qEOyyBRLJQFyHtQe61OPI+g==
X-Received: by 2002:a65:5ac8:0:b0:463:9c77:285a with SMTP id
 d8-20020a655ac8000000b004639c77285amr38797068pgt.517.1666815366079; 
 Wed, 26 Oct 2022 13:16:06 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y5-20020aa78f25000000b00541c68a0689sm3375770pfr.7.2022.10.26.13.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 13:16:05 -0700 (PDT)
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
Subject: [PATCH v3 05/16] eepro100: Omit errp for pci_add_capability
Date: Thu, 27 Oct 2022 05:15:16 +0900
Message-Id: <20221026201527.24063-6-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221026201527.24063-1-akihiko.odaki@daynix.com>
References: <20221026201527.24063-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::536;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x536.google.com
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
capabilities overlap. This behavior is appropriate heare because all of
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


