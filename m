Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 249AC2EF6F7
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 19:06:24 +0100 (CET)
Received: from localhost ([::1]:46314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxw9X-0001id-53
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 13:06:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxw7N-0000Ib-E5
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 13:04:09 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:36113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxw7K-0000oi-HW
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 13:04:09 -0500
Received: by mail-wr1-x436.google.com with SMTP id t16so9866344wra.3
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 10:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=5ppBHYzxmgl5hzoC4HlriYit+ub13d9GiK837Ur2BnM=;
 b=cYOu5ZhKgHgxLahkRk1JnxBaaA+Cae58P2KvgDh/HGo/HE0eDBuk8Y+iwi/y4invWN
 1J20T+rA5UpvgHJmaGQJewAgCnICg8ToikH9EDtD6gGbqJWuQ9X5QKZ5FGgXvwGkxbRt
 /avwownMSmBSUOp434ehS08Z97XkIpLGIsNvUQU8Vi53Z1/QezIOJXdPfq7YI102kPic
 Luk3/mV7r5YtRP+LVSivaqOSdLQ8zDK9oLduG4AWgQxo6ckS3qSdYWPbIaNtwkrU3p9l
 BS6/Hd6jJbP+6jbXwXj8WWFzKjP5sTX0t+WjqRKkveVYqSTu/qwOt5hpTiOSOPzG7joa
 2f5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5ppBHYzxmgl5hzoC4HlriYit+ub13d9GiK837Ur2BnM=;
 b=Msb0wqKihHGl5qAus6g+b5F4t7wVpn1XdrrHMP7HpUHhuWS/FmQV5DSLWyhvzMRL/R
 dhNi6vsKQf0lTcf+8nECW3hMB6c0dTRmyJxzKhdPqg9h4sH4uiwwYrlQxTiK5Fkr0zK9
 w47LMhj0d+65D2OEbzFFCw7K2m4VyFaeLpNx3apCXqzXHrjM39w7q0svSrXjJzlLdRYZ
 r39IPNb/UpKjJ17vmxxFFziG41qkMuTcC3+wZ+remNIyaLBnuSIq9XGBFWi7TFDQv813
 vR+1dovdfioHfM7YRZUq6klMgBraT8nhNqo5z5cl+vW3QlQA/88D1E9KQ0Eh6S+b5GZr
 cGLA==
X-Gm-Message-State: AOAM530j0Nfqjyil60CGqZ7xGbP8e97KVuAqPVji3nY6fD2T85CEPsCN
 avnJRLzdMsq7h6GZ0cIdndTk+23AJoVesA==
X-Google-Smtp-Source: ABdhPJxiedntBPCu418+U3VaeN1srE1PVzk6avlZhNVFua3G5Lj0XroIZHwH3IRes00yNr3yZTzF6Q==
X-Received: by 2002:a5d:4f8a:: with SMTP id d10mr4713721wru.219.1610129045021; 
 Fri, 08 Jan 2021 10:04:05 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s1sm13423029wrv.97.2021.01.08.10.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 10:04:04 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/net/lan9118: Fix RX Status FIFO PEEK value
Date: Fri,  8 Jan 2021 18:04:00 +0000
Message-Id: <20210108180401.2263-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108180401.2263-1-peter.maydell@linaro.org>
References: <20210108180401.2263-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A copy-and-paste error meant that the return value for register offset 0x44
(the RX Status FIFO PEEK register) returned a byte from a bogus offset in
the rx status FIFO. Fix the typo.

Cc: qemu-stable@nongnu.org
Fixes: https://bugs.launchpad.net/qemu/+bug/1904954
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/net/lan9118.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
index ab57c02c8e1..13d469fe24f 100644
--- a/hw/net/lan9118.c
+++ b/hw/net/lan9118.c
@@ -1206,7 +1206,7 @@ static uint64_t lan9118_readl(void *opaque, hwaddr offset,
     case 0x40:
         return rx_status_fifo_pop(s);
     case 0x44:
-        return s->rx_status_fifo[s->tx_status_fifo_head];
+        return s->rx_status_fifo[s->rx_status_fifo_head];
     case 0x48:
         return tx_status_fifo_pop(s);
     case 0x4c:
-- 
2.20.1


