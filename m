Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 079C43D0270
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 22:00:57 +0200 (CEST)
Received: from localhost ([::1]:56734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5vvE-0007Vx-0z
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 16:00:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5vpK-00079T-8w
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 15:54:51 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:37691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5vpH-0007zA-Ru
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 15:54:50 -0400
Received: by mail-pl1-x631.google.com with SMTP id y3so7567761plp.4
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 12:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5munM6eZd/uk4n4hD7SHb+ixOouAZHeY9ReXlmZhFgI=;
 b=gDX6ehLRIo3QZFClUPXppf32wbMUb6HT7Mf0RaYLAgrHkUq/p60ghOWZ2WwY3yUIt+
 DO0iBd3ipsxne5JUMpfZORaW0pKKmXVNjJWUFOmrqqKlPkwby7fzTb7xl9F21q51vCQq
 GL2SBw4TQbbq0JrjVLZRMiGH/qfi84iytCyRcMWPegLOLqwQ7l46hMLkOLqrSs6Q1Aa5
 Bqma2g3nW7fERtYjtz3NKpu4Kcl4vwJBdDDZLWGm48iq+GYYqxkS/x/s/pn7CrygkdNj
 eahS0cOIQ0PBAXGEq4/lAPZrY0UiGyLcw42jn0JjHsYg/43dAVDYu1/SGwEsd0JqjJcP
 uvpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5munM6eZd/uk4n4hD7SHb+ixOouAZHeY9ReXlmZhFgI=;
 b=T1T+NJ5WRkDg/PNy9O6IAG4BS5lj4rfV9ZqDUcm2cMsz1xWSG64aDCAshI1R0cdkyQ
 3EDvRyBli0tFZ7Wm/wa9Ax87QTzgZ2FNCRcT7jmmNper4TGs5ECfAQR+C5LyIaHc1p4o
 bubISeInJb9m1AkUah5sjhjzTQSiEDNizv3UEPVlz2TRhFNWdz/U9rhcd7CqKmiJGAVl
 EdfZeRbEmNzuUuavYcE0x6a7hYS4gelOokSnHRx1Zsng/LY5iADz4nVfEUO/CHsnCQU5
 2ZihIqiACG/5hiIQYLo0svxzDQ57BD3aPK7xC7arvZdLUkxEQ98jFy9NHBmoLtI+wA7o
 bt9A==
X-Gm-Message-State: AOAM532JUIO3BDAwLcGIuzAlLBOpY0ef11Z1hgVCYcy1vWInJ1tAPGxS
 84ytdLnmqDC7+G8TLqhO9HVtmCuQxvQiGg==
X-Google-Smtp-Source: ABdhPJwlNNZ/eNISC4ms7tMU4vhsbPRtVxA4IAO8YkSehlXsv8kZD5/NqsiyZ6x0L1xlY/JoilJZbg==
X-Received: by 2002:a17:902:ecce:b029:12b:374:c15f with SMTP id
 a14-20020a170902ecceb029012b0374c15fmr24812552plh.22.1626810886600; 
 Tue, 20 Jul 2021 12:54:46 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id j25sm15422179pfh.77.2021.07.20.12.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 12:54:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 v6 03/17] target/alpha: Drop goto_tb path in
 gen_call_pal
Date: Tue, 20 Jul 2021 09:54:25 -1000
Message-Id: <20210720195439.626594-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720195439.626594-1-richard.henderson@linaro.org>
References: <20210720195439.626594-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

We are certain of a page crossing here, entering the
PALcode image, so the call to use_goto_tb that should
have been here will never succeed.

We are shortly going to add an assert to tcg_gen_goto_tb
that would trigger for this case.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/translate.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index 103c6326a2..949ba6ffde 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -1207,19 +1207,8 @@ static DisasJumpType gen_call_pal(DisasContext *ctx, int palcode)
                   ? 0x2000 + (palcode - 0x80) * 64
                   : 0x1000 + palcode * 64);
 
-        /* Since the destination is running in PALmode, we don't really
-           need the page permissions check.  We'll see the existence of
-           the page when we create the TB, and we'll flush all TBs if
-           we change the PAL base register.  */
-        if (!ctx->base.singlestep_enabled) {
-            tcg_gen_goto_tb(0);
-            tcg_gen_movi_i64(cpu_pc, entry);
-            tcg_gen_exit_tb(ctx->base.tb, 0);
-            return DISAS_NORETURN;
-        } else {
-            tcg_gen_movi_i64(cpu_pc, entry);
-            return DISAS_PC_UPDATED;
-        }
+        tcg_gen_movi_i64(cpu_pc, entry);
+        return DISAS_PC_UPDATED;
     }
 #endif
 }
-- 
2.25.1


