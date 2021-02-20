Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EAD32022D
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 01:23:03 +0100 (CET)
Received: from localhost ([::1]:56538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDG34-0004c3-UG
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 19:23:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDFus-0001ti-LF; Fri, 19 Feb 2021 19:14:34 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:40857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDFuq-0005r7-M9; Fri, 19 Feb 2021 19:14:34 -0500
Received: by mail-ej1-x62b.google.com with SMTP id u20so16191550ejb.7;
 Fri, 19 Feb 2021 16:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eGr5UWWx36FyPb21wHNpZuBCvW0pzWxLYXr/5FODULE=;
 b=nNBba7oEqfjtEothvithV0gs6KG7Tzi5ru6mEsocc/NCNDURfeTD6zmTrP0Xe9N6QV
 NUkcyXLOz7r4a/jwZM2Nb4w/swl4SOZDFmmYQw06OSxMAfIJaM0P9umXiqaZQiXosXGS
 HOWnCzSXmZE7MyerELq+3jMMqlspnKDMay1oWhZoKj8YxcGbIMFV6thO+WKRFIN1NnCK
 ZQLfLnz3+hy9av2nl9lMk/Wy2Bd0Mt0zzifCBk2+8cBOm6BRmERQivmJdX9EgKkzDlSW
 9wvTNpZ2G76PfXcWGGmD4KZAzZ4khe0Pf4Cec6ssvtcnGqKwQMoVTcWsOhBiL7fbha6G
 dmnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eGr5UWWx36FyPb21wHNpZuBCvW0pzWxLYXr/5FODULE=;
 b=sx0KvQ4qhwWH20HDitiCEUV+QCqp0s6URsKu/gD9fb1x1pMI6xawJ5hEsIFOvHj+re
 1Xv7X0t6CCKQBPPSCE/N8xqEgq8pQIC/gcNF3rFhHm7ppdudl5d4hf5UZ38UDEgfKgs2
 4V4MDY/ZqKF7qmGNRiB8/ORpdw2BZDjYZK7/oyTQxxm6Ki1o/LVYew4b8PqeHjb6ENyS
 kNjRRIBvdqxHvIYAH7bvYfii5sCYSsWf5u58v2Q/R8Yrif2FiZzH82EWBydQNpEK+kkk
 NhyqIWGyWbMRoZWPLqLcGpKmSqxR+BFDaHj40rlf78yS6+4SuDWk7PUR4KaM7FspMkks
 KdmA==
X-Gm-Message-State: AOAM530/giUAKvxX/fLPYiwS0VsaR5agnwtHw3lQVER9SUphiSBbdsrA
 UkhnF2/kAS6eoVFrUYsfXTMlswrP8Vk=
X-Google-Smtp-Source: ABdhPJzRyuxF2sHZH33iGG7bJjVLSY3IUmMj354kdj2qJxjik6NgSq18VOFex1PmBr7SFS1WsQsBAQ==
X-Received: by 2002:a17:906:4a0a:: with SMTP id
 w10mr11189069eju.551.1613780070856; 
 Fri, 19 Feb 2021 16:14:30 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id t23sm5378406ejs.4.2021.02.19.16.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 16:14:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/18] hw/sd: sd: Skip write protect groups check in CMD24/25
 for high capacity cards
Date: Sat, 20 Feb 2021 01:13:06 +0100
Message-Id: <20210220001309.2225022-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210220001309.2225022-1-f4bug@amsat.org>
References: <20210220001309.2225022-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

High capacity cards don't support write protection hence we should
not perform the write protect groups check in CMD24/25 for them.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210216150225.27996-8-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 883c04de028..3a515a5365f 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1268,8 +1268,10 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
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
@@ -1821,9 +1823,11 @@ void sd_write_byte(SDState *sd, uint8_t value)
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
2.26.2


