Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB82F69555B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 01:29:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRjB7-0007RK-Ox; Mon, 13 Feb 2023 19:28:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pRjB6-0007Qn-2O
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 19:28:12 -0500
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pRjB4-000603-Ax
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 19:28:11 -0500
Received: by mail-il1-x136.google.com with SMTP id h29so4011111ila.8
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 16:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=44euG2MYwKiDmmIiT6djpZ4qT+JKtKjHtQycLoy9kbw=;
 b=j0cPHM2yZluMahyPlrkYiCEY6qvfpCeIRNAUAjWUmJzWTZJdiJRo6izpsmJXo4/qRJ
 bcHfAlGXkW8lia61Gv5HeFQI9MCQTG+BIQuu30XKSqdY8zI5+Eru1GTJnVMIqBVk9JsF
 FbXFaiDatKgI26VKswdhdv73bfRKyXAQEf+icBPLHRcV0HwTTf2dD/q9OO6NHUe4bdII
 vB7nTRJf99woPTjvqrcUns7fUoKG32W4B1mpo/eLsZ96abcJPukxwXzpUYsKLBi/hu4D
 8wxmCTQDgAcMY42xtZPvkOrIGlaPLXv3uWMsEn8yO6XItj2jU6vJV+cHXoNuovfsh8j7
 TYxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=44euG2MYwKiDmmIiT6djpZ4qT+JKtKjHtQycLoy9kbw=;
 b=ZEap3WGR1P0Q+Ghl8tkQtZYnWQ8JoK1wIWRGeONiDEIjzoKjt73EMFhWRtYzhd6Mfc
 Sz08KPLYolQm83Vr5KlhwrWlXci4IoGqHAlJf3IxBOHKY8WkoaclzEvjW7PdRaY1HawB
 6bSok3hsYfkqtVtSZIqOetcCPL9MpMCImoeqjk/8qsw5fYizPEDz7ebdhiRnStKZBuZE
 9K8rRiAczudxbaUmf/AnR2d+e991Xw2gdG+GTj9jn1W8aRSt/6Zb7s3wBNeD6Kng9AxV
 5dBDZoBCf7eco3M7HsJ37gtk3ZUKfsw1Y69mcmmovUBv95EYLx6EhJrGQFt7kmWrPUFv
 csFQ==
X-Gm-Message-State: AO0yUKUWjlCj7m2ds8qbTHvAvkrg3T/nlbqyar2EHT9jSEvUCQBPoBed
 RP2yu7NwxNKsc4DFzG0G3hNaXsXawD64kMp+
X-Google-Smtp-Source: AK7set9LWJHv5y9Kag7/oIknMU6TXd1mFMFkDOui+OvQeFq9jGhdq5CNY8P73nJe7vr9QU2O8zRnmw==
X-Received: by 2002:a05:6e02:1c89:b0:315:36f5:fb3f with SMTP id
 w9-20020a056e021c8900b0031536f5fb3fmr499578ill.23.1676334488896; 
 Mon, 13 Feb 2023 16:28:08 -0800 (PST)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 r17-20020a028811000000b003af4300d670sm4500923jai.27.2023.02.13.16.28.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 16:28:08 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>, richard.henderson@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, kevans@freebsd.org, f4bug@amsat.org,
 Thomas Huth <thuth@redhat.com>, Juergen Lock <nox@jelal.kn-bremen.de>,
 Stacey Son <sson@FreeBSD.org>
Subject: [PATCH v2 08/12] bsd-user: common routine do_freebsd_sysctl_oid for
 all sysctl variants
Date: Mon, 13 Feb 2023 17:27:53 -0700
Message-Id: <20230214002757.99240-9-imp@bsdimp.com>
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

From: Juergen Lock <nox@jelal.kn-bremen.de>

do_freebsd_sysctl_oid filters out some of the binary and special sysctls
where host != target. None of the sysctls that have to be translated from
host to target are handled here.

Signed-off-by: Juergen Lock <nox@jelal.kn-bremen.de>
Co-Authored-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
Co-Authored-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/freebsd/os-sys.c | 90 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 86 insertions(+), 4 deletions(-)

diff --git a/bsd-user/freebsd/os-sys.c b/bsd-user/freebsd/os-sys.c
index 084d53c16f6..e847404af66 100644
--- a/bsd-user/freebsd/os-sys.c
+++ b/bsd-user/freebsd/os-sys.c
@@ -126,7 +126,7 @@ static abi_ulong h2t_ulong_sat(u_long ul)
  * sysctl, see /sys/kern/kern_sysctl.c:sysctl_sysctl_oidfmt() (compare to
  * src/sbin/sysctl/sysctl.c)
  */
-static int G_GNUC_UNUSED oidfmt(int *oid, int len, char *fmt, uint32_t *kind)
+static int oidfmt(int *oid, int len, char *fmt, uint32_t *kind)
 {
     int qoid[CTL_MAXNAME + 2];
     uint8_t buf[BUFSIZ];
@@ -168,7 +168,7 @@ static int G_GNUC_UNUSED oidfmt(int *oid, int len, char *fmt, uint32_t *kind)
  *
  * For opaque data, per sysctl OID converts take care of it.
  */
-static void G_GNUC_UNUSED h2t_old_sysctl(void *holdp, size_t *holdlen, uint32_t kind)
+static void h2t_old_sysctl(void *holdp, size_t *holdlen, uint32_t kind)
 {
     size_t len;
     int hlen, tlen;
@@ -243,7 +243,7 @@ static void G_GNUC_UNUSED h2t_old_sysctl(void *holdp, size_t *holdlen, uint32_t
 /*
  * Convert the undocmented name2oid sysctl data for the target.
  */
-static inline void G_GNUC_UNUSED sysctl_name2oid(uint32_t *holdp, size_t holdlen)
+static inline void sysctl_name2oid(uint32_t *holdp, size_t holdlen)
 {
     size_t i, num = holdlen / sizeof(uint32_t);
 
@@ -252,12 +252,94 @@ static inline void G_GNUC_UNUSED sysctl_name2oid(uint32_t *holdp, size_t holdlen
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
+     * as big on the host which will be writing them. In h2t_old_sysctl we'll adjust
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
+                h2t_old_sysctl(holdp, &holdlen, kind);
+                /* NB: None of these are LONG or ULONG */
+                break;
+            }
+        } else {
+            /*
+             * Need to convert from host to target. All the weird special cases
+             * are handled above.
+             */
+            h2t_old_sysctl(holdp, &holdlen, kind);
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


