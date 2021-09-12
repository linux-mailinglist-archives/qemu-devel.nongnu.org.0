Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B88407E60
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 18:04:09 +0200 (CEST)
Received: from localhost ([::1]:51544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPRxg-0002J3-AJ
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 12:04:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPRs1-0002MR-Kx
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 11:58:17 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:42931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPRrz-0003vQ-4q
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 11:58:17 -0400
Received: by mail-pl1-x635.google.com with SMTP id n4so4249549plh.9
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 08:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4qLOJ7aAC4BizQd/i02xX0hEQglVCR9hQiC8rfWR7Us=;
 b=J7B4eDwfWuTdlCqBUcS077j1KftDXaNKG2WBXRsA6Sgc/ikWItxTG5F00+4lOjYM48
 q0DU1ytuRlWDrnryc25ccjcJzVoSAbozidI5MZj981xAdbAfIkgPClF7WQvEQCo3BJs/
 bje0Wdu512RVsx6j33IMsK0VH1VzVaPZ5sBQnC5IJ98QiRimcCUqs/tCxZEceMlLdXM4
 lg0GoIB4aB7UbPgqwtbJCMrUNH+Nn6FIygpIxOcS5sUfOW0Uk5pP4jXU1xMQFpESgpXL
 HWIQMjySe0npcVgDWn3aIvhDmiCdujqFoHMPqcKvQIFKXCLLwlkca/xrgbGjYAlgxEPZ
 G+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4qLOJ7aAC4BizQd/i02xX0hEQglVCR9hQiC8rfWR7Us=;
 b=012UX7vGYWYuwUTQbPmUPyERSfCa4r/yFINXC0hnT98IJAWU2AAAnOx7cBN7bkGMZW
 jKUNJ7N3lbAPoenz7YWJzjan1sNYvegtNaNpufANGlPJM4vu+uK++3s9bstv4Kh/BeW+
 AASXs4g0tMaAWArx7S6EOsLSwpbs4OLkZNNX3sCOC6dgnh1CCmp4oaj5V7UPBN6Axreg
 kC2qFU3nyZB3NWocDquSUFH0uMFy2jQH+3l2avZxoFPvpae+EwK6Okq4li2yGoMHpW/5
 U/2NdjS3oTJJmUsFG6C8Zrlx3+2OUviGYMMuoSnviPCvMgNs96sPnA07Ndf30mYJOp3i
 Mp1g==
X-Gm-Message-State: AOAM5326DID52jG1Z/3zKks94NzFMFpuzBbcqrBqAVWTlbXxMJTq8Dme
 mkj71pvdo5ZP85kiZuEU0KSMX4ObrIH2Lg==
X-Google-Smtp-Source: ABdhPJxDm8ZprADwzxgUDE3nzSFbd+QaL5Tow1fYNdjcJsvKby1rXzj0+zYX1PhevF97qZLQAPdqpw==
X-Received: by 2002:a17:90b:4904:: with SMTP id
 kr4mr8417715pjb.50.1631462293808; 
 Sun, 12 Sep 2021 08:58:13 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id v13sm4439415pfm.16.2021.09.12.08.58.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 08:58:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 4/9] accel/tcg: remove redundant TCG_KICK_PERIOD define
Date: Sun, 12 Sep 2021 08:58:04 -0700
Message-Id: <20210912155809.196236-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210912155809.196236-1-richard.henderson@linaro.org>
References: <20210912155809.196236-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: peter.maydell@linaro.org, Luc Michel <lmichel@kalray.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Luc Michel <lmichel@kalray.eu>

The TCG_KICK_PERIOD macro is already defined in tcg-accel-ops-rr.h.
Remove it from tcg-accel-ops-rr.c.

Signed-off-by: Luc Michel <lmichel@kalray.eu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210811141229.12470-1-lmichel@kalray.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tcg-accel-ops-rr.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
index c02c061ecb..a5fd26190e 100644
--- a/accel/tcg/tcg-accel-ops-rr.c
+++ b/accel/tcg/tcg-accel-ops-rr.c
@@ -60,8 +60,6 @@ void rr_kick_vcpu_thread(CPUState *unused)
 static QEMUTimer *rr_kick_vcpu_timer;
 static CPUState *rr_current_cpu;
 
-#define TCG_KICK_PERIOD (NANOSECONDS_PER_SECOND / 10)
-
 static inline int64_t rr_next_kick_time(void)
 {
     return qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + TCG_KICK_PERIOD;
-- 
2.25.1


