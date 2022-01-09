Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D03A488797
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 05:06:42 +0100 (CET)
Received: from localhost ([::1]:39138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6PTb-0002Sz-1f
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 23:06:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chrisfriedt@gmail.com>)
 id 1n6PSO-000131-89; Sat, 08 Jan 2022 23:05:24 -0500
Received: from [2607:f8b0:4864:20::833] (port=36572
 helo=mail-qt1-x833.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chrisfriedt@gmail.com>)
 id 1n6PSM-0000SJ-RJ; Sat, 08 Jan 2022 23:05:23 -0500
Received: by mail-qt1-x833.google.com with SMTP id f9so9862704qtk.3;
 Sat, 08 Jan 2022 20:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3WFxPI7IVemcGg4l8MDY6Up6yfiOlJdEqkZJg7RkCuU=;
 b=XUwOtcBkz42f9CA7VIAzVQ73b1RSYSWcDCW8n067jnfmLMHvQ5HH8tNY7W45nelVOZ
 c/0gdM7cfJAqrLPhX3qE1vb3YzZqx60QQoicaJip0AF/HZXm9MWopcfkL2nLOYb1XL0U
 DfLW9awVXWPKs+6AboLqKsb2M8sqDDBKS/ecoHUjOQoKNuabwAsF1IM2aIzIjaonAoEo
 +LX/OLcXvsNxzTNKhkuwL79F+771YFpHFqNJS767ElDdEvbQefd4gv1Nb1xwn2WIZvxo
 hWxNKonCSgU+oiKHh9AlGN6//pWFUK2DQQSgwGF9NRsrenXU25FG39/cAiHZlfwHGMdv
 1rpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3WFxPI7IVemcGg4l8MDY6Up6yfiOlJdEqkZJg7RkCuU=;
 b=iJYtbeFJ9dijtjxFnY4HN5vcqQhRPpSsBLEv2/QGIlO+BjsuBxT42AKixCUzBzpv/a
 dey2cWu6l9p6ao95O5qoTcy8TfwkMJmSCxCVG0WEgbtAS/KuYaUQeAunDpG9X9T+MG+w
 h9CLMn8KR7+Rckks5EjbK03TQ2+xxLbdNODxVWLkZO2NFWjaZxzXe1SBwGTKxxPKupef
 EejFmqbpEfIKxTa743iMoRoN4Ooxjyxy1t/pYNjQym6A07iFPVVD+qzX83iL9UpvqC/G
 lRxyZI01yqmxcBY3K/vM0Mk1Kb/IBL5V8PArRxthuFX0Pl5ZkIp3yDFslbHhY+aFDyl3
 COaw==
X-Gm-Message-State: AOAM532zF7MHoIPOg1V9t3whGMh1ZBFZ1++fHE9pI/YSXS1g6n+LKZjR
 mBMOJJS6sGdN4XmOGli8WrkA0h3QZBg=
X-Google-Smtp-Source: ABdhPJw2UKM4wNWjywnd3n3y3My/l5hznGSBipG7JecrJtqYtIRLOaOh1zsJe0F7HIYR6x5IWjU8RA==
X-Received: by 2002:a05:622a:553:: with SMTP id
 m19mr6774863qtx.180.1641701121283; 
 Sat, 08 Jan 2022 20:05:21 -0800 (PST)
Received: from ChristophersAir.hitronhub.home
 ([2001:1970:50d6:9900:ecb7:536:86b6:f747])
 by smtp.gmail.com with ESMTPSA id 14sm2196877qtx.84.2022.01.08.20.05.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 08 Jan 2022 20:05:20 -0800 (PST)
From: Christopher Friedt <chrisfriedt@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hw: misc: edu: fix 2 off-by-one errors
Date: Sat,  8 Jan 2022 23:05:08 -0500
Message-Id: <20220109040508.47696-1-chrisfriedt@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::833
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=chrisfriedt@gmail.com; helo=mail-qt1-x833.google.com
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
2.30.1 (Apple Git-130)


