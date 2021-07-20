Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 867EF3CF140
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 03:22:10 +0200 (CEST)
Received: from localhost ([::1]:38514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5eSX-0006Fk-JR
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 21:22:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5eOn-0006eN-My
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 21:18:18 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:45718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5eOm-0003RT-AQ
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 21:18:17 -0400
Received: by mail-pf1-x435.google.com with SMTP id q10so18213761pfj.12
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 18:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+p6ro6D5KFq3icWk04aTft7NAAiKyhL4s7d6P84Hy6s=;
 b=IBBYKQktOIqbOtC6pKwZ93dSuTM4bFrE5U1rJ7h23gCF50tWbPLmm1GN13v5K22aCQ
 +/IbJ26BzcEol3LdPFx4yP2Tp46l3z5Fosus/5FABgiRRaXFCVvQHpAGKXvcj37VoOKz
 dc2Ard4UYgbWylhqXaIyZmhl7QjKoj52Xmb8JogiTHjVAP/S2DEyDjdGgn5LEdw1ufRP
 bn9eOq92UzzUSM4D41cVPgxq7DWIZedeRlgDdAD+h4rM24wUwi7RDVAPIlI6F4ks7Lav
 mr2+PW+YkBOdjv6F49L7fGfLOEHuf/WM/vZ+OGAHAL1doh+xo55/LOvjnTOcgrB60293
 Ut9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+p6ro6D5KFq3icWk04aTft7NAAiKyhL4s7d6P84Hy6s=;
 b=BWMn4gBqqnSmJpYAburjgp8p7tr8IorrpTV90nLe7iGNOTmixd9fuLeo1Q3xsjogyR
 fn0WXmgu0VvL56nXQUngBnmHvEi4hhD3lgbiHn89OoRctnfOnbsVcsM9TOYuqHWqQsXG
 vXZtK6tv5zTBsceev2M1pWc5Sf80TLLLBbJkEYFdGKu75cO7jCltKRpjvsilZds5Ee46
 ATzi/6zEfKIiSQUiAg5V/AT9AZvkxWM8nVNL9o65zjZplnqjOF/kAxdqPZABQwqCf4y5
 xHHQpmOX3IJfOpFgzKUABDPMsHqTRVY/4/oAl1fFEHoptd/ImJIGiC6Cv0LMKvF9ujln
 p8bw==
X-Gm-Message-State: AOAM533Gz2TJPAahGHD8J9mSUgQDXJgmYNptTau5advhQPXFWVklgWiv
 TYZu5i0kQ100NCfkV7riZ8H4AhpW/6h/Ew==
X-Google-Smtp-Source: ABdhPJwGjdlLLsP04qyvimXwfzkLWrzsg25LmBlthpxK5EP/dWWUbbbDyomgaYZ6Fl44kIPAihUCoQ==
X-Received: by 2002:aa7:81d8:0:b029:308:1d33:a5fa with SMTP id
 c24-20020aa781d80000b02903081d33a5famr28108509pfn.55.1626743895043; 
 Mon, 19 Jul 2021 18:18:15 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id e4sm25378054pgi.94.2021.07.19.18.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 18:18:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 v5 08/15] hw/core: Introduce
 TCGCPUOps.debug_check_breakpoint
Date: Mon, 19 Jul 2021 15:17:53 -1000
Message-Id: <20210720011800.483966-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720011800.483966-1-richard.henderson@linaro.org>
References: <20210720011800.483966-1-richard.henderson@linaro.org>
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

New hook to return true when an architectural breakpoint is
to be recognized and false when it should be suppressed.

First use must wait until other pieces are in place.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/tcg-cpu-ops.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index 72d791438c..eab27d0c03 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -88,6 +88,12 @@ struct TCGCPUOps {
      */
     bool (*debug_check_watchpoint)(CPUState *cpu, CPUWatchpoint *wp);
 
+    /**
+     * @debug_check_breakpoint: return true if the architectural
+     * breakpoint whose PC has matched should really fire.
+     */
+    bool (*debug_check_breakpoint)(CPUState *cpu);
+
     /**
      * @io_recompile_replay_branch: Callback for cpu_io_recompile.
      *
-- 
2.25.1


