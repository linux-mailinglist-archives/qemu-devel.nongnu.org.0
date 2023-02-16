Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6D369A270
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 00:35:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSnlO-000065-He; Thu, 16 Feb 2023 18:34:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pSnlN-00004v-45
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 18:34:05 -0500
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pSnlL-0008Qr-5z
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 18:34:04 -0500
Received: by mail-il1-x12c.google.com with SMTP id i26so1403059ila.11
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 15:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t3IWrnGl4pF51ODc0/WxLp2uU7S+u2cBX78xflQCoHA=;
 b=DiwPs8jihFTx5+GePfqyeUDwULxgSMb7AHc1of+K6oYuukB+mHKk8P3wUhgIRTmnuL
 lpxhxc7bK6GbZQ5GOMb4g8+kK/L7O+lCHnWKq/g4Pooo5gzDKLE0cM3EMYLgoTNPius0
 UPGWtD8+D8lT9lilETDwoJnPXqhk6OOg4/wtSYGEPleVT0G1LwENHya5WyojoaEyzrEZ
 H0fNAiWm49slIozlL+p4roiYctkhJlY7dxMG75QYciaM99sUDVUpMeWM7vB9JYVFb2al
 UObOIufSJz3WFJdaY0NLV/LobwcXVvfpoX98gnUUUViXcxUQRyODl8/P6Ib2/IdqfGul
 FDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t3IWrnGl4pF51ODc0/WxLp2uU7S+u2cBX78xflQCoHA=;
 b=54vxAWIlSzuNbeI14s9GvDyODyDFq94FEj47S7n5JFSISPKuHAeH2mCFy5S6e6Qp0K
 bhRiyX9W6X9elmmBxy/nDe1flwPVb1105q4RZJd08LqnfuzPHoHupKpwaZosISbhw4vv
 GZVGKHgo8pkbrcHVBOY24OqAXaefTcp+GeXNrY0cZJWMHaiCVhKmtEqho8Ex0MTi137o
 6QXOU86GM2lXl91w3qMIKQvFpk3T4bVR4xrBezcLz/AFruKTWdo1fOOiU4g/SDS+gTu7
 UmaKUMqlrv11pi5cd76FwmPcquWczmSr08/S83KkhEXDEUuDDhNmMzyQIxNQioKCHY6D
 aIRg==
X-Gm-Message-State: AO0yUKWtdsTR+PEyuDouhj3uXiczEFNwBuih22VYqXOofXymLNXV4wQz
 45vebjd6tw6wR6baoIr5SIjbeIvYKTIcBkW3
X-Google-Smtp-Source: AK7set+aUbNiJ1SciV7biOJpk2v1vbdg0U2Ig6Ctdu91BmV9bb9FhSpuyaxIiSCgTrhS79qL/80KAw==
X-Received: by 2002:a05:6e02:1488:b0:314:fa6:323c with SMTP id
 n8-20020a056e02148800b003140fa6323cmr7514382ilk.12.1676590440963; 
 Thu, 16 Feb 2023 15:34:00 -0800 (PST)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 y7-20020a02a387000000b00346a98b0a76sm934816jak.77.2023.02.16.15.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 15:34:00 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 Warner Losh <imp@bsdimp.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Sean Bruno <sbruno@FreeBSD.org>,
 Juergen Lock <nox@jelal.kn-bremen.de>,
 Raphael Kubo da Costa <rakuco@FreeBSD.org>, Stacey Son <sson@FreeBSD.org>
Subject: [PATCH v3 06/11] bsd-user: Helper routines h2g_old_sysctl
Date: Thu, 16 Feb 2023 16:33:48 -0700
Message-Id: <20230216233353.13944-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216233353.13944-1-imp@bsdimp.com>
References: <20230216233353.13944-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12c;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12c.google.com
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

h2g_old_sysctl does the byte swapping in the data to return it to the
target for the 'well known' types. For most of the types, either the
data is returned verbatim (strings, byte size, opaque we don't know
about) or it's returned with byte swapping (for all the integer
types). However, for ABI32 targets, LONG and ULONG are different sizes,
and need to be carefully converted (along with help from the caller).

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
 bsd-user/freebsd/os-sys.c | 100 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 96 insertions(+), 4 deletions(-)

diff --git a/bsd-user/freebsd/os-sys.c b/bsd-user/freebsd/os-sys.c
index 1bf2b51820e..77c2b157c61 100644
--- a/bsd-user/freebsd/os-sys.c
+++ b/bsd-user/freebsd/os-sys.c
@@ -29,7 +29,7 @@
  * Compare with sys/kern_sysctl.c ctl_size
  * Note: Not all types appear to be used in-tree.
  */
-static const int G_GNUC_UNUSED guest_ctl_size[CTLTYPE+1] = {
+static const int guest_ctl_size[CTLTYPE+1] = {
         [CTLTYPE_INT] = sizeof(abi_int),
         [CTLTYPE_UINT] = sizeof(abi_uint),
         [CTLTYPE_LONG] = sizeof(abi_long),
@@ -44,7 +44,7 @@ static const int G_GNUC_UNUSED guest_ctl_size[CTLTYPE+1] = {
         [CTLTYPE_U64] = sizeof(uint64_t),
 };
 
-static const int G_GNUC_UNUSED host_ctl_size[CTLTYPE+1] = {
+static const int host_ctl_size[CTLTYPE+1] = {
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
@@ -139,6 +139,98 @@ static int G_GNUC_UNUSED oidfmt(int *oid, int len, char *fmt, uint32_t *kind)
     return 0;
 }
 
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
+        }
+        else {
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


