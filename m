Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D249355776
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 17:13:01 +0200 (CEST)
Received: from localhost ([::1]:55304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTnO0-0001vj-4a
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 11:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lTnCY-0006go-Vl
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 11:01:11 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:36379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lTnCV-0005GD-HS
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 11:01:10 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 j20-20020a05600c1914b029010f31e15a7fso9487442wmq.1
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 08:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gefn2DRF/c8mvnspkmx+UtmiGg0K8qHxUAw9GiT4wuk=;
 b=eAw1pLo9G2o94juxdVy/cRhrcd4vMu9gtITKWYYYgtMI9xfAmcMCBAxm3QO5QDkJ4R
 H0RPeQW3yM7BLJwD4/vJmzerDGdCCeoJUt3ZWtkCtX64htDPOojpdnxdq2ZdVxpXSnz/
 5P9gftGdA37Mcgfjqf6GEKNO9W0DztI7bB/eiH7MmWG6wUdrb3gKCMWgtO+VMW4Ex/f1
 uNykkN4VUwPhftkccJwXRMXu+3x5aA68if0mzKVNFXWfSItbxg2m1nL8wc1ip5PyOEsv
 07Zdy4w+XVMHSykaqqbRXzhwv23/7OKdUMl4AzaqDzO5AXw0EMB+iiQ0a89Qo9FyboJU
 i/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gefn2DRF/c8mvnspkmx+UtmiGg0K8qHxUAw9GiT4wuk=;
 b=MvRBe9TYe/hBGoL1/nvi4RZw1jKAYFqw2xDl8DTftJGXw2vh5kUSdwIxTdytjBjxhD
 IJ/+WffH8qDy277O4sXwDbx7Uo9tdDnbt80p7caFTs9mjB8QPlc5YslQJWCX7n3S+NeE
 8o9kEORPzQzQabB8rgXPMu9a9/pPbBSToNRKRT6YrUFWt4p3+LRGbVlJ1BTrVIRyK44/
 ge/fBOANkHzwTzYbPmLQobOHW6Kmj1pZLPbhDRUjECxrarl1SuO7NP5j+l5UFvFCEq45
 BL78bfaMIevE58o9wVVziYYIEl8VzjzOY2qe/NM1UTbypIHV1Ur1H2Zqm3u2F1dR3f9B
 2b5A==
X-Gm-Message-State: AOAM531Z9n8Kz7PnTP913YL18jHggktHrQ3I7RQ/Pu8ht9s8im8D5OZc
 bAI/ssHrB619AyvrEnU8SaXiUg==
X-Google-Smtp-Source: ABdhPJxnuZAuodnBFwvlJ6cFYQ61AArBBJ6Ayi83usnQNdjhSUojp5aloPHwxNSRnLPN+/sRKfQFzQ==
X-Received: by 2002:a05:600c:4c95:: with SMTP id
 g21mr4423551wmp.182.1617721265471; 
 Tue, 06 Apr 2021 08:01:05 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q79sm3398247wme.11.2021.04.06.08.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 08:00:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D33171FF98;
 Tue,  6 Apr 2021 16:00:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 09/11] docs/system/gdb.rst: Document how to debug multicore
 machines
Date: Tue,  6 Apr 2021 16:00:39 +0100
Message-Id: <20210406150041.28753-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210406150041.28753-1-alex.bennee@linaro.org>
References: <20210406150041.28753-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Document how multicore machines appear to GDB when debugged
via the debug stub. This is particularly non-intuitive for
the "multiple heterogenous clusters" case, but unfortunately
as far as I know there is no way with the remote protocol
for the stub to tell gdb "I have 2 inferiors, please connect
to both", so the user must set it all up manually.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210325175023.13838-3-peter.maydell@linaro.org>
Message-Id: <20210401102530.12030-10-alex.bennee@linaro.org>

diff --git a/docs/system/gdb.rst b/docs/system/gdb.rst
index 0bb1bedf1b..144d083df3 100644
--- a/docs/system/gdb.rst
+++ b/docs/system/gdb.rst
@@ -45,6 +45,61 @@ Here are some useful tips in order to use gdb on system code:
 3. Use ``set architecture i8086`` to dump 16 bit code. Then use
    ``x/10i $cs*16+$eip`` to dump the code at the PC position.
 
+Debugging multicore machines
+============================
+
+GDB's abstraction for debugging targets with multiple possible
+parallel flows of execution is a two layer one: it supports multiple
+"inferiors", each of which can have multiple "threads". When the QEMU
+machine has more than one CPU, QEMU exposes each CPU cluster as a
+separate "inferior", where each CPU within the cluster is a separate
+"thread". Most QEMU machine types have identical CPUs, so there is a
+single cluster which has all the CPUs in it.  A few machine types are
+heterogenous and have multiple clusters: for example the ``sifive_u``
+machine has a cluster with one E51 core and a second cluster with four
+U54 cores. Here the E51 is the only thread in the first inferior, and
+the U54 cores are all threads in the second inferior.
+
+When you connect gdb to the gdbstub, it will automatically
+connect to the first inferior; you can display the CPUs in this
+cluster using the gdb ``info thread`` command, and switch between
+them using gdb's usual thread-management commands.
+
+For multi-cluster machines, unfortunately gdb does not by default
+handle multiple inferiors, and so you have to explicitly connect
+to them. First, you must connect with the ``extended-remote``
+protocol, not ``remote``::
+
+    (gdb) target extended-remote localhost:1234
+
+Once connected, gdb will have a single inferior, for the
+first cluster. You need to create inferiors for the other
+clusters and attach to them, like this::
+
+  (gdb) add-inferior
+  Added inferior 2
+  (gdb) inferior 2
+  [Switching to inferior 2 [<null>] (<noexec>)]
+  (gdb) attach 2
+  Attaching to process 2
+  warning: No executable has been specified and target does not support
+  determining executable automatically.  Try using the "file" command.
+  0x00000000 in ?? ()
+
+Once you've done this, ``info threads`` will show CPUs in
+all the clusters you have attached to::
+
+  (gdb) info threads
+    Id   Target Id         Frame
+    1.1  Thread 1.1 (cortex-m33-arm-cpu cpu [running]) 0x00000000 in ?? ()
+  * 2.1  Thread 2.2 (cortex-m33-arm-cpu cpu [halted ]) 0x00000000 in ?? ()
+
+You probably also want to set gdb to ``schedule-multiple`` mode,
+so that when you tell gdb to ``continue`` it resumes all CPUs,
+not just those in the cluster you are currently working on::
+
+  (gdb) set schedule-multiple on
+
 Advanced debugging options
 ==========================
 
-- 
2.20.1


