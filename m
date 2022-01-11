Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8556648B3D1
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 18:28:08 +0100 (CET)
Received: from localhost ([::1]:38068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7KwH-0008Vo-AB
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 12:28:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7Kfh-0005Av-Rs
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 12:10:58 -0500
Received: from [2a00:1450:4864:20::434] (port=35467
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7Kfe-0007Ia-Oi
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 12:10:57 -0500
Received: by mail-wr1-x434.google.com with SMTP id e9so32744976wra.2
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 09:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/jGnsJVkg/+ZfygtKsHgjGO+aK46tFljwLWJ8e5maX8=;
 b=yWLipiECET/cot1mlylKu2t4xZrle1fGHWd8s6LzUC6OpEnFsU/tyoGmikcgFA8NWu
 QMRyydSle5YEo4JzLjYEQMehizqkz3+WAgxm9HcBmD9lAyA1RUDX5JFtejATwegvuMw0
 40E7hpizwFFW4nfp2CGTh7ni0nkwnbTMO2zHjS9JJPvs0fosZJxfy6uxZ44s95ANa2LZ
 rgrq9MiKJ99ZsijvsWMTiE7obSODLIOkFzje6DqFFHcCGhBOcO4mTKvjgoxTsqyUIMi3
 Wz8m5xjuh1EF9a6euCHw8SIvbkUdzzg5MOPuTDEVyfoE/lZgqkmxoztp74r8P8gB9ZHW
 PHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/jGnsJVkg/+ZfygtKsHgjGO+aK46tFljwLWJ8e5maX8=;
 b=tsxFHTShB7DCqPGkijgitquo2X9LFF00rBNNxOl/2ldJ9OWBW4T16id1OyuD9PkPyH
 cRYIp2K1I1C609UYmYRQofrfMdsUQrrh0bQEPSvRuMOnxO4sMk1lSlSX96hV6ku+vUvi
 ToimJXEEm0Z0PYpY43uR5ecWFiIxYLjmSVP2wiwgRQuFjrDYiYStbZQSY2UWIbaxKu+w
 3552etiALaiBAR3BSkaY5N4TpS24Ny3puZH8FBWsKHotyNZicJ2Ljzmz15yyJ6gy655S
 7hLp/oIIZiTh46WDpL7wAKUzAJ7BtQ+gW9jXpTM5iwnsW1U3PLTEVWkyzmouFFE2uQ5b
 rGOg==
X-Gm-Message-State: AOAM5326rjmMRzaEnJpG0KekGhSaBqOJKXpVL0bfyOeLaUv4NbmvyVTh
 xpEAwbz8+nGvCU+ppt46EhrqIQ/4pOJOLQ==
X-Google-Smtp-Source: ABdhPJyvn6tBb6S5A9iO+h9I16uzPLqIZX3vR3VTFjJ5p2sq3b6yqdOodR4Dzky4E3Wct4LNjiQl+g==
X-Received: by 2002:a05:6000:18cd:: with SMTP id
 w13mr4744849wrq.199.1641921053538; 
 Tue, 11 Jan 2022 09:10:53 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id c7sm11157941wri.21.2022.01.11.09.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 09:10:53 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 04/13] hw/intc/arm_gicv3_its: Don't use data if reading
 command failed
Date: Tue, 11 Jan 2022 17:10:39 +0000
Message-Id: <20220111171048.3545974-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111171048.3545974-1-peter.maydell@linaro.org>
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

In process_cmdq(), we read 64 bits of the command packet, which
contain the command identifier, which we then switch() on to dispatch
to an appropriate sub-function.  However, if address_space_ldq_le()
reports a memory transaction failure, we still read the command
identifier out of the data and switch() on it.  Restructure the code
so that we stop immediately (stalling the command queue) in this
case.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index a6c2299a091..c1f76682d04 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -672,8 +672,13 @@ static void process_cmdq(GICv3ITSState *s)
         data = address_space_ldq_le(as, s->cq.base_addr + cq_offset,
                                     MEMTXATTRS_UNSPECIFIED, &res);
         if (res != MEMTX_OK) {
-            result = false;
+            s->creadr = FIELD_DP64(s->creadr, GITS_CREADR, STALLED, 1);
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: could not read command at 0x%" PRIx64 "\n",
+                          __func__, s->cq.base_addr + cq_offset);
+            break;
         }
+
         cmd = (data & CMD_MASK);
 
         switch (cmd) {
-- 
2.25.1


