Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2193CF13A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 03:20:33 +0200 (CEST)
Received: from localhost ([::1]:58822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5eQy-0000tp-S7
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 21:20:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5eOj-0006aQ-GB
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 21:18:14 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:46776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5eOi-0003OS-5L
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 21:18:13 -0400
Received: by mail-pg1-x52b.google.com with SMTP id r21so2852835pgv.13
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 18:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9B/gmUM+QUz3bpCH+D2gMCTlPL+YqDM4DQGjYBG4u2w=;
 b=NhdB/zzX6mDFjrjH1iM0YPwvjxswVTIJuu+MDmfEoddHffyqa/2j2UsfRHskFzHgHf
 96OBigqIgY/G673cG+GVh0U/1Tp2RWrbDilOd/vGHPCSOG8VSMfhUK9Anj56scdF7KHM
 /wxTobJLD0p7rTBNgGMlTq2ufzYiBdu/JlCLFjKOdVc2Lg+aM9ReG4NJNM0RpkaikDMq
 JN8uDzTd6EB/vfNNHjL/50Oh7YPwVeOMzAZ+bjUoQQcAStCd6o37xbz8H0RPK6Gkcqoz
 GRqwC31qltNlx5IrT/32w/jnPOFCd0jX7AFL9seGrHWsH+fEqL3ZMeJZhq+CFqARxmqn
 6Rgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9B/gmUM+QUz3bpCH+D2gMCTlPL+YqDM4DQGjYBG4u2w=;
 b=lNTnuRmS2NbDa4Kbhc5DxYD9dZv/GrQjGJq91gAWDUwURm1RIleC0iYzcR/eMk5pu7
 luE15WOuHucIMmhzYm6aOG3tJ0Uc5FzQ8j5y9jRr72kFE0Gss8ePVxSdYZnZ4yRzZ5Dh
 9EWiTHJV3dpADCbGHbQrz9raFArl/J0+6rFXCVbYpqpEZ3t/aIahbRFZ8GlBVw/USwkm
 Dcf9EGXtInbO/JzNYYnlucDwkcxYFqW2RhZoeO0G7xxY3HGCvvQ3iMuH2upDzvgc8MO3
 O2f1QTFQe8GNx5xSvqlxHkveZl2wfzGfJyiLfI5q8AEDMc3jaIg9Q0HQoV7MYvl1eSwo
 PT6g==
X-Gm-Message-State: AOAM531QEy80qbjDPlq87+nLdwb/V+toeH5loa63EOnXhMU8MGFVu9Nx
 If72GRnQB4OZjuKjxbm9/34+MhxZbiLttg==
X-Google-Smtp-Source: ABdhPJzslWkt+0D1wN7wzUp679Xv+Z3RwOKtcPWNkSYpuVoRkmAFr5O3z2+v/Hm8zKpPnl4GshmKbg==
X-Received: by 2002:a62:bd15:0:b029:31c:a584:5f97 with SMTP id
 a21-20020a62bd150000b029031ca5845f97mr28289884pff.33.1626743890850; 
 Mon, 19 Jul 2021 18:18:10 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id e4sm25378054pgi.94.2021.07.19.18.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 18:18:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 v5 05/15] accel/tcg: Drop CF_NO_GOTO_PTR from -d
 nochain
Date: Mon, 19 Jul 2021 15:17:50 -1000
Message-Id: <20210720011800.483966-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720011800.483966-1-richard.henderson@linaro.org>
References: <20210720011800.483966-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The purpose of suppressing goto_ptr from -d nochain had been
to return to the main loop so that -d cpu would be recognized.
But we now include -d cpu logging in helper_lookup_tb_ptr so
there is no need to exclude goto_ptr.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210717221851.2124573-5-richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index d3232d5764..70ea3c7d68 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -150,7 +150,7 @@ uint32_t curr_cflags(CPUState *cpu)
     uint32_t cflags = cpu->tcg_cflags;
 
     if (qemu_loglevel_mask(CPU_LOG_TB_NOCHAIN)) {
-        cflags |= CF_NO_GOTO_TB | CF_NO_GOTO_PTR;
+        cflags |= CF_NO_GOTO_TB;
     }
 
     return cflags;
-- 
2.25.1


