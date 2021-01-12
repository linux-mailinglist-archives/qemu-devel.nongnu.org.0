Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A90D2F3379
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 16:01:25 +0100 (CET)
Received: from localhost ([::1]:42464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzLAi-0004RR-Ia
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 10:01:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kzL5P-00088i-21; Tue, 12 Jan 2021 09:55:55 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:40396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kzL5N-0004nn-Hg; Tue, 12 Jan 2021 09:55:54 -0500
Received: by mail-pg1-x536.google.com with SMTP id 15so1606163pgx.7;
 Tue, 12 Jan 2021 06:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dUq4A654ZKmWVdTONfz5D26WNlkMJCt4bN5UkLrjKbg=;
 b=jSkw+6YEVqEEyeQ0O3nuUZ9msOUgFm3uzG1/Toks1srZfR2JWS8nJtKkekVfx1ypa1
 ume9rwehUhm+WVDcUS49xti1N7yFAkDXPVpRSnHEA8KdPZsWzQejwujF3XuiQYxcWJQN
 Gil0Cv0KP+OG3O8OFJsA374WKvuFB2PQWTmeevfnJlSGr/4MwkongIKHbF13Jog5m9yn
 vazZIYNCeVvtdXN2jJl7/7JlGf9gPpogIb4x0WwSeVqJ/zlvd0rsTTzOE1yuPQPR88vm
 xkPdVQ/qP4l6natwU/zzPM4g2YXi4tOo+5Xg6w4mU1t5KuvVQnYTrq/SKGSdDgSSRriI
 nT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dUq4A654ZKmWVdTONfz5D26WNlkMJCt4bN5UkLrjKbg=;
 b=ryHbSwhExyBsyqG8BCSwv32sy825R7o1vJRyFijRgM+yZHZiGeAfdT98DyfCIhoR9l
 oG2Ae/Gck0qvXcmasRoFSsqcWKMeLrWbNAunRRY5U/JRKC7YEdIUx9rUv+t8tuaR0js9
 s+qV1qFy4tJuZnX1pj4ch6f+vDo9oGbWLnGlOR7Ntga8ThpQgtm7t5MU7VH1Yb4TbJad
 CIea9KiI0yca82X+R1b9qsftyOxSOoLn+OYvYBu7dKFJMXY3hfrER3OEE5z2OMFX8TEb
 y1ahSP76nc+G4OzIlwfiEQJtRd4aEqvEq6wJTCzYEXRFdokKJO/TScXKiPJj735GcfHr
 HqdA==
X-Gm-Message-State: AOAM531bXMhYVWcxkDDAZVxGKgKNxTfcBEC8PctDPF5Bi9NWDuacz8ma
 A+AGWJntfBOq2O72iZ+HPm4=
X-Google-Smtp-Source: ABdhPJyPWmCUc8IKTLSJeKabospcV+9a3w3RoWd34wr7VUHEIKxpWrcE7CyvHmKAaZYXnMaFX3XFPQ==
X-Received: by 2002:aa7:947c:0:b029:1a5:dece:c07f with SMTP id
 t28-20020aa7947c0000b02901a5decec07fmr4843278pfq.47.1610463351971; 
 Tue, 12 Jan 2021 06:55:51 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id l141sm3593938pfd.124.2021.01.12.06.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 06:55:51 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v5 4/6] hw/ssi: imx_spi: Round up the burst length to be
 multiple of 8
Date: Tue, 12 Jan 2021 22:55:24 +0800
Message-Id: <20210112145526.31095-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210112145526.31095-1-bmeng.cn@gmail.com>
References: <20210112145526.31095-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x536.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Current implementation of the imx spi controller expects the burst
length to be multiple of 8, which is the most common use case.

In case the burst length is not what we expect, log it to give user
a chance to notice it, and round it up to be multiple of 8.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v5:
- round up the burst length to be multiple of 8

Changes in v4:
- s/normal/common/ in the commit message
- log the burst length value in the log message

Changes in v3:
- new patch: log unimplemented burst length

 hw/ssi/imx_spi.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 880939f595..b7456de065 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -128,7 +128,20 @@ static uint8_t imx_spi_selected_channel(IMXSPIState *s)
 
 static uint32_t imx_spi_burst_length(IMXSPIState *s)
 {
-    return EXTRACT(s->regs[ECSPI_CONREG], ECSPI_CONREG_BURST_LENGTH) + 1;
+    uint32_t burst;
+
+    burst = EXTRACT(s->regs[ECSPI_CONREG], ECSPI_CONREG_BURST_LENGTH) + 1;
+    if (burst % 8) {
+        qemu_log_mask(LOG_UNIMP,
+                      "[%s]%s: burst length (%d) not multiple of 8!\n",
+                      TYPE_IMX_SPI, __func__, burst);
+        burst = ROUND_UP(burst, 8);
+        qemu_log_mask(LOG_UNIMP,
+                      "[%s]%s: burst length rounded up to %d; this may not work.\n",
+                      TYPE_IMX_SPI, __func__, burst);
+    }
+
+    return burst;
 }
 
 static bool imx_spi_is_enabled(IMXSPIState *s)
-- 
2.25.1


