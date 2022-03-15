Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 800314D9794
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 10:24:41 +0100 (CET)
Received: from localhost ([::1]:49772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU3Q0-0003y6-IA
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 05:24:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nU2lt-0008R3-9F
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 04:43:13 -0400
Received: from [2607:f8b0:4864:20::436] (port=42912
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nU2lr-00052X-M0
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 04:43:12 -0400
Received: by mail-pf1-x436.google.com with SMTP id g19so18515948pfc.9
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 01:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=okcfQUsJbvGgBubMBl231SWHxFIIoHPnrQLrMT7DxsE=;
 b=lUPJpge9TcgreAVQ6BHdy1CA6kCDx0PFwnD+tVU7/3pNBwexqEF+4RT2kt+1zHOG4X
 X743szgHzLhogNqoecjuV6OOrTsNVa4wu1GVn8c0GVD9aHtJpKAJiyNfb9ZssS9lwFa4
 CgfvMLkGX9dZGjEeFuKGDYKP9/4Eyh/0McO018SWXL36GQFWM+8EU9CAi3+jGgzQxhAu
 c1ifJI3DDD39yXLgnRT7I3dx9S/z6Spg1qANro+OJG2lggSKyKDgB9jUO1gB6JTq1cR3
 yoZiZUIzTp59ZcbHWPXDL/r7xc9+nrrLXjyQtUdCVMOAXOMDCHpGyoEMkJ4PoGWQsF1D
 a1nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=okcfQUsJbvGgBubMBl231SWHxFIIoHPnrQLrMT7DxsE=;
 b=Q7cHlxME7eofoUsgaWUNS/+TIIUXOwfufhiHfPrzR4ihTZcr/cvdl00/oTdcgCCEuq
 87Ospv0QpXAYwgMNTbGTsRddrwV9Wcx/D97rGrJCzHIZUx2tVCjI7Szs6UHkaKze7qw6
 dFhSJX/Gk1KYdKt9GiAFNQDHlHA+Q1R/JorwFKovlSrPI91OCf0dA8a5rS1UmTP7ACFH
 59mS4BPLW/O61lPWNCBky4RXLIf5FeTnja/4TQyGl5bWnr45ZoSrZ0dk3G67E5LgjurU
 MfhIQFSGiAWX09PJSi51Djtpo3A5Vh4R6KRaNdoNSbKdzFOqpRnqxJk1h5tfbR+HVCIF
 nuKA==
X-Gm-Message-State: AOAM530yvg59YGPIFtDPECQ/bybrzRSmvYo6yHm1mb0icK9EPL0l/6b0
 wLBJgk+Cld9rlSYDeE24r+/PhFhLfvFlfA==
X-Google-Smtp-Source: ABdhPJyMGnD9q3wW6zhp8nnBpcuyr59Xf5owKUHqhetbbuLpxG3lTyLzUuwo4sGA1EjUPQ3OBN58tQ==
X-Received: by 2002:a62:7981:0:b0:4f7:9e4:96e4 with SMTP id
 u123-20020a627981000000b004f709e496e4mr27966954pfc.4.1647333790290; 
 Tue, 15 Mar 2022 01:43:10 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 ob13-20020a17090b390d00b001becfd7c6f3sm2233762pjb.27.2022.03.15.01.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 01:43:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] linux-user/alpha: Fix sigsuspend for big-endian hosts
Date: Tue, 15 Mar 2022 01:43:04 -0700
Message-Id: <20220315084308.433109-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220315084308.433109-1-richard.henderson@linaro.org>
References: <20220315084308.433109-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On alpha, the sigset argument for sigsuspend is in a register.
When we drop that into memory that happens in host-endianness,
but target_to_host_old_sigset will treat it as target-endianness.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index b9b18a7eaf..ecd00382a8 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -9559,7 +9559,8 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         {
             TaskState *ts = cpu->opaque;
 #if defined(TARGET_ALPHA)
-            abi_ulong mask = arg1;
+            /* target_to_host_old_sigset will bswap back */
+            abi_ulong mask = tswapal(arg1);
             target_to_host_old_sigset(&ts->sigsuspend_mask, &mask);
 #else
             if (!(p = lock_user(VERIFY_READ, arg1, sizeof(target_sigset_t), 1)))
-- 
2.25.1


