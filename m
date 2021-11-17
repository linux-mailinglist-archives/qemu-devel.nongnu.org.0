Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D314A454A96
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 17:10:15 +0100 (CET)
Received: from localhost ([::1]:50042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnNVm-0001s5-V3
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 11:10:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnNQA-0008T6-Fm
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:04:26 -0500
Received: from [2a00:1450:4864:20::336] (port=42768
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnNQ7-00031r-Mn
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:04:26 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so2524015wmd.1
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 08:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dYNbpTaiaVd2Z/SKkWoQWGZZQtH+SI9yqkf6sNwKdU8=;
 b=Ej+iHCvKyaNJmZN1e2iM9yPyAwXpv3gA6ebNn3tCwoxE0mVq3Wdgp/w2HJuuTJNiL7
 o/f1EkNIt6EL7XJ4XGXqPqmPsnP3Cb/l/LMGk7MaT5UV4R4Wc2YA+MR10RsQ4yd34FA+
 N1TdqGkYEkOkxodq49LGf79ZieaHdqabB+WMmbo6RJRfyzfP9ebZso7//OAm4xm4Lb+Z
 dNKZYuFunO1Wat9uSgO3qdxRqbIVU1QRZfVcuq8d9ttKrvzCoupu3AMntCXjZ28OJBE/
 W7kkoHCzY4lgCFSHxryhCeKTZuDaiIJIwJNeRycSO+tyh+TcW3BWUT7wJ1vP9J05K5Ta
 Lhxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dYNbpTaiaVd2Z/SKkWoQWGZZQtH+SI9yqkf6sNwKdU8=;
 b=xyYzMki2qa7sp3yTQO4sWLSpuKZMvF0ZvzRe022R52vJakQh33S8HWD9U/xGnsJFmp
 ax/fR9MFTQlaCGdG2g+On4hqGqE/zDnuP08x8JMCZcbC/CL4VWRAti4n4FqdwI+6w1uT
 Xdfwc11OWyIm21liQEofQiSGD8OC2/2crzSwuJH9Sbb5eSzSx64Cb5szsN8uDMCqOQHG
 mR1Y28sS8WgvwXaCnT7TkzfYMMizy4SjBqKALbSAGFWWtAY4KvdgquFGa0YeeH5+7s0o
 hFRcfDFV7/yT6dz6p3xbxxRfHLjrpZMrRZn3oZTftY7LjlOt8eO1BiMh2i5e1sG1rG64
 oNOQ==
X-Gm-Message-State: AOAM531sYultgPiexRenIu4Z1c9s/O7f5if4BVvRXl/LArpd9/MdnV3C
 hrG1l/fUe2YzbiSBX59pB/RsjZTqnH1XIK4b8rY=
X-Google-Smtp-Source: ABdhPJz4EDjgj3U7/SVoS8GHj+zqO/iZ4VvdHhvyd/YKs1jX9PgjxBpp5+4UJaC5bwKIQ6v2yxIBCQ==
X-Received: by 2002:a7b:c194:: with SMTP id y20mr905507wmi.61.1637165059312;
 Wed, 17 Nov 2021 08:04:19 -0800 (PST)
Received: from localhost.localdomain
 (101.red-176-80-44.dynamicip.rima-tde.net. [176.80.44.101])
 by smtp.gmail.com with ESMTPSA id m2sm5826742wml.15.2021.11.17.08.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 08:04:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 03/17] linux-user/safe-syscall.inc.S: Move to common-user
Date: Wed, 17 Nov 2021 17:03:58 +0100
Message-Id: <20211117160412.71563-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211117160412.71563-1-richard.henderson@linaro.org>
References: <20211117160412.71563-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu, imp@bsdimp.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Move all the safe_syscall.inc.S files to common-user. They are almost
identical between linux-user and bsd-user to re-use.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211113045603.60391-4-imp@bsdimp.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build                                                 | 2 ++
 {linux-user => common-user}/host/aarch64/hostdep.h          | 0
 {linux-user => common-user}/host/arm/hostdep.h              | 0
 {linux-user => common-user}/host/i386/hostdep.h             | 0
 {linux-user => common-user}/host/ppc64/hostdep.h            | 0
 {linux-user => common-user}/host/riscv/hostdep.h            | 0
 {linux-user => common-user}/host/s390x/hostdep.h            | 0
 {linux-user => common-user}/host/x86_64/hostdep.h           | 0
 {linux-user => common-user}/host/aarch64/safe-syscall.inc.S | 0
 {linux-user => common-user}/host/arm/safe-syscall.inc.S     | 0
 {linux-user => common-user}/host/i386/safe-syscall.inc.S    | 0
 {linux-user => common-user}/host/ppc64/safe-syscall.inc.S   | 0
 {linux-user => common-user}/host/riscv/safe-syscall.inc.S   | 0
 {linux-user => common-user}/host/s390x/safe-syscall.inc.S   | 0
 {linux-user => common-user}/host/x86_64/safe-syscall.inc.S  | 0
 15 files changed, 2 insertions(+)
 rename {linux-user => common-user}/host/aarch64/hostdep.h (100%)
 rename {linux-user => common-user}/host/arm/hostdep.h (100%)
 rename {linux-user => common-user}/host/i386/hostdep.h (100%)
 rename {linux-user => common-user}/host/ppc64/hostdep.h (100%)
 rename {linux-user => common-user}/host/riscv/hostdep.h (100%)
 rename {linux-user => common-user}/host/s390x/hostdep.h (100%)
 rename {linux-user => common-user}/host/x86_64/hostdep.h (100%)
 rename {linux-user => common-user}/host/aarch64/safe-syscall.inc.S (100%)
 rename {linux-user => common-user}/host/arm/safe-syscall.inc.S (100%)
 rename {linux-user => common-user}/host/i386/safe-syscall.inc.S (100%)
 rename {linux-user => common-user}/host/ppc64/safe-syscall.inc.S (100%)
 rename {linux-user => common-user}/host/riscv/safe-syscall.inc.S (100%)
 rename {linux-user => common-user}/host/s390x/safe-syscall.inc.S (100%)
 rename {linux-user => common-user}/host/x86_64/safe-syscall.inc.S (100%)

diff --git a/meson.build b/meson.build
index e2d38a43e6..c58abf0d0d 100644
--- a/meson.build
+++ b/meson.build
@@ -2878,10 +2878,12 @@ foreach target : target_dirs
     if 'CONFIG_LINUX_USER' in config_target
       base_dir = 'linux-user'
       target_inc += include_directories('linux-user/host/' / config_host['ARCH'])
+      target_inc += include_directories('common-user/host/' / config_host['ARCH'])
     endif
     if 'CONFIG_BSD_USER' in config_target
       base_dir = 'bsd-user'
       target_inc += include_directories('bsd-user/' / targetos)
+      target_inc += include_directories('common-user/host/' / config_host['ARCH'])
       dir = base_dir / abi
       arch_srcs += files(dir / 'target_arch_cpu.c')
     endif
diff --git a/linux-user/host/aarch64/hostdep.h b/common-user/host/aarch64/hostdep.h
similarity index 100%
rename from linux-user/host/aarch64/hostdep.h
rename to common-user/host/aarch64/hostdep.h
diff --git a/linux-user/host/arm/hostdep.h b/common-user/host/arm/hostdep.h
similarity index 100%
rename from linux-user/host/arm/hostdep.h
rename to common-user/host/arm/hostdep.h
diff --git a/linux-user/host/i386/hostdep.h b/common-user/host/i386/hostdep.h
similarity index 100%
rename from linux-user/host/i386/hostdep.h
rename to common-user/host/i386/hostdep.h
diff --git a/linux-user/host/ppc64/hostdep.h b/common-user/host/ppc64/hostdep.h
similarity index 100%
rename from linux-user/host/ppc64/hostdep.h
rename to common-user/host/ppc64/hostdep.h
diff --git a/linux-user/host/riscv/hostdep.h b/common-user/host/riscv/hostdep.h
similarity index 100%
rename from linux-user/host/riscv/hostdep.h
rename to common-user/host/riscv/hostdep.h
diff --git a/linux-user/host/s390x/hostdep.h b/common-user/host/s390x/hostdep.h
similarity index 100%
rename from linux-user/host/s390x/hostdep.h
rename to common-user/host/s390x/hostdep.h
diff --git a/linux-user/host/x86_64/hostdep.h b/common-user/host/x86_64/hostdep.h
similarity index 100%
rename from linux-user/host/x86_64/hostdep.h
rename to common-user/host/x86_64/hostdep.h
diff --git a/linux-user/host/aarch64/safe-syscall.inc.S b/common-user/host/aarch64/safe-syscall.inc.S
similarity index 100%
rename from linux-user/host/aarch64/safe-syscall.inc.S
rename to common-user/host/aarch64/safe-syscall.inc.S
diff --git a/linux-user/host/arm/safe-syscall.inc.S b/common-user/host/arm/safe-syscall.inc.S
similarity index 100%
rename from linux-user/host/arm/safe-syscall.inc.S
rename to common-user/host/arm/safe-syscall.inc.S
diff --git a/linux-user/host/i386/safe-syscall.inc.S b/common-user/host/i386/safe-syscall.inc.S
similarity index 100%
rename from linux-user/host/i386/safe-syscall.inc.S
rename to common-user/host/i386/safe-syscall.inc.S
diff --git a/linux-user/host/ppc64/safe-syscall.inc.S b/common-user/host/ppc64/safe-syscall.inc.S
similarity index 100%
rename from linux-user/host/ppc64/safe-syscall.inc.S
rename to common-user/host/ppc64/safe-syscall.inc.S
diff --git a/linux-user/host/riscv/safe-syscall.inc.S b/common-user/host/riscv/safe-syscall.inc.S
similarity index 100%
rename from linux-user/host/riscv/safe-syscall.inc.S
rename to common-user/host/riscv/safe-syscall.inc.S
diff --git a/linux-user/host/s390x/safe-syscall.inc.S b/common-user/host/s390x/safe-syscall.inc.S
similarity index 100%
rename from linux-user/host/s390x/safe-syscall.inc.S
rename to common-user/host/s390x/safe-syscall.inc.S
diff --git a/linux-user/host/x86_64/safe-syscall.inc.S b/common-user/host/x86_64/safe-syscall.inc.S
similarity index 100%
rename from linux-user/host/x86_64/safe-syscall.inc.S
rename to common-user/host/x86_64/safe-syscall.inc.S
-- 
2.25.1


