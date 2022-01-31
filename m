Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C48824A5062
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 21:43:36 +0100 (CET)
Received: from localhost ([::1]:35952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEdWR-0000Hs-E2
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 15:43:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnb-0004ll-Hu
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:15 -0500
Received: from [2607:f8b0:4864:20::131] (port=39530
 helo=mail-il1-x131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnD-0002c3-3h
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:06 -0500
Received: by mail-il1-x131.google.com with SMTP id z7so12400811ilb.6
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 11:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6fk8Rm7tbwnMJwW6ytgiwa7PMfU+rVxxXH2pSHcB2Zs=;
 b=6DO3aUHBFwRcvQXdDht3Ks10VZ5Oi1OzItTtVonDCJm7duSqHovv5jLOoXV+kYtSgG
 EAHd9q0cIZYpQuXALjSphnmvV/Um4PxfgoZMsxS0Z257tbFJk0bPxuR3gLBkeLNKfpi7
 kv3xtvxhasAD/eGi8Vh5720JxekRKN6N6yfA4XJ+WxyqG/qnI5Vx8A+fC+BHSh0tKWWq
 JqLC0GLQ15adKndAFaxyL0L8EXXWGaxB965B6KvJvoKO7JkhwOCfAPEgSXy+XCpSiXLj
 ipkXwnZg6YyWmU7TkKLrH7uHR2gVmXI2sFs4FlzglyZvrYJP7ZLtOGX/MJVYsusHFwrw
 fdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6fk8Rm7tbwnMJwW6ytgiwa7PMfU+rVxxXH2pSHcB2Zs=;
 b=3fiqV0F24Dw9AFQu3O2CcvD7FKzIxHZfNROB0j5Byojjxho24d07NlC6ONojKuydi0
 UEy8Ygqs2BKb+yJ4yklUmctNeYcL4tKroAXF3T6bBaBDfQV4KfZxzoD/PxUARRjUP5sT
 VqYgw2FTmKnvi39yoTXmkNjdlNmXHBUnvEw4vnNttCfZs+/wgINPHL65Ojb5zxqJ74/N
 Vdo6qn3KwIbouCZyoL+3oi0sPVJ2go7uBQo1lmMPDZ0uiOuK5dk+dBlQLbzv/96jsdL1
 HcDSFj+r02V+R07SdDgX/TjYbislma/0ejsaBOCeF3oqAAgLl9T/+ZHJ8GxzDc9UsiZ2
 294A==
X-Gm-Message-State: AOAM533Yh/sIKT8FbTj3V+qBrB/7wKFeNhaXgM6oAms8cuyk8Ek5GD/4
 UCRq0fGJS261blyNNUPLETe4+4fKNJwHyw==
X-Google-Smtp-Source: ABdhPJxP8/7HM6nTabyvEwwLaeyYAl078joBNk6OxjAJJQtm9jtMebKrTNPDjjdDBvSktf+8Ixu1BQ==
X-Received: by 2002:a92:d84c:: with SMTP id h12mr4698629ilq.168.1643658997179; 
 Mon, 31 Jan 2022 11:56:37 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j2sm1972989ilu.82.2022.01.31.11.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 11:56:36 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/40] bsd-user/arm/target_arch_cpu.h: Move EXCP_ATOMIC to
 match linux-user
Date: Mon, 31 Jan 2022 12:56:03 -0700
Message-Id: <20220131195636.31991-8-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220131195636.31991-1-imp@bsdimp.com>
References: <20220131195636.31991-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::131
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::131;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x131.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the EXCP_ATOMIC case to match linux-user/arm/cpu_loop.c:cpu_loop
ordering.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_cpu.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index c675419c30a..c526fc73502 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -180,12 +180,12 @@ static inline void target_cpu_loop(CPUARMState *env)
                 queue_signal(env, info.si_signo, &info);
             }
             break;
-        case EXCP_ATOMIC:
-            cpu_exec_step_atomic(cs);
-            break;
         case EXCP_YIELD:
             /* nothing to do here for user-mode, just resume guest code */
             break;
+        case EXCP_ATOMIC:
+            cpu_exec_step_atomic(cs);
+            break;
         default:
             fprintf(stderr, "qemu: unhandled CPU exception 0x%x - aborting\n",
                     trapnr);
-- 
2.33.1


