Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 759F62B97A1
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 17:20:52 +0100 (CET)
Received: from localhost ([::1]:49242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfmfz-00027w-HI
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 11:20:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kfmct-0007jO-7i
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:17:39 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:40779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kfmcp-0006V0-FV
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:17:38 -0500
Received: by mail-wm1-x343.google.com with SMTP id a3so7255541wmb.5
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 08:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yVxKoMCNOb0M91+IB4bEHuCMrgq5vsUnaIKYxB1d630=;
 b=dDwV2HOOETBDkUsCMTNHCyuyyqzdt3cOrYoC7qLG+IxqEmTiqd8zVzLhTe/ge0DNg0
 YQs/xgU/vxsBu7TBXEQgdUpwbb+PY+Xor+Xqpb7ZRmlt8SXneHMUHroxQcGetjImCCpE
 Lpqk7iwzAuaPVX/XnBvx6im9L8KQKCnAuNhR8b2/Ob7dHWblsLK81tfFJDSjaDUMOKww
 E8oMkNLWKwC7aQshAPNK7jkeNizEuCX9lNK+E4tCLZeATOtnDucMXHWeIHFfUCQKElbU
 YaTRpNBAul1nMGaynZm/9DJ//4k5NS8A2ViH2EHooRzO27Cr8iM+z6Ta91cRsHIDOQ3+
 SgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yVxKoMCNOb0M91+IB4bEHuCMrgq5vsUnaIKYxB1d630=;
 b=Zc4F/4pRqIvtn4H/QfPaKl5bMlPyNSGSKvxNO/5pZN5A92fpfoDKqbxi3GLUFksZmC
 JgLKnuq9QMInxwidiK9q9L4xqnFH+0Flyb5S4RSiHFkXSX7nucmrz145Ht7qHAWnGsTx
 UEggliCNpV1hUj84tD7yuSxQ10pNac9GEgb/5qugRxNowVqCZ14l4ZZyvQvfFjd6SQyK
 cU0X1uDO+3H71f7UWLZbjcmi7lsCUM90EsJ/cnH3Q9wAhDhKcNykxF6afRoeATbhnfAk
 3aVOgNN6vhqErCvMpWAS988PZO5lVX2RFTZmI6kqXksEK5a4151UnLN9cuxEpKuCc4Zx
 Bf1Q==
X-Gm-Message-State: AOAM533kfncOIoH0oVNzE7zRfdc9f4TJWK5hqQO4f8ZAUAnY+P+uT7sx
 5MlSsuw3YWMlzq3Mp7ldub78VUHM44E=
X-Google-Smtp-Source: ABdhPJyQMKDqqtDvaS0yImovipER8E5lurtCERQLOi6XOKGhEV1J8r7wbuzJOFN+OGB+9K+1aY9j7g==
X-Received: by 2002:a1c:56c4:: with SMTP id k187mr5368084wmb.92.1605802648205; 
 Thu, 19 Nov 2020 08:17:28 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id t7sm323418wrp.26.2020.11.19.08.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 08:17:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] default-configs: Support o32 ABI with 64-bit MIPS CPUs
Date: Thu, 19 Nov 2020 17:17:09 +0100
Message-Id: <20201119161710.1985083-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201119161710.1985083-1-f4bug@amsat.org>
References: <20201119161710.1985083-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Fredrik Noring <noring@nocrew.org>, David Daney <ddaney.cavm@gmail.com>,
 Mathieu Malaterre <malat@debian.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 YunQiang Su <wzssyqa@gmail.com>, James Cowgill <james410@cowgill.org.uk>,
 "Maciej W . Rozycki" <macro@linux-mips.org>,
 =?UTF-8?q?J=C3=BCrgen=20Urban?= <JuergenUrban@gmx.de>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MIPS o32 ABI on 64-bit CPUs looks like a ILP32-on-64bit data
model, allowing 64-bit arithmetic and data movement instructions.

This is the default ABI used by the "Sony Linux Toolkit for
Playstation 2".

As we don't know big-endian uses, we only introduce the
little-endian variant.

Inspired-by: Richard Henderson <rth@twiddle.net>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Fredrik Noring <noring@nocrew.org>
Cc: Maciej W. Rozycki <macro@linux-mips.org>
Cc: Jürgen Urban <JuergenUrban@gmx.de>

Cc from https://lists.debian.org/debian-mips/2015/05/msg00014.html:
Cc: Mathieu Malaterre <malat@debian.org>
Cc: James Cowgill <james410@cowgill.org.uk>
Cc: YunQiang Su <wzssyqa@gmail.com>
Cc: David Daney <ddaney.cavm@gmail.com>
---
 docs/user/main.rst                                 | 3 +++
 default-configs/targets/mips64o32el-linux-user.mak | 7 +++++++
 2 files changed, 10 insertions(+)
 create mode 100644 default-configs/targets/mips64o32el-linux-user.mak

diff --git a/docs/user/main.rst b/docs/user/main.rst
index 8dfe232a3af..2cef1320ff3 100644
--- a/docs/user/main.rst
+++ b/docs/user/main.rst
@@ -211,6 +211,9 @@ Other binaries
 
    * ``qemu-mipsel`` executes 32-bit little endian MIPS binaries (MIPS O32 ABI).
 
+   * ``qemu-mips64o32el`` executes 64-bit little endian MIPS binaries (MIPS O32
+     ABI).
+
    * ``qemu-mips64`` executes 64-bit big endian MIPS binaries (MIPS N64 ABI).
 
    * ``qemu-mips64el`` executes 64-bit little endian MIPS binaries (MIPS N64
diff --git a/default-configs/targets/mips64o32el-linux-user.mak b/default-configs/targets/mips64o32el-linux-user.mak
new file mode 100644
index 00000000000..ecd57ff949f
--- /dev/null
+++ b/default-configs/targets/mips64o32el-linux-user.mak
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


