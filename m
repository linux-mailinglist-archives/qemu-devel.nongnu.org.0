Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 657623D179D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 22:11:03 +0200 (CEST)
Received: from localhost ([::1]:50762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6IYY-00061H-ET
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 16:11:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6IOH-0002xl-Qz
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:00:29 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:53979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6IOC-0005o5-If
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:00:23 -0400
Received: by mail-pj1-x1035.google.com with SMTP id p9so2551378pjl.3
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 13:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AQ5Q3JNtN/mbypwUzDSRUQzn9dP3F0xe81U/358f3Jc=;
 b=ZieUyDGcXrZ/ZD+pERJLO5zrBPrviZeSrak3MiFPWIlqHLHFlBBjHMtARtGBvIXViF
 INwA5NUo+zllvsjdBEc7uQNYwUcLDLIwugdNz9VfMSpyVE2Z1dPggURlo5GTkL+jP7iu
 vNmeQYm8fud1QX4VlVTqecw4a/6beMTuj9iftFzpP5MCKsfV9zztJSVQr5QKlU55YUtM
 Vn9RanVWNNTafEdmMGk3A7ElDZCpHuQ/WB8wYdg6uqvJfj5bINWpbGv3Ko8woWxmMV9t
 D8dh6k2VNcwdt8ClRzUHaym3RFlQGldn83kPxsSzeM1f6KVGCxQPc56EfDsA9bw+KBxS
 NECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AQ5Q3JNtN/mbypwUzDSRUQzn9dP3F0xe81U/358f3Jc=;
 b=c03VOo4IjcprYBdgESBlYv1krcFrEQGqQgF2zwEe6SRe5lNPbaPtTmjTeq7p9uaRRq
 nFZfS7J2w/qyDPufO2UCOWXMunzlRFHTABPAvdGSM2ymsfl3GH426IGK2D10QvZX3v8a
 iMoB86GcOBUadw0FUDDORuYXSt4bkT0O7ZhAnGh+SKasDBYqSl9j+gwYS4PKy39n6kRu
 0rDf37zm0guT3UoMXB2MP7atjgsQvO0knctfv5k2TNnh6bo/nz7NkSFmMv98nvllgU3y
 0HsO+YKAZuu/eQGyKBCjymv6Un7Al56PPKdFLqbFsaCYTv7G6+Krpkr0rxAYXDva4D+H
 Z+sg==
X-Gm-Message-State: AOAM533GeAP/nlOyAEV+bEAXTLvscOGbZG5B3CsSjT02OmzfYeu7owHq
 OZR57hIKwFzUypeGQ7ABJSCnErpFSfmRQQ==
X-Google-Smtp-Source: ABdhPJynmWfmLWZTy2Vqs2PnxKcQSE0s3hGNQydV0tvwkSrooYS2JbygL1yDQCSlGspHJ+wIKobi7g==
X-Received: by 2002:a63:fe51:: with SMTP id x17mr37341434pgj.58.1626897617759; 
 Wed, 21 Jul 2021 13:00:17 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id w3sm706028pjq.12.2021.07.21.13.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 13:00:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/27] accel/tcg: Drop CF_NO_GOTO_PTR from -d nochain
Date: Wed, 21 Jul 2021 09:59:42 -1000
Message-Id: <20210721195954.879535-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721195954.879535-1-richard.henderson@linaro.org>
References: <20210721195954.879535-1-richard.henderson@linaro.org>
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
Cc: peter.maydell@linaro.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The purpose of suppressing goto_ptr from -d nochain had been
to return to the main loop so that -d cpu would be recognized.
But we now include -d cpu logging in helper_lookup_tb_ptr so
there is no need to exclude goto_ptr.

Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
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


