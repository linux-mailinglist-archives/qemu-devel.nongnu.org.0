Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3ACC6A4430
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:21:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe8v-0005He-JE; Mon, 27 Feb 2023 09:06:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe8p-0005Fl-UI
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:06:11 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe8o-0008MT-8U
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:06:11 -0500
Received: by mail-wr1-x42a.google.com with SMTP id e37so3877302wri.10
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LxEfan69o3My8Mrmn1KC1X4kpU+7cC+eIIqeiegwnsI=;
 b=gOFQX7LJTkUzE2/IoCmrMlqBkJo9hx52g+j7PihPDiFn4GXCX1JE+pmODJyysv1Meu
 jv8KEit8ctTakNciv9rFq0998bTAtuu79ehC+21J5VyAU40KtDZJnE4kHlVf0tZCkfqh
 H5qLAjZ46T8I723ekIdDq1KZdrSPcxlXOhJOPzfkjIi5tmawD2A+pm0dHhK+Dqtw97C2
 1h7MMrgwaywytmzz9FTGYRf04noyH+M1a3f5Jq0KMcbZISfpFc/v+yv+1TpcBUAqmwCX
 yE8Wqf9SnCFYyWgaJDkXaQgndeUvs/3/WpauEMSjxsf4t5B9BZ+JDmQykeAj4tXbknIC
 OoYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LxEfan69o3My8Mrmn1KC1X4kpU+7cC+eIIqeiegwnsI=;
 b=HzIiyhC0fcatVEPWQP5oXDw0X1Zwgho8p4nrCiDInqkYdgQ5Ehew+PyviBZpS+/Txj
 1zL1FCg7Jy1k3tWSxWBuNFJo5v2QLbOBpszet4vDgZbexAT2d8tOsrhhrsV5Kbjhzy8A
 /xFdINzDwUvyYip9+JAQz/u5QZLg2se8/CkU1IFpeQp0HGywL0M1PCNoBvssGacw2lMb
 OlhJx/IZkd1JfYb5iWMDxTTn9GrMDG/YYJGBCQ+y9MxR5QNRXPOKKnGrkSS5H/fQb7aK
 IulZP1038d01w36J+DaWSv0HRBGyl/0zQLEkZEANB0WCE7txi9oiXaromIxR4ksC1r4q
 uirw==
X-Gm-Message-State: AO0yUKVg0uQLgI+Dgy2gTIuWL1YDxH1tnhtllBTgEcHxi9mySdLBODpM
 Upzzye5693pXvdDyw6DV1RPpd7NB2mYvB1dm
X-Google-Smtp-Source: AK7set/jc60g4+LTIbR0rSfEEBy96ge+JNEZtaM6zWdEQnFWM68qcXA5RpPrIGWYPcWBUi2og+Q4uA==
X-Received: by 2002:a5d:456f:0:b0:2c7:16c3:1768 with SMTP id
 a15-20020a5d456f000000b002c716c31768mr10560285wrc.19.1677506767650; 
 Mon, 27 Feb 2023 06:06:07 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a5d4f0a000000b002c54911f50bsm7210362wru.84.2023.02.27.06.06.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:06:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 052/126] hw/pci: Fix a typo
Date: Mon, 27 Feb 2023 15:00:59 +0100
Message-Id: <20230227140213.35084-43-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

Fix 'interrutp' typo.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230211152239.88106-2-philmd@linaro.org>
---
 hw/pci/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index cc51f98593..bad8e63db3 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1648,7 +1648,7 @@ void pci_device_set_intx_routing_notifier(PCIDevice *dev,
  * 9.1: Interrupt routing. Table 9-1
  *
  * the PCI Express Base Specification, Revision 2.1
- * 2.2.8.1: INTx interrutp signaling - Rules
+ * 2.2.8.1: INTx interrupt signaling - Rules
  *          the Implementation Note
  *          Table 2-20
  */
-- 
2.38.1


