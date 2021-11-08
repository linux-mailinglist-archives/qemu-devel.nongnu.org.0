Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FDC447908
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 05:01:50 +0100 (CET)
Received: from [::1] (port=34614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjvqv-0000sF-9w
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 23:01:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvi5-0006s0-NA
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:41 -0500
Received: from [2607:f8b0:4864:20::12d] (port=33560
 helo=mail-il1-x12d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvhz-0002vK-Ii
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:38 -0500
Received: by mail-il1-x12d.google.com with SMTP id l19so15626568ilk.0
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 19:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oLmdczkCWtTXgS+hIrrLVL8jr4D4Q93OjOn0dkypiZQ=;
 b=8IjHAEf0T/07Kc4SeBfB/3a/wPPO1ToXqK/JENPSlvi7Iae9ioWVBd/0IqAAsbRaW+
 VOk8a5SEfF+2NOTYfbjXvZXvsEvMHOIqLSeoE1/1dD2ce0DMfYic3/0EzfJ8Bkl92N+e
 7CTDh4K/eTFKU6+a7WUBdPfyejxPu+10TBtqEKa/SuKP8/r1syAyzQt5g0K/3qDmTZwY
 c4KgkeR+YFngMANhGR9YdoPbSbTQ6tUMs1WWkXHoqLbiz/iflpzBbUY0+LxlHvk7aiIM
 fQmzSh5rk8ERIq1zZ2kk4jPUWIipeq+pSwKPfwxMvvOhKczSRTq6996Mv3QG1ppFn17S
 yxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oLmdczkCWtTXgS+hIrrLVL8jr4D4Q93OjOn0dkypiZQ=;
 b=B7+vKEmPdYbCiGvDes2RrAS9wkZyQ72VJsIhVK611/+wSkHjo5KGAXzUMRXsPYAWHf
 oQ70Q60dpsW0xjBj451kx/yJydRP4pQHi3QcjQgf4QXe2HTcCaTj2LdzNM4jU924UQpu
 WAXQ2saYV3TsZcGpW/tJ8sY6dpj4VYvNSx+lr76oLo/BjJVjeuZToMCpDQ3/oQU/4Rs9
 2wbOH2NskvcV9NUmaRtcfyPpP1dzMzMXMeDe+WFAzzUDdr9pG8/148oRZ9fzHdgPYtmu
 Y7uukcTqW8+OYpipKkZHImVt41WopvGrkSQLWKrM949JUOSu/Zs1GfLu1Ng6snzEjia2
 B3gQ==
X-Gm-Message-State: AOAM531nT/HgiYD4VNiK4/FxO4lokdwebOjcYBdsFHcBDa4cVLbcvvZ3
 2a9OfcYJVyrotezjtoin2T0SPSU/JvCBxQ==
X-Google-Smtp-Source: ABdhPJyAY2xjK7jP6X5K+EirXHF14L+LHzRS7SfPwzzE1XRiVIofKYJQ5eXxYXBVgJ8/NownPWo8Ig==
X-Received: by 2002:a05:6e02:174a:: with SMTP id
 y10mr9572350ill.68.1636343554472; 
 Sun, 07 Nov 2021 19:52:34 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:34 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 26/37] bsd-user/arm/target_arch_elf.h: arm defines for ELF
Date: Sun,  7 Nov 2021 20:51:25 -0700
Message-Id: <20211108035136.43687-27-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108035136.43687-1-imp@bsdimp.com>
References: <20211108035136.43687-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12d
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::12d;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12d.google.com
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@FreeBSD.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Basic set of defines needed for arm ELF file activation.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_elf.h | 36 ++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 bsd-user/arm/target_arch_elf.h

diff --git a/bsd-user/arm/target_arch_elf.h b/bsd-user/arm/target_arch_elf.h
new file mode 100644
index 0000000000..15b5c66511
--- /dev/null
+++ b/bsd-user/arm/target_arch_elf.h
@@ -0,0 +1,36 @@
+/*
+ *  arm ELF definitions
+ *
+ *  Copyright (c) 2013 Stacey D. Son
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+#ifndef _TARGET_ARCH_ELF_H_
+#define _TARGET_ARCH_ELF_H_
+
+#define ELF_START_MMAP 0x80000000
+#define ELF_ET_DYN_LOAD_ADDR    0x500000
+
+#define elf_check_arch(x) ((x) == EM_ARM)
+
+#define ELF_CLASS       ELFCLASS32
+#define ELF_DATA        ELFDATA2LSB
+#define ELF_ARCH        EM_ARM
+
+#define USE_ELF_CORE_DUMP
+#define ELF_EXEC_PAGESIZE       4096
+
+#define ELF_HWCAP 0
+
+#endif /* _TARGET_ARCH_ELF_H_ */
-- 
2.33.0


