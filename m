Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1E03C3F78
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 23:20:06 +0200 (CEST)
Received: from localhost ([::1]:58110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2grt-0006Rs-Hd
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 17:20:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2ga5-0007nl-C8
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:01:41 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:39729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2ga0-0001AC-Pe
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:01:38 -0400
Received: by mail-wr1-x42b.google.com with SMTP id f17so22095541wrt.6
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 14:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xzjbO+5jo6pD19SRnGaYYtwqZATAxg4quF6D0X5U33M=;
 b=d0xq0X5mbyLIPvVJ9GNNp4IYay2e/oEyqacBTO2skJgXXQSSASbcA+1PTSf6AmS65Z
 49lDtZEkUP4t4lc7Z4X0mrkO+qJRctiEOyX6/8j09pcZHnX3wTGLMIDoChexAMe0KYJB
 AENQYoD2Uk3/ruBdJ224vcSIZcYHvAvKO/yytTZ71I6C4wK3qOALybDeE+P9cSu9vnwa
 IJp4VNnK8tMQfnfqcSXCIOt1aTrymYf0jAZowaoG99vU9eVVFYfGaM6VRWRNiT5oXed6
 fzSd1NxzCosfJyz3shH3CO7GjmSZS8UkuOZPqm2QYkr5u1QhvEe+NGe6zjQZFUPYgGFm
 G3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xzjbO+5jo6pD19SRnGaYYtwqZATAxg4quF6D0X5U33M=;
 b=aqljjopZKqwu8hGnlG6SLHzxOeoJmHrxnhxo4bO2dD8NcliYsSOr8lp9VpdrGGPBTJ
 coicKerOfkABDpiaQxz+IxxrsHj4Gf10S3QswkdcV562R92EDeKW2rVXlytyJt9sXe8w
 yVvyzpvo9yoN9sfH+QrJW0r8ZMIVVpRLn6lVisVmLLsF8fhjLzJKF0Y+YXBTFl+9u+uG
 abdnDP2Saqvd1+jy2KfDr+a41X+Tw1DqXKFab4OHp4+RwKiwgcu3brV2lGKVNEYmOhIU
 U+U5UpaimlZnoHTunhGO7nfV84fhacXp8m9Owb/MYQ1mTLL0AmRcbR0rm+xB3HQAlxKR
 uMSw==
X-Gm-Message-State: AOAM530ypr62oSw+OptPNgMT7eNd4HZLgtfM8ZBNrbyzthrBz8UB9ESG
 69w98SlCB8hBfSEek19nfS5LT+S13IDS/Rdy
X-Google-Smtp-Source: ABdhPJwuDFuldvyM9w7IG2oBR82gCO+guYI48yH0WyvQP8t32AwWBv8M+9WlnCDe/3hH38jnWtB6og==
X-Received: by 2002:a05:6000:1b02:: with SMTP id
 f2mr14327729wrz.315.1626037295233; 
 Sun, 11 Jul 2021 14:01:35 -0700 (PDT)
Received: from localhost.localdomain
 (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr. [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id e6sm3005736wrg.18.2021.07.11.14.01.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 14:01:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/19] dp8393x: fix CAM descriptor entry index
Date: Sun, 11 Jul 2021 23:00:11 +0200
Message-Id: <20210711210016.2710100-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210711210016.2710100-1-f4bug@amsat.org>
References: <20210711210016.2710100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fredrik Noring <noring@nocrew.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Finn Thain <fthain@linux-m68k.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Currently when a LOAD CAM command is executed the entries are loaded into the
CAM from memory in order which is incorrect. According to the datasheet the
first entry in the CAM descriptor is the entry index which means that each
descriptor may update any single entry in the CAM rather than the Nth entry.

Decode the CAM entry index and use it store the descriptor in the appropriate
slot in the CAM. This fixes the issue where the MacOS toolbox loads a single
CAM descriptor into the final slot in order to perform a loopback test which
must succeed before the Ethernet port is enabled.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Finn Thain <fthain@linux-m68k.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210625065401.30170-10-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/dp8393x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index 252c0a26641..11810c9b600 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -270,7 +270,7 @@ static void dp8393x_update_irq(dp8393xState *s)
 static void dp8393x_do_load_cam(dp8393xState *s)
 {
     int width, size;
-    uint16_t index = 0;
+    uint16_t index;
 
     width = (s->regs[SONIC_DCR] & SONIC_DCR_DW) ? 2 : 1;
     size = sizeof(uint16_t) * 4 * width;
@@ -279,6 +279,7 @@ static void dp8393x_do_load_cam(dp8393xState *s)
         /* Fill current entry */
         address_space_read(&s->as, dp8393x_cdp(s),
                            MEMTXATTRS_UNSPECIFIED, s->data, size);
+        index = dp8393x_get(s, width, 0) & 0xf;
         s->cam[index][0] = dp8393x_get(s, width, 1) & 0xff;
         s->cam[index][1] = dp8393x_get(s, width, 1) >> 8;
         s->cam[index][2] = dp8393x_get(s, width, 2) & 0xff;
@@ -291,7 +292,6 @@ static void dp8393x_do_load_cam(dp8393xState *s)
         /* Move to next entry */
         s->regs[SONIC_CDC]--;
         s->regs[SONIC_CDP] += size;
-        index++;
     }
 
     /* Read CAM enable */
-- 
2.31.1


