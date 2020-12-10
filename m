Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDB82D5DB5
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 15:30:15 +0100 (CET)
Received: from localhost ([::1]:47418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knMxQ-0002Fm-G7
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 09:30:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1knMk2-0006QZ-OL; Thu, 10 Dec 2020 09:16:22 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:34346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1knMjw-0003Z0-15; Thu, 10 Dec 2020 09:16:22 -0500
Received: by mail-wr1-x443.google.com with SMTP id k14so5661351wrn.1;
 Thu, 10 Dec 2020 06:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MqIwFv8FtosuPTOH+76+Ccv7DmvEu0dknfwXXb3hwPw=;
 b=D8M7eer8ludLMyOVanrF/5s+a+ekwjBYkWEE9/lKm1X+rseJozSoctOp0+pobdUjLh
 TxoNC+Mo6RhujfEJVtcVEYjouLxfLkNMHjv6vKVOI2V9Qo/6qpEqgZkonoWzQof+6g+m
 ciBg+B4ve6QI728QJ7bN2OPUS1MIwIfM8135GcWMH6H4CiiYENoQRHxqrtiMaaIOyNUE
 zx6AECRKgH2r/pqrd50uIRTZQkokS2duec1VqGSpVdoigjzVHB4R9KmwQKQaG7FA3W30
 Nxt4fWSBJ55WOuM7SrQpn4xnv2GL/oZBqk9/RC9CLjcSwnYAkjEAPC52QRUIQZXIJjAU
 +t6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=MqIwFv8FtosuPTOH+76+Ccv7DmvEu0dknfwXXb3hwPw=;
 b=hApNj4iBuYxbJ1K2Lmz4UvDKC60QFWgHVlfrrumwwVVDTFVlYEUTUooNG/tQ25W0FS
 jvzKQVuoSRC7XRn6hmlG/sng1Pr82/InewZBqtLwn2pBVxQxR8I4if4raupDImosa2//
 wjCSTkVHwOjcmr84iaWSpGDYkfH4SW03WzY6WaRfLZHGFS4fpF1osvwD/MEp8odMYQMZ
 p3eEPQmfGcQ5bKHWO1VyH1TdIPizI7Ok6VolSlQ7p1YKkYOA5TdVmEcgKX5DwspUJEEp
 g3qhiU1Rms688CIwyvCt/Ye4NKbFJi3avCfnVBZGRptGkxleV172q8BQWBisvEpn1iYw
 SqRA==
X-Gm-Message-State: AOAM532qgn/uw5x3K+CF750o6L9zY3jnO4RsElW0mDX69ZKr/DfNi2WR
 nERuYz87ktE9JlgbOXFy9Mr3EUF02iM=
X-Google-Smtp-Source: ABdhPJzlUD128glwtV81VT7I3DcgFt8F6hm79iTooCfbaizmmYFVO5w2uU7OA0WpQl9BWOQFeTGhpg==
X-Received: by 2002:a5d:68c9:: with SMTP id p9mr8514912wrw.139.1607609772968; 
 Thu, 10 Dec 2020 06:16:12 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id a13sm9787526wrt.96.2020.12.10.06.16.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 06:16:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] hw/misc/zynq_slcr: Avoid #DIV/0! error
Date: Thu, 10 Dec 2020 15:16:10 +0100
Message-Id: <20201210141610.884600-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Gaoning Pan <gaoning.pgn@antgroup.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Gaoning Pan <pgn@zju.edu.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Malicious user can set the feedback divisor for the PLLs
to zero, triggering a floating-point exception (SIGFPE).

As the datasheet [*] is not clear how hardware behaves
when these bits are zeroes, use the maximum divisor
possible (128) to avoid the software FPE.

[*] Zynq-7000 TRM, UG585 (v1.12.2)
    B.28 System Level Control Registers (slcr)
    -> "Register (slcr) ARM_PLL_CTRL"
    25.10.4 PLLs
    -> "Software-Controlled PLL Update"

Fixes: 38867cb7ec9 ("hw/misc/zynq_slcr: add clock generation for uarts")
Reported-by: Gaoning Pan <pgn@zju.edu.cn>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Damien Hedde <damien.hedde@greensocs.com>
Cc: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Cc: Alistair Francis <alistair.francis@wdc.com>
Cc: Gaoning Pan <gaoning.pgn@antgroup.com>
Cc: Mauro Matteo Cascella <mcascell@redhat.com>

Alternative is to threat that as PLL disabled and return 0...
---
 hw/misc/zynq_slcr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c
index a2b28019e3c..66504a9d3ab 100644
--- a/hw/misc/zynq_slcr.c
+++ b/hw/misc/zynq_slcr.c
@@ -217,6 +217,11 @@ static uint64_t zynq_slcr_compute_pll(uint64_t input, uint32_t ctrl_reg)
         return 0;
     }
 
+    /* Consider zero feedback as maximum divide ratio possible */
+    if (!mult) {
+        mult = 1 << R_xxx_PLL_CTRL_PLL_FPDIV_LENGTH;
+    }
+
     /* frequency multiplier -> period division */
     return input / mult;
 }
-- 
2.26.2


