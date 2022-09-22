Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5785E6A6E
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 20:10:18 +0200 (CEST)
Received: from localhost ([::1]:40722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obQeO-0005A9-LN
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 14:10:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPBG-0002Db-Io
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:36:11 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPB7-0005RN-8L
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:36:03 -0400
Received: by mail-wr1-x431.google.com with SMTP id r7so16471511wrm.2
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 09:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=FWYlNaO7g+0N0S2l/ScS3UFVLAbgPMCsy0Gh9IEfsf0=;
 b=zRxJntQCbPrjm3O51eIwYarHIbJemNdXUxwqpQFuuuFyN0Dv+5uKQwy8cjHpd+XB72
 6zKj/HgP5De5jlyDtPSWiZiDwHBl9pTNyaE0y8aGykU5rBcmAEAO6SN6y1TM+EAn9gdD
 vuqLZiqDBGOalWX2OlK4P6wFKftRHmRMEehgLvB3daaNYAycvU8VxLcp7GfObbTJ6qPw
 ktjStNmpv+GEIT0d6Jwq9clr8crWa/sJ+WeePqmKx+dJuBkgSJU4HUqfZLFSeHYUw0Qv
 SF4sl3yjfyaxwdQ7eJ7WSu6Cm9GkFlxQO7EbX8EbLnvbGWvUl2iX8M51Rx4whGRoo9Q8
 hX7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=FWYlNaO7g+0N0S2l/ScS3UFVLAbgPMCsy0Gh9IEfsf0=;
 b=wZ2B+8IJCr0ON+Pp3i/SwQUy0J4E2kzVDIkJy5zhm6DSw8am7Dp6rClhCFYXX/AvDv
 TLbZm+OgLA3T6Uro47vNBfqaa4wpE8PlTQACDZwAKth8FukhQ/FYQnow6i9fRYS0x0S4
 hv74fQnks/NDrmQZ/tJv07qA/S68P4lc7nzqKi6aDSz/yEKltKDGb2C1Feq8WGxXAUHs
 UUqkvcv5bAa7VgYAQDcYQ75ioqLCBSLpnnmtdBaIGpsCcLnQ/z9Y8kyCUuJeXaATUW8P
 d1Tj9uDy7VkCI13RzhduFL/rRg0eIqTWDG3Wd14XN8oQFewzNQMCSI67CMNXFU3/nCGh
 Zh/A==
X-Gm-Message-State: ACrzQf3wZu4oFUyvUL4t0jsiifohb1m/JoGAZc/U5+D/y5droF78I8Vv
 BQ8rNVikWJA/obI+bVqyYL/QOT4gGByyrw==
X-Google-Smtp-Source: AMsMyM4hoJYTFuC/TOlM9NKFL6xtUQeJg8CrVBHKaBnPHO3m/Yo0rO0XHCPZFllbvs6l6fjeCmlopA==
X-Received: by 2002:a5d:5c0a:0:b0:228:db53:22cc with SMTP id
 cc10-20020a5d5c0a000000b00228db5322ccmr2476689wrb.126.1663864552267; 
 Thu, 22 Sep 2022 09:35:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 iw1-20020a05600c54c100b003b3401f1e24sm6452599wmb.28.2022.09.22.09.35.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 09:35:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/39] hw/net/lan9118: Signal TSFL_INT flag when TX FIFO
 reaches specified level
Date: Thu, 22 Sep 2022 17:35:18 +0100
Message-Id: <20220922163536.1096175-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922163536.1096175-1-peter.maydell@linaro.org>
References: <20220922163536.1096175-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Lucas Dietrich <ld.adecy@gmail.com>

The LAN9118 allows the guest to specify a level for both the TX and
RX FIFOs at which an interrupt will be generated.  We implement the
RSFL_INT interrupt for the RX FIFO but are missing the handling of
the equivalent TSFL_INT for the TX FIFO.  Add the missing test to set
the interrupt if the TX FIFO has exceeded the guest-specified level.

This flag is required for Micrium lan911x ethernet driver to work.

Signed-off-by: Lucas Dietrich <ld.adecy@gmail.com>
[PMM: Tweaked commit message and comment]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/net/lan9118.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
index 456ae38107b..f1cba559672 100644
--- a/hw/net/lan9118.c
+++ b/hw/net/lan9118.c
@@ -696,6 +696,14 @@ static void do_tx_packet(lan9118_state *s)
     n = (s->tx_status_fifo_head + s->tx_status_fifo_used) & 511;
     s->tx_status_fifo[n] = status;
     s->tx_status_fifo_used++;
+
+    /*
+     * Generate TSFL interrupt if TX FIFO level exceeds the level
+     * specified in the FIFO_INT TX Status Level field.
+     */
+    if (s->tx_status_fifo_used > ((s->fifo_int >> 16) & 0xff)) {
+        s->int_sts |= TSFL_INT;
+    }
     if (s->tx_status_fifo_used == 512) {
         s->int_sts |= TSFF_INT;
         /* TODO: Stop transmission.  */
-- 
2.25.1


