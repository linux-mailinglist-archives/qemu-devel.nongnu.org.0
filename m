Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5734C007F
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 18:53:20 +0100 (CET)
Received: from localhost ([::1]:53142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMZLj-0001oN-8A
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 12:53:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMZ7e-0003vk-1I
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:38:46 -0500
Received: from [2a00:1450:4864:20::52e] (port=42899
 helo=mail-ed1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMZ7c-0002q2-8k
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:38:45 -0500
Received: by mail-ed1-x52e.google.com with SMTP id i11so37020808eda.9
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 09:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zjmSFcMWhfofmPFxlk/r2EeC0P+Uw+dEJELYLF9MjVo=;
 b=RXuSJjhZMKFGr3pclKhNgalDOKTxnrFfO8HRvdhLdiW1wZTk6Psz4lKQIEthOXcblX
 tyHs4Zqvp/y8agIx9hyxATm6mn/A7WYWO72f8P+Ae+V8YHANIqXviNQE6tvXU0LCGH2b
 /DaSLqn3MYDqEOMYcHVY3i9lHrhC5pDps1SH7TIV1Id3Ad9VEgPPtNzXaHQJpinVe44i
 fJ4deNzEf4r799LVLeDGdhKW696yjOwcOIyKp7x43ksIlTB/oZxsbuzQSlfS5ftAFnxD
 I+nKNId7lFzamQw/Pvs48SiCdnjkZ9iFn22ukkhSc62v1QZXr27tbsshZlx4VMS+HolC
 EE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zjmSFcMWhfofmPFxlk/r2EeC0P+Uw+dEJELYLF9MjVo=;
 b=AYpHdQvxQjoj6/wKhuvYNAdnyVHgrhxkI8froi0ubecSDYuECMh4Hz6OpzGjaX7xYV
 4Hf95LQqQExqVZEws7LlFjXocextP1J6N8I1QINbm0dP7tH1W0LyoxuXn3a8+QUfJalK
 vM1DFeYjA6wXCIenMebYtBHHXSDf3jzZZj7v77en7QPeGUX9EjVX0+D+OIx5kFhg4b3B
 HVtmE8hd9x+/glqAozfgRnq95cyWQvz6c/7d+fhlOq8o3SbAFaghtAuBxIZQMQdafrAD
 E9ignQvdKn9TsT/xsmHYjR34Hn/6k9KuluAJE31HJQThaIG1VeaGJ7raVHWpnOJdN2UH
 S5wQ==
X-Gm-Message-State: AOAM531u54uGHk2/Y2uiXZYAJ20dwQEKyKxmZ6Wu7Irm+EDDoAqH7/9m
 +9pkEHbz1Z6LNOlFn4ITPuVMFtuIhn4=
X-Google-Smtp-Source: ABdhPJxN8229K0AftczisfyzvuMFwm422TqeH2SNlTzcPqhCkleeOYg1mXJvpX4FKFRax42F3LmWHg==
X-Received: by 2002:a50:ee14:0:b0:410:7a88:4b0c with SMTP id
 g20-20020a50ee14000000b004107a884b0cmr27568761eds.37.1645551522738; 
 Tue, 22 Feb 2022 09:38:42 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-227-088.89.12.pool.telefonica.de. [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id et2sm6449382ejc.101.2022.02.22.09.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 09:38:42 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/22] hw/ipmi/isa_ipmi_kcs: Disuse isa_init_irq()
Date: Tue, 22 Feb 2022 18:38:13 +0100
Message-Id: <20220222173819.76568-17-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222173819.76568-1-shentey@gmail.com>
References: <20220222173819.76568-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Bernhard Beschow <shentey@gmail.com>, Corey Minyard <minyard@acm.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

isa_init_irq() has become a trivial one-line wrapper for isa_get_irq().
Use the original instead such that isa_init_irq() can be removed
eventually.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ipmi/isa_ipmi_kcs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ipmi/isa_ipmi_kcs.c b/hw/ipmi/isa_ipmi_kcs.c
index 3b23ad08b3..afabb95ebe 100644
--- a/hw/ipmi/isa_ipmi_kcs.c
+++ b/hw/ipmi/isa_ipmi_kcs.c
@@ -91,7 +91,7 @@ static void ipmi_isa_realize(DeviceState *dev, Error **errp)
     }
 
     if (iik->isairq > 0) {
-        isa_init_irq(isadev, &iik->irq, iik->isairq);
+        iik->irq = isa_get_irq(isadev, iik->isairq);
         iik->kcs.use_irq = 1;
         iik->kcs.raise_irq = isa_ipmi_kcs_raise_irq;
         iik->kcs.lower_irq = isa_ipmi_kcs_lower_irq;
-- 
2.35.1


