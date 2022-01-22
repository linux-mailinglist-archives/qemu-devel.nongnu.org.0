Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 424D8496D82
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 20:03:58 +0100 (CET)
Received: from localhost ([::1]:35534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBLg5-0002y9-2z
	for lists+qemu-devel@lfdr.de; Sat, 22 Jan 2022 14:03:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nBL4z-0005n8-AI
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 13:25:37 -0500
Received: from [2a00:1450:4864:20::42a] (port=35714
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nBL4u-0007gj-Nx
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 13:25:35 -0500
Received: by mail-wr1-x42a.google.com with SMTP id r14so5908819wrp.2
 for <qemu-devel@nongnu.org>; Sat, 22 Jan 2022 10:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=21JlFmTfghwTaDwa5naHNdk9BldcI4QKiETubeObcCA=;
 b=RjIERdbBOmYJ+5UjdZoszVefR4dYrTxt9tsJc+4N1sANqWijAhWCBlzkbYY4W/t9K+
 x1C9sZeomMXEgkwjxL8EPquh2gHXCLaARh49vR6FH67L9swhBPGmzR7esTduSpSQtQZm
 fDvYpeYGPHh46l5hqHhvJXRVUU7EtzPQICOGbUINaMEl2osggsVTPy6Ffsfj0vWm1Xz9
 IgiDKrmHoF3TlbvKmHyr0rk/VvTBd7CVHDSaYQAZeCwaIx8IrW4dEHOxat2bCLLSxdsZ
 ueVFveNAlD86jVsiYAygWjRMMqLJqCNZIF3Lf3Q+LPAxyo5B5VPPaC/gLbCD8AvLJt/9
 Ixow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=21JlFmTfghwTaDwa5naHNdk9BldcI4QKiETubeObcCA=;
 b=h2nhf52w7vUNgy+X+R1rOPoTtUPxY81alNb9k3+Eu6z2JdMdAlenXJOjtqOUJ63Fjp
 oswMIbXok/t5nZ7DdfQtAoJr9InW1JWmxBwsOF3CLgYhwUwKsLJu8+2U/qc4TstBHzbG
 4XDTpzZOB3OU6V9u/WC09hZpJiaixAVxgdGzbcgAE423+YIjDaxvMvXIHuFIKuJfN6m/
 KsYE0EegQ+Hc9qc8IpAsavPaXfmSN0Z+ou+kLW5N7AGGSHd+KiIPrmYxRpcbci+RTA8/
 KgOPrro0wDtC1IHwH+GTyeT9WdtiEJTwHVXAcq8j27oEBaTEPTp45xsTRSmQjH/nrZgR
 7KyQ==
X-Gm-Message-State: AOAM5309E/+UfhcqtUbHeZO9e1iPAd+Z4qff5GFBcqtEiBIE7sOUaJAo
 C/QGQxWQv673Kab0/iCLZ3u8gQ==
X-Google-Smtp-Source: ABdhPJynVpAQgzKp6fvszgdjoqizMkFKHxnIOSJOQ646U6rtNPaFLW8KL5A7mOEyy0c9UQ9iZDQXmg==
X-Received: by 2002:adf:c843:: with SMTP id e3mr8587182wrh.38.1642875890510;
 Sat, 22 Jan 2022 10:24:50 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id 21sm8870774wmk.45.2022.01.22.10.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 10:24:50 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 06/14] hw/intc/arm_gicv3: Honour GICD_CTLR.EnableGrp1NS for
 LPIs
Date: Sat, 22 Jan 2022 18:24:36 +0000
Message-Id: <20220122182444.724087-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220122182444.724087-1-peter.maydell@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The GICD_CTLR distributor register has enable bits which control
whether the different interrupt groups (Group 0, Non-secure Group 1
and Secure Group 1) are forwarded to the CPU.  We get this right for
traditional interrupts, but forgot to account for it when adding
LPIs.  LPIs are always Group 1 NS and if the EnableGrp1NS bit is not
set we must not forward them to the CPU.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
index 715df5421dd..6d3c8ee231c 100644
--- a/hw/intc/arm_gicv3.c
+++ b/hw/intc/arm_gicv3.c
@@ -166,6 +166,7 @@ static void gicv3_redist_update_noirqset(GICv3CPUState *cs)
     }
 
     if ((cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) && cs->gic->lpi_enable &&
+        (cs->gic->gicd_ctlr & GICD_CTLR_EN_GRP1NS) &&
         (cs->hpplpi.prio != 0xff)) {
         if (irqbetter(cs, cs->hpplpi.irq, cs->hpplpi.prio)) {
             cs->hppi.irq = cs->hpplpi.irq;
-- 
2.25.1


