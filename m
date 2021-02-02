Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 497CA30C939
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 19:14:36 +0100 (CET)
Received: from localhost ([::1]:54028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l70CB-0000fG-7b
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 13:14:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6ztz-0005UD-4s
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:55:47 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:34561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6zto-0002Gm-Vy
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:55:46 -0500
Received: by mail-wm1-x333.google.com with SMTP id o10so2415562wmc.1
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 09:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3psuB1ujp7JFYSza2o7U3rCXIKQg0wNOJZ1+v6YLYU8=;
 b=PK78JQ2WxQdUHVuGycKPPxv1RwV1K077sakOFKGWXp5NcZDlvCnaMpjMDYxuCjLW0U
 C6n51/y3ut81kJ3+tLQOUgtrWm3V+9agfa3FEJoXB4itMPH+c7/i/guvWEeacI7/5lev
 o6+70fwTI5P3m15hCR0C6WG1yaNh1Nm/Dv18XMb4cM4ik6kuC3UgrMHD1ndQdo1eaM9/
 DxIPQx4MmRi9klaGthNf8bRjIsSk/9/BXU4xpDy2WmNNSpV8iKS1r3UaQ3LaD002MPQY
 gBs0eoJYF2jRM6mw99roPjUdESoNrtmk44aHrNZoqZyhZWz3acPNQDEaX/W2ao87gmsn
 1ITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3psuB1ujp7JFYSza2o7U3rCXIKQg0wNOJZ1+v6YLYU8=;
 b=jBOTvHGGL3IASMnAWGavrozabpOUgXGJvwTnr6/Ia/pdMarBkCtsOvlfskft9C8FOw
 g3uTC+KIl+lp7ycH9HpzS4wARzBL77LHYKV3anThlEGJlW35XYPHUQ5q5Ig4QdOx0oZM
 jnlTdgUbFvOxuaIfW2HATCSumv/R3L0nGZFWq+3EPuWZUHX5o6u9+0Dll1lr6hjeGnxw
 QMFehNlNtQ+itc1ARMZZ3dtCpDvZ5qGEAJVZvdCploD24UYh9m+VKfaK0/oMOFGaXU48
 4rUM+rP29MA7bepAvXPCqM82vnG+v+LeDwPSnI41o4hEzHXKVLgVj9T7LkvcS3LmEYXN
 m/eg==
X-Gm-Message-State: AOAM533auyeDOhBQhYWWL6dqMBwpcevLnBjs1wHMeUWlxtoCEJwUvtl1
 4u/MnzmKsu7XKtlQ5gljFqtReyy8gKdg4w==
X-Google-Smtp-Source: ABdhPJzWVSuhZpWpH2Nc03tnKSuDghoC+XdQ9QPkv2c+kuVCBos/DsaQSFzutda4QZ/saueBrMwckw==
X-Received: by 2002:a7b:c7c8:: with SMTP id z8mr4711019wmk.72.1612288532487;
 Tue, 02 Feb 2021 09:55:32 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q6sm4142283wmj.32.2021.02.02.09.55.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 09:55:32 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/21] hw/ssi: imx_spi: Correct the burst length > 32 bit
 transfer logic
Date: Tue,  2 Feb 2021 17:55:09 +0000
Message-Id: <20210202175517.28729-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210202175517.28729-1-peter.maydell@linaro.org>
References: <20210202175517.28729-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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

From: Bin Meng <bin.meng@windriver.com>

For the ECSPIx_CONREG register BURST_LENGTH field, the manual says:

0x020 A SPI burst contains the 1 LSB in first word and all 32 bits in second word.
0x021 A SPI burst contains the 2 LSB in first word and all 32 bits in second word.

Current logic uses either s->burst_length or 32, whichever smaller,
to determine how many bits it should read from the tx fifo each time.
For example, for a 48 bit burst length, current logic transfers the
first 32 bit from the first word in the tx fifo, followed by a 16
bit from the second word in the tx fifo, which is wrong. The correct
logic should be: transfer the first 16 bit from the first word in
the tx fifo, followed by a 32 bit from the second word in the tx fifo.

With this change, SPI flash can be successfully probed by U-Boot on
imx6 sabrelite board.

  => sf probe
  SF: Detected sst25vf016b with page size 256 Bytes, erase size 4 KiB, total 2 MiB

Fixes: c906a3a01582 ("i.MX: Add the Freescale SPI Controller")
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210129132323.30946-10-bmeng.cn@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/ssi/imx_spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 41fe199c9f1..a34194c1b06 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -185,7 +185,7 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
 
         DPRINTF("data tx:0x%08x\n", tx);
 
-        tx_burst = MIN(s->burst_length, 32);
+        tx_burst = (s->burst_length % 32) ? : 32;
 
         rx = 0;
 
-- 
2.20.1


