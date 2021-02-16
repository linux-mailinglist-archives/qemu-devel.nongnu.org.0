Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 642FC31CCC6
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 16:17:48 +0100 (CET)
Received: from localhost ([::1]:59422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC26l-0002nx-DV
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 10:17:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lC1sW-0004AY-CM; Tue, 16 Feb 2021 10:03:04 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:46925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lC1sU-0006Ki-Oy; Tue, 16 Feb 2021 10:03:04 -0500
Received: by mail-pf1-x434.google.com with SMTP id k13so6262349pfh.13;
 Tue, 16 Feb 2021 07:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=De5bwJf/gB6oegTlcXsKYXiBI7vnaHuG8ebxRTJsS0w=;
 b=IxK5AWVfj1TdsEdGT6rfy7p6YyT+sX1r8p+mtJXmgGN0pbPOJqacjmab0lxVbrOypq
 7rEKI8g3zYMuoMyUlMbDg8tW6SSPMsbt4MSWymOEYXWPoX4jRTzpYuAp0NzbpVMcKkxc
 tgmJP1Pe1DomQQNkdYGTyhhG7AHotzrigXedUWQbawHHjV4ye06Af8wkb7kinxFcsZB/
 3XKTrGYHAO53P7TGaRAqdxZUec7+NNb+UkeOz38VfHx7s9oWRnE8C+Pr3jwUW2DOdQ2S
 L+b/E86NX46WTQAXID3tVucVwth6gK0dZY7cOKu1jNvAQfCg1C/g6y6O99ldO5e3gy0q
 yXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=De5bwJf/gB6oegTlcXsKYXiBI7vnaHuG8ebxRTJsS0w=;
 b=eKR1QFrOSYOMArLopLIsma36LVKnYXc48c7jfUTHSf+RkZzd3cGHS91cOiuKXrjOsc
 rnC7EMyFb677/pCeCQ9yZCqKCKH9mXpFxzNCdUE9GKQLm+3mMcy5JDqVmuE7pWF3WrYY
 Z7nif5sK7Iirmk+Cb6S5K07Y3qXj/UAehxMaVH5cGN16rAVQkJWJND1qWJhSQDIQFSBp
 MmW236JO1gRfEkJYv7RaDJ1495ap6UQ+cLnLjT4/ySRTP61rYDvHYxv6z2aEO6RPYd4N
 MM5jtWkwQ2dOFGGajwHnLTu4s2gqTrxN1bbGxVjChJkUTpsUGcmUlniVmQ9WiPoImPeB
 e3bg==
X-Gm-Message-State: AOAM5337Z3ChAz3EqfcHQ2KEiOmH+sGj7UIIzJwTQbLYh4rODVeykJmL
 8x3I6VzVWDA0xAfe8SG1tXE=
X-Google-Smtp-Source: ABdhPJyVkfpBUo1rHJF/vTBKE/wjmUGZgHFXLbADVxqp4kLn1LNOudXftKtwAZIj3Nf+Bf87cNSxzw==
X-Received: by 2002:a63:2214:: with SMTP id i20mr19309470pgi.189.1613487780850; 
 Tue, 16 Feb 2021 07:03:00 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id n15sm21960300pgl.31.2021.02.16.07.02.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 07:03:00 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 7/8] hw/sd: sd: Skip write protect groups check in CMD24/25
 for high capacity cards
Date: Tue, 16 Feb 2021 23:02:24 +0800
Message-Id: <20210216150225.27996-8-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210216150225.27996-1-bmeng.cn@gmail.com>
References: <20210216150225.27996-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

High capacity cards don't support write protection hence we should
not preform the write protect groups check in CMD24/25 for them.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v2:
- new patch: sd: Skip write protect groups check in CMD24/25 for high capacity cards

 hw/sd/sd.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index b386f16fcb..75dc57bf0e 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1274,8 +1274,10 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
             sd->data_offset = 0;
             sd->blk_written = 0;
 
-            if (sd_wp_addr(sd, sd->data_start)) {
-                sd->card_status |= WP_VIOLATION;
+            if (sd->size <= SDSC_MAX_CAPACITY) {
+                if (sd_wp_addr(sd, sd->data_start)) {
+                    sd->card_status |= WP_VIOLATION;
+                }
             }
             if (sd->csd[14] & 0x30) {
                 sd->card_status |= WP_VIOLATION;
@@ -1827,9 +1829,11 @@ void sd_write_byte(SDState *sd, uint8_t value)
                 sd->card_status |= ADDRESS_ERROR;
                 break;
             }
-            if (sd_wp_addr(sd, sd->data_start)) {
-                sd->card_status |= WP_VIOLATION;
-                break;
+            if (sd->size <= SDSC_MAX_CAPACITY) {
+                if (sd_wp_addr(sd, sd->data_start)) {
+                    sd->card_status |= WP_VIOLATION;
+                    break;
+                }
             }
         }
         sd->data[sd->data_offset++] = value;
-- 
2.25.1


