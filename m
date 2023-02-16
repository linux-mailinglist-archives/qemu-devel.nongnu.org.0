Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA0A69A273
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 00:35:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSnlQ-00007x-UQ; Thu, 16 Feb 2023 18:34:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pSnlO-00006P-Ju
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 18:34:06 -0500
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pSnlM-0008R9-SM
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 18:34:06 -0500
Received: by mail-io1-xd34.google.com with SMTP id j4so1322461iog.8
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 15:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=121msZ7BQw47YP3HHlZFZiV5/sv+6Qz3v9vW8ncVL2Q=;
 b=eHcCFiqal+MKDi4p3P9Yeyjpy3veTZVhdziRks09iocYe8F+QKMwVngQ434sCPcJGA
 i2D0OAyGZMs9e7a1Q5d0tA1U6buKWxjbwfDKuYWZhZ6SJC58d79eoPQJqADaJWw95prw
 5AhErwZPfuJv6oZ/4WKmHtDFpwKVhTR5PK/9Av4Gv/WlsZ/GD06mOoGaOjY7rz74kDoB
 hvxapf28mzaHj8+dvXyaiVIoVYd5AYnmeuFIITQO6KEYnoUPvAF4pXbAViXrz+ProYat
 Y14W0JOFV8veLcuEwUy/zojQz48RNK0ANIkRxfm1ZMTUAMnHaYvPGd54SWL22pC1bluu
 YErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=121msZ7BQw47YP3HHlZFZiV5/sv+6Qz3v9vW8ncVL2Q=;
 b=FYGilxZOsRMoefiAxuAR+MYpMtsMnHLH+AiTzjDq9bhPpGXLTalzRT4pbyDHtvl0GG
 /8Vn39QHGXtZ4DvN4nsVCnROL8UehSHGR9QgW8thgsUIPTKSSpBZvVhU1FbzqRXWoqO2
 OwHmjGVdpUGhviefmklpL76TnzH0rHaIhYOuFBWRGHU3GH/ke9Tk1ikxFH6VBVv3S1KY
 SuSb51AQXeRhr2M8exijCAYUExCoZw9LdDHaj3DeYfuBkDt6b9qBrdYetJ2AI2W4/T28
 8nKtTmDCyzNUOSEmsJraKrasEHrn5+dFUBhFZfRdTh2fC/Zl/M6guRB6Qjt5d99YFk/7
 fRmA==
X-Gm-Message-State: AO0yUKWQO/wQNpVvdcxaZVw18ywJsaF3oBkukr7GFWCxF/Petawcv0iL
 /9XD80b/yjskxKCRNfBSuRDw+pXnZwlGCmOu
X-Google-Smtp-Source: AK7set+VTQl28qPjtZZqyDW4dfkz/S2vIzwzZkAismv7qDSKG+obg8LhNEnSNiF9XRZ8+hsZxSIGXw==
X-Received: by 2002:a5d:8896:0:b0:717:df30:e56c with SMTP id
 d22-20020a5d8896000000b00717df30e56cmr5602538ioo.2.1676590442915; 
 Thu, 16 Feb 2023 15:34:02 -0800 (PST)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 y7-20020a02a387000000b00346a98b0a76sm934816jak.77.2023.02.16.15.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 15:34:02 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 Warner Losh <imp@bsdimp.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Juergen Lock <nox@jelal.kn-bremen.de>,
 Stacey Son <sson@FreeBSD.org>
Subject: [PATCH v3 08/11] bsd-user: common routine do_freebsd_sysctl_oid for
 all sysctl variants
Date: Thu, 16 Feb 2023 16:33:50 -0700
Message-Id: <20230216233353.13944-9-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216233353.13944-1-imp@bsdimp.com>
References: <20230216233353.13944-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d34;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd34.google.com
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

From: Juergen Lock <nox@jelal.kn-bremen.de>

do_freebsd_sysctl_oid filters out some of the binary and special sysctls
where host != target. None of the sysctls that have to be translated from
host to target are handled here.

Signed-off-by: Juergen Lock <nox@jelal.kn-bremen.de>
Co-Authored-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
Co-Authored-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/freebsd/os-sys.c | 90 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 86 insertions(+), 4 deletions(-)

diff --git a/bsd-user/freebsd/os-sys.c b/bsd-user/freebsd/os-sys.c
index dee8c92309b..42f0cc82279 100644
--- a/bsd-user/freebsd/os-sys.c
+++ b/bsd-user/freebsd/os-sys.c
@@ -112,7 +112,7 @@ static abi_ulong h2g_ulong_sat(u_long ul)
  * sysctl, see /sys/kern/kern_sysctl.c:sysctl_sysctl_oidfmt() (compare to
  * src/sbin/sysctl/sysctl.c)
  */
