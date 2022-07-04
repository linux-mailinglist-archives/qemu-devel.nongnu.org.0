Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDC5565149
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 11:49:52 +0200 (CEST)
Received: from localhost ([::1]:37098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8IiG-0000c4-1d
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 05:49:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ITf-0000rf-V1
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:34:47 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:39526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ITa-0004ys-Fa
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:34:47 -0400
Received: by mail-pg1-x529.google.com with SMTP id q82so1268027pgq.6
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 02:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZpM2xT691aOsaTZd6sDap5X966f+8/CDqP5hDIUEL28=;
 b=iWuCx4VpqAeKD5SFKHBUshW6V0ZF2Cfbp2smIhfW/cvO6S+SfPXGOq2EsQQF6t/5yk
 I3rPwBtOKgkcJmiY1pXEYWZIpjL4zEVOByuc+nFG11RP2hs2EqZsvcuooLFvI1dOBKPM
 Fq6r6twd4jyx0+nzc0SJ7f/9FnUxaqLFQwn6/ug0OR6XAfTINCmfaorstsFL85s059FR
 PgkqkOEYC5XdVx4rbgdNI6IJ1IabRh/IASoQdX1pHEXnwr1X59L6HprbG12lfJsh2UOL
 QJv5pRI63c4tWZP/RywvnH7ZJpYGKlsP0M361pIS5Xf53itGLgmZV5v2lzGrsyRynvlW
 YLpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZpM2xT691aOsaTZd6sDap5X966f+8/CDqP5hDIUEL28=;
 b=hZdA9i5Efd8gpxEC/Z+6brs/20DT5paxKp+gBNhKyFGRxVSiCbkekhTQuckHyzPfuD
 1XrOMTWEcx5RVlfiz2DhHsMKJU0xPupo//SD+NtpR5/5pvi/bB8D9G/peI+sl23R5oHN
 rcRqgnzxi1odDN9Esg4J4VIfNTxJikMcf9FkqmrYNJQzi9w0c7NnM6gAwnX0GFUwQ0BC
 /5QXuRcdDGBKpjK+5fsmAuLzaOZvyidCrs8k1wMi3ikPq0XZ9M00oOGLbswbBsv8fR/Y
 WcK3EjdqgiHVzT9xtgt15ekPkp5xowNBfoxjhjAF7yWJiifxyxc4TOPh6RKVYLXM1Tfn
 ARgg==
X-Gm-Message-State: AJIora++uCrihRntgTm+EK/Nj8XAWkp1FZiL+gQ9tKXbPBM3+tup97tr
 afqSa30UmaBDs+UBkap4bAESbm/kpiVhVM/L
X-Google-Smtp-Source: AGRyM1u6/czdPhxi9mtl0YKYVowz1IHFEgJwWgHHugFnorKR+zjpWvk2FhdI/2ZPRA8iVEsIXJ9LOQ==
X-Received: by 2002:a63:f70c:0:b0:412:1877:7e1c with SMTP id
 x12-20020a63f70c000000b0041218777e1cmr8859077pgh.621.1656927280233; 
 Mon, 04 Jul 2022 02:34:40 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 z5-20020aa79e45000000b00525b7f3e906sm15353355pfq.27.2022.07.04.02.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 02:34:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PULL 13/23] target/loongarch: Update README
Date: Mon,  4 Jul 2022 15:03:47 +0530
Message-Id: <20220704093357.983255-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220704093357.983255-1-richard.henderson@linaro.org>
References: <20220704093357.983255-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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

From: Song Gao <gaosong@loongson.cn>

Add linux-user emulation introduction

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220624031049.1716097-14-gaosong@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/README | 39 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/target/loongarch/README b/target/loongarch/README
index 4dcd0f1682..9f5edd10c8 100644
--- a/target/loongarch/README
+++ b/target/loongarch/README
@@ -24,9 +24,9 @@
 
     Download cross-tools.
 
-      wget https://github.com/loongson/build-tools/releases/latest/download/loongarch64-clfs-20211202-cross-tools.tar.xz
+      wget https://github.com/loongson/build-tools/releases/download/2022.05.29/loongarch64-clfs-5.0-cross-tools-gcc-full.tar.xz
 
-      tar -vxf loongarch64-clfs-20211202-cross-tools.tar.xz -C /opt
+      tar -vxf loongarch64-clfs-5.0-cross-tools-gcc-full.tar.xz -C /opt
 
     Config cross-tools env.
 
@@ -60,5 +60,40 @@
 
     ./build/qemu-system-loongarch64 -machine virt -m 4G -cpu Loongson-3A5000 -smp 1 -kernel build/tests/tcg/loongarch64-softmmu/hello -monitor none -display none -chardev file,path=hello.out,id=output -serial chardev:output
 
+- Linux-user emulation
+
+  We already support Linux user emulation. We can use LoongArch cross-tools to build LoongArch executables on X86 machines,
+  and We can also use qemu-loongarch64 to run LoongArch executables.
+
+  1. Config cross-tools env.
+
+     see System emulation.
+
+  2. Test tests/tcg/multiarch.
+
+     ./configure  --static  --prefix=/usr  --disable-werror --target-list="loongarch64-linux-user" --enable-debug
+
+     cd build
+
+     make && make check-tcg
+
+  3. Run LoongArch system basic command with loongarch-clfs-system.
+
+     - Config clfs env.
+
+       wget https://github.com/loongson/build-tools/releases/download/2022.05.29/loongarch64-clfs-system-5.0.tar.bz2
+
+       tar -vxf loongarch64-clfs-system-5.0.tar.bz2 -C /opt/clfs
+
+       cp /opt/clfs/lib64/ld-linux-loongarch-lp64d.so.1  /lib64
+
+       export LD_LIBRARY_PATH="/opt/clfs/lib64"
+
+     - Run LoongArch system basic command.
+
+       ./qemu-loongarch64  /opt/clfs/usr/bin/bash
+       ./qemu-loongarch64  /opt/clfs/usr/bin/ls
+       ./qemu-loongarch64  /opt/clfs/usr/bin/pwd
+
 - Note.
   We can get the latest LoongArch documents or LoongArch tools at https://github.com/loongson/
-- 
2.34.1


