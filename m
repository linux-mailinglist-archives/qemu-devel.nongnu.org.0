Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53908614C6F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 15:18:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oprmr-0005qx-0X; Tue, 01 Nov 2022 09:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oprmp-0005pf-Sx
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:58:39 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oprmj-00043z-1F
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:58:39 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 l22-20020a17090a3f1600b00212fbbcfb78so18869850pjc.3
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 06:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vn8QAsjO7gtbZVeE7QQx9COaGQRw61V/sT24VvnuPKo=;
 b=C3GjqfXsD+xbAZ7NLVEBefSI2Q16JRsfCuQhCFx3qZthCUNPIJCISVWkjLGFcyymei
 FF5dVckuzI3Ww9iWO+PsoducmQ/H4F/gpL7hnJvDK8JjbhXRIMQJwnhqHJBHOngCOYog
 qpXywxGkE60HhwdJZ0jlyw80sFQihf/sqvVpdquhTCauNDSR6FUKcVNN76l9mEYNAesa
 iz03iJgmEIw5DmKq28TLqmAt5+Mq4BQ219OffOeBLe9BaRI4vjX+TgPl8Y/XETGcvFii
 E74jiD9PjU/viIXMzanR3CD7AQNpqyPX5A2/uICiM0REaA0qe0q3K91klSg8TJluD8R1
 6LzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vn8QAsjO7gtbZVeE7QQx9COaGQRw61V/sT24VvnuPKo=;
 b=S0IyCJhwYI3RCdF5g4Wc5sjAyZQDXmASo6g4AjuEW+2nODXbuT7GNW8SyZZGXey2yj
 wP7b6nXJQPfD1vftZQIe/L/BNVfaUd5RtsVDqrgyXEldigneyAwAefMpHEqOKEAgqdDq
 famg3MNRjT/eqBVILKRiCfE90Tp+z3AN9PVYwYhI6taBxhW4vFB53NmGAPvHcIEYcXW5
 0yKoTMtcDok88iL0CZeE0tw5MkjG1dRZHykJipa5Hrhji/DIbdVmXq1F7olyu1XZx6og
 RFDZqo9MiegKtZnR3SiS5vy7a7qtClBEc/8Ac3jCnpW3cxNTlh/qtIq2dV/yphvvfNXg
 tOhQ==
X-Gm-Message-State: ACrzQf0A3P1QnL4iAWOkb8fUnvkCV6+JHs2hlJ6IoMVq1cmUvlIBm//+
 l4Je5PA5jfS6/rfvIAfy2X9HRs4GJXFLTxbM
X-Google-Smtp-Source: AMsMyM7zj9Ly+opxmHR9S8IfDWfyvZIjj/nbfM+mthMg3TS9YvkGmkAa/d1LzucJyczAn+uYiUs0Ng==
X-Received: by 2002:a17:902:e5cb:b0:187:2d8c:a4fa with SMTP id
 u11-20020a170902e5cb00b001872d8ca4famr6963792plf.151.1667311110942; 
 Tue, 01 Nov 2022 06:58:30 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y4-20020aa79ae4000000b0056bdc3f5b29sm6510722pfp.186.2022.11.01.06.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 06:58:30 -0700 (PDT)
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v8 06/17] eepro100: Omit errp for pci_add_capability
Date: Tue,  1 Nov 2022 22:57:38 +0900
Message-Id: <20221101135749.4477-7-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101135749.4477-1-akihiko.odaki@daynix.com>
References: <20221101135749.4477-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102f.google.com
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


