Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E334C4A046A
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 00:40:32 +0100 (CET)
Received: from localhost ([::1]:48934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDar2-0003wt-0P
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 18:40:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDaf5-0000AF-2d
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:28:11 -0500
Received: from [2607:f8b0:4864:20::d36] (port=45774
 helo=mail-io1-xd36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDaf3-0001YV-Cz
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:28:10 -0500
Received: by mail-io1-xd36.google.com with SMTP id s18so9651759ioa.12
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 15:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6fk8Rm7tbwnMJwW6ytgiwa7PMfU+rVxxXH2pSHcB2Zs=;
 b=xl32rECUvOVa+CP0V/A57Pn1QgQcJRMejpDe+R0QfefrpjLAAfAF0CzwQorvvG+HaL
 LHO/4nqAvmCiNHwW9AG7vVvct+0MlYK9SRP79ErjhRz2PFQEoIhjBAPIs66u2MjtZjgs
 M3xpoMsLp8pZp/owQj614MYIhV3CkDF0/ZleutTcIxWUPYsIbCV7Bp3Lh/ncDMtSkN/g
 ktJ4H4oR3gdKkSzqayizOVLm3kuvVf/UT88lzQKEXtN9AhU7KEvUrBVuu6McNKutqWBJ
 U3SnMl2LutXnQPgG3haDDHUZF6fOLoEOmN+pcj0KihFa3vnIx+jIZyhLp8+0PznbeZGX
 vrqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6fk8Rm7tbwnMJwW6ytgiwa7PMfU+rVxxXH2pSHcB2Zs=;
 b=4GLrM3X9V428cHFFL7EK5HUzK9OBaTnDZ2VK/YTMp5yiZZdUkmg4uNJ2ddEn8L+FAA
 GIf3+Lrj0CLzEoBUV0CN/Eyn7LC15vIXKpT6I5T4MSndfDNDHRt37rENT7QaC/vIFr0b
 QFmjdFzG9hHdTWSDR5oxI4nR2ixlm/4GeWu7XazGSHKnOwN4P5fMHQZpCfU3NvabuRnu
 Ho/zDUK3OyCqLqPaU2wYz+MSdVeqzSjKuSeU7WbCVCvU1yN7+w2NQOWp39ksl+n3B9cq
 q4SQpKvbVAyVyku4XgjmOQXxwH7RyOvRehgEaKkOtLZ9hNvgep81I6MrAs2AZDUIRdm1
 W3BQ==
X-Gm-Message-State: AOAM533JoPMLVSr0oJr6jJngwLFGmB7FA5vdxtblQOzwT23lZFAhGV/N
 DIiqtRouMwTZopsFMLBFTqaT30Hvk8H3eA==
X-Google-Smtp-Source: ABdhPJxNKfzZgyJNNB2p/5yXWrrD6Nwnug11NvB2NtF0q3B6jLt44pywOWDzwSFa7YHRvNR8lCHyvQ==
X-Received: by 2002:a05:6638:1450:: with SMTP id
 l16mr779747jad.30.1643412487959; 
 Fri, 28 Jan 2022 15:28:07 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id o11sm14323111ilm.20.2022.01.28.15.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 15:28:07 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/40] bsd-user/arm/target_arch_cpu.h: Move EXCP_ATOMIC to
 match linux-user
Date: Fri, 28 Jan 2022 16:27:32 -0700
Message-Id: <20220128232805.86191-8-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128232805.86191-1-imp@bsdimp.com>
References: <20220128232805.86191-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d36
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d36;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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


