Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9780648875E
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 03:39:38 +0100 (CET)
Received: from localhost ([::1]:38486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6O7N-0005zC-9E
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 21:39:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chrisfriedt@gmail.com>)
 id 1n6O5R-000583-UG; Sat, 08 Jan 2022 21:37:37 -0500
Received: from [2607:f8b0:4864:20::72c] (port=47100
 helo=mail-qk1-x72c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chrisfriedt@gmail.com>)
 id 1n6O5Q-00057O-GF; Sat, 08 Jan 2022 21:37:37 -0500
Received: by mail-qk1-x72c.google.com with SMTP id 202so10839638qkg.13;
 Sat, 08 Jan 2022 18:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HVHz4LljrWyly/3ZCzMzQ51vugIv+uVN7Al8e9a9qgQ=;
 b=ZD87IYwD1KFqAOeyyFylQdYOMI21/qF+WczOuy8a15+2LRR9wEXnmarUQLnAaitySU
 k7Sw/X28Lwzja4pABr7RAivsWo3xiYH7f8SF5AG+Mdj/KmWG8/e8j9N8nuPP2Z6zcT9x
 yxaA1iBTmdLysrQ4zLkKcvSNwaTk9bPILRY31rvCiwXbt5xaECS5b5hEfeK7dhiflV1i
 ngtw7xV+9IJVNwQgiL7GhI7ULt55JY6IgZf66BCP9cj8o93gm8vRXupkp81QD6A4KnO6
 YjtzlTo6N9dEp4Fj0P6gAyCclObvsQueThC6VXdbe4Ipqiy77nZDMmm7x+tknFKyuunb
 zpmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HVHz4LljrWyly/3ZCzMzQ51vugIv+uVN7Al8e9a9qgQ=;
 b=CkIClwQFbc/tHXAlKNL5FlT5F7S9PAueED0/PLzhhfTbXzK/IlVity8w745PQN1YBw
 44rPbdJfooI3Y+NBc5+FvQlhbaAiRSY5OiO9bWm9qHRJ8A+AO1dgf1hl2ebd7d38SZzk
 RdLPLSkuNrHFrQW4puxiKYW03/ifhP0DzsDhnAH6WWewPwQyhGNu0KiicdTQI1m3OhKW
 nOursTPK9Zx7PzvtlJ0vMqFlO1ITULBhXhEM0tjG+xiZWXPCRv4at00Qf518d8jIZicC
 hWcIpCbgaoP/A9WcCWVzLIM1h8g2Ms03ln0TEKq7G+/bm68JsM+6gtl5ks3ydGtYCdnw
 EXgg==
X-Gm-Message-State: AOAM533+3qi/uanPF3C+zb14sASqpzpuZlXZX4JBXh9oPTpNiHADqXVt
 Y60owDSDg5yFECRx5E3bnCMdsogN2E8=
X-Google-Smtp-Source: ABdhPJwcGObz0/7CS21w0L063gKt21WHPR28MydA0BgnfyWZ46PWEyq3pkJBwfqmHuqsn/Vhzyqppw==
X-Received: by 2002:a05:620a:f84:: with SMTP id
 b4mr391274qkn.566.1641695854602; 
 Sat, 08 Jan 2022 18:37:34 -0800 (PST)
Received: from ChristophersAir.hitronhub.home
 ([2001:1970:50d6:9900:ecb7:536:86b6:f747])
 by smtp.gmail.com with ESMTPSA id j12sm1830007qtj.30.2022.01.08.18.37.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 08 Jan 2022 18:37:34 -0800 (PST)
From: Christopher Friedt <chrisfriedt@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw: misc: edu: fix 2 off-by-one errors
Date: Sat,  8 Jan 2022 21:37:28 -0500
Message-Id: <20220109023728.46765-1-chrisfriedt@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::72c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=chrisfriedt@gmail.com; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Christopher Friedt <chrisfriedt@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the case that size1 was zero, because of the explicit
'end1 > addr' check, the range check would fail and the error
message would read as shown below. The correct comparison
is 'end1 >= addr' (or 'addr <= end1').

EDU: DMA range 0x40000-0x3ffff out of bounds (0x40000-0x3ffff)!

At the opposite end, in the case that size1 was 4096, within()
would fail because of the non-inclusive check 'end1 < end2',
which should have been 'end1 <= end2'. The error message would
previously say

EDU: DMA range 0x40000-0x40fff out of bounds (0x40000-0x40fff)!

The solution is to use non-inclusive ranges e.g. [begin,end).

Signed-off-by: Christopher Friedt <chrisfriedt@gmail.com>
---
 hw/misc/edu.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/hw/misc/edu.c b/hw/misc/edu.c
index e935c418d4..73e97a54e7 100644
--- a/hw/misc/edu.c
+++ b/hw/misc/edu.c
@@ -103,25 +103,21 @@ static void edu_lower_irq(EduState *edu, uint32_t val)
     }
 }
 
-static bool within(uint64_t addr, uint64_t start, uint64_t end)
-{
-    return start <= addr && addr < end;
-}
-
 static void edu_check_range(uint64_t addr, uint64_t size1, uint64_t start,
                 uint64_t size2)
 {
     uint64_t end1 = addr + size1;
     uint64_t end2 = start + size2;
 
-    if (within(addr, start, end2) &&
-            end1 > addr && within(end1, start, end2)) {
+    if (start <= addr && addr < end2 &&
+        addr <= end1 &&
+        start <= end1 && end1 <= end2) {
         return;
     }
 
-    hw_error("EDU: DMA range 0x%016"PRIx64"-0x%016"PRIx64
-             " out of bounds (0x%016"PRIx64"-0x%016"PRIx64")!",
-            addr, end1 - 1, start, end2 - 1);
+    hw_error("EDU: DMA range [0x%016"PRIx64", 0x%016"PRIx64")"
+             " out of bounds [0x%016"PRIx64", 0x%016"PRIx64")!",
+            addr, end1, start, end2);
 }
 
 static dma_addr_t edu_clamp_addr(const EduState *edu, dma_addr_t addr)
-- 
2.30.2


