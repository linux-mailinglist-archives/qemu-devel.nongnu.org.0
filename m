Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A2B31B204
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:33:45 +0100 (CET)
Received: from localhost ([::1]:59030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBMDI-0000eG-5I
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:33:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLiT-0000lt-3U
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:01:53 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:40898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLiR-0004ed-O0
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:01:52 -0500
Received: by mail-wm1-x336.google.com with SMTP id o24so5809312wmh.5
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 10:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n3Ruy+Xz1agjPvsuiBU7vncCZhEJuePdDDqrAtuEmMk=;
 b=aOPQCOR5VVDODm+YYA2dWOcWVSqjP82C64DlckI4snPkGSq5SqDsnBo4yLvmg9zhrb
 KfkzkS0zyo6PNTww8FRQ/hiQ/Gtu6I88zjZb12daqJcxsq5AEZQpp3D/OsXvVXunsu16
 qzNXz5N/BhngNxaUJGJgbIJraOJKIKCC11NQVbvAAvkCl7oKKpXmhy1XPV/l8U5ys9QH
 7zD7siIx5kN9TIdnbeHI6vWzAY/eWVgBDs7eFNBfR4bhgp88nT4bPMGME6fvwEpoTfNH
 XkTRZ2Ux1wFS+jD5D1B6l2+CV/NNQgPUjOzIfpX/9D978NGdpAF8D84MzdtBg1Yv9xQX
 8+vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=n3Ruy+Xz1agjPvsuiBU7vncCZhEJuePdDDqrAtuEmMk=;
 b=HIcoI8oAKIRnbpG1nhuyN+fQrvsmL5n/UshbjAbJ8jDz5W5oTxPAGHMavafVOW1NYM
 lD321zL49+wy23/G5ggSUBoy/wdFKVhEs1L/cE+EB/EW++cMvJSwItu2ueJ3KelNuMdU
 93U/p3T2xoSp+ejL29aUBoPhS2n6UniIdz2j4h0qcj05cW3gbyI1V46aikUfwg1P2Xf/
 kKN4zzFxykeWZEFXandxeHABEf5AcQfXbd3/IrtsFOj9yxfVw2+xxg8LOLmZ+cv1G00m
 zcIKOxnjQ+SJBFlb63DgcsRqyKuaIy7xsibibwNh4u03g8j6MWfROaHfL43PdZiha7kD
 lEKQ==
X-Gm-Message-State: AOAM532ekDm3yBXCWJT3Udy7aI3Gr6B7ZYFxBLHjGpVCU9klVXGDgZHu
 TSXI4eQZKTPSxchOXykdzgHDkB5HweM=
X-Google-Smtp-Source: ABdhPJzjdZf/c25iP5AS3GOJtk1l6iNOF7TOdb1z21ywbVQUqdcF/P7C2bT7qmyQ7FyhrorFxQkJ6w==
X-Received: by 2002:a1c:c904:: with SMTP id f4mr11173025wmb.14.1613325710056; 
 Sun, 14 Feb 2021 10:01:50 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id l1sm20040169wmi.48.2021.02.14.10.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 10:01:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 31/42] default-configs: Support o32 ABI with R5900 64-bit
 MIPS CPU
Date: Sun, 14 Feb 2021 18:59:01 +0100
Message-Id: <20210214175912.732946-32-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210214175912.732946-1-f4bug@amsat.org>
References: <20210214175912.732946-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
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
Cc: Fredrik Noring <noring@nocrew.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MIPS o32 ABI on 64-bit CPUs looks like a ILP32-on-64bit data
model, allowing 64-bit arithmetic and data movement instructions.

Since this ABI seems to have only ever been used for the
development of the PS2 with the "Sony Linux Toolkit for
Playstation 2" targetting the R5900 CPU (little-endian),
we name this user-mode target 'r5900o32el'.

Inspired-by: Richard Henderson <rth@twiddle.net>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: Rename qemu-mips64o32el -> qemu-r5900o32el (Fredrik)
---
 docs/user/main.rst                                | 3 +++
 default-configs/targets/r5900o32el-linux-user.mak | 7 +++++++
 2 files changed, 10 insertions(+)
 create mode 100644 default-configs/targets/r5900o32el-linux-user.mak

diff --git a/docs/user/main.rst b/docs/user/main.rst
index 8dfe232a3af..405acb8155e 100644
--- a/docs/user/main.rst
+++ b/docs/user/main.rst
@@ -221,6 +221,9 @@ Other binaries
    * ``qemu-mipsn32el`` executes 32-bit little endian MIPS binaries (MIPS N32
      ABI).
 
+   * ``qemu-r5900o32el`` executes 64-bit little endian MIPS R5900 binaries (MIPS
+     O32 ABI).
+
 -  user mode (NiosII)
 
    * ``qemu-nios2`` TODO.
diff --git a/default-configs/targets/r5900o32el-linux-user.mak b/default-configs/targets/r5900o32el-linux-user.mak
new file mode 100644
index 00000000000..ecd57ff949f
--- /dev/null
+++ b/default-configs/targets/r5900o32el-linux-user.mak
@@ -0,0 +1,7 @@
+TARGET_ARCH=mips64
+TARGET_BASE_ARCH=mips
+TARGET_ABI_MIPSO32=y
+TARGET_ABI32=y
+TARGET_SYSTBL_ABI=o32
+TARGET_SYSTBL=../mips/syscall_o32.tbl
+TARGET_ALIGNED_ONLY=y
-- 
2.26.2


