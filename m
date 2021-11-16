Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1FE452FCA
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 12:05:04 +0100 (CET)
Received: from localhost ([::1]:46362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmwGt-00049j-Tg
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 06:05:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmwF0-0001Si-F1
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:03:06 -0500
Received: from [2a00:1450:4864:20::331] (port=53861
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmwEy-0004uu-OO
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:03:06 -0500
Received: by mail-wm1-x331.google.com with SMTP id y196so16500353wmc.3
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 03:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zpDSDxGnP0doBblMTguXufreu6LAli0ayiyl7WMNWJY=;
 b=gtInK6CVcGXqXM/aehZyaCSy6jDxd7riN9nIfVMNUjMYehddmqPrFnpkqLjzexupmY
 cfwupq0cPqlIj/M12/aZ7hn26zfnWb3gx2NByu0bOu/p88rqXpT1x1b+nObC0exi6H0/
 vZH4NPwHVmVU+Yf8Aofurta5avu4INciB5zXJVLw+MrNiMzCJoVoRLekfrJE91s8lo1V
 ymzGUF4hhIoCOqiseeb1a7PMjoD/Ahy3802dpKZWWhiChj8khvfvf9Syk6HTh1yf7kd+
 nnU/ULyD7zxO97Ci8a3OS0/ISpWz/M6D6J6lY0T7cFzk2XrFQy71YQq4HMpysvgA746M
 jbNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zpDSDxGnP0doBblMTguXufreu6LAli0ayiyl7WMNWJY=;
 b=hgDzypiZFUw2A1qXyKONw60BeXg56tI2bmt7zK6jDh0xRHRYj5cASy2imOVZTfGs3y
 nCusYvusP4088szHyuX0o6UIgXy0wZcQa1KRnUZQDIFz7n1BKxI7dJavRfPp2X7cMgtx
 jbxnQgZxVINFgLipYPYwPa4MA5hi+lk+lI6B1UjV6O0WV5lA3Kqvaaly1QaPoSuL9+w+
 b1b89bARu9AweVg16TjxFMfNGt0QKEdO6mKJv/WOvZamFhsbU1BnAdr5dqlePCcOENc2
 vPbN+A8R38Ke4b07Ox2v40yIBnwjpk6q+HWCgOz4YK7eVXns1061R5hEPGQfaFPpCDI2
 cAuw==
X-Gm-Message-State: AOAM530drLIi5s7OOvRsXyxzMNoyLtWzwbeWY3u2oy8bODtRk/cGW0sE
 4IuyJTWOVRyVk3dPaGCI0R89Vq6my3ZIbyxUHzg=
X-Google-Smtp-Source: ABdhPJwozH/di64UH16zNrvU4qgDwEgiC8yLb5KiwZEwAQnKHxElVRSYMnz6bSDfhYcr8bfAZiAupQ==
X-Received: by 2002:a05:600c:1d06:: with SMTP id
 l6mr6430534wms.97.1637060583378; 
 Tue, 16 Nov 2021 03:03:03 -0800 (PST)
Received: from localhost.localdomain
 (145.red-37-158-173.dynamicip.rima-tde.net. [37.158.173.145])
 by smtp.gmail.com with ESMTPSA id f15sm2639779wmg.30.2021.11.16.03.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 03:03:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/9] linux-user/safe-syscall.inc.S: Move to common-user
Date: Tue, 16 Nov 2021 12:02:50 +0100
Message-Id: <20211116110256.365484-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116110256.365484-1-richard.henderson@linaro.org>
References: <20211116110256.365484-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Move all the safe_syscall.inc.S files to common-user. They are almost
identical between linux-user and bsd-user to re-use.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211113045603.60391-4-imp@bsdimp.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build                                                 | 1 +
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
 15 files changed, 1 insertion(+)
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
index ccc6cefc25..ec22cf05c1 100644
--- a/meson.build
+++ b/meson.build
@@ -2878,6 +2878,7 @@ foreach target : target_dirs
     if 'CONFIG_LINUX_USER' in config_target
       base_dir = 'linux-user'
       target_inc += include_directories('linux-user/host/' / config_host['ARCH'])
+      target_inc += include_directories('common-user/host/' / config_host['ARCH'])
     endif
     if 'CONFIG_BSD_USER' in config_target
       base_dir = 'bsd-user'
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


