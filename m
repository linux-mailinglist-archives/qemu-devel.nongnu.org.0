Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C399D4D4687
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 13:13:11 +0100 (CET)
Received: from localhost ([::1]:43038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSHfK-0006Rg-SC
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 07:13:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxX-0005nW-6e
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:27:55 -0500
Received: from [2607:f8b0:4864:20::1036] (port=42533
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxV-0007zS-PS
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:27:54 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 c16-20020a17090aa61000b001befad2bfaaso4970182pjq.1
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GQKtq5EmgHv2pf8acDMhuJ8SB17+NoN37aNM30IhfvE=;
 b=jtOiGy3FYwQP3MCPQKueM36CjJDClkhfzP7GS1+H6iFjFbaIXyJp1fZpmcMN5vi1JW
 qhuify425kryo/WWX5g5MFg9FAHMSm6N0SVWagC2XWw25AFjw89Xqa/NnVXZneZpCGgH
 N15S6EBfr/5VKd9Q9GcD8taM7E3w+wpHQ+FKxE9W2ePy3jht47IGi95b4dz3kE44Ii6z
 tdzNlpZRh7DUWpWPqUWW9WGK3iB4FgFfaGtW7Qi1ehVWHxwtHUYISBM3yvxWQLAFLJLr
 O0QRVJrWth9FgbsTf+A9sg4N5TBt/MMoYuK3aaKKsBCKxXzRUIKQcBfS8PF9W9OcWu1M
 HwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GQKtq5EmgHv2pf8acDMhuJ8SB17+NoN37aNM30IhfvE=;
 b=hjHS8HWjYQr5vKPiMRlfE/QSTH6EDkGr92jpIaUKZteMvxuUUGGXrMcUZdpfMCNr4n
 PRgXoPd5PMw3OPWVZATo7HorTLBOOkCOcQnQtejB1+50NHwTp4b8A+nJ70cJx63FkBeH
 Gs216/ZSarLT+dgdPEodCRF2KIfSxYSW8l2i+A/PKSYkMtldsQSUXy4BfXZA2ALiY7sT
 QhsMT7wZww7JxeIv4HgQMn1kmrhHnjchCrEsiUtB5PH8arynwBGXXBWPlnIQluB3tRE7
 7C4XQuJEAbuSUbCHG8+VwjOpnJP2QyvJuQGNr5r/nn4tfy7tunsGKBW5PTfyBW4Lnv+h
 1bvA==
X-Gm-Message-State: AOAM530jmoGLqLDR0tIeCXUyIqeXvVkljgEC39AWGkjUKqpxMZ4ezWn/
 HG4XSqnrA1jl8SLLlEYUfgg6mSBruA6MHw==
X-Google-Smtp-Source: ABdhPJzXVUyvhHQDiY4OLa1tBTIAQSusDweAX2LhG57unBu3gnXq7sN4oG25YPSOzuAwct4qTvXbCw==
X-Received: by 2002:a17:90b:788:b0:1bf:41d:a9ff with SMTP id
 l8-20020a17090b078800b001bf041da9ffmr4456639pjz.116.1646911672487; 
 Thu, 10 Mar 2022 03:27:52 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 js15-20020a17090b148f00b001bfc8614b93sm3114977pjb.1.2022.03.10.03.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:27:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 23/48] target/nios2: Handle EXCP_UNALIGN and EXCP_UALIGND
Date: Thu, 10 Mar 2022 03:27:00 -0800
Message-Id: <20220310112725.570053-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310112725.570053-1-richard.henderson@linaro.org>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These misaligned data and misaligned destination exceptions
are defined, but not currently raised.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/helper.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index 285f3aae1d..0392c0ea84 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -119,6 +119,12 @@ void nios2_cpu_do_interrupt(CPUState *cs)
         case EXCP_ILLEGAL:
             name = "ILLEGAL insn";
             break;
+        case EXCP_UNALIGN:
+            name = "Misaligned (data)";
+            break;
+        case EXCP_UNALIGND:
+            name = "Misaligned (destination)";
+            break;
         case EXCP_TRAP:
             name = "TRAP insn";
             break;
@@ -167,6 +173,8 @@ void nios2_cpu_do_interrupt(CPUState *cs)
     case EXCP_SUPERD:
     case EXCP_ILLEGAL:
     case EXCP_TRAP:
+    case EXCP_UNALIGN:
+    case EXCP_UNALIGND:
         do_exception(cpu, cpu->exception_addr, false);
         break;
 
-- 
2.25.1


