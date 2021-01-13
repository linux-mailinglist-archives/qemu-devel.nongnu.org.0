Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 893B52F5486
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 22:19:51 +0100 (CET)
Received: from localhost ([::1]:45458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kznYU-0005u2-LU
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 16:19:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.dentinger@spacecodesign.com>)
 id 1kznUr-0003Kw-Fn
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 16:16:05 -0500
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:38354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anthony.dentinger@spacecodesign.com>)
 id 1kznUp-0008MO-IZ
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 16:16:05 -0500
Received: by mail-qk1-x72a.google.com with SMTP id w79so4129464qkb.5
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 13:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=spacecodesign.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=/+0KbUs6wv+H6He8aUZqbucCfLiVDvi1h7YFTS+o9Lc=;
 b=BdlJHEAZd/zaxamzIA8LckuaRtz0wBOoGynDz1WLVypSO4ffOS3K00apPBfpR5Xdi8
 UnImOsFr4SdKFcuMTcsluQi2KVytzI7AqDWTwk8dDhCeGNGVtqKuGfknjFutikHObt+5
 91O2Ik3FfIv1M+vsvKCYQJk/pKPesiaOZlGDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=/+0KbUs6wv+H6He8aUZqbucCfLiVDvi1h7YFTS+o9Lc=;
 b=gFjw8XVFXIlPKBIKiPhfLnjohLoXkdxGnid1jXCBOHRE/Gr9667Bw/o78FOmXnH7rt
 GU4eDrmsVpkd4T5j1O9etFp1q7jaCdHLMN0AbMba/Q5p6h7gC866jz+qAmctrJN4vbCB
 C3hOo7d38e2WkJJB9M8fxJP61nS476q67HJiRhHkx8FZmJydwp8dFDtlAa4gChJJ+7Dn
 sAaVdqf+hugPIeTlWrpJoce1VpufGqN66UcDnfEOAC6VqtnbE2Pc8EUgdrtns9tM44L2
 u+An2x2IqwWDlHfwvUWJyL7hmjNkAGFet2/i+XNAeVAnVs3EeLLn3BJTb7VLj6SX1GzC
 6xMw==
X-Gm-Message-State: AOAM530O6wBjWIiRF06crwaBQATCghuMJDNmMXD7uMeAjbi8xelY+k+T
 rh/gllcgrXVryN9ltiBxq+gAhIuU2qHIuViB
X-Google-Smtp-Source: ABdhPJxUyuAMYTAzbKzq+6PhD1lj3CBFsMYO2x+Pueno4Yyop3VUf65tlasaBPAOg+a9N/h6LC2vXw==
X-Received: by 2002:a37:a14a:: with SMTP id k71mr3985273qke.33.1610572562349; 
 Wed, 13 Jan 2021 13:16:02 -0800 (PST)
Received: from localhost.localdomain (104-37-205-141.resi.cgocable.ca.
 [104.37.205.141])
 by smtp.gmail.com with ESMTPSA id o201sm1869321qke.60.2021.01.13.13.16.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 Jan 2021 13:16:01 -0800 (PST)
From: Anthony Dentinger <anthony.dentinger@spacecodesign.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/char/cadence_uart: Fixed wrong Cadence UART stop bit count
 register value.
Date: Wed, 13 Jan 2021 16:15:31 -0500
Message-Id: <20210113211531.20696-1-anthony.dentinger@spacecodesign.com>
X-Mailer: git-send-email 2.16.2.windows.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=anthony.dentinger@spacecodesign.com;
 helo=mail-qk1-x72a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 13 Jan 2021 16:18:38 -0500
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
Cc: qemu-trivial@nongnu.org,
 Anthony Dentinger <anthony.dentinger@spacecodesign.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Here is a reference showing that 0x00 is the correct value:
- https://www.xilinx.com/support/documentation/user_guides/ug585-Zynq-7000-TRM.pdf
  (page 1776, Register XUARTPS_MR_OFFSET Details, which is for a platform
  called Zynq that has a UART made by Cadence)
- https://github.com/Xilinx/linux-xlnx/blob/51445f9139af73c616f054a8fcc77ed2568b81b1/drivers/tty/serial/xilinx_uartps.c#L98
  (Linux driver for the Cadence UART on that Zynq platform).

Signed-off-by: Anthony Dentinger <anthony.dentinger@spacecodesign.com>
---
 hw/char/cadence_uart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index c603e14012..a049ed50c4 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -93,7 +93,7 @@
 #define UART_DATA_BITS_7       (0x2 << UART_MR_CHRL_SH)
 #define UART_PARITY_ODD        (0x1 << UART_MR_PAR_SH)
 #define UART_PARITY_EVEN       (0x0 << UART_MR_PAR_SH)
-#define UART_STOP_BITS_1       (0x3 << UART_MR_NBSTOP_SH)
+#define UART_STOP_BITS_1       (0x0 << UART_MR_NBSTOP_SH)
 #define UART_STOP_BITS_2       (0x2 << UART_MR_NBSTOP_SH)
 #define NORMAL_MODE            (0x0 << UART_MR_CHMODE_SH)
 #define ECHO_MODE              (0x1 << UART_MR_CHMODE_SH)
-- 
2.16.2.windows.1


