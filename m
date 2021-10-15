Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BB942E818
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:52:04 +0200 (CEST)
Received: from localhost ([::1]:39592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbFCN-0002XE-4L
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEcJ-00070N-Nj
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:49 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:34744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEcH-0002yj-6s
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:47 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 q2-20020a17090a2e0200b001a0fd4efd49so2155715pjd.1
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9im4CvhbPoyQ1RG+uvEuwMG0n0qsYjZQphEGRSBJSzY=;
 b=EThQgfXVM3+gTYBP9riZDdoy7+261/jK33Yl47MmSU3iZ5wuNAQhHQ1LyE8ousV8iH
 1AjrG+9rCqBtcryjB1w0B3O6wHWejaW2rlvS0pKjP8jr/WtTvMkugxPr3sADthjBjCls
 B4ylcrg9BnnlXZyZyvOQ4ZuWnlsZD866jOv1Y0T4cIjsvQqpTfDpz1WlDaN6GO1QKQTl
 uG+4Xh+32n+YeUZzBDfzEruvVQrqnrnCVEgay2gso4Udk86qLTQCkQj3yvbx1W5MoLbX
 +3ru5fDt7DSamH5Dv/fbh3xeIkL1nGYBROkdt0DdZULC1rI4TjQ67w5USrW/awd7kEHA
 iTsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9im4CvhbPoyQ1RG+uvEuwMG0n0qsYjZQphEGRSBJSzY=;
 b=JTPMjfef1fVec1BRQ+Ts+J3knvehYXY6rgpYnY1V6n47PgLlKmV5gh7ArkyaUH+E5V
 jqUnXv643pNih2ywG8YNmfRcovP5DcLUaPAAtU9S8dOREzLcSLPj4jZrUY4hnEqPVLzK
 87XfDUwpbu185/3Yu+u5N66ERSYYtffZpLBsQ6b+k9zL9qWqH0Jn0fy7LMIRJdO5iayu
 be78/E/FhxBhHbQquoT4jj3egUnXAe5ryc2E1YA26r/yLTNTzp2RLiIg6S0arVZFyuVV
 AwcQH9uiu1N4b7lEhnpSEccaD/oNM3tzK1rHluUpKQnPe/jb2eqJbosWA0X4V+IrOa/2
 lLUQ==
X-Gm-Message-State: AOAM531lmD+tS54dJsEk7mmuNbydDx1TuIZyfF6YietG7oNCIMUXM/FX
 peWzqG7Ns3LiOkf43VTjCpbcPM1DWTrnog==
X-Google-Smtp-Source: ABdhPJxsxOFbWni+7leUobr/WdP9cvIIZATWUyzaX2hApjBgtAqbVRRhN/L5AJC2xRFa2ep7PzHHoA==
X-Received: by 2002:a17:90a:1507:: with SMTP id
 l7mr10750149pja.141.1634271282818; 
 Thu, 14 Oct 2021 21:14:42 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q8sm10236885pja.52.2021.10.14.21.14.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:14:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 61/67] linux-user: Handle BUS_ADRALN in host_signal_handler
Date: Thu, 14 Oct 2021 21:10:47 -0700
Message-Id: <20211015041053.2769193-62-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Handle BUS_ADRALN via cpu_loop_exit_sigbus, but allow other SIGBUS
si_codes to continue into the host-to-guest signal coversion code.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/signal.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index df2c8678d0..81c45bfce9 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -860,6 +860,9 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
             cpu_loop_exit_sigsegv(cpu, guest_addr, access_type, maperr, pc);
         } else {
             sigprocmask(SIG_SETMASK, &uc->uc_sigmask, NULL);
+            if (info->si_code == BUS_ADRALN) {
+                cpu_loop_exit_sigbus(cpu, guest_addr, access_type, pc);
+            }
         }
 
         sync_sig = true;
-- 
2.25.1


