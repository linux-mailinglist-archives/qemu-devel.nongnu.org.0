Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E60D74478A6
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 03:47:12 +0100 (CET)
Received: from [::1] (port=47052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjugh-000454-SY
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 21:47:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjudd-0001jF-Lf
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 21:44:05 -0500
Received: from [2607:f8b0:4864:20::731] (port=45791
 helo=mail-qk1-x731.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjudb-0005Yo-PW
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 21:44:01 -0500
Received: by mail-qk1-x731.google.com with SMTP id n15so14243446qkp.12
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 18:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UsOSCtGoBAQxcg5JxOa/5YjOm67k4i+bTjj+7kzrnNs=;
 b=w9LuMrJ1LOJo3Bfr/YUWkhlGMr6JTdgZyvfSHUHfHO3P9EMsXIFolPjUvYwoG9vgjr
 bNX51vXhcP2UrT/WQP2NpAhojkd3mDxBd+/lih+k3UFkECYa33Co2JgumYpOr4BffEzT
 JzDFmZMo1YUAQ7osP5gZq2f+ciSGOJntAyALZ1CpQtIstptDR/KRNVqcdbNtY8UpTg6k
 5JtdCSeTGziv3RortQ/jaHZv/IWXQCa2QVFJ7VtqR/pyyAzmb9IhNxoHDmWVnie4Ybvd
 l9UjYeF84DP6ffFr+G7yZ+oSbNB3AKMFr7OmIZXI0kyeCkSTxXnwZ4cPdfC4QLiaqnj/
 jyRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UsOSCtGoBAQxcg5JxOa/5YjOm67k4i+bTjj+7kzrnNs=;
 b=hyAN6bL+7jPzcD7FwNQsGdTz32XfcGXOrjp7ALZXFdVcc6n0gOaXKNCS+roJ8D9LLq
 EI7LhX7aEg+uHfONAz4Zn183sV9VR3dlM8V/ZaaADWaLZN+T/SyabbDXmJqoaUqeru29
 07BJ8wxAoL7pbdPmINKF1x0TbtV56t775uv/Zo/zQaLM2LSJBCdrBPLd3RuXqp9yQDi6
 J9blmRtgsWcTvEM1bAMYMtP7/HRZOIi2dr//uaSnJNGe894RnmdAF9ICPAVx/0Hg99F2
 ezO8hMthDvZrl1iBhGQ/pyci2P9IhofufPzL0Nh7qZX3WzjGegvvGtX+xl+tjXsI+hoy
 N/ow==
X-Gm-Message-State: AOAM531stJ8y0hsJbvIFelodoqM82EaR6XRvXD/SpoT+LpXqhVHn18Dp
 WZdPV1iwYtglYECuHGeAcqMBf/8YepLoUA==
X-Google-Smtp-Source: ABdhPJwfwmYorrbfMHuc3HW0G10OPjWRYuzY6HcoB2bGXx2XiYY1XGwbelO21SE5BnyBf8hJl5VEyQ==
X-Received: by 2002:a05:6638:14c2:: with SMTP id
 l2mr8438156jak.45.1636339093287; 
 Sun, 07 Nov 2021 18:38:13 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id m2sm9030284iow.6.2021.11.07.18.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 18:38:12 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [RFC 3/4] linux-user/safe-syscall.inc.S: Move to common-user
Date: Sun,  7 Nov 2021 19:37:37 -0700
Message-Id: <20211108023738.42125-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108023738.42125-1-imp@bsdimp.com>
References: <20211108023738.42125-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::731
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::731;
 envelope-from=imp@bsdimp.com; helo=mail-qk1-x731.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 Philippe Mathieu-Daude <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move all the safe_syscall.inc.S files to common-user. They are almost
identical between linux-user and bsd-user to re-use.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 {linux-user => common-user}/host/aarch64/safe-syscall.inc.S | 0
 {linux-user => common-user}/host/arm/safe-syscall.inc.S     | 0
 {linux-user => common-user}/host/i386/safe-syscall.inc.S    | 0
 {linux-user => common-user}/host/ppc64/safe-syscall.inc.S   | 0
 {linux-user => common-user}/host/riscv/safe-syscall.inc.S   | 0
 {linux-user => common-user}/host/s390x/safe-syscall.inc.S   | 0
 {linux-user => common-user}/host/x86_64/safe-syscall.inc.S  | 0
 meson.build                                                 | 1 +
 8 files changed, 1 insertion(+)
 rename {linux-user => common-user}/host/aarch64/safe-syscall.inc.S (100%)
 rename {linux-user => common-user}/host/arm/safe-syscall.inc.S (100%)
 rename {linux-user => common-user}/host/i386/safe-syscall.inc.S (100%)
 rename {linux-user => common-user}/host/ppc64/safe-syscall.inc.S (100%)
 rename {linux-user => common-user}/host/riscv/safe-syscall.inc.S (100%)
 rename {linux-user => common-user}/host/s390x/safe-syscall.inc.S (100%)
 rename {linux-user => common-user}/host/x86_64/safe-syscall.inc.S (100%)

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
diff --git a/meson.build b/meson.build
index 26c58123e9..6f7acc8936 100644
--- a/meson.build
+++ b/meson.build
@@ -2883,6 +2883,7 @@ foreach target : target_dirs
     if 'CONFIG_LINUX_USER' in config_target
       base_dir = 'linux-user'
       target_inc += include_directories('linux-user/host/' / config_host['ARCH'])
+      target_inc += include_directories('common-user/host/' / config_host['ARCH'])
     endif
     if 'CONFIG_BSD_USER' in config_target
       base_dir = 'bsd-user'
-- 
2.33.0


