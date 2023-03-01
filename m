Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D11BA6A735F
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 19:25:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXR7g-0005UI-KR; Wed, 01 Mar 2023 13:24:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pXR7e-0005SB-Cr
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 13:24:14 -0500
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pXR7c-0006oS-HH
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 13:24:14 -0500
Received: by mail-io1-xd2c.google.com with SMTP id t129so5732779iof.12
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 10:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1677695051;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZHZZAEauaqUmmv34opJ70pPD5fSPwd2yVcyCl/DdvEc=;
 b=CB8JfYLrIvLFgMM4kJJdrve54T9cHS/SIO2nzoaI36GO51MX6CMfee/vf6Xf+PjA0b
 kazdZC5ImYOpy9Zh09ytTEOkU49K4bu48r8aMcbdvE5gn5zrCeDjh0UgdOOqgeSM4QFn
 xfJ243Bq2V060lraLlxerPQ81YDVsFRfxwfaN1PAGbBNQ6Rj4zPf1DKp8421cIsJzZ+K
 Vpi8jbbgjC3tgZGBdB/hpm1SGlyhCwT5YROmZc8wlMJ8r0xqmELfG341/ZvzMfoE/2OR
 n74O9ex/9ezINI0e5Zgw8815Uq6k+HE7BxQiMnLCYkbRui6a1390+bWtoRz3TzKkjCfO
 9xqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677695051;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZHZZAEauaqUmmv34opJ70pPD5fSPwd2yVcyCl/DdvEc=;
 b=W5ikjBA2af5Nxr9FauVLiaSQ5lHgOU7noXy37q++sedpwi4Ilkj2WX4QiQy15727iN
 E0jz9kI3Sg3ryTqCQ9NWomwJMR045XJmSYAWLeq2GF0SQcNT8HT65AhY8cHXtnRY1nP4
 Ljr1w3idVIwiQbDbb3O4WqI2EkXRkzCGhghl/RpMZizd6vCSsPfMrX12RC1ceWn9hjw6
 gwlqtAIuja41siSOVTn5xR2m8DSLM5Ka0sUUQ52LZEhgYwt3/ax92fQJFXc05g98WMfE
 TpYcuRGE5Ap5zJ+wkxiXHodFqukWCIAv10uiizIkCqDwYoIU3fqpcq4SS5qHL8TpfFah
 qv+Q==
X-Gm-Message-State: AO0yUKVt2gImErvRLA1boR4Ca/aIhfnizdhwI/h9dHRHwDHe9AdgNPHe
 Th56jVduFNSORbbgNAUXw/LZvo84SJtDHPE/
X-Google-Smtp-Source: AK7set9EpFiRwO5qgscitDFroenHkqQ0N3PV6qAnqHleG1Ot9e7EqKfNNAAPA3/jBKf5QcHbfvwDjw==
X-Received: by 2002:a6b:ee14:0:b0:74c:91c2:cb05 with SMTP id
 i20-20020a6bee14000000b0074c91c2cb05mr4705663ioh.9.1677695050840; 
 Wed, 01 Mar 2023 10:24:10 -0800 (PST)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 l5-20020a6b7b05000000b0073f8a470bacsm4169316iop.16.2023.03.01.10.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 10:24:10 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 Paolo Bonzini <pbonzini@redhat.com>, Stacey Son <sson@FreeBSD.org>,
 Sean Bruno <sbruno@FreeBSD.org>, Juergen Lock <nox@jelal.kn-bremen.de>,
 Raphael Kubo da Costa <rakuco@FreeBSD.org>
Subject: [PULL 05/10] bsd-user: Helper routines oidfmt
Date: Wed,  1 Mar 2023 11:23:48 -0700
Message-Id: <20230301182353.21559-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230301182353.21559-1-imp@bsdimp.com>
References: <20230301182353.21559-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2c.google.com
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

From: Stacey Son <sson@FreeBSD.org>

oidfmt uses undocumented system call to get the type of the sysctl.

Co-Authored-by: Sean Bruno <sbruno@FreeBSD.org>
Signed-off-by: Sean Bruno <sbruno@FreeBSD.org>
Co-Authored-by: Juergen Lock <nox@jelal.kn-bremen.de>
Signed-off-by: Juergen Lock <nox@jelal.kn-bremen.de>
Co-Authored-by: Raphael Kubo da Costa <rakuco@FreeBSD.org>
Signed-off-by: Raphael Kubo da Costa <rakuco@FreeBSD.org>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/freebsd/os-sys.c | 131 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 127 insertions(+), 4 deletions(-)

diff --git a/bsd-user/freebsd/os-sys.c b/bsd-user/freebsd/os-sys.c
index a4f3fd8091a..2e0a6c058d6 100644
--- a/bsd-user/freebsd/os-sys.c
+++ b/bsd-user/freebsd/os-sys.c
@@ -29,7 +29,7 @@
  * Compare with sys/kern_sysctl.c ctl_size
  * Note: Not all types appear to be used in-tree.
  */
