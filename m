Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 486AA306DF2
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 07:55:21 +0100 (CET)
Received: from localhost ([::1]:55888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l51D6-0001Y2-CX
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 01:55:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l511j-0000vK-BB; Thu, 28 Jan 2021 01:43:35 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:46182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l511c-000564-P2; Thu, 28 Jan 2021 01:43:35 -0500
Received: by mail-pl1-x636.google.com with SMTP id u11so2770769plg.13;
 Wed, 27 Jan 2021 22:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+ONtYAQnIg3B0shD87NXtuFcOs8Nz1ALYrT2I+ozvuA=;
 b=d225K6La+D9US1LHDi3IPth44wgj5Kqk8SLfAHuhbGuHSnZUEjeYNzLgM6u1LtRNej
 3Dt/ZazmUus4rlLxIgy9Dins4FunDkzkOuxDXEqVGNEcx+F7GEG/oYOi739e4ybWaIDp
 HNR8lmsTgCn1yafzMCSsMYNrAmNUQqNJImRyhIrJ00pwc25MVT8fuxOtktnn09u5A8dB
 KPd4Kh2t8hTboBoZjpQAuul4KrK8w2rGQcVuhx10cpq2gieI5HuWlFf+JGPQJiNIIAvS
 EwIJkVjPLZkYBw+7S65hpGPMp0IRqGeY6pZ6LGl+WXoXz2nIpujpCh1ezElfW33eX0nz
 uzzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+ONtYAQnIg3B0shD87NXtuFcOs8Nz1ALYrT2I+ozvuA=;
 b=d5ktkmEOw5Us1wfzeFH07K1P/DbcBIcigTpLlniSGZI1IFRhb5GwP3VZApYLa5SHvf
 y2h2JiNbxHQeIJZl75uqFDayWRyAy12PCQr1sN2L2Sr0h8yKoGyEbJsIPkG0lSYgNaf/
 MYluGBj2Fi55OtwLh5qOZcfzhq/d2eIa9jEhTZWXg90Gc8LQhA8/PPU290qpi9uSo/p8
 dv79ODCut2NE2AaOIH2Gi936iCleY4oHzDcK/oJT2QybN9FizFpnJrRU0TZU3rH+s4FS
 gKDM/Mx9lJjMNcWRst59gVosZUKEpGzqZIynFF25cx2L4b0eFptI+EI0t2BehTb6BbtM
 E2gQ==
X-Gm-Message-State: AOAM530nB78Su8hpT2OduiDUDsTZ9CQdwMImkBnhq5bFCDEYsgbAD2es
 UxAIT4ihseJfXnQn/jKBcgtEltGSAvdlNQ==
X-Google-Smtp-Source: ABdhPJxOqQo2//UTgWmDcn4eVPOKHzH61+Y0t7ygQxXgJPfASwKCtlP2izRBoAQN2cjQyl/Duvw3xQ==
X-Received: by 2002:a17:902:c106:b029:de:af88:80ed with SMTP id
 6-20020a170902c106b02900deaf8880edmr14924165pli.35.1611816207318; 
 Wed, 27 Jan 2021 22:43:27 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id v19sm3800609pjh.37.2021.01.27.22.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 22:43:26 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 3/3] hw/sd: sd: Actually perform the erase operation
Date: Thu, 28 Jan 2021 14:43:12 +0800
Message-Id: <20210128064312.16085-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128064312.16085-1-bmeng.cn@gmail.com>
References: <20210128064312.16085-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x636.google.com
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

At present the sd_erase() does not erase the requested range of card
data to 0xFFs. Let's make the erase operation actually happen.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

 hw/sd/sd.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 1886d4b30b..8c397d4ad7 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -765,6 +765,8 @@ static void sd_erase(SDState *sd)
     int i;
     uint64_t erase_start = sd->erase_start;
     uint64_t erase_end = sd->erase_end;
+    uint64_t erase_addr;
+    int erase_len = 1 << HWBLOCK_SHIFT;
 
     trace_sdcard_erase(sd->erase_start, sd->erase_end);
     if (sd->erase_start == INVALID_ADDRESS
@@ -788,6 +790,13 @@ static void sd_erase(SDState *sd)
         return;
     }
 
+    memset(sd->data, 0xff, erase_len);
+    erase_addr = erase_start;
+    for (i = 0; i < (erase_end - erase_start) / erase_len + 1; i++) {
+        BLK_WRITE_BLOCK(erase_addr, erase_len);
+        erase_addr += erase_len;
+    }
+
     erase_start = sd_addr_to_wpnum(erase_start);
     erase_end = sd_addr_to_wpnum(erase_end);
     sd->erase_start = INVALID_ADDRESS;
-- 
2.25.1


