Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D01695559
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 01:29:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRjB4-0007PD-Ht; Mon, 13 Feb 2023 19:28:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pRjB2-0007Nc-3Q
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 19:28:08 -0500
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pRjB0-0005z7-BG
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 19:28:07 -0500
Received: by mail-il1-x131.google.com with SMTP id v13so4271526iln.4
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 16:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E52lvXAV4jnwfoAfchHD4x98Su75UpFmWttI3qxLtLo=;
 b=DCyI9q6pqmi6cmGnlY+UyuMxUfjpu0dq9YMpCDxW0iU3/OJnYsu5JCMnBy7AAZcuE/
 1TdB4oOv7qNHkNBsGjUQ2qqvgnL5uC2xMcp0wihE0KRyIeVmLX1plJsbLditJFKT1FzZ
 jNSLnRMR/UiIDDgvA4D3eibj0FyCXYsWbQJRtn2R+os0EaJmow0Tx3yNQG8ceH1GdgO7
 cEiYmSrbuQif2aCTfUIwEzULhLwhQ7m2guyE2oxky3eZfrLhUmAheeq96YV1xKvCd5jV
 dHbsGiIAfmUosPXEZClxbiRJH2d0BjYaK6P1UqoEgOQ2vAQCt7fNN88lCEjyMSPitFT5
 C+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E52lvXAV4jnwfoAfchHD4x98Su75UpFmWttI3qxLtLo=;
 b=1hboE+CpT8uZttsWihL1OA9DG04Le8HUfdZRUSh3+bck8h40+e1Gx+DT4WBA4e/eBS
 nvtTrp8iPZykiixao3VxLSVI+suHIxZ+XErSzLPS7BB15D01WB1QXMEjXtefkCN3r0Ps
 cQWgMaXlvSYVDmy6Tp2cwUx2YZaeiEqBBlBKdKfLT+51sMMZ7DcDok4GGFJls9mEWGt3
 d4/yc/qr3diOKwNQRjVIl/Ylv6DIYtYKQvO/OjhqafJ+v2yt0Ud/YfnM3TxV3hYhumw2
 N1YExk5DLFiQ/Xn5xrauWN9jl31RmxH8C6UWmk/Axm2izypsG7B2+KpuI1xOHUdjCQ9/
 9oag==
X-Gm-Message-State: AO0yUKWsAUnjbhJlABJmRE2YPwyboMpoxSV5/YS5Fz3frhD02Tr1uYYi
 VbfV0L9wBqy6YZ8IWtTssVov/nBqeMB5fm9X
X-Google-Smtp-Source: AK7set/1cCT2of1ilRyYrvjO66yLSU/c3FPH1vnfhr/+h8MCeN9inuSvizeiNJ9Qj3Z8A5EefLP3aw==
X-Received: by 2002:a05:6e02:144b:b0:313:e126:180 with SMTP id
 p11-20020a056e02144b00b00313e1260180mr804597ilo.0.1676334484845; 
 Mon, 13 Feb 2023 16:28:04 -0800 (PST)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 r17-20020a028811000000b003af4300d670sm4500923jai.27.2023.02.13.16.28.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 16:28:04 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>, richard.henderson@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, kevans@freebsd.org, f4bug@amsat.org,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 04/12] bsd-user: various helper routines for sysctl
Date: Mon, 13 Feb 2023 17:27:49 -0700
Message-Id: <20230214002757.99240-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214002757.99240-1-imp@bsdimp.com>
References: <20230214002757.99240-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::131;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x131.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

cap_memory - Caps the memory to just below MAXINT
scale_to_target_pages - Account for difference in host / targe page size
h2t_long_sat - converts a int64_t to a int32_t, saturating at max / min values
h2t_ulong_sat - converts a uint64_t to a uint32_t, saturating at max value

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/freebsd/os-sys.c | 100 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/bsd-user/freebsd/os-sys.c b/bsd-user/freebsd/os-sys.c
index 1676ec10f83..cfbc4148a5c 100644
--- a/bsd-user/freebsd/os-sys.c
+++ b/bsd-user/freebsd/os-sys.c
@@ -21,6 +21,106 @@
 #include "qemu.h"
 #include "target_arch_sysarch.h"
 
