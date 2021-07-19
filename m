Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4573CEE19
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 23:27:05 +0200 (CEST)
Received: from localhost ([::1]:33270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5an2-0004BM-8L
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 17:27:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5aiz-0003zm-Ad
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:22:53 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:35819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5aix-0000p3-RX
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:22:53 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 gp5-20020a17090adf05b0290175c085e7a5so631505pjb.0
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 14:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9B/gmUM+QUz3bpCH+D2gMCTlPL+YqDM4DQGjYBG4u2w=;
 b=zIL0Kp1watv+AvAjixN6HulLojuIrY0x9zNa0MsVlwhE1fsYS1niTL1esSOoIVoGUg
 KhOX6TAGVxmxC9InRSkt2PbltU+xy2anrl2CmTU78B3c4GsnM+MECGg4MI6ary0Qyg39
 zhtlSvL5Rzu0jOUSEUAhUFDkNdtWvQhHdAXg9SBZcSa66BeUs47iBxGFoYV4V3pOHqWZ
 Gc/sJI91JxUQGpZ/9KrIo2s9bkJcocdkCMh0oqUbE8Q98QyOoGRBwea9fXCe/dzryXC5
 Q6Qzsc23yIGNpbm2d5JVZqIIeTWNHkRATPsX2vTKMWUxfmCRilpCWt+jZoYJUuBbYG13
 QCMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9B/gmUM+QUz3bpCH+D2gMCTlPL+YqDM4DQGjYBG4u2w=;
 b=qXD6c5z4RLNxMwqPO/7seGO1gCDRjkBSypwUAW6wWpa+KCxX1vU1d3mSrNMB0HtlUv
 O5hLKbA9UqvNOt2zKBfrqLGLnZQWeua4nKLxkVn9O3cYz9hqzdhwmludCNb17fVeu546
 t4hqWTBJ04ETovHASqX8eeZPfC2OKrVSBNk189CtixcUYHEQTjJS7RYnKTtzoRu39IMk
 4nAEkS5nA7R6ct8AZayE4WYaHdSpcKPLyX/pN0bXpxH+E9SXA3gtP2JxLI1wbbmze/bx
 H3DjKfBJyhSLg1H++Rpy/SRT4jRjfRCIpHV3P6X7vl7QNeZadwLrVD0RNKkvepxt63kY
 17ng==
X-Gm-Message-State: AOAM533cliTm06grww0N7R2fLCqhl0YDD6mbx/ifRYnLrkjqFPfyFTX6
 DtnrUdla30aFZtR7TP+dfMrxT45UI05LVw==
X-Google-Smtp-Source: ABdhPJxD67VXsyy3Sz/GQTFbRkddYxKO2I5bh+Nsl13xB5hFbZM4ySLjpafoiQRXxwb7LBKomdb1BQ==
X-Received: by 2002:a17:90b:e8b:: with SMTP id
 fv11mr25678027pjb.25.1626729770550; 
 Mon, 19 Jul 2021 14:22:50 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id e4sm25008434pgi.94.2021.07.19.14.22.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 14:22:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 v4 05/15] accel/tcg: Drop CF_NO_GOTO_PTR from -d
 nochain
Date: Mon, 19 Jul 2021 11:22:29 -1000
Message-Id: <20210719212239.428740-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210719212239.428740-1-richard.henderson@linaro.org>
References: <20210719212239.428740-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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


