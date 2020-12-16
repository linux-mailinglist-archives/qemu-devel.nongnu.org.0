Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C542DC194
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 14:50:13 +0100 (CET)
Received: from localhost ([::1]:45846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpXC0-0006ex-4z
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 08:50:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpX61-0000c8-SF
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 08:44:03 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:37878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpX5x-0005RP-ML
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 08:44:01 -0500
Received: by mail-wr1-x42b.google.com with SMTP id i9so23252238wrc.4
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 05:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ygBBalz5UyiuOJifXXOKc1oAnXdEKjBaVDLqLiZUgIE=;
 b=C+QmQvZ1pgM1LQ41KpkchN3AidK5oN+fBo28fExrzvExSbgAx4Kv5iMgZilcFa9Nf8
 HGV3+8UApZ7nST4D2/T96SfHaNhjbmGp83kPX8EnDEAM3WEDUCDcVkzAu5wMCJF0UBmq
 PlzBHPh/HulLAksM9cXqABy5g2x8CTLUI3fGDG+n1V0R5E4/ybbIoVmSOH1VNxS0suHb
 RXCXBJ3CkjkFCbguUPELQ05JsTzJZ+OyJRrLJcLfHHc3XU/ovRTu6aPbxbcqoF9nBmgc
 YlW1lRKp4MPzK8A1gwIFWGe2ceHwAS3QOQlMb5AsqI5hZRlViyfxvBsCChOHl1ksxBxu
 Vjnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ygBBalz5UyiuOJifXXOKc1oAnXdEKjBaVDLqLiZUgIE=;
 b=i64A81Igbhu84DN38ccxB8uXQxPPH9+zj0ewU+h3aUd2Glfw+I1rhmtEyb7jCEpdce
 Qqp3j7weO1dc2KY43+hVmm+2ZYeneAd3yh12Bo7B42P5nJKD322asjSykkCAcIGMdJLV
 0dkjRkmmYYz+K4pB5ffjna7ElfpqsA6qjSsxzKoMKh2G1VK+vV7sxZO/MvWcZc3LSlfS
 qcoaJ425TeW2XGrNCev/TnWJbs4S/9+z+ARQgWvZArv3NCXydsLUjYwMY1Bv0HOS4uJt
 Cm6KzW0J/6UdkeFKmenjIrH0yg2scoy7Bk8Vd7J72SXGmxe7OCibdf5MYzi52eeblKuC
 FbDA==
X-Gm-Message-State: AOAM533YZ8OM8tq9LRw2wxnz+yKfOJ77jzcLtBtC8G2SjTlASnOHRVf0
 XCJax1PX8WUeg7OrtlyEvqj4Jp4fQ9E=
X-Google-Smtp-Source: ABdhPJwgr5y9DPyWpYjHfAB5VZap1PbMcMSeCm/PYBwVhrafvovIo08YjvGWC1g27rYMqIoLXjCULQ==
X-Received: by 2002:a5d:68c9:: with SMTP id p9mr38251711wrw.139.1608126235845; 
 Wed, 16 Dec 2020 05:43:55 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id a13sm3089593wrt.96.2020.12.16.05.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 05:43:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/11] target/mips/mips-defs: Use ISA_MIPS32R5 definition to
 check Release 5
Date: Wed, 16 Dec 2020 14:43:22 +0100
Message-Id: <20201216134328.851840-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201216134328.851840-1-f4bug@amsat.org>
References: <20201216134328.851840-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


