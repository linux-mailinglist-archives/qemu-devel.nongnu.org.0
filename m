Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 679E3695558
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 01:29:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRjBJ-0007T2-8x; Mon, 13 Feb 2023 19:28:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pRjB8-0007Rp-OA
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 19:28:14 -0500
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pRjB6-000603-Sx
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 19:28:14 -0500
Received: by mail-il1-x136.google.com with SMTP id h29so4011135ila.8
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 16:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oFq1eRvbniaQzSLu1dNAxUhkDZddT5JGCoR/msUAj9s=;
 b=f/b1E0eHKuM51WiWl/7D/yDGvSo3lApuDOEfXVhgZEUYLWKpJIyS1gNyMo/ulDJDF+
 +Hkgeb01WMO5PgD4ClXPvK6NDd57pUiqkReXn0FN0wfOpmTuBqLhQYaXsvQ+EzNSlmNP
 RdTiSffrLW5GHkTN2mGWUnJIbETAgLcqSwtfsKMbLEnix/+OSSuLiKV9CZZBfZAzOQKx
 60Q7mBah+gjnWUpSlBmIhtTekb6qQEDFy+JVlLm/xJFjyxQNqJxdgzaUreAMBJujJvwW
 DE5mMDKG32nwrXDYQNbrPdO4Pe4pvGcMK4Zskd+SRSlsjFp5pWer4aEq6jhQ6TpI6Si3
 aeBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oFq1eRvbniaQzSLu1dNAxUhkDZddT5JGCoR/msUAj9s=;
 b=nUKKk4PR1LRNZT2FKuQDEVG+d24brR80hgvtOa//MoqgWxaIxlRyA6posoV3LkAoqK
 LILk2k/7gOzkJ1R+8O3/8xWMUzT3HBEBMMV405hD7TFRAc8jtVjZQv9qFS1mXGIvABi3
 ir0GKMzjx2BbJCeCBJU0E+s0RtqV7mKglrZjPBtrXKTjfIsUIip70ksBxPn3scTbC37o
 D8RX8oweJGYZr8wcUrWW9bo2uT/n9aZfyV48WlAhphFExT+oClvMPeuuo/cUFXtfDyqO
 UNk+9PiIxPVlI255NXc/qXLd+nrvpalnN/q3r7P5R7UPrMCeUATLzisK/BKb2B4AVB+R
 RwHw==
X-Gm-Message-State: AO0yUKVHVYqxVjdsF+ox7ALuKtQYGf/vq0QI2hkvouh43UqQhk2fH4Bl
 rGyW76slDtBcrlrEJMuCdVdDSQedKcXn+jpo
X-Google-Smtp-Source: AK7set8+ZY7lv/eWaZfxCcdsDRGPgx1hbpRVWXePBk/iHegQY+SngEj+7QjzTyuZKhgc3JM5s81ung==
X-Received: by 2002:a05:6e02:b4c:b0:311:66d:47aa with SMTP id
 f12-20020a056e020b4c00b00311066d47aamr510465ilu.26.1676334486989; 
 Mon, 13 Feb 2023 16:28:06 -0800 (PST)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 r17-20020a028811000000b003af4300d670sm4500923jai.27.2023.02.13.16.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 16:28:06 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>, richard.henderson@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, kevans@freebsd.org, f4bug@amsat.org,
 Thomas Huth <thuth@redhat.com>, Sean Bruno <sbruno@FreeBSD.org>,
 Juergen Lock <nox@jelal.kn-bremen.de>,
 Raphael Kubo da Costa <rakuco@FreeBSD.org>, Stacey Son <sson@FreeBSD.org>
Subject: [PATCH v2 06/12] bsd-user: Helper routines h2t_old_sysctl
Date: Mon, 13 Feb 2023 17:27:51 -0700
Message-Id: <20230214002757.99240-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214002757.99240-1-imp@bsdimp.com>
References: <20230214002757.99240-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::136;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x136.google.com
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

h2t_old_sysctl does the byte swapping in the data to return it to the
target for the 'well known' types.

Co-Authored-by: Sean Bruno <sbruno@FreeBSD.org>
Signed-off-by: Sean Bruno <sbruno@FreeBSD.org>
Co-Authored-by: Juergen Lock <nox@jelal.kn-bremen.de>
Signed-off-by: Juergen Lock <nox@jelal.kn-bremen.de>
Co-Authored-by: Raphael Kubo da Costa <rakuco@FreeBSD.org>
Signed-off-by: Raphael Kubo da Costa <rakuco@FreeBSD.org>
Co-Authored-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/freebsd/os-sys.c | 95 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 91 insertions(+), 4 deletions(-)

