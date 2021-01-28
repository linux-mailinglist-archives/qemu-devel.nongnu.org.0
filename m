Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1BF306DC5
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 07:46:53 +0100 (CET)
Received: from localhost ([::1]:37416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l514t-0002A2-KJ
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 01:46:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l50pc-0007Q8-2P; Thu, 28 Jan 2021 01:31:04 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:40836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l50pa-0001Fi-4h; Thu, 28 Jan 2021 01:31:03 -0500
Received: by mail-pg1-x534.google.com with SMTP id b21so3624552pgk.7;
 Wed, 27 Jan 2021 22:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TnZh7DEOrej1+UtJzzLiMV3IgufZiYy4MZVYPJThvrs=;
 b=VU6/T11SX1Rqphxq/Do7VJP7X59l+WCtWUziwt7DVVQl4p4qPXy2j8TjN2Fp+H23O6
 1+YgeOMvI+uBMbi4EWHsz2eyYr9jKJcBZH0JkqT5532e2imhuxvzbVMyA0QSVTrFbH1d
 HEnqiZQN4ClQdc2ATl2k7QHQQ35TU5ySg2EA/GTGJKs/oqevksDAVLMAzkOGpRK92Ja7
 OYvOvbSKdUvRPCuGgivBwou962Sl18RSDJdhOD/oybWFkz3r5Ql5leySTZ49h7xkeWj9
 1aH8hHF8dZLtXB01ZwgM4oqlSa4GMrOEWrcrP4Gv0b0X7YIkAU6fuBW0UcVgSosRpEbU
 RLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TnZh7DEOrej1+UtJzzLiMV3IgufZiYy4MZVYPJThvrs=;
 b=MgRlVvk+vZBxt6nv5mcgHn7OGbve66hixdk91DnLpWvcl4ii81/1xdk7XmWbNHZS8Y
 xnl55s5ykCY+dQJcl73LzwuU4UWY+WPS9zoc5OCDaAwJPWGRGSKanaeNk9MR4pCYX/Cp
 noBh3CuQ0/a8+vUq0XrI3HP8czT5f6WaQd5vlExaVTIKnAZVs0wiAkObD9bjLRCuJLgR
 Xe2voo4VkmvrFYi0fxL/a2DVzA39ZtLO0Upw8nnJ9SDX1CdGp2RovvFrhARBAk9VK6YW
 T/UW8VoI0lOCW79cMr5O4p85kZlD4Qn0THiFPd8GYnPIarQxgtop/sezJYxYu7F9OWIo
 2qOw==
X-Gm-Message-State: AOAM5322eJmQUwuzI8/rFmaf3TNpaNXuQUZHBzQMwBuQtJ2m3F2V6eN4
 z/4zXimwpktXxLl1MRJAweE=
X-Google-Smtp-Source: ABdhPJyEbvzg6SqhJMxC0RanoiDM/Oa9D/OEfU2l/c/SmRTkQzJfi5BTZbCYYHJqwtYK4eoNhZXGPA==
X-Received: by 2002:a05:6a00:a88:b029:19e:4ba8:bbe4 with SMTP id
 b8-20020a056a000a88b029019e4ba8bbe4mr14624250pfl.41.1611815459665; 
 Wed, 27 Jan 2021 22:30:59 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id t6sm4245080pfc.64.2021.01.27.22.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 22:30:59 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v4 7/9] hw/sd: ssi-sd: Fix SEND_IF_COND (CMD8) response
Date: Thu, 28 Jan 2021 14:30:33 +0800
Message-Id: <20210128063035.15674-8-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128063035.15674-1-bmeng.cn@gmail.com>
References: <20210128063035.15674-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x534.google.com
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

The SEND_IF_COND command (CMD8) response is of format R7, but
current code returns R1 for CMD8. Fix it.

Fixes: 775616c3ae8c ("Partial SD card SPI mode support")
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

---
When testing with VxWorks driver, this additional issue was exposed.
It looks like VxWorks has stricter parsing on command responses while
U-Boot/Linux drivers are all happy with exising QEMU CMD8 response.

(no changes since v1)

 hw/sd/ssi-sd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 200e885225..84c873b3fd 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -176,9 +176,9 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
                 s->arglen = 1;
                 s->response[0] = 4;
                 DPRINTF("SD command failed\n");
-            } else if (s->cmd == 58) {
-                /* CMD58 returns R3 response (OCR)  */
-                DPRINTF("Returned OCR\n");
+            } else if (s->cmd == 8 || s->cmd == 58) {
+                /* CMD8/CMD58 returns R3/R7 response */
+                DPRINTF("Returned R3/R7\n");
                 s->arglen = 5;
                 s->response[0] = 1;
                 memcpy(&s->response[1], longresp, 4);
-- 
2.25.1


