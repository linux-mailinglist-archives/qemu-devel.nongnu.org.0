Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BD4697F64
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 16:19:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSJYK-0002TF-VX; Wed, 15 Feb 2023 10:18:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.nowakowski@fungible.com>)
 id 1pSDSV-0006xd-QK
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 03:48:12 -0500
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.nowakowski@fungible.com>)
 id 1pSDSU-00071a-8E
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 03:48:11 -0500
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-15ff0a1f735so22150413fac.5
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 00:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fungible.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=peZWXJ9TIqhJZN5pvOyZFjZ+4SZzBi3MO1y+d3SOb5A=;
 b=Otvt20unFuGO+xtKAl695C1dnrGKC3qktJGHBQswuAMTSRVMB+avbd/5E8fecEaKdL
 ZSfFYpw6oUtzdvvdTKZzXJHdqFhXp/BxaKrvb+ZdwdSXqZm+a0FOT/shRmg3ZOsYuJSi
 KUysxbCBW+SUZP1eX9VSrJPGxy0HLuxwDNszE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=peZWXJ9TIqhJZN5pvOyZFjZ+4SZzBi3MO1y+d3SOb5A=;
 b=ox+9PCGXDsGbe7lIbNm+M9VFTtUsPKeCOT0K5jbE4EMKbJ1MgB5upa/GdfKmSbgDCp
 TIid3mnyqjxue/l1Le7OPsVkXSIJmtK7yzZqBmJ2S1PnKiQAvGsuV0WSVoR6Ppf2vE++
 8Mu++jidPSiI+uZNc1WMb0kK1uKnGK6OBe0XGJKBRXdFveiVOHIb4hWhqR/TfHP39V2H
 5XadX4rPIty1k9fVDa0Bgsaqgq5RxB5vhLh/INF1v9fwdyobyMTsy+W44Jk8YU9jDWBL
 rsJAAJ7wbTTP6PsfP3SaKmuYeWpc2nXE9FwZIyK1i4GJzljmHIVr/BLcyIlL4YPhXJFb
 zDDw==
X-Gm-Message-State: AO0yUKXqajM7YlNHiBiaPnstAVd8rAKRjC0A/5EDEYftzo/A4HDekq8V
 FsfaWiUJ0+oI9FY7/UWjxeOPmuRD2lQilVlp
X-Google-Smtp-Source: AK7set/bbz/rYXvAJXZ+Iyw3JYddYn86EVArSf/rOhyzaspLFTY534QldtShWP/qboNUD58JmBn1Pg==
X-Received: by 2002:a05:6871:6a9:b0:16e:116e:1c36 with SMTP id
 l41-20020a05687106a900b0016e116e1c36mr703102oao.3.1676450888661; 
 Wed, 15 Feb 2023 00:48:08 -0800 (PST)
Received: from WR-NOWAKOWSKI.fungible.local (77-255-255-121.adsl.inetia.pl.
 [77.255.255.121]) by smtp.gmail.com with ESMTPSA id
 a9-20020a056870d60900b0013bc40b09dasm6788811oaq.17.2023.02.15.00.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 00:48:08 -0800 (PST)
From: Marcin Nowakowski <marcin.nowakowski@fungible.com>
To: qemu-devel@nongnu.org
Cc: marcin.nowakowski@fungible.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PATCH 1/3] target/mips: fix JALS32/J32 instruction handling for
 microMIPS
Date: Wed, 15 Feb 2023 09:47:52 +0100
Message-Id: <20230215084754.3816747-2-marcin.nowakowski@fungible.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230215084754.3816747-1-marcin.nowakowski@fungible.com>
References: <20230215084754.3816747-1-marcin.nowakowski@fungible.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=marcin.nowakowski@fungible.com; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 15 Feb 2023 10:18:35 -0500
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
---
 target/mips/tcg/translate.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 624e6b7786..5d46f24141 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -4860,6 +4860,7 @@ static void gen_compute_branch(DisasContext *ctx, uint32_t opc,
     target_ulong btgt = -1;
     int blink = 0;
     int bcond_compute = 0;
+    int jal_mask = 0;
     TCGv t0 = tcg_temp_new();
     TCGv t1 = tcg_temp_new();
 
@@ -4917,6 +4918,11 @@ static void gen_compute_branch(DisasContext *ctx, uint32_t opc,
         break;
     case OPC_J:
     case OPC_JAL:
+        /* Jump to immediate */
+        jal_mask = ctx->hflags & MIPS_HFLAG_M16 ? 0xF8000000 : 0xF0000000;
+        btgt = ((ctx->base.pc_next + insn_bytes) & jal_mask) |
+            (uint32_t)offset;
+        break;
     case OPC_JALX:
         /* Jump to immediate */
         btgt = ((ctx->base.pc_next + insn_bytes) & (int32_t)0xF0000000) |
-- 
2.25.1


