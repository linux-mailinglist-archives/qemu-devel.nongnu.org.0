Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 520A862022B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 23:13:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAMc-0005Vb-D9; Mon, 07 Nov 2022 17:13:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osAML-0005T5-TO
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:12:50 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osAMK-0004vy-5F
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:12:49 -0500
Received: by mail-wr1-x435.google.com with SMTP id a14so18258328wru.5
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YpK+f5f/gQRJ2J/DGs6Tr1bUCA1xTkm0TNYPoo23NHk=;
 b=uqP3aYn/hZN5L9fzJB0Hth9UPmNDTZst2SS84YWJxpX/xTlAgQ0h3QPS19AaaurTCa
 PoGZlSt0YlQoNzEZvjKYkvdq6A1lN6OXcAARiAvDqbnIPGGIMvwhaWtfZN0CwVqldZGx
 zt3vzUewr9cKQpfpBI5c7FkPjBxq7MnxLsE77iAyHw/btCQ9nu7vHvK2jZDocUMaNoLf
 IBJWluX1z4TLuJy1Ssxi0YxEptvCemNpAyco1iYletEFYUtrokGEyZfyzVvPDoLe/8o/
 BEV0NKAZSDkXplyn1Yr43tuqoLflMBN2NSLQuF/Jddg71gYcK70ZxYWBoWBYhMtWPx/z
 G8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YpK+f5f/gQRJ2J/DGs6Tr1bUCA1xTkm0TNYPoo23NHk=;
 b=1N/WxOq2o2XhfaO0WktuAuUppKpFukBLabRRy1MDTJ5otJtpZBVZpljhKkJ4MLmlHz
 yzdl7tZySooomrSWvRUp76je/SpO3snSCeJ4wn0gWCn/mgPbz5t8jt1VYmajx/iuRFlM
 SvJ2fv8rfMTdn23Mur3MGTT9b2lONNOXp5VXKE/bBfV6iqVgUMwM1E6lRIxlNdGQj0q1
 8+TZxZb40Dv6U3SE5yIuWt/SS6bm+iNi6s9z+UPEi3Evw7kPYRjiohRRkyWp7wY9X2Sg
 kqSnDplQX30Lc/BUkzpRP6LH8GvH2noZH9biTIOOWTTEqP2tvN9Azn9U5ig7nR2XsPHN
 TyxQ==
X-Gm-Message-State: ACrzQf3M0UGFpCT71ObuyP41RJ7T4LQs+fhRsRsyncqyMIV8a97gFRq+
 +Icjic588a7UvD8rCPAyV0IiN1X19c11tg==
X-Google-Smtp-Source: AMsMyM7VoUWwTmMtSG6ZzgYm+S6b55Xi+ZcFcUunX7CbMi04rng/rcsJdYt2hgEPwflUVxITp18yFg==
X-Received: by 2002:adf:fdce:0:b0:236:f543:2fd9 with SMTP id
 i14-20020adffdce000000b00236f5432fd9mr19389406wrs.511.1667859164911; 
 Mon, 07 Nov 2022 14:12:44 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z3-20020adfe543000000b0023538fb27c1sm8191956wrm.85.2022.11.07.14.12.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Nov 2022 14:12:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Sai Pavan Boddu <saipava@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 RivenDell <XRivenDell@outlook.com>, Siqi Chen <coc.cyqh@gmail.com>,
 ningqiang <ningqiang1@huawei.com>
Subject: [PATCH-for-7.2 1/2] hw/sd/sdhci: Do not set Buf Wr Ena before writing
 block (CVE-2022-3872)
Date: Mon,  7 Nov 2022 23:12:35 +0100
Message-Id: <20221107221236.47841-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107221236.47841-1-philmd@linaro.org>
References: <20221107221236.47841-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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

When sdhci_write_block_to_card() is called to transfer data from
the FIFO to the SD bus, the data is already present in the buffer
and we have to consume it directly.

See the description of the 'Buffer Write Enable' bit from the
'Present State' register (prnsts::SDHC_SPACE_AVAILABLE) in Table
2.14 from the SDHCI spec v2:

  Buffer Write Enable

  This status is used for non-DMA write transfers.

  The Host Controller can implement multiple buffers to transfer
  data efficiently. This read only flag indicates if space is
  available for write data. If this bit is 1, data can be written
  to the buffer. A change of this bit from 1 to 0 occurs when all
  the block data is written to the buffer. A change of this bit
  from 0 to 1 occurs when top of block data can be written to the
  buffer and generates the Buffer Write Ready interrupt.

In our case, we do not want to overwrite the buffer, so we want
this bit to be 0, then set it to 1 once the data is written onto
the bus.

This is probably a copy/paste error from commit d7dfca0807
("hw/sdhci: introduce standard SD host controller").

Reproducer:
https://lore.kernel.org/qemu-devel/CAA8xKjXrmS0fkr28AKvNNpyAtM0y0B+5FichpsrhD+mUgnuyKg@mail.gmail.com/

Fixes: CVE-2022-3872
Reported-by: RivenDell <XRivenDell@outlook.com>
Reported-by: Siqi Chen <coc.cyqh@gmail.com>
Reported-by: ningqiang <ningqiang1@huawei.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sd/sdhci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 306070c872..f230e7475f 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -954,7 +954,7 @@ static void sdhci_data_transfer(void *opaque)
             sdhci_read_block_from_card(s);
         } else {
             s->prnsts |= SDHC_DOING_WRITE | SDHC_DAT_LINE_ACTIVE |
-                    SDHC_SPACE_AVAILABLE | SDHC_DATA_INHIBIT;
+                                           SDHC_DATA_INHIBIT;
             sdhci_write_block_to_card(s);
         }
     }
-- 
2.38.1


