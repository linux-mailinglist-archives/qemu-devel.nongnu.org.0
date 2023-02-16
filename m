Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 121C369A268
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 00:35:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSnlR-00008g-Hn; Thu, 16 Feb 2023 18:34:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pSnlK-0008US-4i
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 18:34:02 -0500
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pSnlI-0008QO-9a
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 18:34:01 -0500
Received: by mail-il1-x12f.google.com with SMTP id h7so959166ila.7
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 15:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jcQ3VoTbe+79hYfj0QV+d8UTWb9sjCudpysXyieHUGQ=;
 b=ET4p04pioKHHyivHk3PnLifrt5iLPOfCGyessSvMZxwauirg+UYemDvcPNqTriKbCb
 Zcu/dJZQYe+YG8OhILYT4bK62QKdget3skbxT8fGjTeRVXse0rgrGxKntRpD/POcfY7V
 nRGFJfhotG10bNyTM2eotXVXOba4sGcWtAzbjKDBBZHxJHAXx07s12gB556EJufpHuSh
 yu01a7cMSpsxawR8w2nNjNaIj4iLnKs9S27bqB/tPwTPCWGs96sFXxzdMMGvUFCZj8q0
 0dddxHx3m9+bKL1nM33siNoZnJb2pvHwCtd7vZtT+eVnuxLf5TpyAL9Bed76wimr0D30
 F56w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jcQ3VoTbe+79hYfj0QV+d8UTWb9sjCudpysXyieHUGQ=;
 b=OCF3j8sGxA7UPUb1YtbRGBIMlhiE3iEeV+Ej/RdsMbxb5Fxocw0sCGvVFhxuGg92z4
 M3QvW/x0XGh32T/xM9fogminjbKHNvEq3iDGmoYLyLRG1U/zSe6z6mkg1DZsmS8vXBz/
 Ev4QMgC8mjML1455q5MhBpihQUCXnw49FEC4ewyo/79ih4MSC1cAqSIwm3e52eCfFbj1
 evKxkLSFjCM8rezxZNhvKL1idCRQYsLogMU8UfsZCG8Ra3JVe44QgEUw4bZjKuUc1QaY
 d/ecTNQDajGwaAsb0RXT43FAA4YvPOvH9ny2zyC8QG7O/4nlOEcXm8E3A9A2GE3SSnJi
 8n+g==
X-Gm-Message-State: AO0yUKWxu3Ofl1FIK4uAEtiO+H6X9wyozpTyHD7BAavLTlFHsB8Tn+LH
 zMDVADklELpHQykRXgZoqRAq4RZc7FHefRsy
X-Google-Smtp-Source: AK7set9uJhXEm4wFj/x/Qn+uvdYQYK6AxAridUptvbE5NXBLaYVL7oageCszHnjesufsVliSY+mUng==
X-Received: by 2002:a05:6e02:19cb:b0:315:9749:7a25 with SMTP id
 r11-20020a056e0219cb00b0031597497a25mr1288022ill.17.1676590438667; 
 Thu, 16 Feb 2023 15:33:58 -0800 (PST)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 y7-20020a02a387000000b00346a98b0a76sm934816jak.77.2023.02.16.15.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 15:33:58 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 Warner Losh <imp@bsdimp.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 04/11] bsd-user: various helper routines for sysctl
Date: Thu, 16 Feb 2023 16:33:46 -0700
Message-Id: <20230216233353.13944-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216233353.13944-1-imp@bsdimp.com>
References: <20230216233353.13944-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12f;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12f.google.com
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
---
 bsd-user/freebsd/os-sys.c | 86 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/bsd-user/freebsd/os-sys.c b/bsd-user/freebsd/os-sys.c
index 1676ec10f83..9b84e90cb32 100644
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
+static const int G_GNUC_UNUSED guest_ctl_size[CTLTYPE+1] = {
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
+static const int G_GNUC_UNUSED host_ctl_size[CTLTYPE+1] = {
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


