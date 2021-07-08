Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8B13C19E0
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:34:48 +0200 (CEST)
Received: from localhost ([::1]:34162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ZnL-0008PZ-3G
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZWN-0002AL-UO
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:17:17 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:53049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZWL-0007TI-Vc
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:17:15 -0400
Received: by mail-wm1-x32e.google.com with SMTP id g10so4791142wmh.2
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 12:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M0B41l8DgGSa12niyjKzHwCDTjBJNRfJGB+oGiCv7dg=;
 b=fegvHx5OP2Ie5+W7AjJfvR6cN4HDnWqJD4TXaYURha36aAqDoYQPDJK3EJGCfqXYIO
 wD6hXyYquPfcjY27BbfisZuj4OghWHW/8xwMxqYNX5b3sbSvma8SPr4ZjJslnvhvyals
 knfFQzfltoKOU73loXl3ljxsIs0+G2XCyuoPvXGJShwCaADxwkmqGxxZENHR6ZQmHHaJ
 9tGRcdxkfn8Gi32CBBR4IkH9gQlLYkTx9OjoOCLxG3Ra34CdtFEf1kFNhUsq38DTcZPc
 iQfn6ymtkJFAmGBM5Ysa0QxaVjnlB4vAQ7telXIACMcStPgp2aH2vWPg7LOKoN/e+MlS
 NP8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M0B41l8DgGSa12niyjKzHwCDTjBJNRfJGB+oGiCv7dg=;
 b=pLdaK4lYhaCEzShAY+98ADWzAyuElj6q+m83t2go+BdcQGtXiZ5sqm7cJNwi0rKU7t
 LPfcWs5yN0DoJnd8zJlzhdq72kP/UQE+IOa9crdt2aUEoQBP5DYBZyGYVb8Ef6HW0r42
 xMG9BT/ozTWFN/t9Uo1R5luPpK8qhmjNJN+2WFJOjlEYFloSLThalOt2uCnuOlz0p96I
 N5GHM9+Jz4nPM0i9R3uqIezGDSWoGKT+gjy2GLtn46bic8e7Xe0Pl2ySCJT7Txledu9G
 rrW3xkKma8yyEd+9+qj1RwI3a7aUgFWj8IlShnQwcn9rkEYP8UpqIC9KiiRMIfSLS/9D
 8i7A==
X-Gm-Message-State: AOAM533oGUIy9Hijbw0pLdjKiQ/RL2fDxwLjjYk8uDQP75Cq3YDWhfUL
 6MjQPBglCapAJOhzdIDL0/EQXg==
X-Google-Smtp-Source: ABdhPJzigHqR3zWezb8xcAU73d3sGbTkUZK4VsTfqd+h5MMI1FL2OGCfD4scn+7iTMTo2o5IHi+KmA==
X-Received: by 2002:a05:600c:4fc7:: with SMTP id
 o7mr34389106wmq.16.1625771832637; 
 Thu, 08 Jul 2021 12:17:12 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m5sm9637964wmq.2.2021.07.08.12.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 12:17:11 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 97C5E1FFBB;
 Thu,  8 Jul 2021 20:09:45 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 34/39] docs/devel: tcg-plugins: add execlog plugin
 description
Date: Thu,  8 Jul 2021 20:09:36 +0100
Message-Id: <20210708190941.16980-35-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210708190941.16980-1-alex.bennee@linaro.org>
References: <20210708190941.16980-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, minyihh@uci.edu, berrange@redhat.com,
 kuhn.chenqun@huawei.com, f4bug@amsat.org, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexandre Iooss <erdnaxe@crans.org>

This adds description of the execlog TCG plugin with an example.

Signed-off-by: Alexandre Iooss <erdnaxe@crans.org>
Message-Id: <20210702081307.1653644-3-erdnaxe@crans.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/tcg-plugins.rst | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 0cd77c77d2..179867e9c1 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -320,3 +320,27 @@ the user to see what hardware is accessed how often. It has a number of options:
       off:0000001c, 1, 2
       off:00000020, 1, 2
       ...
+
+- contrib/plugins/execlog.c
+
+The execlog tool traces executed instructions with memory access. It can be used
+for debugging and security analysis purposes.
+Please be aware that this will generate a lot of output.
+
+The plugin takes no argument::
+
+  qemu-system-arm $(QEMU_ARGS) \
+    -plugin ./contrib/plugins/libexeclog.so -d plugin
+
+which will output an execution trace following this structure::
+
+  # vCPU, vAddr, opcode, disassembly[, load/store, memory addr, device]...
+  0, 0xa12, 0xf8012400, "movs r4, #0"
+  0, 0xa14, 0xf87f42b4, "cmp r4, r6"
+  0, 0xa16, 0xd206, "bhs #0xa26"
+  0, 0xa18, 0xfff94803, "ldr r0, [pc, #0xc]", load, 0x00010a28, RAM
+  0, 0xa1a, 0xf989f000, "bl #0xd30"
+  0, 0xd30, 0xfff9b510, "push {r4, lr}", store, 0x20003ee0, RAM, store, 0x20003ee4, RAM
+  0, 0xd32, 0xf9893014, "adds r0, #0x14"
+  0, 0xd34, 0xf9c8f000, "bl #0x10c8"
+  0, 0x10c8, 0xfff96c43, "ldr r3, [r0, #0x44]", load, 0x200000e4, RAM
-- 
2.20.1


