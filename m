Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A30249A212
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 02:35:03 +0100 (CET)
Received: from localhost ([::1]:46734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCAje-0004wS-77
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 20:35:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAeo-0001t6-Dz
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:02 -0500
Received: from [2607:f8b0:4864:20::132] (port=43929
 helo=mail-il1-x132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAem-0001LM-Qw
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:02 -0500
Received: by mail-il1-x132.google.com with SMTP id d3so15513240ilr.10
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 17:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6fk8Rm7tbwnMJwW6ytgiwa7PMfU+rVxxXH2pSHcB2Zs=;
 b=C0Cwemy+kyRB4ZCElXqsSRSJkZBcBZkHNb5a5IAg+jYd1GN+QedmnE2SuwV86PEftS
 YjAkdU4eKwAsS6wJJmFj2lQ/2d0ZPpX8nIdTzgQJ/0k5JNbA6d6tXHWBRUYORKRUm8kt
 SNoWEZxTPfFcopivdg45m3hXLp69oieMkjMi7mwCjpGjOGIv58CcGMLk+IJHAlNniewK
 7dSkmxJ4FaZPoPuBAm3xRrtmf2ZOReFoZ1HUPFLdeNuUsKmExiERlmnoYNkTiJIfCt6u
 zh9zpUp09JnIsq0lYFDLhNjfQ29q6KRTAjpu7C8MVb8c+nC0T73cVFh0sv5jWQbRzwGc
 XFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6fk8Rm7tbwnMJwW6ytgiwa7PMfU+rVxxXH2pSHcB2Zs=;
 b=IIQSnCKqOU46zYHYuX+rApJSYALqrEaPD6YGR/GwgMnXdskBtgDdaG8LYvaBNxuOoJ
 ScI1yXfHBoGXl9DXAbjmjUTn/5lptiXsK3s+XtJ4tFvBFez20LLvr6yH7gNmy3ra/hmK
 9hM+WWjBEaxwzdSu+sZOY5+YmGbRdx8fdIumFGyRb7UQgiieGYDPoI/FvvY0zf4DHWm8
 yt/OruhRXvPFyY3EigPGXIM5IfZ71ZxU/Rfu7Q2GSEy+S2ekRPsxcHD7C1/FUub6zvWP
 Gmz92folFz3fi/eiqR2xSFRbJEe+KMf7ikyfBfEF7+fE7LUHNzavhzA44o9JdFMl87fG
 TRgw==
X-Gm-Message-State: AOAM530FWLb4pPkxqZ4HASt7672IIjboKmArlDn7V1yfI3nqDFQMJo7S
 fgpVf2NIPjf7KjMPw5Anst3sa/PJWWhkng==
X-Google-Smtp-Source: ABdhPJynhVBIVgrG60+lM/gaH0bdTHpCZraLg1AttrKuHkCVGxbERdFo7fYMSb09T2ipoInkgwaAqQ==
X-Received: by 2002:a92:d70c:: with SMTP id m12mr9976921iln.275.1643074199494; 
 Mon, 24 Jan 2022 17:29:59 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q14sm2061687ilo.63.2022.01.24.17.29.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 17:29:59 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/40] bsd-user/arm/target_arch_cpu.h: Move EXCP_ATOMIC to
 match linux-user
Date: Mon, 24 Jan 2022 18:29:14 -0700
Message-Id: <20220125012947.14974-8-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220125012947.14974-1-imp@bsdimp.com>
References: <20220125012947.14974-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::132
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::132;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x132.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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


