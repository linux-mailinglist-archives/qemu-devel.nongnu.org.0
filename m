Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 792C055C0A2
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 13:23:28 +0200 (CEST)
Received: from localhost ([::1]:44994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o69JX-0001kJ-HR
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 07:23:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o69DZ-0003h3-Qw
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:17:17 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:40799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o69DY-0003B4-BY
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:17:17 -0400
Received: by mail-pg1-x535.google.com with SMTP id 9so11884901pgd.7
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 04:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+UObdrhqrhV3XMbtzMZ8fVzyxK5zVU9oY2exQJ4RAHc=;
 b=EvSFEhQecEMcBjKHhmr6sk9mcjFsrq/lB/2scymTi9l6/lTpHM94olic4sE9PHQlwR
 Jrc49qnEiZuVZXvpetkwDbx1NuidM/tuPCdpivTtz/VTC1LX+lMaPnciVCuRb8hA9l1P
 W0PrPER7jvvFzsj7UQ+PANkz/JNhiXa/7ADggz8aCWZ0p/hAOkc6nUh6qsa1uUVKHO2a
 tCuSIGsoHEQ1k9PrF2rVREDwA1aRnWKf7mnpx8819YfJi0fZdb5pDYwQUYkZqtIFasqa
 r/PJ7D7+Aeaf3ZJvOHpwd5AZlyCSsjy8pyWu2HCHAiB9GACE/I3VGQXjXEd1g7M2BeFV
 g3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+UObdrhqrhV3XMbtzMZ8fVzyxK5zVU9oY2exQJ4RAHc=;
 b=1Y39TTffrbQYsDk7HlnQO5YoM3rRq4Pw2mk2ownLPkI/BUnfPjc0DOPuhmXmFgKhv4
 r4P/pWe/jszyU0c+dcd55GQdv1Q5rrlAXfjo8Udd6rVj0DDxCf479rIK2hbkRWsHnxR3
 /pYzq4htEmkD9UxP6/3boTj0bHhLbOMPRPa4K+ly2Xx/1Ue2iv95pwW/Uns2FrZPwoyy
 V+rUX5vtcukzNlcqMev3+sJeTLmt4aeVFk0ibeqYgfTsmcOtODgQgfgffHGYjSNXueOH
 1XXdft2i4mFHzY/9YeZq2J4U8Js0QR4alF/BJEKHlPE1UrfQFpF7IsPWaWmsJ7pv7ngI
 MGbw==
X-Gm-Message-State: AJIora/HjNaBxdnyntu4MwUW2rm47EInbMVniyGhEEKXeNURxQEfOj3J
 qqzt5rcBnTkaqnYUyeTT9me2r3BQWZiRng==
X-Google-Smtp-Source: AGRyM1uI9gVQliBXuGSNyE4tMXYM/ioGEQI1Ff8R/GlppB8aAgoZQmWycpsQu5DHNjZsb/a8WuxXAQ==
X-Received: by 2002:aa7:81d4:0:b0:525:1ead:17af with SMTP id
 c20-20020aa781d4000000b005251ead17afmr3102526pfn.71.1656415034943; 
 Tue, 28 Jun 2022 04:17:14 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 a8-20020a654188000000b003fd4831e6fesm9079283pgq.70.2022.06.28.04.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 04:17:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, alex.bennee@linaro.org, jiaxun.yang@flygoat.com,
 aleksandar.rikalo@syrmia.com
Subject: [PATCH v5 2/8] target/mips: Drop link syscall from semihosting
Date: Tue, 28 Jun 2022 16:46:55 +0530
Message-Id: <20220628111701.677216-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628111701.677216-1-richard.henderson@linaro.org>
References: <20220628111701.677216-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

We don't implement it with _WIN32 hosts, and the syscall
is missing from the gdb remote file i/o interface.
Since we can't implement it universally, drop it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/sysemu/mips-semi.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/target/mips/tcg/sysemu/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
index 153df1fa15..93c9d3d0b3 100644
--- a/target/mips/tcg/sysemu/mips-semi.c
+++ b/target/mips/tcg/sysemu/mips-semi.c
@@ -362,15 +362,6 @@ void mips_semihosting(CPUMIPSState *env)
         FREE_TARGET_STRING(p, gpr[4]);
         abort();
         break;
-#ifndef _WIN32
-    case UHI_link:
-        GET_TARGET_STRINGS_2(p, gpr[4], p2, gpr[5]);
-        gpr[2] = link(p, p2);
-        gpr[3] = errno_mips(errno);
-        FREE_TARGET_STRING(p2, gpr[5]);
-        FREE_TARGET_STRING(p, gpr[4]);
-        break;
-#endif
     default:
         error_report("Unknown UHI operation %d", op);
         abort();
-- 
2.34.1


