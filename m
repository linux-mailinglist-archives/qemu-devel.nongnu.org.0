Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 722E5602C16
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 14:49:08 +0200 (CEST)
Received: from localhost ([::1]:38780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okm1r-0003MJ-1s
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 08:49:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chrisfriedt@gmail.com>)
 id 1oklgk-0003FT-Qy
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 08:27:18 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:34516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chrisfriedt@gmail.com>)
 id 1oklgj-0000y5-1N
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 08:27:18 -0400
Received: by mail-qt1-x82b.google.com with SMTP id g11so9494520qts.1
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 05:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ae8hPehpjUNhf7+xT0HR9r3tNqUK3me++rgVmdi5DaU=;
 b=D3CqOq9Ec8wvHvNN7Dwlf9G0PKJPJMkJ+580zF8bL2UgTYZbJQ84JwiRVbQSKP9BbZ
 0wbdhu6riZh8eSplPwUUPrj9bdcPD2g77ykSfKcmNrJZ6LcUxdJmHgTAZJsUwXr+g7d+
 BdL1SNmhUVXASCIxdd6aUpqWDTrJBfH77NZQlSBiPvseQ0/Ed0j6TzHMreStLDc2Zw7p
 j0kSaEZK5qS4xXUzbg+ZEIAWAavswlVmkbb3J6UL8nFPKEle6DeaH+qQ531Xj54oFmm+
 MT4N2DmBywDTprn5n8EhtcSR+3l4uHCKLs4Wtfw4FnxKCoi1CWeiw6zfBfT355/SQ7Jx
 JO2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ae8hPehpjUNhf7+xT0HR9r3tNqUK3me++rgVmdi5DaU=;
 b=qVjtjlLpjXv5+qZhomA/KUfDe/c1vBR9zEiajiPwvzv1zYXF7KWEvk/mudLwEwaHyP
 k+BYd33qOsAr3OywyIcR/HmB1ljFg2Ao8BzAw8RDrFQo5UNp/f1I0xCR0AEK4bwtcyKr
 oayaYXvua/YyLQhv4HvGJA41NK95W+locFnMDEjeO96ReJd+YBJFTqwUvjLK+Rf3X5Iu
 PnMzlQNsIXNIECdh1TBPfedySMm7dUiBo4IwvpkT88/QFw7QtPMuA8WMw0YOb+m7mhXa
 JoYQ1BuSNNYowrDz06vLeS0o7olGiWSez8Gep07zE+5xpEWeM1A7jAGlHUt0vycDsU2d
 12Fg==
X-Gm-Message-State: ACrzQf19QnRbXQbWa5IXeVka0K/szUKKQbUDbxv9x+X3I7XpV5EcgJpa
 mq5bhiHescwx9KG+BocZlSf+pLz3+1F0zA==
X-Google-Smtp-Source: AMsMyM7q7FVs9NtxZnUPV+xqQ29YNmW9PMiXe8I6jSeKDF2dNdIh4vJ0ki2sd0qTWsU0RNOD8+mUpg==
X-Received: by 2002:a05:622a:3c6:b0:35d:4335:f060 with SMTP id
 k6-20020a05622a03c600b0035d4335f060mr1820442qtx.326.1666096034668; 
 Tue, 18 Oct 2022 05:27:14 -0700 (PDT)
Received: from localhost.localdomain ([2001:1970:50d6:9900::a196])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a05620a284700b006ecb9dfdd15sm2276248qkp.92.2022.10.18.05.27.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 18 Oct 2022 05:27:13 -0700 (PDT)
From: Chris Friedt <chrisfriedt@gmail.com>
X-Google-Original-From: Chris Friedt <cfriedt@meta.com>
To: qemu-devel@nongnu.org
Cc: cfriedt@meta.com,
	jslaby@suse.cz
Subject: [PATCH v4 1/3] hw: misc: edu: fix 2 off-by-one errors
Date: Tue, 18 Oct 2022 08:25:49 -0400
Message-Id: <20221018122551.94567-1-cfriedt@meta.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=chrisfriedt@gmail.com; helo=mail-qt1-x82b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the case that size1 was zero, because of the explicit
'end1 > addr' check, the range check would fail and the error
message would read as shown below. The correct comparison
is 'end1 >= addr'.

EDU: DMA range 0x40000-0x3ffff out of bounds (0x40000-0x40fff)!

At the opposite end, in the case that size1 was 4096, within()
would fail because of the non-inclusive check 'end1 < end2',
which should have been 'end1 <= end2'. The error message would
previously say

EDU: DMA range 0x40000-0x40fff out of bounds (0x40000-0x40fff)!

Signed-off-by: Chris Friedt <cfriedt@meta.com>
---
 hw/misc/edu.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/hw/misc/edu.c b/hw/misc/edu.c
index e935c418d4..b3de8d206a 100644
--- a/hw/misc/edu.c
+++ b/hw/misc/edu.c
@@ -103,19 +103,18 @@ static void edu_lower_irq(EduState *edu, uint32_t val)
     }
 }
 
-static bool within(uint64_t addr, uint64_t start, uint64_t end)
-{
-    return start <= addr && addr < end;
-}
-
-static void edu_check_range(uint64_t addr, uint64_t size1, uint64_t start,
-                uint64_t size2)
+static void edu_check_range(uint64_t addr, uint64_t size1,
+                uint64_t start, uint64_t size2)
 {
     uint64_t end1 = addr + size1;
     uint64_t end2 = start + size2;
 
-    if (within(addr, start, end2) &&
-            end1 > addr && within(end1, start, end2)) {
+    /*
+     * 1. ensure we aren't overflowing
+     * 2. ensure that [addr, end1) is within [start, size2)
+     */
+    if (end2 >= start && end1 >= addr &&
+        addr >= start && end1 <= end2) {
         return;
     }
 
-- 
2.36.1


