Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FEC42B342
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 05:17:44 +0200 (CEST)
Received: from localhost ([::1]:45512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maUlz-00077J-Ux
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 23:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUL2-0005LB-51
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:49:52 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:44016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUL0-000161-Iq
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:49:51 -0400
Received: by mail-pf1-x435.google.com with SMTP id 187so1140468pfc.10
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 19:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9im4CvhbPoyQ1RG+uvEuwMG0n0qsYjZQphEGRSBJSzY=;
 b=Nx5ci9PbicFL0qor4aKJNc3NX7N5nvKZVF2VScZyZ05bCR5MyiqVj7YZ67qAovzJ0q
 xgI4cT6fCc2k+qeaxQCNgXHM4Q48tUd5auycnsXhV82MvS2Aok39YhU4laY9TOoL3zpi
 glti19rh198uVxZ9/+s75dM4U8P/Vd12l1hX7bbu8UmbC51bTl78eX4PzUPJv21Hdr2A
 3kqyK/hYdIWImGy47vSLLVq4NhCRHLTK8RDvDGyIsEpFbQMjmtUXi4uYeiqKs2elljTt
 sPnb4Oq1dsX7fj51axD4qvv9ON/8wo6M7NelfnwTiNp1xLpLgxDxLdXTsxSvnq/ZbGG4
 my1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9im4CvhbPoyQ1RG+uvEuwMG0n0qsYjZQphEGRSBJSzY=;
 b=a+f4TbzLIenbc6ZIc19Igr1zdFvUapx3MJpEPrnUR/GBgc8M8GPyDH5m2oNgKMK3uf
 pmyyoZaA+u68qEHj3RYrTZPj7ZZ4Inu6d2Qu1GBz3bdPid6unTqNla7HfMUk4Up6AQhQ
 gRP/5mTBKeW+bHUUdyjZfuNxySvlYLSVMaQZhRXpOFrlFHMtXMmrE74XvGXxBKBClrZq
 I8TAOsLHMHQhcY58DiqH51zb3UmYOdqhPDX9hxusqiLR3c5Lkf27B97IPBzMLRffhKBc
 TlctceBhe7QLD0nR1TT31ijWpJsyqbDjxsAPXZxVIiy0d9us82dbqUdYsxcjIo32B2Hx
 auig==
X-Gm-Message-State: AOAM530UaDEaYH8JsdQM2n0m2zReQEz1DFWRy7ejkKM6zm30m3dNX9aW
 lEbHNXPV1hd3ljoqpK9B7BCkNnkpmI8=
X-Google-Smtp-Source: ABdhPJzQsW7AHFUNk/9hJ5dJ2Bzsm9FcqVpx/+EZjkMx7BptSUyxV9Rod+HZkD4/mIAwDq6qLbbe8g==
X-Received: by 2002:a62:3287:0:b0:439:bfec:8374 with SMTP id
 y129-20020a623287000000b00439bfec8374mr34885636pfy.15.1634093389017; 
 Tue, 12 Oct 2021 19:49:49 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y20sm12579610pfp.68.2021.10.12.19.49.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 19:49:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 40/48] linux-user/signal: Handle BUS_ADRALN in
 host_signal_handler
Date: Tue, 12 Oct 2021 19:45:59 -0700
Message-Id: <20211013024607.731881-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013024607.731881-1-richard.henderson@linaro.org>
References: <20211013024607.731881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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


