Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D47F260D1C2
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:44:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onMzT-00070f-Qr; Tue, 25 Oct 2022 12:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMz1-0006du-6u
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:55 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMyf-0001kD-LB
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:49 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 c7-20020a05600c0ac700b003c6cad86f38so11880412wmr.2
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 09:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BI6oZ4aEIYwnI+ESyvZ1YC+hWtdkqyODG5DEJQCOMTc=;
 b=EPjhAaD4xvIib8SqVqO4OTkiZkmgTlFKf1dfkAB9sOPWUQpPE+Lt4fvLxoQXhVG86q
 2MPQYfoo0gJ2MkIHrf7gQklzOTCJyyqYF3q/4sRe+Gl96e6QCwOS9NSRIWi7BZ9tXf/Y
 SG+cCbWj70JIVbtwo985Aij83Iq/dZeG8WNc0xJa58s2pFyrOQM5CRYbhGMd8tMjCPO+
 RRiS135o439Tk1gfMQD6weW5cSJiNKEXDDPo3W4I4L/Wqgnb4XP7ADMVO/7bykbzy8NF
 JOpDiSrQgsrtKD3qSmFJ/wPRFz4BIbBZO4g/NOOpuFz9Ns1pnp3BzZQhVGYRCNgOZzJD
 /s8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BI6oZ4aEIYwnI+ESyvZ1YC+hWtdkqyODG5DEJQCOMTc=;
 b=NVxY+/aKxOC73mRyH91zhmqgjAX4knxjowRafcsDwEC9BldLvwUyjhl77r1WqMWF/q
 0sQPGHdv5lXdLNxjLRQypKWEfynSYkALESnhl6aOZi8pslN0AOJSH/fJ5TugCgz66i5b
 DLpNtKEAvgCoXKxF6XDnxkGQfBviai/e2eZsqKDwuCVt36tCc4qrPlmONh2mF1qbRuoJ
 HIex1OWb3SQ/4J7Mn8ul2oFPOBhW54qq/KTdsr1rrCKpIvgjojKd/NpiCptMoQ5ufRVk
 8dUggYgsyfy9wVN729jCP84ycvoyXkDqdfdB6nKnnq3rQyqEXtIyXjlaJ/ZAv9/2H7ZT
 PuRw==
X-Gm-Message-State: ACrzQf0ToV//5NXWUI/gcWARp1/iFsNAKoY9zqy3r3gE5gGd8DqM5Obd
 IjplYuMGhbtm83v7wwaCbRj+Gps3iMwpvA==
X-Google-Smtp-Source: AMsMyM7HFiEpGoYbnslLvJ2+k7t5c/zGP+TVQ9pB4vlTArWR494P/o1syYk5bK3v7HQC317k7EUTng==
X-Received: by 2002:a05:600c:19d1:b0:3c7:b52:3aa4 with SMTP id
 u17-20020a05600c19d100b003c70b523aa4mr20646607wmq.56.1666716021916; 
 Tue, 25 Oct 2022 09:40:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a05600c220c00b003cd9c26a0basm2971084wml.40.2022.10.25.09.40.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 09:40:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/30] x86: do not re-randomize RNG seed on snapshot load
Date: Tue, 25 Oct 2022 17:39:45 +0100
Message-Id: <20221025163952.4131046-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221025163952.4131046-1-peter.maydell@linaro.org>
References: <20221025163952.4131046-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: "Jason A. Donenfeld" <Jason@zx2c4.com>

Snapshot loading is supposed to be deterministic, so we shouldn't
re-randomize the various seeds used.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Message-id: 20221025004327.568476-4-Jason@zx2c4.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/i386/x86.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 1148f70c03d..bd50a064a36 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1111,7 +1111,7 @@ void x86_load_linux(X86MachineState *x86ms,
         setup_data->type = cpu_to_le32(SETUP_RNG_SEED);
         setup_data->len = cpu_to_le32(RNG_SEED_LENGTH);
         qemu_guest_getrandom_nofail(setup_data->data, RNG_SEED_LENGTH);
-        qemu_register_reset(reset_rng_seed, setup_data);
+        qemu_register_reset_nosnapshotload(reset_rng_seed, setup_data);
         fw_cfg_add_bytes_callback(fw_cfg, FW_CFG_KERNEL_DATA, reset_rng_seed, NULL,
                                   setup_data, kernel, kernel_size, true);
     } else {
-- 
2.25.1


