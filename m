Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D50569D042
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 16:06:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU7jd-0001ZD-JD; Mon, 20 Feb 2023 10:05:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU7jV-0001Ud-Sv
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:05:37 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU7jS-0008Q8-Hm
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:05:35 -0500
Received: by mail-wr1-x433.google.com with SMTP id l1so1265211wry.10
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 07:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7fg6HCxs6YpFo/+46boIzya1hKfktdzojAtH+afSJyQ=;
 b=r9D8/sZ57wMWYURio6MgHiplYoREPPP5ECnZWbkTvd1XGr+lIeT0nApvdJUXrTD4Pv
 ts4EtFGdrza8Q8Dqlk6QFEBiTByaEbH1raEoXSSXCcpgyEGQaj0DcPVLFf8ke3uBply7
 tGnmcx1rIAPnGajolZyE1zTcQPwoecPbJtelOpmVI8nRo0ZN+R34kpSmpgjoDeQYZESH
 rqVdBFEZl1lxwmc+RmvOHBlLgTPfYJMuQUEgqRe2gOX03gIpGunW0T3IPuS5QR6Vca7c
 iXh7ZxIakDuDlYXQHpg1b+DwnLDiSJ95M2AWNbhKxU8ytXuf9SaNh9DNqnX0pBIC2miN
 Oykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7fg6HCxs6YpFo/+46boIzya1hKfktdzojAtH+afSJyQ=;
 b=8SJxntMib3BmIJlMvAxqi36tYYP/Uuoj/JlrnAYBIO0TY6P3R+wfW0O8dEyhIrYjhG
 y2gcZyBhXgLkVC3iEujzYB/mYcfGKnK4yhnd86flaqjepY6UqcrIrq8bHoVUPMI0fM3w
 M4RohKLeuOeo/gJU6txXezV4bDWo80q1Rq1mHnJQxnbC97i3WtfwY4ycmqdipunX9UO1
 P+j7T8BwvfwRWTBq90G17psaLGF/8gEPSVulFO6TGGn/2kQ7dxVEccijzEVW6FalEPLK
 EePu0nNmpELIAuDQKOFFN/4pqKuiam76D//Au8M196YdivGZ/PQ+QBsR02/UP6P777jz
 azAQ==
X-Gm-Message-State: AO0yUKVIrmElAwhYrPqFzPYAYiSq2doVaX6KaJ6XuhvIBinxJxmOHT2I
 sgg0sTlCSpV0zg1E3JQj5DkjKkaithcTwNgg
X-Google-Smtp-Source: AK7set+nPjQc+NySf/0HGsmAmLPQNFM8i/rDFL997S2BPuimChtlBhe2FWqr5/1lmfm5E5OagoblyQ==
X-Received: by 2002:a05:6000:188b:b0:2c5:4e06:b689 with SMTP id
 a11-20020a056000188b00b002c54e06b689mr641490wri.28.1676905532987; 
 Mon, 20 Feb 2023 07:05:32 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 v6-20020adfedc6000000b002c5544b3a69sm12652486wro.89.2023.02.20.07.05.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 07:05:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/9] hw/usb/hcd-ohci-pci: Use QOM type-safe cast conversion
 macro
Date: Mon, 20 Feb 2023 16:05:09 +0100
Message-Id: <20230220150515.32549-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220150515.32549-1-philmd@linaro.org>
References: <20230220150515.32549-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Use the PCI_DEVICE() QOM cast macros to avoid accessing internal fields.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/usb/hcd-ohci-pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/usb/hcd-ohci-pci.c b/hw/usb/hcd-ohci-pci.c
index 6b630d35a7..3234408f1a 100644
--- a/hw/usb/hcd-ohci-pci.c
+++ b/hw/usb/hcd-ohci-pci.c
@@ -52,11 +52,11 @@ struct OHCIPCIState {
 static void ohci_pci_die(struct OHCIState *ohci)
 {
     OHCIPCIState *dev = container_of(ohci, OHCIPCIState, state);
+    PCIDevice *pdev = PCI_DEVICE(dev);
 
     ohci_sysbus_die(ohci);
 
-    pci_set_word(dev->parent_obj.config + PCI_STATUS,
-                 PCI_STATUS_DETECTED_PARITY);
+    pci_set_word(pdev->config + PCI_STATUS, PCI_STATUS_DETECTED_PARITY);
 }
 
 static void usb_ohci_realize_pci(PCIDevice *dev, Error **errp)
-- 
2.38.1


