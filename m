Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AD02ADCA0
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 18:08:47 +0100 (CET)
Received: from localhost ([::1]:53600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcX8P-0007VK-96
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 12:08:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcX6A-0006E5-0E
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 12:06:26 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:45119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcX5v-0008IZ-6e
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 12:06:25 -0500
Received: by mail-wr1-x442.google.com with SMTP id p1so13487579wrf.12
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 09:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3TffB06QqlKySLwwMjn9ARXLrWK2pAbyiKXjQY9uagE=;
 b=PRlGZ4+o5dB5obVsGfLl2BgWYhLqmfbowhDHbmxTnhLpuxsvHolplIOrCaRj5t2y9K
 BoDPLtvLXybS7AlKB6HzsXTZ328+qJTpb5mZ1o8pzlG2g23iFAUk4qPq900yF9LQKQ7Q
 yt5CF4jR5KJTe3nmfGQ8V4zywOkEHjF+/mspqCWl4ExSu/WQY9p0FE1aIk88HAeeSfQq
 ej2K4Io6vtXs2NY5vpmnH7TGnStEKO+twrIcEPfYf8K9vYNhI4ixyRWvSfjD8J1ImoVl
 dNqtnXB2FtrUcSZJjpPkjOG6vdd66YKYHlYGzXp/LvfI/wG4ljtI7JveQ1PQjGLUuRhc
 IVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3TffB06QqlKySLwwMjn9ARXLrWK2pAbyiKXjQY9uagE=;
 b=Ap9NtN7ZrYVuIriZIM0TG+Mo3sIuQmdAyWu65NY+lvY4ww9PV+kASNxQ63rwajmEjv
 xPQo1YWJIEwJS/Gyjh5K+tTNKpTdimS06ON7st4ev0bRX26HmroxrB6wxC+cP33qAKNN
 6QUagCnFsPY93JX8HLfZT5j8rE37PkFu9JM20ndr9oyPxvzCsY8EJAMrKhQIFTbU5PwB
 rAQMbXpSSUYcfCNx1zJqO6pgNOnYlwrRXjOZouluMFwvZGrfmk4Iq44XeWJKgWS+4f4D
 Dn5E6rqf0HNJVvMlTBYxcHlwoyz+yAh0+GmhKxd1XXXaC3cnRwrX7tCi2/+eCz8iBcSr
 RMqg==
X-Gm-Message-State: AOAM533aeW94Ih0gN2fsC4xd7rAoY6G8K5M73YN83JxDz253U8wODknJ
 WEum+KhOtPTi0ESZWvvgXLm0CYeoLt05xg==
X-Google-Smtp-Source: ABdhPJwV+3dV78NStRNqd/B3+qTVt9wstn5V1KYWTPBApZFhTWJuyvSGjM4wvBNugnQOJ2gjuW3RjA==
X-Received: by 2002:a5d:4ac1:: with SMTP id y1mr25693919wrs.27.1605027968019; 
 Tue, 10 Nov 2020 09:06:08 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h4sm17334893wrq.3.2020.11.10.09.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 09:06:07 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-5.2 v2 1/4] hw/net/can/ctucan: Don't allow guest to write
 off end of tx_buffer
Date: Tue, 10 Nov 2020 17:06:01 +0000
Message-Id: <20201110170604.5897-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110170604.5897-1-peter.maydell@linaro.org>
References: <20201110170604.5897-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Jason Wang <jasowang@redhat.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ctucan device has 4 CAN bus cores, each of which has a set of 20
32-bit registers for writing the transmitted data. The registers are
however not contiguous; each core's buffers is 0x100 bytes after
the last.

We got the checks on the address wrong in the ctucan_mem_write()
function:
 * the first "is addr in range at all" check allowed
   addr == CTUCAN_CORE_MEM_SIZE, which is actually the first
   byte off the end of the range
 * the decode of addresses into core-number plus offset in the
   tx buffer for that core failed to check that the offset was
   in range, so the guest could write off the end of the
   tx_buffer[] array

NB: currently the values of CTUCAN_CORE_MEM_SIZE, CTUCAN_CORE_TXBUF_NUM,
etc, make "buff_num >= CTUCAN_CORE_TXBUF_NUM" impossible, but we
retain this as a runtime check rather than an assertion to permit
those values to be changed in future (in hardware they are
configurable synthesis parameters).

Fix the top level check, and check the offset is within the buffer.

Fixes: Coverity CID 1432874
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/net/can/ctucan_core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/net/can/ctucan_core.c b/hw/net/can/ctucan_core.c
index d20835cd7e9..538270e62f9 100644
--- a/hw/net/can/ctucan_core.c
+++ b/hw/net/can/ctucan_core.c
@@ -303,7 +303,7 @@ void ctucan_mem_write(CtuCanCoreState *s, hwaddr addr, uint64_t val,
     DPRINTF("write 0x%02llx addr 0x%02x\n",
             (unsigned long long)val, (unsigned int)addr);
 
-    if (addr > CTUCAN_CORE_MEM_SIZE) {
+    if (addr >= CTUCAN_CORE_MEM_SIZE) {
         return;
     }
 
@@ -312,7 +312,8 @@ void ctucan_mem_write(CtuCanCoreState *s, hwaddr addr, uint64_t val,
         addr -= CTU_CAN_FD_TXTB1_DATA_1;
         buff_num = addr / CTUCAN_CORE_TXBUFF_SPAN;
         addr %= CTUCAN_CORE_TXBUFF_SPAN;
-        if (buff_num < CTUCAN_CORE_TXBUF_NUM) {
+        if ((buff_num < CTUCAN_CORE_TXBUF_NUM) ||
+            (addr < sizeof(s->tx_buffer[buff_num].data))) {
             uint32_t *bufp = (uint32_t *)(s->tx_buffer[buff_num].data + addr);
             *bufp = cpu_to_le32(val);
         }
-- 
2.20.1


