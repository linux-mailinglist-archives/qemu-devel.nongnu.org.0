Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 012373AA648
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 23:46:42 +0200 (CEST)
Received: from localhost ([::1]:44272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltdMu-0005UR-Uv
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 17:46:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltdJz-0001dQ-8k; Wed, 16 Jun 2021 17:43:39 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:34467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltdJx-0006VL-ND; Wed, 16 Jun 2021 17:43:39 -0400
Received: by mail-wr1-x431.google.com with SMTP id e22so657364wrc.1;
 Wed, 16 Jun 2021 14:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ePgJDFFOw4rGg/va2x01kE3ubJf7MZ1h52aSuruLrco=;
 b=rW/98W/lMx2v0/s6Cc7n0Sb2bQ3LUk7jsw87TOCYYu5qA4qyo2R+sTfkynbRx/BXfF
 uodxXLpCCF9Zuzp7PO7vIzTsgYNVO81rdkyt4yROYm3cJhZ9f4/4huMKAHZ7rerAKzX5
 N02snHPhvN6M+lFIvP7DMePV6GV8jwXcJQMvkb/2Wm5RTYtONVQIl1VUOYckK12SJHGB
 pMIKnuV5uhdjB6ty2s5JA6VBOT4XWIxbuLH4w/Yi5zYpsQM3DveDofq9X8OIkFun/ouS
 s6rb8CWIsRlMcwF5np1/609I+EMiSVJQOF8w7I5Auzf8ryVEYYGzPgOVcOZkiUoSUzA7
 nXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ePgJDFFOw4rGg/va2x01kE3ubJf7MZ1h52aSuruLrco=;
 b=f/0sflbj7Q9p26Nev2p0OYv45Ce9Hey4vghJQcmfGjA6jJr1Cju0kQn8ntI8GGaL3q
 ayxiIr1l3rLFv8/3RwJIo/LUGdhSswXQ39Et+WoJ9HnDXfwNTO2R7MTBGGxv7bnLza/M
 6olU+M5y7N1xzuWMpe3ReqaTviW1H6/06LUay1KuiG7eJVHi63F5mM1lPAT8zeDxcGp8
 4NQAeI4XUW1zGZn44GsYuyE0PQZATFjFxYz4LNanrKtmmxn9mVMlysbClnHl5y8A8lCz
 sydsj0kCA6ztOrSVfpuH1lKWDApLxua9h3RTMVNOiDklH9Qhm8V2Wiv/5yHCbifVfiOp
 i8Ig==
X-Gm-Message-State: AOAM533gYZlFmML7YP7oW7pNT1zUKhS1Ab9YHECVJPy4Vkx9xgf6HXaN
 QnyjmFa1QDYt6+sbHTTtPxLNpUnHQj1J5A==
X-Google-Smtp-Source: ABdhPJwgGPAVzsgUylUz4UgJOqI99+YbmA31IKk21sxdfAgmdTbXP7ktYNsBjFHQh62R2q9ASYVT8Q==
X-Received: by 2002:a5d:4ac5:: with SMTP id y5mr1492329wrs.18.1623879815458;
 Wed, 16 Jun 2021 14:43:35 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id j18sm3328687wrw.30.2021.06.16.14.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 14:43:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/15] hw/misc/auxbus: Fix MOT/classic I2C mode
Date: Wed, 16 Jun 2021 23:42:46 +0200
Message-Id: <20210616214254.2647796-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616214254.2647796-1-f4bug@amsat.org>
References: <20210616214254.2647796-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
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

Since its introduction in commit 6fc7f77fd2 i2c_start_transfer()
uses incorrectly the direction of the transfer (the last argument
is called 'is_recv'). Fix by inverting the argument, we now have
is_recv = !is_write.

Fixes: 6fc7f77fd2 ("introduce aux-bus")
Reported-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Corey Minyard <cminyard@mvista.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/auxbus.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
index 6c099ae2a2d..148b070ce4a 100644
--- a/hw/misc/auxbus.c
+++ b/hw/misc/auxbus.c
@@ -139,7 +139,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
             i2c_end_transfer(i2c_bus);
         }
 
-        if (i2c_start_transfer(i2c_bus, address, is_write)) {
+        if (i2c_start_transfer(i2c_bus, address, !is_write)) {
             ret = AUX_I2C_NACK;
             break;
         }
@@ -170,7 +170,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
             /*
              * No transactions started..
              */
-            if (i2c_start_transfer(i2c_bus, address, is_write)) {
+            if (i2c_start_transfer(i2c_bus, address, !is_write)) {
                 break;
             }
         } else if ((address != bus->last_i2c_address) ||
@@ -179,7 +179,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
              * Transaction started but we need to restart..
              */
             i2c_end_transfer(i2c_bus);
-            if (i2c_start_transfer(i2c_bus, address, is_write)) {
+            if (i2c_start_transfer(i2c_bus, address, !is_write)) {
                 break;
             }
         }
-- 
2.31.1


