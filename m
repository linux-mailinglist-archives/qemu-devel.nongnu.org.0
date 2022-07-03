Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 971BA56467B
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 11:42:53 +0200 (CEST)
Received: from localhost ([::1]:49278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7w7w-0001po-NR
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 05:42:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7vSg-00059v-L0
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 05:00:17 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:42674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7vSU-0004D9-LM
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 05:00:04 -0400
Received: by mail-pg1-x534.google.com with SMTP id o18so5104204pgu.9
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 02:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZpM2xT691aOsaTZd6sDap5X966f+8/CDqP5hDIUEL28=;
 b=OoS95rA5srGalUbqm8NyXlImTqjx5VpxWF3D4I0WeXK/azsNCV9zxm+7CSWFVMvCjU
 5fwIp96zM0pwmGRW02OcWXa3CEvo+cnN5ghiU+8FavtQv+diM/eba1iFP1ZWcJdUAQwO
 GhBWowrJDF6Z2QDemKTQwSSmysxmI+QR5wfyoxVB3n2PLrx1NTczbb7oSGRXH2Ma3ZyP
 CaiI/+Jj0GD1k2SE9vLN6ZamSWA4TStTHvoge+MDc4E96flwWSoarC4uSzYOjaYknn6v
 jHrWE6Q0H/tcSPevq9UPwoTlzF+cBvQZpmu6Z7XE0ydINo9h6spfn7eZ+c603SLyg8mX
 7AEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZpM2xT691aOsaTZd6sDap5X966f+8/CDqP5hDIUEL28=;
 b=aEqXWEoJnm4CKnGVL3lUQZyNnbYnu22g8Qs+iuRB5bXDHjq7EZxX5hKIVqeNygwkp1
 ipitwGqkAuNgFMGgo/UYPpPTfUg6w8Tcne8tHzlsXYUKW43mA8HiHHgV9tcVGrZDe6La
 Inra5P5Rpy7vGB6un3l2C24xdlRUDy04CjUgNaxhTB1vHzP6rN57Q9iRBkIVBJWdRlR1
 qlH7jz6PPM3B4BDjFM6h/EW+RCT2g+Rj/2Kcwapx5iy3wlJWLR7LxhibfPXyCSY/vE3J
 uufQYP9TYdqZYEMOOIMOnpcGmGZ3mtcdF0/bIykAC/Ini9HiGwTMq6iBv24SHOVTtt3A
 angQ==
X-Gm-Message-State: AJIora9/5QrF7XHrTcq4ttuyOUNJKXwfRu9YqLD0kKULfAtArLT7Casn
 4IiFLrF8ef/qxGXZrp7FAvd7VWCo3UIaPI4w
X-Google-Smtp-Source: AGRyM1sDXW4fhhw+/Co0lAUCuGQwNRDCNZ0bYzfebRoA30xOAfBED6zhGRQAFMWbR7h4T/TKq7QqPQ==
X-Received: by 2002:a63:35c4:0:b0:40c:99f6:8889 with SMTP id
 c187-20020a6335c4000000b0040c99f68889mr19455689pga.387.1656838800274; 
 Sun, 03 Jul 2022 02:00:00 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 cq16-20020a056a00331000b00518764d09cdsm18777593pfb.164.2022.07.03.01.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:59:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PATCH v21 13/13] target/loongarch: Update README
Date: Sun,  3 Jul 2022 14:29:13 +0530
Message-Id: <20220703085913.772936-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703085913.772936-1-richard.henderson@linaro.org>
References: <20220703085913.772936-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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