diff --git a/bsd-user/freebsd/os-sys.c b/bsd-user/freebsd/os-sys.c
index 1df53a3e53b..457e61f5b36 100644
--- a/bsd-user/freebsd/os-sys.c
+++ b/bsd-user/freebsd/os-sys.c
@@ -29,7 +29,7 @@
  * Compare with sys/kern_sysctl.c ctl_size
  * Note: Not all types appear to be used in-tree.
  */
-static const int G_GNUC_UNUSED target_ctl_size[CTLTYPE+1] = {
+static const int target_ctl_size[CTLTYPE+1] = {
 	[CTLTYPE_INT] = sizeof(abi_int),
 	[CTLTYPE_UINT] = sizeof(abi_uint),
 	[CTLTYPE_LONG] = sizeof(abi_long),
@@ -44,7 +44,7 @@ static const int G_GNUC_UNUSED target_ctl_size[CTLTYPE+1] = {
 	[CTLTYPE_U64] = sizeof(uint64_t),
 };
 
-static const int G_GNUC_UNUSED host_ctl_size[CTLTYPE+1] = {
+static const int host_ctl_size[CTLTYPE+1] = {
 	[CTLTYPE_INT] = sizeof(int),
 	[CTLTYPE_UINT] = sizeof(u_int),
 	[CTLTYPE_LONG] = sizeof(long),
@@ -97,7 +97,7 @@ static abi_ulong G_GNUC_UNUSED scale_to_target_pages(uint64_t pages)
 }
 
 #ifdef TARGET_ABI32
-static abi_long G_GNUC_UNUSED h2t_long_sat(long l)
+static abi_long h2t_long_sat(long l)
 {
     if (l > INT32_MAX) {
         l = INT32_MAX;
@@ -107,7 +107,7 @@ static abi_long G_GNUC_UNUSED h2t_long_sat(long l)
     return l;
 }
 
-static abi_ulong G_GNUC_UNUSED h2t_ulong_sat(u_long ul)
+static abi_ulong h2t_ulong_sat(u_long ul)
 {
     if (ul > UINT32_MAX) {
         ul = UINT32_MAX;
@@ -153,6 +153,93 @@ static int G_GNUC_UNUSED oidfmt(int *oid, int len, char *fmt, uint32_t *kind)
     return 0;
 }
 
+/*
+ * Convert the old value from host to target.
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
+static void G_GNUC_UNUSED h2t_old_sysctl(void *holdp, size_t *holdlen, uint32_t kind)
+{
+    size_t len;
+    int hlen, tlen;
+    uint8_t *hp, *tp;
+
+    /*
+     * Although rare, we can have arrays of sysctl. Both sysctl_old_ddb in
+     * kern_sysctl.c and show_var in sbin/sysctl/sysctl.c have code that loops
+     * this way.  *holdlen has been set by the kernel to the host's length.
+     * Only LONG and ULONG on ABI32 have different sizes: see below.
+     */
+    hp = (uint8_t *)holdp;
+    tp = hp;
+    len = 0;
+    hlen = host_ctl_size[kind & CTLTYPE];
+    tlen = target_ctl_size[kind & CTLTYPE];
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
+        if (hlen == tlen) {
+            switch (hlen) {
+            case 1:
+                /* Nothing needed: no byteswapping and assigning in place */
+                break;
+            case 2:
+                *(uint16_t *)tp = tswap16(*(uint16_t *)hp);
+                break;
+            case 4:
+                *(uint32_t *)tp = tswap32(*(uint32_t *)hp);
+                break;
+            case 8:
+                *(uint64_t *)tp = tswap64(*(uint64_t *)hp);
+                break;
+            }
+        }
+#ifdef TARGET_ABI32
+        else {
+            /*
+             * Saturating assignment for the only two types that differ between
+             * 32-bit and 64-bit machines. All other integral types have the
+             * same, fixed size and will be converted w/o loss of precision
+             * in the above switch.
+             */
+            switch (kind & CTLTYPE) {
+            case CTLTYPE_LONG:
+                *(abi_long *)tp = tswap32(h2t_long_sat(*(long *)hp));
+                break;
+            case CTLTYPE_ULONG:
+                *(abi_ulong *)tp = tswap32(h2t_ulong_sat(*(u_long *)hp));
+                break;
+            }
+        }
+#endif
+        tp += tlen;
+        hp += hlen;
+        len += hlen;
+    }
+#ifdef TARGET_ABI32
+    if (hlen != tlen) {
+        *holdlen = (*holdlen / hlen) * tlen;
+    }
+#endif
+}
+
 /* sysarch() is architecture dependent. */
 abi_long do_freebsd_sysarch(void *cpu_env, abi_long arg1, abi_long arg2)
 {
-- 
2.39.1


