Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE893AA66A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 23:53:54 +0200 (CEST)
Received: from localhost ([::1]:39774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltdTt-0004fM-8W
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 17:53:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltdJk-0000qW-El; Wed, 16 Jun 2021 17:43:24 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:52804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltdJh-0006I1-0H; Wed, 16 Jun 2021 17:43:24 -0400
Received: by mail-wm1-x333.google.com with SMTP id n23so2069715wms.2;
 Wed, 16 Jun 2021 14:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0yFcNPzCMbJU7ln7mvR4pO20Y4U4Q8SH66r8xtnNF00=;
 b=FGNPUiL5FbXYqRdvJbWw08nHuEVPkkLQWO3dIKPg4eIrnDIrZ/t2Az9Lb/13ZRhHWW
 pFI9jrhy/0BG0WNjGFJikNjFZP7eIYbKtlksuzn1Ri6tH20odsEW54BGEPlf3WypPaPy
 bhH0/8RHQTik1hAOXACc1EV49uqrLzRHhSLUE+jhRUNEPWMgMQaB6RSujRXJZZyCQcv0
 gumOjJ6j1z5dfhb/qmJ/KOi0xEKjsVeNIdGZ0w3VeoNtecGzY3LPKQS217DKtDM/hX5u
 DrVThsjEoLvgKi/KIIwLpXtYVLJlmApk3/O5ng/SceYaJ8jIS9w6hWDgXfgGMJT8IyQe
 /SdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0yFcNPzCMbJU7ln7mvR4pO20Y4U4Q8SH66r8xtnNF00=;
 b=j5Ua1c8rTrZrYMiR6svMToluZJex2Y1LXvOcf/flzQIvV0qdpwTE3K0x8ulWMkfsiq
 XZawSaVjitbVQqMlPkoVytx/qL8f4450fAUL9Ql/PLh/nrZO99bBXDavktk/FlI6QjoU
 PIrjvkNDhI4Z+gOUcbYGu2dPlBB4G0hki4xDTrsWnqp6RbzvZnF5E9kbJ1jLNPXOyF0X
 pUN9y9mqzR9vr00zalNGh7yBvXVAkkNV2JeOwQ2i6ygMOI8YtX3sRxGLi7Gq1RG0NYNm
 2GtNhlk+zjkdkuWbKUxCddfXCvYGjW3gr01QFSP74G1N8TLKmCO7xbxjgrvxqAEuqvFt
 Qa/Q==
X-Gm-Message-State: AOAM532WaDoYKoch/GJ9Cwo6YpESFKQ+yiI8fx0w709yoigSQOcuRad+
 IaeosP1l4SJU8AorzA9RnVhsByvUkKerPA==
X-Google-Smtp-Source: ABdhPJxhBMZ3plpWqUCV/ntCJzIaSp8TTk8ea76Lwo8chj0L2B16yWhoMRGrRQ67Sxyjncmff+qbYg==
X-Received: by 2002:a05:600c:4f0c:: with SMTP id
 l12mr1105780wmq.93.1623879798779; 
 Wed, 16 Jun 2021 14:43:18 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id g83sm2774930wma.10.2021.06.16.14.43.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 14:43:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/15] hw/display/sm501: Replace i2c_send_recv() by
 i2c_recv() & i2c_send()
Date: Wed, 16 Jun 2021 23:42:43 +0200
Message-Id: <20210616214254.2647796-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616214254.2647796-1-f4bug@amsat.org>
References: <20210616214254.2647796-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of using the confuse i2c_send_recv(), rewrite to directly
call i2c_recv() & i2c_send(), resulting in code easier to review.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Corey Minyard <cminyard@mvista.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/display/sm501.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index f276276f7f1..569661a0746 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -1033,17 +1033,18 @@ static void sm501_i2c_write(void *opaque, hwaddr addr, uint64_t value,
     case SM501_I2C_CONTROL:
         if (value & SM501_I2C_CONTROL_ENABLE) {
             if (value & SM501_I2C_CONTROL_START) {
+                bool is_recv = s->i2c_addr & 1;
                 int res = i2c_start_transfer(s->i2c_bus,
                                              s->i2c_addr >> 1,
-                                             s->i2c_addr & 1);
+                                             is_recv);
                 if (res) {
                     s->i2c_status |= SM501_I2C_STATUS_ERROR;
                 } else {
                     int i;
                     for (i = 0; i <= s->i2c_byte_count; i++) {
-                        res = i2c_send_recv(s->i2c_bus, &s->i2c_data[i],
-                                            !(s->i2c_addr & 1));
-                        if (res) {
+                        if (is_recv) {
+                            s->i2c_data[i] = i2c_recv(s->i2c_bus);
+                        } else if (i2c_send(s->i2c_bus, s->i2c_data[i]) < 0) {
                             s->i2c_status |= SM501_I2C_STATUS_ERROR;
                             return;
                         }
-- 
2.31.1


