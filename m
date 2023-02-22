Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFAF69EC9D
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 03:01:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUeQw-00033M-1f; Tue, 21 Feb 2023 21:00:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUeQq-00032Q-PH
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:00:32 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUeQo-00013V-VC
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:00:32 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 nw10-20020a17090b254a00b00233d7314c1cso7138786pjb.5
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 18:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4zhGePcD91yQ6ch+7pxzLZ4Aayz4MXPEoGj6QOyVgUM=;
 b=H8Gn3iyK0gYpvOUozYDdkZmGBTmTtz3CBrfDh/43lu45TUwm6couNT62H5vOUvwDy0
 BZj1eID1p+lOv1kx4VqCV7CKtaVMc13RdpMDYsrNo6MliXTqhO+tJWMAbriH+yKRtwIZ
 LFzZGdUm+In1T/PL3WbSHr+GBc81n3AhOHkzPGbWbtnKJUIKVo6r2LKXBOcMNsc9+55e
 VgQhquRoJ9eA/zCGimNoHbZ3WUsYbXZVST3oJoyYLXteVAPE+v4gTklxKo20loKzf25i
 IuNMhDD1mA4OusJ2ysZ5fMVwc2gH/4I7AZGralxV4zW0t2eiLq2Bd7eupD5qqjCgWZbU
 EGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4zhGePcD91yQ6ch+7pxzLZ4Aayz4MXPEoGj6QOyVgUM=;
 b=2Sp8jtsmLU2rY/mSEq4rYMn2ko7sNZtRXUlESbnRjgp31cIK8KW2jh0MzABvLuXfn2
 P/LWlVVnvDg7DkQDa4Kcorl1e/Q4Ff/1xukywsqf3o+F9YuLcmCJdO/wsK3u7HvTup8P
 xYw0L3s3oTHKTPPauVBkRGzcpG2e0g34C5S2eI2q8aJK7laJjs0SGEN9Ysua/sv/wYN/
 klnKVu80YlGpmSd6mOVmUizamoq8kbi/ejJVB03lE1doYHF4TsJyhuk6lHk4r/+Xkz99
 E6HMHdxsFWzTx3Xger3tWZanH5DrQZVAfB4+s2RTN6xBdi5k/74tjJ3oJj9MHS1nXleB
 qx6A==
X-Gm-Message-State: AO0yUKWwsIdhfq0WXsuFjzZmvHdacZ7Q8wW75MhQ8OAaB/d/fEuRV3f2
 KG3BomUKXFpx5/J7ZFNqccUVvhSjhL2NuPChM9w=
X-Google-Smtp-Source: AK7set85d49DCbMlSoAyneE3XdN+qwBRne67f1AjVovYpvBT5WC8aLeHdObgRazawEi7Jk7pU8EH9g==
X-Received: by 2002:a05:6a20:a10e:b0:be:ed2a:b2dd with SMTP id
 q14-20020a056a20a10e00b000beed2ab2ddmr6936600pzk.6.1677031229404; 
 Tue, 21 Feb 2023 18:00:29 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170902c10200b00189743ed3b6sm91468pli.64.2023.02.21.18.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 18:00:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL v2 2/8] linux-user/sparc: Raise SIGILL for all unhandled
 software traps
Date: Tue, 21 Feb 2023 16:00:17 -1000
Message-Id: <20230222020023.904232-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222020023.904232-1-richard.henderson@linaro.org>
References: <20230222020023.904232-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The linux kernel's trap tables vector all unassigned trap
numbers to BAD_TRAP, which then raises SIGILL.

Tested-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reported-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/cpu_loop.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index 434c90a55f..c120c42278 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -248,6 +248,14 @@ void cpu_loop (CPUSPARCState *env)
             cpu_exec_step_atomic(cs);
             break;
         default:
+            /*
+             * Most software trap numbers vector to BAD_TRAP.
+             * Handle anything not explicitly matched above.
+             */
+            if (trapnr >= TT_TRAP && trapnr <= TT_TRAP + 0x7f) {
+                force_sig_fault(TARGET_SIGILL, ILL_ILLTRP, env->pc);
+                break;
+            }
             fprintf(stderr, "Unhandled trap: 0x%x\n", trapnr);
             cpu_dump_state(cs, stderr, 0);
             exit(EXIT_FAILURE);
-- 
2.34.1


