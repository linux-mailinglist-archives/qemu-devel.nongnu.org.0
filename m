Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F5746016B
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Nov 2021 21:22:45 +0100 (CET)
Received: from localhost ([::1]:36852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mr4Dc-0005wE-7y
	for lists+qemu-devel@lfdr.de; Sat, 27 Nov 2021 15:22:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mr4Af-0003oC-Sa
 for qemu-devel@nongnu.org; Sat, 27 Nov 2021 15:19:41 -0500
Received: from [2607:f8b0:4864:20::d35] (port=38868
 helo=mail-io1-xd35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mr4Ad-0004tx-6a
 for qemu-devel@nongnu.org; Sat, 27 Nov 2021 15:19:41 -0500
Received: by mail-io1-xd35.google.com with SMTP id z18so15890610iof.5
 for <qemu-devel@nongnu.org>; Sat, 27 Nov 2021 12:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nN3GoD+NmVWnXx5scKILO0Lt9wSgr2FWl8DwY/rYPok=;
 b=LLKbl0bc47yHoJNn+XnAU2DygrATZjnQpMCdRUSOjNlECLacEYXWaz+J8nxxJ71qxM
 fbnKZvAli2AodBM7VtvXWs/YnGGttjykBHvAISrKauzvCAce3I+JynjVj50lpzWU6ral
 TyPDVsQOqZHzhcxzJ1QzCHX2MvlmqEdJs/+RFCjhnBJBPOGnCOS8FYbiVC50BVeQ3w+K
 VeZMsWKelb5eW0c+bLmaOSyleyogOldWzGtPDSah8N0k9yGRHpBphalIkZptW9QPEldV
 xMvxXaC6WrSyF8ySoJpUvX6ya3ojmXur13LYkSQCZ3gqxXf1A611qT/WZcwnsA0mMpBJ
 LONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nN3GoD+NmVWnXx5scKILO0Lt9wSgr2FWl8DwY/rYPok=;
 b=zAujSU/Wxe48VAkbomFMPG85oCompKbFM8D4wrp1yPuhqAOEBQqaLiS/sfiRSmx9wY
 IXtVfIutXr57Lzivc3Z/a3m+hCUqXz6WJAehP1J7h8yfhr0TnmasFQGfC5n3cSdVaJMR
 KMC2b/b6sF83oxVMoXT8GzFCGKnKCUg7E9U0/31yXj5nHh9OybpHUdN0LqcPpSSGUBZ/
 +ahxBKTwdE6xDMpTTnclxCnfnkmARfB7LWlvTLc5IiFgEBjy/GosWqb33OhzrM9LZtyn
 dvMntcnU/8i9Mg5iGcE0Yl9o5aO/zzdN+BKsL3PnEah7JCakMr8h2KtJuadvXzOt+gz2
 y9fQ==
X-Gm-Message-State: AOAM530qJb8um6FgqLIsx6gUNXTmW2KDGuPD8t6CKq/qyTADGDsZMKh2
 sc+UU5bgzA8JllPHUaZSOXz2XEtQbBsXqt6O
X-Google-Smtp-Source: ABdhPJzHJktS2vZkGu3z5sPaqFvrSQ/akrXWplbWQDaoIffl1WD0Y8e46Owr0g95kVzlnrG6ooZEnQ==
X-Received: by 2002:a6b:3b13:: with SMTP id i19mr39988331ioa.210.1638044377631; 
 Sat, 27 Nov 2021 12:19:37 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h12sm3091632ila.81.2021.11.27.12.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Nov 2021 12:19:37 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 7.0 1/5] h.armv7: Simple hello-world test for armv7
Date: Sat, 27 Nov 2021 13:18:42 -0700
Message-Id: <20211127201846.64187-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211127201846.64187-1-imp@bsdimp.com>
References: <20211127201846.64187-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d35
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd35.google.com
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
Cc: arrowd@freebsd.org, kevans@freebsd.org, richard.henderson@linaro.org,
 f4bug@amsat.org, def@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A simple, tiny, statically linked armv7 'hello world' test. It uses two
system calls (write and exit) and provides a basic sanity check to make
sure that the arm bsd-user binary can interpret FreeBSD armv7 binaries.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 tests/bsd-user-smoke/h.armv7.S | 37 ++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 tests/bsd-user-smoke/h.armv7.S

diff --git a/tests/bsd-user-smoke/h.armv7.S b/tests/bsd-user-smoke/h.armv7.S
new file mode 100644
index 00000000000..fe986f15ef6
--- /dev/null
+++ b/tests/bsd-user-smoke/h.armv7.S
@@ -0,0 +1,37 @@
+# Copyright (c) 2021 Warner Losh
+# SPDX-License-Identifier: BSD-2-Clause
+
+#include <sys/syscall.h>
+#define STDOUT_FILENO	1
+
+	.text
+	.file	"hello.s"
+	.syntax unified
+	.globl	qemu_start                            @ -- Begin function qemu_start
+	.p2align	2
+	.type	qemu_start,%function
+	.code	32                              @ @qemu_start
+qemu_start:
+@ %bb.0:                                @ %entry
+
+	# write(1, .L.str, sizeof(.L.str) - 1)
+	movw	r1, :lower16:.L.str	@ Load hello world
+	movt	r1, :upper16:.L.str
+	ldr	r0, =STDOUT_FILENO
+	ldr	r2, =(.L.strEnd - .L.str - 1)
+	ldr	r7, =SYS_write
+	swi	0
+
+	# _exit(0)
+	ldr	r0, =0			@ success
+	ldr	r7, =SYS_exit
+	swi	0
+.Lfunc_end0:
+	.size	qemu_start, .Lfunc_end0-qemu_start
+                                        @ -- End function
+	.type	.L.str,%object                  @ @.str
+	.section	.rodata.str1.1,"aMS",%progbits,1
+.L.str:
+	.asciz	"Hello World\n"
+.L.strEnd:
+	.size .L.str, .L.strEnd - .L.str
-- 
2.33.0


