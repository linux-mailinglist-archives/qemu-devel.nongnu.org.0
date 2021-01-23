Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D40030144E
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 10:42:34 +0100 (CET)
Received: from localhost ([::1]:50352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3FRA-00054I-OK
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 04:42:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3FPt-0004Zd-Pd
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 04:41:13 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:40153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3FPs-0000k5-4B
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 04:41:13 -0500
Received: by mail-ed1-x52a.google.com with SMTP id s3so963591edt.7
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 01:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JlpFwXP97m26kKhg3fDPurnVi41KUaNstA33/yTPmGY=;
 b=DN/rHSfkRrwbZwuLbOlXyeGnKvUKUVCss4w1s0/luDUk2Jsv593yZmzBoEFY5tA8GF
 7XqEvdpHlQ4S26ygW/WbHjX8k7DeU+YkRYlgPVAleyhXXSdrvOSiJTqaEZ9VhfZwIQXy
 7SaS3dJvWrPwSVVYpwOBufkiDuudZ3+4osPx5VFe3I50AurKSwSRH2zARnnEoLTKnUpl
 Mt6STsMVVluGYjM2f+GrUY3VDApVrd0rmCRoKr2skPeH1q6cXCeECKso9KaffTWd/UlI
 SYrmw48M1W2GsJNTSx71H34M21SeJk4ksmYLuhGA8Kd1FEt8r+vUWmz5CpmQa2YRWfXv
 uP0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=JlpFwXP97m26kKhg3fDPurnVi41KUaNstA33/yTPmGY=;
 b=Rb7+y1b73gB0GQmYpAs2cT0cMfjIWh8r0xYuXvR5UC4yk8IIZlqkzjmaBE+yGdOw/0
 lGUMUDb2MG3s4KSeufCqzOf7KjizXfNfgnMRbLwc4xRGS8d5gVNjQB9bPgXDuWB9OZpa
 lYMZtu+zAeU9K5YFDLDELigs2yi70kizpeyGXcU3jtd71sPJkRegZzGsNIXOjswZdtfh
 1TH9k9Sa4zRHbDnln0gkh6GN7dttSjGpCPYEbqYH1N8DQ1mRO+fclmRJ9q/5j6kTe5Kf
 JjYOKAmjCaUxSK5+IYqmeXbgivEip/0aWNqZdS2p2VggbmSYw6CYLNZYv+racmPHAPQD
 2nXw==
X-Gm-Message-State: AOAM531wryCIeIo6tHBXEAvfzNw25J/gnqjx6hElZunC1C8pbBtdE14z
 3wB7sAZhjvDYJ1efsAapIgjquvsYHOk=
X-Google-Smtp-Source: ABdhPJx74ZQ2dUyxdrD8Ipj4HhymdMUye9bIT45WM3HFjTRo9vRagJRl7QpDlcERHi13A08d838bEQ==
X-Received: by 2002:a05:6402:28e:: with SMTP id
 l14mr1439756edv.19.1611394869927; 
 Sat, 23 Jan 2021 01:41:09 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id z22sm6878626edb.88.2021.01.23.01.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 01:41:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tcg/tci: Restrict tci_write_reg16() to 64-bit hosts
Date: Sat, 23 Jan 2021 10:41:07 +0100
Message-Id: <20210123094107.2340222-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Stefan Weil <sw@weilnetz.de>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict tci_write_reg16() to 64-bit hosts to fix on 32-bit ones:

  [520/1115] Compiling C object libqemu-arm-linux-user.fa.p/tcg_tci.c.o
  FAILED: libqemu-arm-linux-user.fa.p/tcg_tci.c.o
  tcg/tci.c:132:1: error: 'tci_write_reg16' defined but not used [-Werror=unused-function]
   tci_write_reg16(tcg_target_ulong *regs, TCGReg index, uint16_t value)
   ^~~~~~~~~~~~~~~

Fixes: 2f160e0f979 ("tci: Add implementation for INDEX_op_ld16u_i64")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tcg/tci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tcg/tci.c b/tcg/tci.c
index 2311aa7d3ab..3fc82d3c79d 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -128,11 +128,13 @@ static void tci_write_reg8(tcg_target_ulong *regs, TCGReg index, uint8_t value)
     tci_write_reg(regs, index, value);
 }
 
+#if TCG_TARGET_REG_BITS == 64
 static void
 tci_write_reg16(tcg_target_ulong *regs, TCGReg index, uint16_t value)
 {
     tci_write_reg(regs, index, value);
 }
+#endif
 
 static void
 tci_write_reg32(tcg_target_ulong *regs, TCGReg index, uint32_t value)
-- 
2.26.2


