Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA5E3FD9DE
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 14:54:58 +0200 (CEST)
Received: from localhost ([::1]:58866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLPlZ-0002rZ-47
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 08:54:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mLPci-0003jA-4o; Wed, 01 Sep 2021 08:45:48 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:39709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mLPcg-0003ge-LG; Wed, 01 Sep 2021 08:45:47 -0400
Received: by mail-pf1-x433.google.com with SMTP id e16so1953240pfc.6;
 Wed, 01 Sep 2021 05:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0+KB8VLhpjDCIb3k+XnxOMKOakzrhTJnwW420hgy2YA=;
 b=RO630i0c4UDvUHAZSkxa0pOSVXjJUThL3Hyu+OUN7brYuo9Jqz7YAAE3FGZp1VRP7D
 ESPg08odxk9ypns5U/F8qejexBpcM7Wcpy9UwxM8r1mvupm2cJKLZB0lqZslyKTVnRiu
 7YpMqSsK+86d9ecfHQJ4IXjvZuBEEKdyAUHiCb9WH/nC3ZSb6/yjt5zLNDBhm0hBdi7Q
 u4YKqZ8jh5uuEhuevrWKS4Eh4M9UZbqx8PEZYaNg77+aPfI0crAQnoR0UHZaYhxP7NO/
 MVDC0sm+SknNlkm2umscYZ1j4xCYG1IMrKP6ZxqZiE6zK7cpI2yGQaGH+GGbZrIvx8Cv
 QdCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0+KB8VLhpjDCIb3k+XnxOMKOakzrhTJnwW420hgy2YA=;
 b=hQRFyoXBzkTReTTCQzZuKeBA8nMBwfmdYniSC7uXDyJiExDyhIeDNLFKDwnRynjI/I
 hC3sNUQPf458TbTtt+LyGP1KFqWIKSmQMvs6cvZ48B2Tug+48BPFvoqUF83WQXHKoA/o
 3W7daS4tBXMlWpwrFFWSz603bmaBonnBXdV0RzjzDXSsms2eFjsJwl2Ez21QWQx7Zzc4
 zJ/TDGomzyNG4lJfO4u+52mAl6XYcyjxd3omBxUQWnkJ4VUHfC+YGOcWA4yahJo6i/aG
 hIiO3YmY9hx93F5vxtHwaRI/wttdj6Dt5H/CbkfEDGhUT8E8f0etKhrxBhGKAn5RzzgC
 MYZg==
X-Gm-Message-State: AOAM531SXaqpg6C9HT4Y+XKqmeNXqWSCQ0Sb/Dn7FNNoxC/06TDeWOU4
 DNRkMXLdihP9RDeztxfDMKE=
X-Google-Smtp-Source: ABdhPJyKZ05wrtPKAXd372pjRGvQVa2DCd4nspCR55QBtCXfAFwYNxZAxKiq2/a0Ekb00lJHkrAkJA==
X-Received: by 2002:aa7:8d4e:0:b0:3fd:b14b:950a with SMTP id
 s14-20020aa78d4e000000b003fdb14b950amr17922569pfe.26.1630500345130; 
 Wed, 01 Sep 2021 05:45:45 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id d22sm20917134pfq.158.2021.09.01.05.45.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 05:45:44 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 6/6] hw/char: cadence_uart: Log a guest error when device
 is unclocked or in reset
Date: Wed,  1 Sep 2021 20:45:21 +0800
Message-Id: <20210901124521.30599-7-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210901124521.30599-1-bmeng.cn@gmail.com>
References: <20210901124521.30599-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We've got SW that expects FSBL (Bootlooader) to setup clocks and
resets. It's quite common that users run that SW on QEMU without
FSBL (FSBL typically requires the Xilinx tools installed). That's
fine, since users can stil use -device loader to enable clocks etc.

To help folks understand what's going, a log (guest-error) message
would be helpful here. In particular with the serial port since
things will go very quiet if they get things wrong.

Suggested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---

Changes in v3:
- new patch: hw/char: cadence_uart: Log a guest error when unclocked or in reset

 hw/char/cadence_uart.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index 5f5a4645ac..c069a30842 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -240,6 +240,8 @@ static int uart_can_receive(void *opaque)
 
     /* ignore characters when unclocked or in reset */
     if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: uart is unclocked or in reset\n",
+                      __func__);
         return 0;
     }
 
@@ -376,6 +378,8 @@ static void uart_event(void *opaque, QEMUChrEvent event)
 
     /* ignore characters when unclocked or in reset */
     if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: uart is unclocked or in reset\n",
+                      __func__);
         return;
     }
 
@@ -413,6 +417,8 @@ static MemTxResult uart_write(void *opaque, hwaddr offset,
 
     /* ignore access when unclocked or in reset */
     if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: uart is unclocked or in reset\n",
+                      __func__);
         return MEMTX_ERROR;
     }
 
@@ -478,6 +484,8 @@ static MemTxResult uart_read(void *opaque, hwaddr offset,
 
     /* ignore access when unclocked or in reset */
     if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: uart is unclocked or in reset\n",
+                      __func__);
         return MEMTX_ERROR;
     }
 
-- 
2.25.1


