Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DF52ADCBB
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 18:18:50 +0100 (CET)
Received: from localhost ([::1]:48434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcXI9-0000S3-DJ
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 12:18:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcX6C-0006Hq-Jt
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 12:06:28 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:32931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcX67-0008Jg-LE
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 12:06:28 -0500
Received: by mail-wr1-x442.google.com with SMTP id b8so13509862wrn.0
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 09:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PYS0/6U6l5yAr2j+rxA7ao/heFAIM+a4DJHT8NMJBpA=;
 b=rmXdDxBCvNuHWaP5i/CQUZ5H16ZooT1rXqccvbHJ24vX9dSBM8qvIq3zu0ZH6pd0uA
 aXgcaFuoCKJvrhsnpsoBa0tmaNxxIYxXnbH/znOtHfhf7peLziH+3jnYa1xa8QsgeKQm
 cKM30t8fPA78NDcw/KizaxBmZG0Gsx6iQQrtDEOH4291I+ONbbcekL/zHjVZxITLzUS0
 X+LfZXkzMTj9UHj//jRMVAbfnF/+BlyQjHvYPY7f2nwK79oqJmcWs2PjxW4aoOgzPn0a
 nMklSAuXnWeO1588c7UEOiB9ScFboTLlpcn4rYz3XT2gMiZy7GDwjNI+mrM2D8rLi6bp
 n1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PYS0/6U6l5yAr2j+rxA7ao/heFAIM+a4DJHT8NMJBpA=;
 b=szxp5Uuo52aydmTYZtx+Hxn0fY3TBOUsTCjPu5b8YGFIshpSCJhOWvHjxpwnxegTvQ
 i7rUQu6uGbkJvvScypsmy9QGEEV7gBX67AeD+miIrlCVp0kQtuHAJDwUeYSeHYpUOIV5
 KyM7aV67QbWh9lfSu7RhiHGzwIAqJiUwVjbM/zdYDu1VRksJSy4Tcl1PI+d6Afx9j3zg
 4rAnlVEr3VoruKfP03Gi60K5dVT1TNC0ghhJooxgvFg3KkOoSX9ipn3i7OXIQ5KcflGx
 e77T6O6IerMUC6cag+PYmI9arjsDX+tEWh50kPW/jmQJSacB6VlvxFiLStaxosr37A2D
 3JHQ==
X-Gm-Message-State: AOAM531sCybmj45rGwkdWd8P0DjHbQSsfLztx4w4srs7gs9V7o2k9XlF
 WstkyEiThZ8lQqj2LX0arMogtxs7mrsbyg==
X-Google-Smtp-Source: ABdhPJwHFZ48BmYm/z3mnNr5on0wagUFOpws31j4TV1UzatJX0AYZn7BhaetDMV9cxH/Ndn0gVf20Q==
X-Received: by 2002:adf:f881:: with SMTP id u1mr26664333wrp.103.1605027971803; 
 Tue, 10 Nov 2020 09:06:11 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h4sm17334893wrq.3.2020.11.10.09.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 09:06:11 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-5.2 v2 4/4] hw/net/can/ctucan_core: Use stl_le_p to write
 to tx_buffers
Date: Tue, 10 Nov 2020 17:06:04 +0000
Message-Id: <20201110170604.5897-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110170604.5897-1-peter.maydell@linaro.org>
References: <20201110170604.5897-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Instead of casting an address within a uint8_t array to a
uint32_t*, use stl_le_p(). This handles possibly misaligned
addresses which would otherwise crash on some hosts.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Pavel Pisa <pisa@cmp.felk.cvut.cz>
---
 hw/net/can/ctucan_core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/net/can/ctucan_core.c b/hw/net/can/ctucan_core.c
index a400ad13a43..0ef528eb879 100644
--- a/hw/net/can/ctucan_core.c
+++ b/hw/net/can/ctucan_core.c
@@ -305,8 +305,7 @@ void ctucan_mem_write(CtuCanCoreState *s, hwaddr addr, uint64_t val,
         addr %= CTUCAN_CORE_TXBUFF_SPAN;
         if ((buff_num < CTUCAN_CORE_TXBUF_NUM) ||
             (addr < sizeof(s->tx_buffer[buff_num].data))) {
-            uint32_t *bufp = (uint32_t *)(s->tx_buffer[buff_num].data + addr);
-            *bufp = cpu_to_le32(val);
+            stl_le_p(s->tx_buffer[buff_num].data + addr, val);
         }
     } else {
         switch (addr & ~3) {
-- 
2.20.1


