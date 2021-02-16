Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4A631CC9F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 16:09:22 +0100 (CET)
Received: from localhost ([::1]:39954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC1yb-0002XN-3l
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 10:09:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lC1sc-0004Cj-Ck; Tue, 16 Feb 2021 10:03:11 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:33344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lC1sX-0006LH-AH; Tue, 16 Feb 2021 10:03:10 -0500
Received: by mail-pl1-x631.google.com with SMTP id d13so5630221plg.0;
 Tue, 16 Feb 2021 07:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RX9/mc21LlaINOEfHOR1CYj3YRn+N+tLyleUVvIUn/c=;
 b=I/PPjPe4HHIvpKcnnhlsXaA8Bx6bbGE4SLdYgJcPtZWItImIBeoRKTtRX2vJBW5D/v
 7QoSjffi+jQdhG2oV24hGLmQ5aU1LHwS8lxsR4QjZOjij1XW81cq/NwN24nEJTk7urnL
 bTR4ij3bOwJTHHNoaEpnd0Px8uWZC4ix0o1zPasCFHo/QNGQtJyXOxmsAkbdGH7ZvY33
 5gQha4pxgE1WR3Cydx0mDdsYLJLRHf5kVzr50gcQ9wS+SVmAQAI2ugPchIAwqO4GTaji
 AFCzxoGG66m8hArkwLa/JrTY+0qd8WvYEcDsf36m7nwlVx5JxT8g5wH2MypFmQ9TS4Bi
 3nVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RX9/mc21LlaINOEfHOR1CYj3YRn+N+tLyleUVvIUn/c=;
 b=qkcmCFYWznDyueLDVzHxXNCzpwoOix+YeaSAOSdcWTYvMJS90TNYQsxfmEQ62Ootfl
 BY1vj3swTMCWtsvkNg3PvywKcjVgVbODQCxSgzXptC1P0eqv7D69EYUWjLt3UenbdBB8
 x4fzVBQu0zC/tcEc7u38g51aBvFSBLvvD4UTQNzwKkzZXKmICRRBkr6rmjubb0Wf0KBO
 ssayjEPr3U5Qfu4dyzeWVB65hST1GPy9puVfqsH9NwCIF6IsItnAPOT3SY3w5WNo5i/C
 D8uOcan+SAwYOuekYnFgnU9H+5b5oc3C090DGjwTBdJLzAurWFZ9EeoEye4a+gn3GmkP
 KxgA==
X-Gm-Message-State: AOAM533CykWsfHrecHtuvTewgsGkwTrFh5moAyk2nrs2fmHaRy0TxIFd
 JMJohyiLuFI1TTgpb4chfYCEsecZ958=
X-Google-Smtp-Source: ABdhPJxXRo8jpANODl9iaH8WtstQ6KyrlOyuBFnY/vS8XSXFHCWNcIAIrZLcTMoUWSAdqyDb8A0D0Q==
X-Received: by 2002:a17:902:ed0d:b029:e3:76d8:79de with SMTP id
 b13-20020a170902ed0db02900e376d879demr3227493pld.36.1613487783910; 
 Tue, 16 Feb 2021 07:03:03 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id n15sm21960300pgl.31.2021.02.16.07.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 07:03:03 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 8/8] hw/sd: sd: Bypass the RCA check for CMD13 in SPI mode
Date: Tue, 16 Feb 2021 23:02:25 +0800
Message-Id: <20210216150225.27996-9-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210216150225.27996-1-bmeng.cn@gmail.com>
References: <20210216150225.27996-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x631.google.com
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

Unlike SD mode, when SD card is working in SPI mode, the argument
of CMD13 is stuff bits. Hence we should bypass the RCA check.

See "Physical Layer Specification Version 8.00", chapter 7.3.1.3
Detailed Command Description (SPI mode):

  "The card shall ignore stuff bits and reserved bits in an argument"

and Table 7-3 Commands and Arguments (SPI mode):

  "CMD13 Argument [31:0] stuff bits"

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v2:
- update commit message to include the reference in the spec

 hw/sd/sd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 75dc57bf0e..6d6da83b4b 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1169,8 +1169,9 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
     case 13:	/* CMD13:  SEND_STATUS */
         switch (sd->mode) {
         case sd_data_transfer_mode:
-            if (sd->rca != rca)
+            if (!sd->spi && sd->rca != rca) {
                 return sd_r0;
+            }
 
             return sd_r1;
 
-- 
2.25.1