+#include <sys/sysctl.h>
+
+/*
+ * Length for the fixed length types.
+ * 0 means variable length for strings and structures
+ * Compare with sys/kern_sysctl.c ctl_size
+ * Note: Not all types appear to be used in-tree.
+ */
+static const int G_GNUC_UNUSED target_ctl_size[CTLTYPE+1] = {
+	[CTLTYPE_INT] = sizeof(abi_int),
+	[CTLTYPE_UINT] = sizeof(abi_uint),
+	[CTLTYPE_LONG] = sizeof(abi_long),
+	[CTLTYPE_ULONG] = sizeof(abi_ulong),
+	[CTLTYPE_S8] = sizeof(int8_t),
+	[CTLTYPE_S16] = sizeof(int16_t),
+	[CTLTYPE_S32] = sizeof(int32_t),
+	[CTLTYPE_S64] = sizeof(int64_t),
+	[CTLTYPE_U8] = sizeof(uint8_t),
+	[CTLTYPE_U16] = sizeof(uint16_t),
+	[CTLTYPE_U32] = sizeof(uint32_t),
+	[CTLTYPE_U64] = sizeof(uint64_t),
+};
+
+static const int G_GNUC_UNUSED host_ctl_size[CTLTYPE+1] = {
+	[CTLTYPE_INT] = sizeof(int),
+	[CTLTYPE_UINT] = sizeof(u_int),
+	[CTLTYPE_LONG] = sizeof(long),
+	[CTLTYPE_ULONG] = sizeof(u_long),
+	[CTLTYPE_S8] = sizeof(int8_t),
+	[CTLTYPE_S16] = sizeof(int16_t),
+	[CTLTYPE_S32] = sizeof(int32_t),
+	[CTLTYPE_S64] = sizeof(int64_t),
+	[CTLTYPE_U8] = sizeof(uint8_t),
+	[CTLTYPE_U16] = sizeof(uint16_t),
+	[CTLTYPE_U32] = sizeof(uint32_t),
+	[CTLTYPE_U64] = sizeof(uint64_t),
+};
+
+#ifdef TARGET_ABI32
+/*
+ * Limit the amount of available memory to be most of the 32-bit address
+ * space. 0x100c000 was arrived at through trial and error as a good
+ * definition of 'most'.
+ */
+static const abi_ulong target_max_mem = UINT32_MAX - 0x100c000 + 1;
+
+static abi_ulong G_GNUC_UNUSED cap_memory(uint64_t mem)
+{
+    if (((unsigned long)target_max_mem) < mem) {
+        mem = target_max_mem;
+    }
+
+    return mem;
+}
+#endif
+
+static unsigned long host_page_size;
+
+static abi_ulong G_GNUC_UNUSED scale_to_target_pages(uint64_t pages)
+{
+    if (host_page_size == 0) {
+        host_page_size = getpagesize();
+    }
+
+    pages = muldiv64(pages, host_page_size, TARGET_PAGE_SIZE);
+#ifdef TARGET_ABI32
+    abi_ulong maxpages = target_max_mem / (abi_ulong)TARGET_PAGE_SIZE;
+
+    if (((unsigned long)maxpages) < pages) {
+        pages = maxpages;
+    }
+#endif
+    return pages;
+}
+
+#ifdef TARGET_ABI32
+static abi_long G_GNUC_UNUSED h2t_long_sat(long l)
+{
+    if (l > INT32_MAX) {
+        l = INT32_MAX;
+    } else if (l < INT32_MIN) {
+        l = INT32_MIN;
+    }
+    return l;
+}
+
+static abi_ulong G_GNUC_UNUSED h2t_ulong_sat(u_long ul)
+{
+    if (ul > UINT32_MAX) {
+        ul = UINT32_MAX;
+    }
+    return ul;
+}
+#endif
+
+/*
+ * placeholder until bsd-user downstream upstreams this with its thread support
+ */
+#define bsd_get_ncpu() 1
+
 /* sysarch() is architecture dependent. */
 abi_long do_freebsd_sysarch(void *cpu_env, abi_long arg1, abi_long arg2)
 {
-- 
2.39.1


