Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 974C33D0267
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 21:58:08 +0200 (CEST)
Received: from localhost ([::1]:49610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5vsV-0002Xy-JX
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 15:58:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5vpL-0007Af-Ue
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 15:54:53 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:44590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5vpK-00080i-I3
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 15:54:51 -0400
Received: by mail-pf1-x42f.google.com with SMTP id p36so404579pfw.11
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 12:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9B/gmUM+QUz3bpCH+D2gMCTlPL+YqDM4DQGjYBG4u2w=;
 b=Dg6wlJZXVd2Rij+nGrvg34DUpOEIffGb2a6MJAgNAjeITKaAa1QIqutNGV5IfrnA05
 yKb+ohVo8C29jOFE3dXa5BKRRoFyknH5O91PvCdsgBCpY4qK2gQOGGl6nHLRuQPgPQp9
 Ye7fzx+0jCnK0+nJ5hDMdrSrviI+CDujJh2kj+anA4l9Z2GwgFOf/n69UzhdWud46oLw
 gBUdshKO+nKvNsgDYbEei3Ljg/7dAAaXrG5hd6++J9fBiWgVm/NHdLK5hcCkEogonWp9
 9BWTMoAm4wyBTt1ALgXOIiCKIlKOKl8I0Ezx+/cxr/8hKS/sTGQAnpwg4xwUaLN4kiL5
 AhRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9B/gmUM+QUz3bpCH+D2gMCTlPL+YqDM4DQGjYBG4u2w=;
 b=huYlaF7pGaVTLia6dt59lBqYlzHJMTySksOdPhWf8ZMJQJ2Uw7zPGQWifr3o0A9/hs
 7KnMjKCHu4MdN4xUrAbsv/ntbT5VaAc3ggH4SYDDrBKLsSdn3njxVKatZhrq81ugmDx3
 n30fETS9gM/qoa34NmtVs2pTO/ke3bwDTmsWoilmjZ6lXNmmWiLsskTIF4TUFx1GYf2K
 S9hdQBlc84sBXRoNw+6E2edd6/Xpn+exY45vPHjQDF0GzmGrLzJMFd8L94UOJkCLB9hH
 HZAiVxXpBmBWwRRo9HykN6GbByRM4nmSVryKO2Kj5KZNKU1o5dmc3f3dT5rvphkZq3vH
 mEjg==
X-Gm-Message-State: AOAM531L1PSBy51bA5ePfjXdfZ1uQl+oTbc/UoWz03/4qZsnd8NxoTaa
 9RVNpxTmMzYHYCn7/b/DNXT3Nxxpp+OiyA==
X-Google-Smtp-Source: ABdhPJyrRFLA1DhiNKnIr8eQWtRH8F9fY4ryhsVKv6Y5g7MZBlqGEtuIrPAm6GlQPpMjDV+AQ4jF7g==
X-Received: by 2002:a63:e947:: with SMTP id q7mr13992826pgj.324.1626810889267; 
 Tue, 20 Jul 2021 12:54:49 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id j25sm15422179pfh.77.2021.07.20.12.54.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 12:54:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 v6 05/17] accel/tcg: Drop CF_NO_GOTO_PTR from -d
 nochain
Date: Tue, 20 Jul 2021 09:54:27 -1000
Message-Id: <20210720195439.626594-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720195439.626594-1-richard.henderson@linaro.org>
References: <20210720195439.626594-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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


