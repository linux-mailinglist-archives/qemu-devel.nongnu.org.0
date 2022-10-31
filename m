Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B6061367D
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:36:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opU0K-0004sd-VE; Mon, 31 Oct 2022 08:35:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opTzQ-0003Mz-AS
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:34:21 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opTzO-0004NE-Nk
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:34:04 -0400
Received: by mail-pf1-x42b.google.com with SMTP id 17so6302204pfv.4
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vn8QAsjO7gtbZVeE7QQx9COaGQRw61V/sT24VvnuPKo=;
 b=BikZutB21mbzsJSwEx8B/Ylzp5DWUwdu1CtS3tZ0Kp3H3CwDuZcl9eSt2peEzCSfKM
 oMYMKP5yePV53nrS7rvz6gTrue1KNHnXguv+O1sRMdEh+j1ZGELqs8CtDjP94+MFs9iu
 H1h4XeutaFj93oxmrCyCg5zrjOP2Z9nEumpc2AGEL3pj890zHw0nX1p/KZ/X9VfGE50K
 EGF5e4TgAiYbwCRBAGuNXVGkl1xVLWnhLAUb5FsGnfKNnlzat8CRKpHuUO5u0DyGgiBx
 ig5o7VhWz3ajCZJ6Hx13pdSzJySKip+KJjNBDhhriGiAQwKYeiKLbL3HIPL5jud3ZeWq
 GDWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vn8QAsjO7gtbZVeE7QQx9COaGQRw61V/sT24VvnuPKo=;
 b=xs3ZcRU/KdGzZVgkeq1s+lJTMPFpcgbr+XeoFlGzJFpkKrZauKs0nkHiu97NUQRIk9
 RU1Cp4suwMrhuaD+jd+yX6Ren6C1Cv50WOC5sRH+FpfgbhyDvP7iJnJWYMvot6QUTEf9
 3+xqNz7pknHwzZVGxXCG9cAcwrmK0DXrgy7l80vwMsB2843PFmplvR67UnZdTxMf2qlW
 mijatWpo+Sg4GcfYkWzGVWBetRErKDZSo4alpd0GoFIFDl+pU0HrwZudw8te44fWVuSL
 BTXbRqrdYIW1c8qnFAS3fkr76tZgPNps0RQxDROX6RjBtYaJ+H1Y6RJ7OyTnIhzd3+Ha
 TCWw==
X-Gm-Message-State: ACrzQf2PJrMQ2HypLkyUg/TTB8i4kOpyQ8vwNfeWpubquXr2v4EYrQ2G
 xMPLtVPtLznQnJ/zo7XDkOPXYcQPty8EgQiH
X-Google-Smtp-Source: AMsMyM6foI8WggQkdQEoDNvP1B79NcwTFUDFY5tSpVOWwGkjH0JDNt2Ve/d4MiE7pOXSXxuYvL67kg==
X-Received: by 2002:aa7:9629:0:b0:56c:8c22:6d70 with SMTP id
 r9-20020aa79629000000b0056c8c226d70mr14267144pfg.8.1667219639192; 
 Mon, 31 Oct 2022 05:33:59 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a6545ca000000b0042b5095b7b4sm4093810pgr.5.2022.10.31.05.33.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:33:58 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
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
Subject: [PATCH v6 06/17] eepro100: Omit errp for pci_add_capability
Date: Mon, 31 Oct 2022 21:33:08 +0900
Message-Id: <20221031123319.21532-7-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221031123319.21532-1-akihiko.odaki@daynix.com>
References: <20221031123319.21532-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

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
2.38.1


