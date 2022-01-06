Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E20486D7A
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 00:01:45 +0100 (CET)
Received: from localhost ([::1]:59168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5blP-0002Ec-W5
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 18:01:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5bhj-00055X-9h
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 17:57:55 -0500
Received: from [2607:f8b0:4864:20::42f] (port=43951
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5bhX-0000HR-5n
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 17:57:44 -0500
Received: by mail-pf1-x42f.google.com with SMTP id 196so3677872pfw.10
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 14:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RKNFvbhviu9dunAjijjleYy70Vtx5VjKsvJ12r8S+Og=;
 b=ilcGtGPngjgZy3FnhQE9tp8+imvBr9PjsjOPuFbagSsLqo+AU8J/eykxlNo5+N3Vpm
 dEtjaM5CMRwwP3vM5ZtoB5e5cvvDFUUfGaLB+TTa/c5sz+/g1rKsG1dOUUcubbXpiex6
 QDhFIbFqs6EBXDhvcbTeHblA8QcPFv1DpI/teBdujk1BndnrX4tnKXYnsCWcfJXtwRAN
 28UhBe4bVc5lDcPaybzmiM4/pWYb8+UycrR7QPuShTSnfj4mmEPNzSNA9FCi3sYfa9Nj
 Jyy5p/kMcEUf5+cNx+lb5dwZOLOI1snUFCegAEJa7S78J33NoFMt/bwtFdK1NtIL+ogR
 G5lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RKNFvbhviu9dunAjijjleYy70Vtx5VjKsvJ12r8S+Og=;
 b=F3qlTvZ6p1IPW8qxNaILZd5RbBl3IPZAuzJg2DB20fZ4WU0F4URTqe/YxtyT3Q+HYX
 2HCmUG8znuJ1EvvMbQigOVfGiz9USnOG4LxtQH3Gh8EiOiNhIy/Xq9JJt1xgkYqbC4bJ
 vbyULBHKXhkzyaVlL/5UseHaTNiBaSNmrSKHuLBnvLJztmiFKoYrj3JEDBJpUvVrksPu
 Qg6JiHCansCH0UPtSwqlP09SSYLm262XPlCssoYsCR7itAwAMHNjz4w10TQEBURcHJkj
 //nRymX85Mky4vA7RrPVN7MHw3B0ASddfooHIOFUdkT7dm7tR9RwRUesmmqLh0okhpfg
 k7RA==
X-Gm-Message-State: AOAM530IaFBHOa0C3YrD9vqwKt9UNeq579cSiuaagJEVWIdmLUjYcctM
 D2nVWYpnbKqPSUIe5zwwpx9ZagX1IE2a/g==
X-Google-Smtp-Source: ABdhPJyUY9XPAI4K4W5m2x6V3+sIk+dHIpQX2KJXSFAJa8XDIcCNR0JhyKSBBMB+nrPzYihpcC5gBg==
X-Received: by 2002:aa7:91c2:0:b0:4bc:6c97:401 with SMTP id
 z2-20020aa791c2000000b004bc6c970401mr30914277pfa.17.1641509861899; 
 Thu, 06 Jan 2022 14:57:41 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id rj6sm5774687pjb.50.2022.01.06.14.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 14:57:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] linux-user: Implement capability prctls
Date: Thu,  6 Jan 2022 14:57:38 -0800
Message-Id: <20220106225738.103012-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220106225738.103012-1-richard.henderson@linaro.org>
References: <20220106225738.103012-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is PR_CAPBSET_READ, PR_CAPBSET_DROP and the "legacy"
PR_CAP_AMBIENT PR_GET_SECUREBITS, PR_SET_SECUREBITS.

All of these arguments are integer values only, and do not
require mapping of values between host and guest.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 8495f5e08e..4711afaf8c 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6504,10 +6504,15 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
     case PR_SET_UNALIGN:
         return do_prctl_set_unalign(env, arg2);
 
+    case PR_CAP_AMBIENT:
+    case PR_CAPBSET_READ:
+    case PR_CAPBSET_DROP:
     case PR_GET_DUMPABLE:
     case PR_SET_DUMPABLE:
     case PR_GET_KEEPCAPS:
     case PR_SET_KEEPCAPS:
+    case PR_GET_SECUREBITS:
+    case PR_SET_SECUREBITS:
     case PR_GET_TIMING:
     case PR_SET_TIMING:
     case PR_GET_TIMERSLACK:
-- 
2.25.1


