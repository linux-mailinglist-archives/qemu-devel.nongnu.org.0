Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2AF2DC48C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:47:24 +0100 (CET)
Received: from localhost ([::1]:51936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpZxT-0006Lc-OR
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:47:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpZfC-0005KO-5Y
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:28:31 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:43430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpZf0-0007lw-ND
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:28:29 -0500
Received: by mail-wr1-x42a.google.com with SMTP id y17so23758608wrr.10
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ygBBalz5UyiuOJifXXOKc1oAnXdEKjBaVDLqLiZUgIE=;
 b=CoCqj2lqXTBH2HuAzlG1pavCoRzJlYRxksEzR+BBFsENCCnbq1ABkV8muqsz4/MH5k
 hFIivC078hf3cIRAXOBaw+iacRNLVj+J8rvYqJnybij4KsgcT1D5Ees9EVzqbbDiH/9k
 F0iTOlvDq9mLZxFkbyON4ug2K0IjyNjh5wT+LyTsiu7iByBks27oNYDjHdD9kwP3LSxf
 svfbRt4+3UYEZaLip6AMgliY9D3SsLa9OhOcMvSXPA7vUmAtmPI5+cCNCKBdE5A3UOp7
 uWbvnSUBVvP2cRJgoiGR1qWSOeuKrhSDCsumTNL8Qy5w1SajPbb4vA6Ll509ShWyx84l
 2ntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ygBBalz5UyiuOJifXXOKc1oAnXdEKjBaVDLqLiZUgIE=;
 b=FMVdKtrMb0XoOpnX/u1c7ZEG+JQS2aixz4bk0fq5ZEo3GaowK79J4HPMtLnUCXvvAY
 aU6q3rG2K8IOgm8DofwcOXgXXC+NDS5CdeSz32lYaVx3z+PZaBqYkaoSrGWr2Chrqnkj
 S5bWQ61moFvO4jOC7MvVEc8CKso/KbYk8XfzYf3vdVUTWtCsz/345Dz5/7K6RNmOIza/
 lcq7rF+lgAA6KLf/+AqTLMuX/v2fZhIt3dnFBBrSApdkOZXrjAAwPUEHTaStRmC6aKp4
 qcL0FnjdOppiCLjExXdEYn6+uBCyp+73FcA99oZcXN+DBEjx6FJ1UWaV527EzLi/fb41
 Q1sA==
X-Gm-Message-State: AOAM531rj+KsaCnu9cY8qYmCd9lFQXFwvFu8o8RpI8HpvpRgrCe3rsCo
 VRdNZ2UTF3YzqPVjnRo7LTw1Z/WJzs8=
X-Google-Smtp-Source: ABdhPJwr/3+0r+LcnvK0BoElawyXj35BzNGcA7uvAEF3dh8UIlHb5q/dcsXxHQ+C4/XY+rqK1umB/A==
X-Received: by 2002:adf:97dd:: with SMTP id t29mr39063941wrb.357.1608136097116; 
 Wed, 16 Dec 2020 08:28:17 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id h14sm4000636wrx.37.2020.12.16.08.28.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 08:28:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/12] target/mips/mips-defs: Use ISA_MIPS32R5 definition
 to check Release 5
Date: Wed, 16 Dec 2020 17:27:38 +0100
Message-Id: <20201216162744.895920-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201216162744.895920-1-f4bug@amsat.org>
References: <20201216162744.895920-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the single ISA_MIPS32R5 definition to check if the Release 5
ISA is supported, whether the CPU support 32/64-bit.

For now we keep '32' in the definition name, we will rename it
as ISA_MIPS_R5 in few commits.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/mips-defs.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index 0d906ca64b3..ea9dcc7c98e 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -26,7 +26,6 @@
 #define ISA_MIPS32R2      0x0000000000000040ULL
 #define ISA_MIPS32R3      0x0000000000000200ULL
 #define ISA_MIPS32R5      0x0000000000000800ULL
-#define ISA_MIPS64R5      0x0000000000001000ULL
 #define ISA_MIPS32R6      0x0000000000002000ULL
 #define ISA_MIPS64R6      0x0000000000004000ULL
 #define ISA_NANOMIPS32    0x0000000000008000ULL
@@ -87,7 +86,7 @@
 
 /* MIPS Technologies "Release 5" */
 #define CPU_MIPS32R5    (CPU_MIPS32R3 | ISA_MIPS32R5)
-#define CPU_MIPS64R5    (CPU_MIPS64R3 | CPU_MIPS32R5 | ISA_MIPS64R5)
+#define CPU_MIPS64R5    (CPU_MIPS64R3 | CPU_MIPS32R5)
 
 /* MIPS Technologies "Release 6" */
 #define CPU_MIPS32R6    (CPU_MIPS32R5 | ISA_MIPS32R6)
-- 
2.26.2


