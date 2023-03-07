Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 541E06AFAB1
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 00:48:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZh1s-00006b-Ty; Tue, 07 Mar 2023 18:47:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZh1q-0008U0-CC
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:47:34 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZh1o-0002fv-Sk
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:47:34 -0500
Received: by mail-wm1-x334.google.com with SMTP id p16so8810713wmq.5
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 15:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678232851;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T8bm6uagQMSn5YcszvNvVG9S7Gfqzm98L/bweCMen+Q=;
 b=y0vPn78e2wbcn3wQ7XtOrvxVIH/AMVDK1mSjhG5mS4Ml+bmBQpXxv6lppKPYc0CPgq
 Re1YktpIUnXInvKAy6P/TnbX6uemkRbVU2heMW3cAvYvDVk7UUwuLrU7uuqNWTHSQFCW
 u5KxphpLXBluNn47Sq08qbcwvkGcg1CfUfHgZett7wEoew23k20l5onGSHSIFNQQJkf/
 qwnpfrxfs5JKij5G4q6rQctYT1Qin3UcKuSeT8Tuxs9eVppd8DuB2q4FgYBMy/TolEqr
 Cbv56cdcvxuPGNKk/XVVPUHHqy6rC1cWYGOUd+qeYBP481OsBQ6hLSZsciPHXsZ693gR
 M9Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678232851;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T8bm6uagQMSn5YcszvNvVG9S7Gfqzm98L/bweCMen+Q=;
 b=YkgLzoCz2UAQ3Q9aFtxh68MNkR4DYak3byuPYOXjngqLasdShswELgixbay8kwuxQP
 P2LqWn/533M2nwSQihNJRhO03QXlaMNtQyHLJzRKiX9I1PSmaT1+JZwaFQMbQTGptLy0
 0BRgJeAr2MN2A+7bUBoyu2FSZMEOqVlfaTfT40gpZ/ZOQQdzSkyVoZzuKZsSvrZdqhXk
 mvb3vnqh/vx19WWE5XTTW80gFN0ZjGDy9Vp3Xcbk0RwcZlzVDTmR46OyfxRFUphXDTGk
 z8GW2k1Q63fQLCG9zEZ500KuKdDIjKM4GRgHqzQ8SernzJliZoM3PVRDW+DN5NCUNNiC
 n6Jw==
X-Gm-Message-State: AO0yUKU5pKKasOgZ2C9y4ZdAV3x8TXzTe6TeeHwIYZmqgGEg5cIE72xh
 2vxYgE2JCKaqgesZA7q62hFgzi1lKHn2Byg3nXc=
X-Google-Smtp-Source: AK7set9DvrFZGz8AuDUAOTvhNzLg612uH/sZ7UJh3+bgQvByuoGgmEy6Ngx/NfhJJvdoAO9ROtBtRQ==
X-Received: by 2002:a1c:750a:0:b0:3ea:e582:48dd with SMTP id
 o10-20020a1c750a000000b003eae58248ddmr13424919wmc.34.1678232851302; 
 Tue, 07 Mar 2023 15:47:31 -0800 (PST)
Received: from localhost.localdomain (57.red-88-29-179.dynamicip.rima-tde.net.
 [88.29.179.57]) by smtp.gmail.com with ESMTPSA id
 l10-20020a7bc44a000000b003e21dcccf9fsm17730941wmi.16.2023.03.07.15.47.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Mar 2023 15:47:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Marcin Nowakowski <marcin.nowakowski@fungible.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PULL 03/20] target/mips: Fix JALS32/J32 instruction handling for
 microMIPS
Date: Wed,  8 Mar 2023 00:46:54 +0100
Message-Id: <20230307234711.55375-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230307234711.55375-1-philmd@linaro.org>
References: <20230307234711.55375-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Marcin Nowakowski <marcin.nowakowski@fungible.com>

microMIPS J & JAL instructions perform a jump in a 128MB region and 5
top bits of the address need to be preserved. This is different behavior
compared to standard mips systems, where the jump is executed within a
256MB region.
Note that microMIPS32 instruction set documentation appears to have
inconsistent information regarding JALX32 instruction - it is written in
the doc that:

"To execute a procedure call within the current 256 MB-aligned region
(...)
The low 26 bits of the target address is the target field shifted left
2 bits."

But the target address is already 26 bits. Moreover, the operation
description indicates that 28 bits are copied, so the statement about
use of 26 bits is _most likely_ incorrect and the corresponding code
remains the same as for standard mips instruction set.

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@fungible.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230216051717.3911212-2-marcin.nowakowski@fungible.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/mips/tcg/translate.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 8cad3d15a0..24993bc97d 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -4887,6 +4887,14 @@ static void gen_compute_branch(DisasContext *ctx, uint32_t opc,
         break;
     case OPC_J:
     case OPC_JAL:
+        {
+            /* Jump to immediate */
+            int jal_mask = ctx->hflags & MIPS_HFLAG_M16 ? 0xF8000000
+                                                        : 0xF0000000;
+            btgt = ((ctx->base.pc_next + insn_bytes) & jal_mask)
+                   | (uint32_t)offset;
+            break;
+        }
     case OPC_JALX:
         /* Jump to immediate */
         btgt = ((ctx->base.pc_next + insn_bytes) & (int32_t)0xF0000000) |
-- 
2.38.1


