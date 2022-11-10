Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED648624475
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 15:36:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot8eA-0001Mi-4w; Thu, 10 Nov 2022 09:35:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ot8e3-0001LW-UP
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 09:35:10 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ot8e1-0003e6-1P
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 09:35:07 -0500
Received: by mail-wr1-x433.google.com with SMTP id bk15so2500619wrb.13
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 06:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gh3FqphZHkPJ2RSd/jkhg3VQ5KjokR5mr4nkEYamX0w=;
 b=Z/spyWCnl/TlrU9BD10Mp+l6S8WFHMgWWOONx5xjVKdIko7xcLivDX3nV8tAw8TRYS
 vY0l2fyVT8UmLaVxXhVzlsIw3iGMJMLsWfxndm8vUgaUe0j03PJyJgfN6sywymYNsfE7
 HFr/+JFqyopBhQJYVu/R/ZteAiHYr4wwpadTduei8AUuubgENI7p3pq5RxzGgIIP8gG1
 O/KdpWfXDCjHuJJlTWiP2XyW82r37irhLQhMrKmY5aZr2cqmL4HzMFSfJIwysrUtbwgj
 5eATWZyHtMnEpokOcrmC6YyP03+1yHrxNGKS5DvRjdoOCr9LbmhEVNZC5ZQ4D3/H1DCe
 vOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gh3FqphZHkPJ2RSd/jkhg3VQ5KjokR5mr4nkEYamX0w=;
 b=Qtf2ttBDBYIH8UZkFJZ3dSX82C284X2KWqaOR7o5A5AbsqnZzhhhOTKL93/+3B4KJt
 +UWMx2ljLLR/EMcrlwQWZd16CIrnDmdCJyEuTXiUG1mUWUXPj3WX/jbsgfUqzdTaWCPX
 H5Ua854uBYGD7U4ACjpCRLZ1UHDyhN1hA+sEB6CxWYI1CLlA0LR88/8OozRpaQGUrCWD
 cTppJb/pnQTiUhPwvGFMgilmni3krkstg3oxLkmTv34Jl68kZiDJenhro50KCVGT/WHj
 VAfOp+M9tThtud6RWLJFwyMyK0RktUHsM6uFs0VZ9IFniCA+l95MRMtANRwwey46SZeQ
 8P9Q==
X-Gm-Message-State: ACrzQf2Pk9Z60dcOyU+qR0+9P0WH/magQOz8W6U9Wg3XArm3wisqucN6
 KSxSN5RiLl7xZS6a7snpGt3p15DzqgHXVA==
X-Google-Smtp-Source: AMsMyM6TT5MtiJ2qqCifJ37TYeaegkDj+8pFIlkKaWuclRAFkOKbARj8GsozpS7oIFZQ+N9ajPsxfA==
X-Received: by 2002:a5d:50ca:0:b0:236:776c:3075 with SMTP id
 f10-20020a5d50ca000000b00236776c3075mr42127368wrt.656.1668090903565; 
 Thu, 10 Nov 2022 06:35:03 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bq21-20020a5d5a15000000b00231ed902a4esm16666803wrb.5.2022.11.10.06.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 06:35:02 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH for-8.0 1/2] hw/misc/mos6522: Convert TYPE_MOS6522 to 3-phase
 reset
Date: Thu, 10 Nov 2022 14:34:58 +0000
Message-Id: <20221110143459.3833425-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110143459.3833425-1-peter.maydell@linaro.org>
References: <20221110143459.3833425-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

Convert the TYPE_MOS6522 parent class to use 3-phase reset.  This is
a prerequisite for converting its subclasses.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/mos6522.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
index fe38c44426b..0ed631186c3 100644
--- a/hw/misc/mos6522.c
+++ b/hw/misc/mos6522.c
@@ -643,9 +643,9 @@ const VMStateDescription vmstate_mos6522 = {
     }
 };
 
-static void mos6522_reset(DeviceState *dev)
+static void mos6522_reset_hold(Object *obj)
 {
-    MOS6522State *s = MOS6522(dev);
+    MOS6522State *s = MOS6522(obj);
 
     s->b = 0;
     s->a = 0;
@@ -705,9 +705,10 @@ static Property mos6522_properties[] = {
 static void mos6522_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
+    ResettableClass *rc = RESETTABLE_CLASS(oc);
     MOS6522DeviceClass *mdc = MOS6522_CLASS(oc);
 
-    dc->reset = mos6522_reset;
+    rc->phases.hold = mos6522_reset_hold;
     dc->vmsd = &vmstate_mos6522;
     device_class_set_props(dc, mos6522_properties);
     mdc->portB_write = mos6522_portB_write;
-- 
2.25.1


