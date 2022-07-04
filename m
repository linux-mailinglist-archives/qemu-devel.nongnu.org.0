Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB5056513C
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 11:47:10 +0200 (CEST)
Received: from localhost ([::1]:57104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Ifd-0003PA-Ey
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 05:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ITm-0001AX-Tq
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:34:55 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:44918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ITl-000504-B0
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:34:54 -0400
Received: by mail-pl1-x629.google.com with SMTP id l6so8059279plg.11
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 02:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xRn3dlMBTLw7s8LlUcFJIo3Piu/j8Godlc8+nn+z6/k=;
 b=MxpuontjrktHYdZuYoznkc5z6olhgKsQX0MWYBZY6hn8dg8kHRVOQbai+DXGJwonJw
 zuYjSLZnSTOc7ySkdr2j/013N4PwhstwfsrrU6GR9/tU8jk2FQk3TVsvpYc3a3p21ms1
 CZ9h3mwel6vP0RlS0bHh8hM9f5UZYGjfLhZAmtBR1JGqi4exySmFTg+8hFvqU4pEUpDV
 NM8mA/bnGySY82SV8ARMeM48I6rJ4TJfHjcx9rw/yFIh8ChLR+9zHA1gJZ34QbsI2Ddt
 7t/PemsVVo5U5h0P6vBHAIphODEE5LWwucc4OhGgpt1I61eIX4kq9mlnNQ3vZ+XCtK+L
 UxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xRn3dlMBTLw7s8LlUcFJIo3Piu/j8Godlc8+nn+z6/k=;
 b=mCP7JiUrco2zG1MQw29erTuMRl5+RztJo2/sQ++geGr6Zv/uPKgVegyySHReurLOpe
 EMSopl9BJIn2b7/MjvLbYoieH8yxqLV/lTh8mc64Rz4UyGtHYzn0ag9vtrPfZ7Do9gv1
 tYXG4JM/+AWA1svCRLkhdo96Obn5D69UkcxswMtDMFXZqTgIvzetCiMrcrSDPWieBO00
 1kH+KsGAUIkXmedVN0UMzPAO1SvbUlLcv1zKRQAauXGh4WUhYdZMejsTpk6ANyK9WJBa
 nYIaYZKx8jxMixKA5q39dXT4wuvFzqvzt6d9jJsQEfCkRmW8uFbD1t50kR58vXv9aGj9
 jdww==
X-Gm-Message-State: AJIora8RCtemUu9F5DwbTKObOiwnqhQmvlfir90dSWUB4shHHe1hLnyo
 8fxVsRykWQ0qrP6N9TAww/Ntux5OwB+S8TWd
X-Google-Smtp-Source: AGRyM1t365CH1xo62H1pY5oLWmF6zhM3RtPd/hBkMuaVOp9iEnI9NgKK3VqJo8/FEVx5eXefzjhp8w==
X-Received: by 2002:a17:902:cf03:b0:16b:e692:c104 with SMTP id
 i3-20020a170902cf0300b0016be692c104mr2717340plg.134.1656927292026; 
 Mon, 04 Jul 2022 02:34:52 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 z5-20020aa79e45000000b00525b7f3e906sm15353355pfq.27.2022.07.04.02.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 02:34:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PULL 18/23] hw/rtc/ls7a_rtc: Add reset function
Date: Mon,  4 Jul 2022 15:03:52 +0530
Message-Id: <20220704093357.983255-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220704093357.983255-1-richard.henderson@linaro.org>
References: <20220704093357.983255-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

Add ls7a rtc reset function to delete timers and clear regs when rtc reset.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Message-Id: <20220701093407.2150607-5-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/rtc/ls7a_rtc.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/hw/rtc/ls7a_rtc.c b/hw/rtc/ls7a_rtc.c
index f1e7a660e9..eb10cdb451 100644
--- a/hw/rtc/ls7a_rtc.c
+++ b/hw/rtc/ls7a_rtc.c
@@ -463,6 +463,25 @@ static void ls7a_rtc_realize(DeviceState *dev, Error **errp)
 
 }
 
+/* delete timer and clear reg when reset */
+static void ls7a_rtc_reset(DeviceState *dev)
+{
+    int i;
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    LS7ARtcState *d = LS7A_RTC(sbd);
+    for (i = 0; i < TIMER_NUMS; i++) {
+        if (toy_enabled(d)) {
+            timer_del(d->toy_timer[i]);
+        }
+        if (rtc_enabled(d)) {
+            timer_del(d->rtc_timer[i]);
+        }
+        d->toymatch[i] = 0;
+        d->rtcmatch[i] = 0;
+    }
+    d->cntrctl = 0;
+}
+
 static int ls7a_rtc_pre_save(void *opaque)
 {
     LS7ARtcState *s = LS7A_RTC(opaque);
@@ -511,6 +530,7 @@ static void ls7a_rtc_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     dc->vmsd = &vmstate_ls7a_rtc;
     dc->realize = ls7a_rtc_realize;
+    dc->reset = ls7a_rtc_reset;
     dc->desc = "ls7a rtc";
 }
 
-- 
2.34.1