-static const int G_GNUC_UNUSED guest_ctl_size[CTLTYPE + 1] = {
+static const int guest_ctl_size[CTLTYPE + 1] = {
         [CTLTYPE_INT] = sizeof(abi_int),
         [CTLTYPE_UINT] = sizeof(abi_uint),
         [CTLTYPE_LONG] = sizeof(abi_long),
@@ -44,7 +44,7 @@ static const int G_GNUC_UNUSED guest_ctl_size[CTLTYPE + 1] = {
         [CTLTYPE_U64] = sizeof(uint64_t),
 };
 
-static const int G_GNUC_UNUSED host_ctl_size[CTLTYPE + 1] = {
+static const int host_ctl_size[CTLTYPE + 1] = {
         [CTLTYPE_INT] = sizeof(int),
         [CTLTYPE_UINT] = sizeof(u_int),
         [CTLTYPE_LONG] = sizeof(long),
@@ -86,7 +86,7 @@ static abi_ulong G_GNUC_UNUSED scale_to_guest_pages(uint64_t pages)
 
 #ifdef TARGET_ABI32
 /* Used only for TARGET_ABI32 */
-static abi_long G_GNUC_UNUSED h2g_long_sat(long l)
+static abi_long h2g_long_sat(long l)
 {
     if (l > INT32_MAX) {
         l = INT32_MAX;
@@ -96,7 +96,7 @@ static abi_long G_GNUC_UNUSED h2g_long_sat(long l)
     return l;
 }
 
-static abi_ulong G_GNUC_UNUSED h2g_ulong_sat(u_long ul)
+static abi_ulong h2g_ulong_sat(u_long ul)
 {
     return MIN(ul, UINT32_MAX);
 }
@@ -107,6 +107,129 @@ static abi_ulong G_GNUC_UNUSED h2g_ulong_sat(u_long ul)
  */
 #define bsd_get_ncpu() 1
 
+/*
+ * This uses the undocumented oidfmt interface to find the kind of a requested
+ * sysctl, see /sys/kern/kern_sysctl.c:sysctl_sysctl_oidfmt() (compare to
+ * src/sbin/sysctl/sysctl.c)
+ */
+static int G_GNUC_UNUSED oidfmt(int *oid, int len, char *fmt, uint32_t *kind)
+{
+    int qoid[CTL_MAXNAME + 2];
+    uint8_t buf[BUFSIZ];
+    int i;
+    size_t j;
+
+    qoid[0] = CTL_SYSCTL;
+    qoid[1] = CTL_SYSCTL_OIDFMT;
+    memcpy(qoid + 2, oid, len * sizeof(int));
+
+    j = sizeof(buf);
+    i = sysctl(qoid, len + 2, buf, &j, 0, 0);
+    if (i) {
+        return i;
+    }
+
+    if (kind) {
+        *kind = *(uint32_t *)buf;
+    }
+
+    if (fmt) {
+        strcpy(fmt, (char *)(buf + sizeof(uint32_t)));
+    }
+    return 0;
+}
+
+/*
+ * Convert the old value from host to guest.
+ *
+ * For LONG and ULONG on ABI32, we need to 'down convert' the 8 byte quantities
+ * to 4 bytes. The caller setup a buffer in host memory to get this data from
+ * the kernel and pass it to us. We do the down conversion and adjust the length
+ * so the caller knows what to write as the returned length into the target when
+ * it copies the down converted values into the target.
+ *
+ * For normal integral types, we just need to byte swap. No size changes.
+ *
+ * For strings and node data, there's no conversion needed.
+ *
+ * For opaque data, per sysctl OID converts take care of it.
+ */
+static void G_GNUC_UNUSED h2g_old_sysctl(void *holdp, size_t *holdlen, uint32_t kind)
+{
+    size_t len;
+    int hlen, glen;
+    uint8_t *hp, *gp;
+
+    /*
+     * Although rare, we can have arrays of sysctl. Both sysctl_old_ddb in
+     * kern_sysctl.c and show_var in sbin/sysctl/sysctl.c have code that loops
+     * this way.  *holdlen has been set by the kernel to the host's length.
+     * Only LONG and ULONG on ABI32 have different sizes: see below.
+     */
+    gp = hp = (uint8_t *)holdp;
+    len = 0;
+    hlen = host_ctl_size[kind & CTLTYPE];
+    glen = guest_ctl_size[kind & CTLTYPE];
+
+    /*
+     * hlen == 0 for CTLTYPE_STRING and CTLTYPE_NODE, which need no conversion
+     * as well as CTLTYPE_OPAQUE, which needs special converters.
+     */
+    if (hlen == 0) {
+        return;
+    }
+
+    while (len < *holdlen) {
+        if (hlen == glen) {
+            switch (hlen) {
+            case 1:
+                /* Nothing needed: no byteswapping and assigning in place */
+                break;
+            case 2:
+                *(uint16_t *)gp = tswap16(*(uint16_t *)hp);
+                break;
+            case 4:
+                *(uint32_t *)gp = tswap32(*(uint32_t *)hp);
+                break;
+            case 8:
+                *(uint64_t *)gp = tswap64(*(uint64_t *)hp);
+                break;
+            default:
+                g_assert_not_reached();
+            }
+        } else {
+#ifdef TARGET_ABI32
+            /*
+             * Saturating assignment for the only two types that differ between
+             * 32-bit and 64-bit machines. All other integral types have the
+             * same, fixed size and will be converted w/o loss of precision
+             * in the above switch.
+             */
+            switch (kind & CTLTYPE) {
+            case CTLTYPE_LONG:
+                *(abi_long *)gp = tswap32(h2g_long_sat(*(long *)hp));
+                break;
+            case CTLTYPE_ULONG:
+                *(abi_ulong *)gp = tswap32(h2g_ulong_sat(*(u_long *)hp));
+                break;
+            default:
+                g_assert_not_reached();
+            }
+#else
+            g_assert_not_reached();
+#endif
+        }
+        gp += glen;
+        hp += hlen;
+        len += hlen;
+    }
+#ifdef TARGET_ABI32
+    if (hlen != glen) {
+        *holdlen = (*holdlen / hlen) * glen;
+    }
+#endif
+}
+
 /* sysarch() is architecture dependent. */
 abi_long do_freebsd_sysarch(void *cpu_env, abi_long arg1, abi_long arg2)
 {
-- 
2.39.1


