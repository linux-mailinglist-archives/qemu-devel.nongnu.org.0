Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3371D1EFE42
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jun 2020 18:52:07 +0200 (CEST)
Received: from localhost ([::1]:51960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jhFZe-00044Q-5F
	for lists+qemu-devel@lfdr.de; Fri, 05 Jun 2020 12:52:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jhFXq-000198-NE
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 12:50:14 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jhFXp-0001de-UF
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 12:50:14 -0400
Received: by mail-wr1-x42b.google.com with SMTP id y17so10420935wrn.11
 for <qemu-devel@nongnu.org>; Fri, 05 Jun 2020 09:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=JbPgHS0uFT5SU5bLrmRMVkoZQ1aduSbm+LPDO/fRmyE=;
 b=X7Z7bGQRLiYsJrsNMGg5FXaYMpITJ8ghGTKZySGnluDH2St8rgPbbHqcy4SO3J2Eto
 5ByIL8nhmUBpVlQevFi2G4u0kSk6jjJHvRoNz3RDTCNoWAhFcVsJpDzIfTY4suzPzMtc
 yYQSGmQtMq8LLtUQPJg8hv7BJlx3i4hFdTGG1lOmvSydtFdjUpa118x4qPFqp5TbINX3
 nvYvlxhORYS6pZ4EE5BiaP+3eG8fBjsv8z13j3IVM7MhwImrNPHoxcIn9T+qAKNRe2DC
 2TgFKB5U3DVpmsAEMNK32zRwxOMogxXdUHUf4lfkPxb66ZX/rtbyT6Ou0TuwueMe9c4O
 Fjdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JbPgHS0uFT5SU5bLrmRMVkoZQ1aduSbm+LPDO/fRmyE=;
 b=L8xvUTHbu00bSlDilX1QD4Yw7NSE7j9k+sW6WBrsJuv0ynuuJd3O/UlfERP0eyNQjA
 WvH6/1ci43h2fVr5uhOdL1CvtGuhXK8jx+laffuX9qJS76DnKeii9UsPObU9O0GeqD3X
 hD2MyIl9EaXAaKXiuaKXqyjYV8XsV0tTjRRTorv1tXLNnlIJMx8aN41tKlbFkQ7jBeFw
 y+jZa/PSBeZHRpTpoAVjvITRzMk09q3ZkroczRCYvdm82UJihVvHv7NAaVZhedHdrRLM
 zXAiwDySPlWQtU9LuF7sBOOHd/x/M8sBBFTrLawCAjlodgA22hlg5cvb58OAog1++ZbT
 c/Cg==
X-Gm-Message-State: AOAM532/3gsCtZtEQOYC1KAAhOqLNVgHHbYdXbCwjxNxZDk0BFDEGu1n
 aw2nn97OmyNXnPEyHgQBVWJ1WPO4m09a5w==
X-Google-Smtp-Source: ABdhPJzm3IfFarDNCI1BIxi1WH2LWP50FdJmlFu4yfZtWW3v2zbcKgUVjmyhnm2aGtb341SMTgXCjg==
X-Received: by 2002:adf:e590:: with SMTP id l16mr10081659wrm.383.1591375812080; 
 Fri, 05 Jun 2020 09:50:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id c140sm12272724wmd.18.2020.06.05.09.50.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 09:50:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/29] hw/ssi/imx_spi: Removed unnecessary cast of rx data
 received from slave
Date: Fri,  5 Jun 2020 17:49:40 +0100
Message-Id: <20200605165007.12095-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200605165007.12095-1-peter.maydell@linaro.org>
References: <20200605165007.12095-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

From: Eden Mikitas <e.mikitas@gmail.com>

When inserting the value retrieved (rx) from the spi slave, rx is pushed to
rx_fifo after being cast to uint8_t. rx_fifo is a fifo32, and the rx
register the driver uses is also 32 bit. This zeroes the 24 most
significant bits of rx. This proved problematic with devices that expect to
use the whole 32 bits of the rx register.

Signed-off-by: Eden Mikitas <e.mikitas@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/ssi/imx_spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 6fef5c79588..43b2f14dd28 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -206,7 +206,7 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
         if (fifo32_is_full(&s->rx_fifo)) {
             s->regs[ECSPI_STATREG] |= ECSPI_STATREG_RO;
         } else {
-            fifo32_push(&s->rx_fifo, (uint8_t)rx);
+            fifo32_push(&s->rx_fifo, rx);
         }
 
         if (s->burst_length <= 0) {
-- 
2.20.1


