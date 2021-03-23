Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5C5346641
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:26:58 +0100 (CET)
Received: from localhost ([::1]:48548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOknx-0002LH-8J
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:26:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOkAV-0004Up-ES
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:46:12 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:54965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOkAP-0007RV-Sm
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:46:09 -0400
Received: by mail-wm1-x336.google.com with SMTP id k128so9027392wmk.4
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 09:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i59NK8T1KKmM/jpHKwY4F5uG2e8WcL/wYXoZD+s8pas=;
 b=n1YDtAvTnM6Fagg7I1Pw+qpfjIUD2eusTi4D+8adgkY1wG9E3XwIP+v3cbGcf2mVTq
 30Ch6Zj7EBUZ7JWJzXpIs1rkjhEbbUot1tMUvOMEdJWyLVgrCGgThuY8eXPncYrXmSJS
 /3hm8hwLWvXg3qUqe5/hczTkWFRM9Z0e3GwyZrhrhJMkT+IN6iylVSuhi/mH5rb/ytt6
 jvErrIF5MRxX6uAKvvwjnjz0hSR31q4BCHUXONCIhEFbLCDgsrlfRpLTBa1hFVV4MQuM
 IRO+LhHPukoaA11ydD5MS9kCoH8A0h4WWQ59dhep8M3Rgfas0nV9yqtrFUAaJ/11cQNQ
 ENZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i59NK8T1KKmM/jpHKwY4F5uG2e8WcL/wYXoZD+s8pas=;
 b=Ufloofg7LuLH/FnpOuwiF/0IVn3fY+DUZ085CUq2kvzGWFlwECHn/Hn2GTo/i+LmXW
 cfml/eVDQa1UAs45dx8IyVU7GxaNOPFrQKrTIIhf8qS4NUemqmuQghi6BqjunpGX7NLi
 sHZDio/lJzte6fNQ9MsaMfgbw6lIMUzIbtEBOp+n09htxVOXfrVtopCc1o3VdByj8j9z
 +bxX9EIX84QipfbArmWEnDxGSX7M+GAJ5hhOKrgEr0jwS8bP7Kqb1O76t9mkvrPhKHvc
 G4/5FFeVWnJkTVibcfBxFa6yqq+A5MJkeXIu80fVqgfRp93+LtlysXmepjGpYjI/xfyo
 yQdA==
X-Gm-Message-State: AOAM532zfJcR3uKUSh5LT36q9w4yD47gaCNnritY3uvGQoKHyJfX/uju
 Qo1FDo7prlhNuZ9MXPD/hcHL+2eqi6CDxgqN
X-Google-Smtp-Source: ABdhPJzYVIQT8xAkDe04Z70s6+kS9rZjRRFHYutjZ2ZBKk4apzk0Lhy3F0OrfqKTEPQO3CCQt3pLIg==
X-Received: by 2002:a1c:7e16:: with SMTP id z22mr4182891wmc.74.1616517963690; 
 Tue, 23 Mar 2021 09:46:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q15sm24045077wrr.58.2021.03.23.09.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 09:46:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/pci/pci.c: Assert that pci_irq_handler() inputs are valid
Date: Tue, 23 Mar 2021 16:46:01 +0000
Message-Id: <20210323164601.27200-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

pci_irq_handler documents that it must be called with 0 <= irq_num <=
3 and level either 0 or 1.  Add assertions that the caller has passed
us in valid arguments.

In particular, if a device model fails to set the PCI_INTERRUPT_PIN
field in its config space correctly to indicate that it has an
interrupt, and then tries to raise an interrupt (either by calling
pci_set_irq(), or by getting a qemu_irq from pci_allocate_irq() and
then calling qemu_set_irq() on that) we will now diagnose this device
model bug with an assertion rather than engaging in the undefined
behaviour of shifting by a negative number.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/pci/pci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 0eadcdbc9ec..38aefe22ab3 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1449,6 +1449,9 @@ static void pci_irq_handler(void *opaque, int irq_num, int level)
     PCIDevice *pci_dev = opaque;
     int change;
 
+    assert(irq_num >= 0 && irq_num < PCI_NUM_PINS);
+    assert(level == 0 || level == 1);
+
     change = level - pci_irq_state(pci_dev, irq_num);
     if (!change)
         return;
-- 
2.20.1


