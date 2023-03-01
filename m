Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7AE6A7365
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 19:26:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXR7f-0005Tj-SZ; Wed, 01 Mar 2023 13:24:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pXR7d-0005MV-46
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 13:24:13 -0500
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pXR7b-0006o2-Cq
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 13:24:12 -0500
Received: by mail-io1-xd35.google.com with SMTP id d12so5746291ioe.10
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 10:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1677695050;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qS3B4XxCtOnwr9umuPwlWj5mJg7Wr0+I5HiEP4TPEHo=;
 b=ec4v1ib+Eubog1MGJ6PD5+1ltVOW+9acWaNPrj9INDgwN7PYU9sSe8n8HgdzWlLOuI
 wrrv+97guwVzulzn8ebAMsgyIm2RSqHr1ssDjh29AUbUzF8uz+bF5syMswfKd/NQfipm
 st7sk1T/91a5HwHwTuWO3l5iNlBONFyOkq6heMPHhTQAQyRCHlGlOoMtlx+rqEex3ewe
 YU3laDkNcjlK+wD6eyZVBE3ssz3aeLYLv9wUEFaOYhRcwLaF+C0KJsvDHhhhmfHAJ+19
 RV1rCIptjlIxs+vYZOWYPCrkuVH1VXgCtTXr4P+fNldHkUn3RnuuzELLoGs5fRmbwSX4
 wlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677695050;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qS3B4XxCtOnwr9umuPwlWj5mJg7Wr0+I5HiEP4TPEHo=;
 b=FBDEoiRX923AJf7JULDbZmAoS9B19wrkDJoPnqJXEVu/NNpBp643jX6Wuq1AdiEe8g
 zZhnJF2tXE29EOdxhVw53tH1J80wAIPwV+y4+sHZlDfZZpYdqpRetUrbE6WjedtuNOjG
 1R/8DzKE9g7K2L/cHU4H0ZVLytSxDV9qpv0KUBnxVsPTPBcwzQQyYtBiDTVFn8FcbIQ1
 0F/VVOLkyQA4lOIIMormDegz58Cu+GIhZhmvQHEGH1mvBKDtjHQkeR4ls7pofGTF92yv
 U0tp5r13faMV7Qgx51Oad91qlzzT/fC1arZ8+6aMN0wXbQDMyUMHzB3/Alp5mqw65AYh
 RiRg==
X-Gm-Message-State: AO0yUKXRUIIR7xOzTvJeI+ytf0GrtazEnHr/Uq79mAr4xNRHWHDaaXdm
 +5gNG4rNLvg7MxexEpQa4jtUypCf4WT2Pn+F
X-Google-Smtp-Source: AK7set+tD0EQXdfSQZNV4QKo6opa3SchPjfBKJQxVjy6XuBtUhUwn1ZV4U4ekArk89DjFRp3mfxh2g==
X-Received: by 2002:a6b:ee0e:0:b0:721:d759:ab16 with SMTP id
 i14-20020a6bee0e000000b00721d759ab16mr4712118ioh.18.1677695049752; 
 Wed, 01 Mar 2023 10:24:09 -0800 (PST)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 l5-20020a6b7b05000000b0073f8a470bacsm4169316iop.16.2023.03.01.10.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 10:24:09 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 04/10] bsd-user: various helper routines for sysctl
Date: Wed,  1 Mar 2023 11:23:47 -0700
Message-Id: <20230301182353.21559-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230301182353.21559-1-imp@bsdimp.com>
References: <20230301182353.21559-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd35.google.com
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
scale_to_guest_pages - Account for difference in host / guest page size
h2g_long_sat - converts a int64_t to a int32_t, saturating at max / min values
h2g_ulong_sat - converts a uint64_t to a uint32_t, saturating at max value

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/freebsd/os-sys.c | 86 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/bsd-user/freebsd/os-sys.c b/bsd-user/freebsd/os-sys.c
index 1676ec10f83..a4f3fd8091a 100644
--- a/bsd-user/freebsd/os-sys.c
+++ b/bsd-user/freebsd/os-sys.c
@@ -21,6 +21,92 @@
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
+static const int G_GNUC_UNUSED guest_ctl_size[CTLTYPE + 1] = {
+        [CTLTYPE_INT] = sizeof(abi_int),
+        [CTLTYPE_UINT] = sizeof(abi_uint),
+        [CTLTYPE_LONG] = sizeof(abi_long),
+        [CTLTYPE_ULONG] = sizeof(abi_ulong),
+        [CTLTYPE_S8] = sizeof(int8_t),
+        [CTLTYPE_S16] = sizeof(int16_t),
+        [CTLTYPE_S32] = sizeof(int32_t),
+        [CTLTYPE_S64] = sizeof(int64_t),
+        [CTLTYPE_U8] = sizeof(uint8_t),
+        [CTLTYPE_U16] = sizeof(uint16_t),
+        [CTLTYPE_U32] = sizeof(uint32_t),
+        [CTLTYPE_U64] = sizeof(uint64_t),
+};
+
+static const int G_GNUC_UNUSED host_ctl_size[CTLTYPE + 1] = {
+        [CTLTYPE_INT] = sizeof(int),
+        [CTLTYPE_UINT] = sizeof(u_int),
+        [CTLTYPE_LONG] = sizeof(long),
+        [CTLTYPE_ULONG] = sizeof(u_long),
+        [CTLTYPE_S8] = sizeof(int8_t),
+        [CTLTYPE_S16] = sizeof(int16_t),
+        [CTLTYPE_S32] = sizeof(int32_t),
+        [CTLTYPE_S64] = sizeof(int64_t),
+        [CTLTYPE_U8] = sizeof(uint8_t),
+        [CTLTYPE_U16] = sizeof(uint16_t),
+        [CTLTYPE_U32] = sizeof(uint32_t),
+        [CTLTYPE_U64] = sizeof(uint64_t),
+};
+
+#ifdef TARGET_ABI32
+/*
+ * Limit the amount of available memory to be most of the 32-bit address
+ * space. 0x100c000 was arrived at through trial and error as a good
+ * definition of 'most'.
+ */
+static const abi_ulong guest_max_mem = UINT32_MAX - 0x100c000 + 1;
+
+static abi_ulong G_GNUC_UNUSED cap_memory(uint64_t mem)
+{
+    return MIN(guest_max_mem, mem);
+}
+#endif
+
+static abi_ulong G_GNUC_UNUSED scale_to_guest_pages(uint64_t pages)
+{
+    /* Scale pages from host to guest */
+    pages = muldiv64(pages, qemu_real_host_page_size(), TARGET_PAGE_SIZE);
+#ifdef TARGET_ABI32
+    /* cap pages if need be */
+    pages = MIN(pages, guest_max_mem / (abi_ulong)TARGET_PAGE_SIZE);
+#endif
+    return pages;
+}
+
+#ifdef TARGET_ABI32
+/* Used only for TARGET_ABI32 */
+static abi_long G_GNUC_UNUSED h2g_long_sat(long l)
+{
+    if (l > INT32_MAX) {
+        l = INT32_MAX;
+    } else if (l < INT32_MIN) {
+        l = INT32_MIN;
+    }
+    return l;
+}
+
+static abi_ulong G_GNUC_UNUSED h2g_ulong_sat(u_long ul)
+{
+    return MIN(ul, UINT32_MAX);
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


