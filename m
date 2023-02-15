Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDF26980C2
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 17:21:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSKTs-0008BS-5u; Wed, 15 Feb 2023 11:18:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSKTX-0007jA-12
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:17:48 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSKTU-0008M1-8i
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:17:42 -0500
Received: by mail-wr1-x429.google.com with SMTP id bk16so19693676wrb.11
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 08:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qyUIbhj07XcqpScbyTudufNTnv88vdyZCLw8YDqH+8E=;
 b=nsqUb68DWzG9WtJIDlG+QYVcDwW9BfHBnHpfGqubntklmaZsK0yWeAod+Kr74rxskb
 FhLptyYI0XsEUWw80rYT/B+X6Iwr7rESCjntdThZeWAZaie70mSRQ8z50z7Kz+mNYw5+
 Gna9yWQrwxFZmRJdXv7Ek5XCJnnzwBg2YlZy2g0f1WofAZuMf6oMiwMdg00KJToctIC0
 zod+PzTxxBm0hXEIdvgEiEKvz2O45WhDZtI/GshzdvI62q/2StrTyIPZFQ/4lMK+tjNa
 UytLpKJxjHE+a0gV7/m14rSYVjavVHyA930XlQq7pF9s9rc/87HzueVtHMtTJQOwuw/f
 6wRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qyUIbhj07XcqpScbyTudufNTnv88vdyZCLw8YDqH+8E=;
 b=4goy79/0viTxys506PH1cSPWwuVjD/4qA46m6+4ieQkHDR6fZ6b+CFTzlIBSpiLU5r
 2fo6y63VwZ/U4v6rZdKe4qo49WmEyYDK0eR+Tmvas26YZedn96ryyygxwND3MmMOEzLw
 MHMgUOVZupgoq+cfwUtrcK8KuwFh3RJYIAdYrrJL0XJTk2v6nWOxj8n4R12w60C2NCnk
 1k8Dg+KQAElkbKiYMihZy5pP8nUHahV3VB1f/NyCSAumL6wPa9aZGQlng2+sCTFTAmwe
 rmxl1s+CgHNZxTtuDcy0xky8i61j8qxzrCbBu8wiR/FO4aWQD7CVAyE3Tl99tVNdXzPf
 PZag==
X-Gm-Message-State: AO0yUKXih3c0bYOo9g35IdJG5g+8QjSDAr06Fhhf/Q+xxaw27TlG1pMI
 ptOKsee/PBaF/wEd144YKwm+gc90lmq+IUOt
X-Google-Smtp-Source: AK7set/BUsVR27bM5hRR/XdPCNthJDuw3+hCzqHABL6sZtXiK6H3DakoQYH/dviv1EJiuFSE7OalSw==
X-Received: by 2002:adf:fa4d:0:b0:2c5:4ffa:ba62 with SMTP id
 y13-20020adffa4d000000b002c54ffaba62mr1985092wrr.17.1676477858167; 
 Wed, 15 Feb 2023 08:17:38 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 d1-20020adff841000000b002c5640f9bf9sm4660663wrq.85.2023.02.15.08.17.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Feb 2023 08:17:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-ppc@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 10/18] hw/isa: Use isa_address_space_io() in
 isa_register_ioport()
Date: Wed, 15 Feb 2023 17:16:33 +0100
Message-Id: <20230215161641.32663-11-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215161641.32663-1-philmd@linaro.org>
References: <20230215161641.32663-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

We don't have any caller passing a NULL device argument,
so we can simplify, avoiding to access the global 'isabus'.

(Since the previous commit, isa_address_space_io() assert
 the device argument is not NULL).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/isa/isa-bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 08c84704e9..abc1bd0771 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -120,7 +120,7 @@ static inline void isa_init_ioport(ISADevice *dev, uint16_t ioport)
 
 void isa_register_ioport(ISADevice *dev, MemoryRegion *io, uint16_t start)
 {
-    memory_region_add_subregion(isabus->address_space_io, start, io);
+    memory_region_add_subregion(isa_address_space_io(dev), start, io);
     isa_init_ioport(dev, start);
 }
 
-- 
2.38.1


