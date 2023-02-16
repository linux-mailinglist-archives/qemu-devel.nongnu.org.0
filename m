Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5843B698B9E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 06:18:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSWeF-0002Hl-Jq; Thu, 16 Feb 2023 00:17:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.nowakowski@fungible.com>)
 id 1pSWeC-0002HE-Oe
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:17:32 -0500
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.nowakowski@fungible.com>)
 id 1pSWeB-0002yc-4X
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:17:32 -0500
Received: by mail-lf1-x130.google.com with SMTP id w11so1354797lfu.11
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 21:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fungible.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N4CyYFlQ9lJnVulTLeH6Vug8QJSqq38HI4xXOKNMb/s=;
 b=eQUH6FTH8oASifbVNJSWTCM1qU51eSOaJgp6QBcJgujfUr1899rm7qMD2YxXtVU4R7
 l+/85jxbB8TmxjsIjmUAX2U5M6JFjjnQOuKNzEU4SY3v0hB9CWuUrWAtjnEHi0DiuoOF
 eFlryNIsvVkrjlQNXRi4Xv+jduxLgC80xqmqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N4CyYFlQ9lJnVulTLeH6Vug8QJSqq38HI4xXOKNMb/s=;
 b=IFVvUc61tqjb95RwXO2AxhESsOOjhLQkdQxXkf79QQ8s954H6ij8bLsqogLK/uURoQ
 xVl2UlM7oKnyqGdM4G9xes38IMrZ0jQQ/0uJfTcZA/C3cAMB7H13xmT+rshXWEShVcFs
 MJHRmbOR9Yu7AErHyneEar/3SObug1lEnzDE+gLZMMo0wmYYbxB5OzC5CmLH+AAIKQaA
 UiParF1yGXgXfJ2dJdNbZyLUoKIUNtsdo1ylVYV/Nm4CNqwHlorH2wjbDbo6ko8UphpM
 Sut1+0RE0emM5yw+Y2lkuR2223zGcChzPCkIr2NeGi7EmbGyHZz2R1pAEd4FcyBNU2KX
 ZNeQ==
X-Gm-Message-State: AO0yUKUdY0UCfo2JgRBGDUtoag7/0KeNWwMZpAKHzxLXneyisSAJlTtf
 f5o3w3QUTTULLVVch7/qPEmet7D14Ywf/Zxp
X-Google-Smtp-Source: AK7set8h4Cq9p0HxrUZUMS0JcKK1Pm2MS2BhjV10w4kTIM0Tyn5C179ytr4uNjv3RnlwRrdlahHHdQ==
X-Received: by 2002:ac2:42c2:0:b0:4b6:f51e:b8b6 with SMTP id
 n2-20020ac242c2000000b004b6f51eb8b6mr1007707lfl.56.1676524649144; 
 Wed, 15 Feb 2023 21:17:29 -0800 (PST)
Received: from WR-NOWAKOWSKI.fungible.local (77-255-255-121.adsl.inetia.pl.
 [77.255.255.121]) by smtp.gmail.com with ESMTPSA id
 s1-20020a19ad41000000b004b7033da2d7sm141278lfd.128.2023.02.15.21.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 21:17:28 -0800 (PST)
From: Marcin Nowakowski <marcin.nowakowski@fungible.com>
To: qemu-devel@nongnu.org
Cc: marcin.nowakowski@fungible.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 1/4] target/mips: fix JALS32/J32 instruction handling for
 microMIPS
Date: Thu, 16 Feb 2023 06:17:14 +0100
Message-Id: <20230216051717.3911212-2-marcin.nowakowski@fungible.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230216051717.3911212-1-marcin.nowakowski@fungible.com>
References: <20230216051717.3911212-1-marcin.nowakowski@fungible.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=marcin.nowakowski@fungible.com; helo=mail-lf1-x130.google.com
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
---
 target/mips/tcg/translate.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 624e6b7786..567ca11ccf 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -4917,6 +4917,13 @@ static void gen_compute_branch(DisasContext *ctx, uint32_t opc,
         break;
     case OPC_J:
     case OPC_JAL:
+        {
+            /* Jump to immediate */
+            int jal_mask = ctx->hflags & MIPS_HFLAG_M16 ? 0xF8000000 : 0xF0000000;
+            btgt = ((ctx->base.pc_next + insn_bytes) & jal_mask) |
+                (uint32_t)offset;
+            break;
+        }
     case OPC_JALX:
         /* Jump to immediate */
         btgt = ((ctx->base.pc_next + insn_bytes) & (int32_t)0xF0000000) |
-- 
2.25.1


