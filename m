Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7C3611808
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:50:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooST0-0004J8-3D; Fri, 28 Oct 2022 12:44:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSSY-0007Tp-Ns; Fri, 28 Oct 2022 12:43:54 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSSQ-0000uf-Ti; Fri, 28 Oct 2022 12:43:54 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-13c2cfd1126so6866850fac.10; 
 Fri, 28 Oct 2022 09:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Ld3bktmNMzyCf3dZm5iJ5Yo9T6ZCyv9EWO8lFJTyoU=;
 b=aFndxckVjnCAUlRsM8lBZXau4EE8eKjvi3PZVgc8IRQOpJQ2Oq1biVYkEHBhgTPxFC
 +yUwO7jK0M+iBxz3bgBvlzAX8uZCUbCF6EGI8KPsazVXVC5L1j8rPn0QACURoatlMd7W
 N5p9aiB6ZejupWkAwmVhZVMixOUoEzy2AkmBzH7DA86GfviskY2snKodC5B+6ojnyASb
 eLnReGd08zWjRxKPvBK/4khg5vjiuQ9H8gMM6Bwh4UAXjEueXNd18t+bqtiPIlsWKo7I
 tUnxTXaTz1gKnA2lw10aAPG5aQ9tYgtJhvrn/i2YF+am85SStFIKt50plKa11yDRpclF
 B6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8Ld3bktmNMzyCf3dZm5iJ5Yo9T6ZCyv9EWO8lFJTyoU=;
 b=lUI3Zb0yVMykDXicwIxHIc7ByPkNW9K2CAcvtyfuir9EgWPOnS1rYf7kihpDqJT3Sn
 eZNm0SbpBGAnlRuoYFwp1Ikam135UmzBpO2EWUWPS3CYO1eMFjqrR5n/QO0iQ//BjxaR
 YMpdI+Ofy3eeMR2n3u16Qoz2i7XiX1P/jaNyUBTGZftkkfzCPdXZOAAwDhMB+mlyeveA
 kfqRPdc74DFsp9xtoiXDDJ49LLxV0d7eidOiff1To7PMB+41/U0zdqbMiXilWxQzhnGF
 n/shLiQa+8THkjg3a0NL+XTxkYi4g2tXBdIQz4I/Z+li7G96MTZLt1WDoivw8NWrDUuq
 5ndg==
X-Gm-Message-State: ACrzQf2tvacEjwL+IXZG7qdsm6MyUmHUpc2GpU8TC6LLhWFOqkl+eUbm
 q6cu92LqikfwpheKtbSzZHiuChr7XDBNaw==
X-Google-Smtp-Source: AMsMyM7TtylJmnJC9l9qa1fGh1AZf8UAcXVUO5YiZD4LnHoNtk3B83Z3J7FCLVC2fzOckKDziKp6rw==
X-Received: by 2002:a05:6870:890b:b0:132:fa8c:1a00 with SMTP id
 i11-20020a056870890b00b00132fa8c1a00mr9824307oao.26.1666975425123; 
 Fri, 28 Oct 2022 09:43:45 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:43:44 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 51/62] ppc4xx_sdram: Use hwaddr for memory bank size
Date: Fri, 28 Oct 2022 13:39:40 -0300
Message-Id: <20221028163951.810456-52-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: BALATON Zoltan <balaton@eik.bme.hu>

This resolves the target_ulong dependency that's clearly wrong and was
also noted in a fixme comment.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <92fdc5f9cc76bf45831428b3ec8d9fc6241b7190.1666194485.git.balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc4xx_sdram.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/hw/ppc/ppc4xx_sdram.c b/hw/ppc/ppc4xx_sdram.c
index 62ef7d8f0d..2294747594 100644
--- a/hw/ppc/ppc4xx_sdram.c
+++ b/hw/ppc/ppc4xx_sdram.c
@@ -34,7 +34,6 @@
 #include "qapi/error.h"
 #include "qemu/log.h"
 #include "exec/address-spaces.h" /* get_system_memory() */
-#include "exec/cpu-defs.h" /* target_ulong */
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "hw/ppc/ppc4xx.h"
@@ -126,11 +125,6 @@ enum {
 
 /*****************************************************************************/
 /* DDR SDRAM controller */
-/*
- * XXX: TOFIX: some patches have made this code become inconsistent:
- *      there are type inconsistencies, mixing hwaddr, target_ulong
- *      and uint32_t
- */
 static uint32_t sdram_ddr_bcr(hwaddr ram_base, hwaddr ram_size)
 {
     uint32_t bcr;
@@ -174,9 +168,9 @@ static inline hwaddr sdram_ddr_base(uint32_t bcr)
     return bcr & 0xFF800000;
 }
 
-static target_ulong sdram_ddr_size(uint32_t bcr)
+static hwaddr sdram_ddr_size(uint32_t bcr)
 {
-    target_ulong size;
+    hwaddr size;
     int sh;
 
     sh = (bcr >> 17) & 0x7;
@@ -523,9 +517,9 @@ static inline hwaddr sdram_ddr2_base(uint32_t bcr)
     return (bcr & 0xffe00000) << 2;
 }
 
-static uint64_t sdram_ddr2_size(uint32_t bcr)
+static hwaddr sdram_ddr2_size(uint32_t bcr)
 {
-    uint64_t size;
+    hwaddr size;
     int sh;
 
     sh = 1024 - ((bcr >> 6) & 0x3ff);
-- 
2.37.3