-static int G_GNUC_UNUSED oidfmt(int *oid, int len, char *fmt, uint32_t *kind)
+static int oidfmt(int *oid, int len, char *fmt, uint32_t *kind)
 {
     int qoid[CTL_MAXNAME + 2];
     uint8_t buf[BUFSIZ];
@@ -154,7 +154,7 @@ static int G_GNUC_UNUSED oidfmt(int *oid, int len, char *fmt, uint32_t *kind)
  *
  * For opaque data, per sysctl OID converts take care of it.
  */
-static void G_GNUC_UNUSED h2g_old_sysctl(void *holdp, size_t *holdlen, uint32_t kind)
+static void h2g_old_sysctl(void *holdp, size_t *holdlen, uint32_t kind)
 {
     size_t len;
     int hlen, glen;
@@ -234,7 +234,7 @@ static void G_GNUC_UNUSED h2g_old_sysctl(void *holdp, size_t *holdlen, uint32_t
 /*
  * Convert the undocmented name2oid sysctl data for the target.
  */
-static inline void G_GNUC_UNUSED sysctl_name2oid(uint32_t *holdp, size_t holdlen)
+static inline void sysctl_name2oid(uint32_t *holdp, size_t holdlen)
 {
     size_t i, num = holdlen / sizeof(uint32_t);
 
@@ -243,12 +243,94 @@ static inline void G_GNUC_UNUSED sysctl_name2oid(uint32_t *holdp, size_t holdlen
     }
 }
 
-static inline void G_GNUC_UNUSED sysctl_oidfmt(uint32_t *holdp)
+static inline void sysctl_oidfmt(uint32_t *holdp)
 {
     /* byte swap the kind */
     holdp[0] = tswap32(holdp[0]);
 }
 
+static abi_long G_GNUC_UNUSED do_freebsd_sysctl_oid(CPUArchState *env, int32_t *snamep,
+        int32_t namelen, void *holdp, size_t *holdlenp, void *hnewp,
+        size_t newlen)
+{
+    uint32_t kind = 0;
+    abi_long ret;
+    size_t holdlen, oldlen;
+#ifdef TARGET_ABI32
+    void *old_holdp;
+#endif
+
+    holdlen = oldlen = *holdlenp;
+    oidfmt(snamep, namelen, NULL, &kind);
+
+    /* Handle some arch/emulator dependent sysctl()'s here. */
+
+#ifdef TARGET_ABI32
+    /*
+     * For long and ulong with a 64-bit host and a 32-bit target we have to do
+     * special things. holdlen here is the length provided by the target to the
+     * system call. So we allocate a buffer twice as large because longs are twice
+     * as big on the host which will be writing them. In h2g_old_sysctl we'll adjust
+     * them and adjust the length.
+     */
+    if (kind == CTLTYPE_LONG || kind == CTLTYPE_ULONG) {
+        old_holdp = holdp;
+        holdlen = holdlen * 2;
+        holdp = g_malloc(holdlen);
+    }
+#endif
+
+    ret = get_errno(sysctl(snamep, namelen, holdp, &holdlen, hnewp, newlen));
+    if (!ret && (holdp != 0)) {
+
+        if (snamep[0] == CTL_SYSCTL) {
+            switch (snamep[1]) {
+            case CTL_SYSCTL_NEXT:
+            case CTL_SYSCTL_NAME2OID:
+            case CTL_SYSCTL_NEXTNOSKIP:
+                /*
+                 * All of these return an OID array, so we need to convert to
+                 * target.
+                 */
+                sysctl_name2oid(holdp, holdlen);
+                break;
+
+            case CTL_SYSCTL_OIDFMT:
+                /* Handle oidfmt */
+                sysctl_oidfmt(holdp);
+                break;
+            case CTL_SYSCTL_OIDDESCR:
+            case CTL_SYSCTL_OIDLABEL:
+            default:
+                /* Handle it based on the type */
+                h2g_old_sysctl(holdp, &holdlen, kind);
+                /* NB: None of these are LONG or ULONG */
+                break;
+            }
+        } else {
+            /*
+             * Need to convert from host to target. All the weird special cases
+             * are handled above.
+             */
+            h2g_old_sysctl(holdp, &holdlen, kind);
+#ifdef TARGET_ABI32
+            /*
+             * For the 32-bit on 64-bit case, for longs we need to copy the
+             * now-converted buffer to the target and free the buffer.
+             */
+            if (kind == CTLTYPE_LONG || kind == CTLTYPE_ULONG) {
+                memcpy(old_holdp, holdp, holdlen);
+                g_free(holdp);
+                holdp = old_holdp;
+            }
+#endif
+        }
+    }
+
+    *holdlenp = holdlen;
+    return ret;
+}
+
 /* sysarch() is architecture dependent. */
 abi_long do_freebsd_sysarch(void *cpu_env, abi_long arg1, abi_long arg2)
 {
-- 
2.39.1


