Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49515487B70
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 18:29:54 +0100 (CET)
Received: from localhost ([::1]:53492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5t3p-0006WM-C7
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 12:29:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5sw2-00055i-To
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:21:51 -0500
Received: from [2a00:1450:4864:20::330] (port=44639
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5sw1-0007so-GN
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:21:50 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 f189-20020a1c1fc6000000b00347ac5ccf6cso1248123wmf.3
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 09:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=WhfaxipphljaQnFFNp/teaFMbHkOrGbHBKmTsnpAR9A=;
 b=O5k6e+ZhI8o59lQNrXtW/0xGbzGn8TCz8UaW85rPlLKb6LJx7jdVu0BJCwGsGDpf4+
 EhJ+pcqFtKkitlrDpk+BAPWhmM/lC6rRVeLoI5DMTyEDcJaXhCtK8X/HOGgrAKM1zB2P
 XLdW3lX20n/qelMvfZMZhpc/Djf4kArrWhTqTh4rDSYJdlcuN0z1yVEVf1DWc053dUB/
 MtglYdRULQKI5qPhDd8M26JwJt3hSlo8QXYHfLvr+/98SWutn5lcLwzhTzBKqcAJOE6I
 niwn9qOejRAdLl2hJ3moQLZjZ1AvkhjV/n08EDDGavA2LQoMjewiHjqBhYSWNjp5ejOT
 wpkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WhfaxipphljaQnFFNp/teaFMbHkOrGbHBKmTsnpAR9A=;
 b=VulAei6qoTip/Kz0GjSr6+E/udxqysxsFeb6d+lQFhZL70rzSeLzswMiXk9o7uYebp
 BLLsoMFuZsByFrRySiY+1ppx6dQGiGPfcxro1H3Ul6J9y3CVg+AOyyHEp9y/oi6j573M
 b5Pj9PbYNkQHPHi7IYyWKv+VxwSfFlzQmXTjfUMCzD+5KOUhF/pjVkS0DTswdrrzLzho
 ker7nkdm3h2XO4X8UmrxFSJl0ViXB16t0yIefZzDkEqHWQvrh1TsCffFDWM9PFoJ5I/j
 mYx3FeqEv/MDaFFI2FVbpAuwqjC+GfPPkIxLN8iRHw4crrYD29RhZ5+1jw9+0rq9Lo67
 F20A==
X-Gm-Message-State: AOAM530Q6t63/tVra6f5N4hW4V6nKduHiZxUgH64Q27fRcXDf8UD1Fpf
 zUs1awqQRmm+8Pvh/8RHpW2tFdS3FzipDg==
X-Google-Smtp-Source: ABdhPJyaO78Nkek6Ppl46nExTeK/8qAmzQtZlo68dhypwN8Chg4wA2JmI2X6Zlp/c4Tp6zRga38Giw==
X-Received: by 2002:a1c:4b10:: with SMTP id y16mr11280698wma.185.1641576108290; 
 Fri, 07 Jan 2022 09:21:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id i6sm6060219wrf.79.2022.01.07.09.21.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 09:21:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/19] hw/intc/arm_gicv3_its: Don't return early in
 extract_table_params() loop
Date: Fri,  7 Jan 2022 17:21:29 +0000
Message-Id: <20220107172142.2651911-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107172142.2651911-1-peter.maydell@linaro.org>
References: <20220107172142.2651911-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In extract_table_params() we process each GITS_BASER<n> register.  If
the register's Valid bit is not set, this means there is no
in-guest-memory table and so we should not try to interpret the other
fields in the register.  This was incorrectly coded as a 'return'
rather than a 'break', so instead of looping round to process the
next GITS_BASER<n> we would stop entirely, treating any later tables
as being not valid also.

This has no real guest-visible effects because (since we don't have
GITS_TYPER.HCC != 0) the guest must in any case set up all the
GITS_BASER<n> to point to valid tables, so this only happens in an
odd misbehaving-guest corner case.

Fix the check to 'break', so that we leave the case statement and
loop back around to the next GITS_BASER<n>.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index f321f10189e..c97b9982ae1 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -795,7 +795,7 @@ static void extract_table_params(GICv3ITSState *s)
             s->dt.valid = FIELD_EX64(value, GITS_BASER, VALID);
 
             if (!s->dt.valid) {
-                return;
+                break;
             }
 
             s->dt.page_sz = page_sz;
@@ -826,7 +826,7 @@ static void extract_table_params(GICv3ITSState *s)
              * hence writes are discarded if ct.valid is 0
              */
             if (!s->ct.valid) {
-                return;
+                break;
             }
 
             s->ct.page_sz = page_sz;
-- 
2.25.1


