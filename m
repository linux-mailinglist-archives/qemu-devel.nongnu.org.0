Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1353469A26D
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 00:35:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSnlR-00008Z-BF; Thu, 16 Feb 2023 18:34:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pSnlP-000072-14
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 18:34:07 -0500
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pSnlN-0008Ph-5x
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 18:34:06 -0500
Received: by mail-il1-x130.google.com with SMTP id v13so1422629iln.4
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 15:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rQSSYyJH9Z4zIbAHEAHA5MUcncm7KN1aWBx0s4v1VyI=;
 b=QFKPf6LFTWauNR7a5SKlFcoS66l5aOyjGkPfvZNOyaT7S2Ng28N1soV4g9sunIQ1X7
 OEyPJu55py12/wOWd9YAivThJaPQgcE4abK+/B/yVC1AHn4DEOAcI+WfTZfT6upMgP/G
 EamHmT4EdgKO29gxcbgbPwyBTnQBNzcsFXWPGpB45LWHKtFWey4nGYiSwo1Vr1yaAsAf
 0CbG08M2Ozw/rYsn+/096vXlYWI22hmrUIPuvBcGYdx5AE6s5eAVIrSbrIWO7I6qVPTG
 67QWl9MMd4v9S2kUddS9qqKUguFcRs9WahqIPwYpzTVbttqgR06W8JJ8UCxUDvISnE1Y
 9BMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rQSSYyJH9Z4zIbAHEAHA5MUcncm7KN1aWBx0s4v1VyI=;
 b=AMD/XC9HrlAgND+eECxi4n3YKNUfQ4zxyoMLq8H3ak7uZDb05uikMtAe4uqehEYkx9
 7PhVsueJ/TgMH/3MKH9G/LvSpKhTtXx/2ojmkga4YWHVf3ngNEajipAdAZFS5/Z97LGf
 TuZgiqrX9bOT8HGW46EmJzhrJtxTUmrjuYraE5R+OP97e+Wcqknv7WwOSTRpw1zil9JG
 pI2V1f1k2P0riKW3QTruKsEK/hskBsl5VheJWj9US6J/QJ0sSY0yoPaoXhzBEQZggpWc
 MNRa1wwyIpSmxe4oeeGLjU+t0S6dqvPV4yNktCttD+kggoMD8qqDBu8sxzPjXCfV13CB
 tQhw==
X-Gm-Message-State: AO0yUKUCCvGlpf8pyFkAN4Y2rrzMgC4koOjDCxkpI3MfrPoQp3dQAYkt
 49roxddPA2LvgJe1MyA+6Wu/ji9W9mvCXxXc
X-Google-Smtp-Source: AK7set9xGgBu1yLRiY4g2xXOSQseB6T1pn4ReylPte7Ya2x9ItyCzl85jqE32qbOOHpJ0XnPh1zscw==
X-Received: by 2002:a05:6e02:1a4c:b0:315:9a9b:9b54 with SMTP id
 u12-20020a056e021a4c00b003159a9b9b54mr658353ilv.12.1676590444115; 
 Thu, 16 Feb 2023 15:34:04 -0800 (PST)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 y7-20020a02a387000000b00346a98b0a76sm934816jak.77.2023.02.16.15.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 15:34:03 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 Warner Losh <imp@bsdimp.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Juergen Lock <nox@jelal.kn-bremen.de>,
 Stacey Son <sson@FreeBSD.org>
Subject: [PATCH v3 09/11] bsd-user: Start translation of arch-specific sysctls
Date: Thu, 16 Feb 2023 16:33:51 -0700
Message-Id: <20230216233353.13944-10-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216233353.13944-1-imp@bsdimp.com>
References: <20230216233353.13944-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::130;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x130.google.com
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

Intercept some syscalls that we need to translate (like the archiecture
we're running on) and translate them. These are only the simplest ones
so far.

Signed-off-by: Juergen Lock <nox@jelal.kn-bremen.de>
Co-Authored-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
Co-Authored-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/freebsd/os-sys.c | 145 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 143 insertions(+), 2 deletions(-)

diff --git a/bsd-user/freebsd/os-sys.c b/bsd-user/freebsd/os-sys.c
index 42f0cc82279..1464e64428f 100644
--- a/bsd-user/freebsd/os-sys.c
+++ b/bsd-user/freebsd/os-sys.c
@@ -67,13 +67,13 @@ static const int host_ctl_size[CTLTYPE+1] = {
  */
 static const abi_ulong guest_max_mem = UINT32_MAX - 0x100c000 + 1;
 
-static abi_ulong G_GNUC_UNUSED cap_memory(uint64_t mem)
+static abi_ulong cap_memory(uint64_t mem)
 {
     return MIN(guest_max_mem, mem);
 }
 #endif
 
-static abi_ulong G_GNUC_UNUSED scale_to_guest_pages(uint64_t pages)
+static abi_ulong scale_to_guest_pages(uint64_t pages)
 {
     /* Scale pages from host to guest */
     pages = muldiv64(pages, qemu_real_host_page_size(), TARGET_PAGE_SIZE);
@@ -264,6 +264,146 @@ static abi_long G_GNUC_UNUSED do_freebsd_sysctl_oid(CPUArchState *env, int32_t *
     oidfmt(snamep, namelen, NULL, &kind);
 
     /* Handle some arch/emulator dependent sysctl()'s here. */
+    switch (snamep[0]) {
+    case CTL_KERN:
+        switch (snamep[1]) {
+        case KERN_USRSTACK:
+            if (oldlen) {
+                (*(abi_ulong *)holdp) = tswapal(TARGET_USRSTACK);
+            }
+            holdlen = sizeof(abi_ulong);
+            ret = 0;
+            goto out;
+
+        case KERN_PS_STRINGS:
+            if (oldlen) {
+                (*(abi_ulong *)holdp) = tswapal(TARGET_PS_STRINGS);
+            }
+            holdlen = sizeof(abi_ulong);
+            ret = 0;
+            goto out;
+
+        default:
+            break;
+        }
+        break;
+
+    case CTL_HW:
+        switch (snamep[1]) {
+        case HW_MACHINE:
+            holdlen = sizeof(TARGET_HW_MACHINE);
+            if (holdp) {
+                strlcpy(holdp, TARGET_HW_MACHINE, oldlen);
+            }
+            ret = 0;
+            goto out;
+
+        case HW_MACHINE_ARCH:
+        {
+            holdlen = sizeof(TARGET_HW_MACHINE_ARCH);
+            if (holdp) {
+                strlcpy(holdp, TARGET_HW_MACHINE_ARCH, oldlen);
+            }
+            ret = 0;
+            goto out;
+        }
+        case HW_NCPU:
+            if (oldlen) {
+                (*(abi_int *)holdp) = tswap32(bsd_get_ncpu());
+            }
+            holdlen = sizeof(int32_t);
+            ret = 0;
+            goto out;
+#if defined(TARGET_ARM)
+        case HW_FLOATINGPT:
+            if (oldlen) {
+                ARMCPU *cpu = env_archcpu(env);
+                *(abi_int *)holdp = cpu_isar_feature(aa32_vfp, cpu);
+            }
+            holdlen = sizeof(abi_int);
+            ret = 0;
+            goto out;
+#endif
+
+
+#ifdef TARGET_ABI32
+        case HW_PHYSMEM:
+        case HW_USERMEM:
+        case HW_REALMEM:
+            holdlen = sizeof(abi_ulong);
+            ret = 0;
+
+            if (oldlen) {
+                int mib[2] = {snamep[0], snamep[1]};
+                unsigned long lvalue;
+                size_t len = sizeof(lvalue);
+
+                if (sysctl(mib, 2, &lvalue, &len, NULL, 0) == -1) {
+                    ret = -1;
+                } else {
+                    lvalue = cap_memory(lvalue);
+                    (*(abi_ulong *)holdp) = tswapal((abi_ulong)lvalue);
+                }
+            }
+            goto out;
+#endif
+
+        default:
+        {
+            static int oid_hw_availpages;
+            static int oid_hw_pagesizes;
+
+            if (!oid_hw_availpages) {
+                int real_oid[CTL_MAXNAME + 2];
+                size_t len = sizeof(real_oid) / sizeof(int);
+
+                if (sysctlnametomib("hw.availpages", real_oid, &len) >= 0) {
+                    oid_hw_availpages = real_oid[1];
+                }
+            }
+            if (!oid_hw_pagesizes) {
+                int real_oid[CTL_MAXNAME + 2];
+                size_t len = sizeof(real_oid) / sizeof(int);
+
+                if (sysctlnametomib("hw.pagesizes", real_oid, &len) >= 0) {
+                    oid_hw_pagesizes = real_oid[1];
+                }
+            }
+
+            if (oid_hw_availpages && snamep[1] == oid_hw_availpages) {
+                long lvalue;
+                size_t len = sizeof(lvalue);
+
+                if (sysctlbyname("hw.availpages", &lvalue, &len, NULL, 0) == -1) {
+                    ret = -1;
+                } else {
+                    if (oldlen) {
+                        lvalue = scale_to_guest_pages(lvalue);
+                        (*(abi_ulong *)holdp) = tswapal((abi_ulong)lvalue);
+                    }
+                    holdlen = sizeof(abi_ulong);
+                    ret = 0;
+                }
+                goto out;
+            }
+
+            if (oid_hw_pagesizes && snamep[1] == oid_hw_pagesizes) {
+                if (oldlen) {
+                    (*(abi_ulong *)holdp) = tswapal((abi_ulong)getpagesize());
+                    ((abi_ulong *)holdp)[1] = 0;
+                }
+                holdlen = sizeof(abi_ulong) * 2;
+                ret = 0;
+                goto out;
+            }
+            break;
+        }
+        }
+        break;
+
+    default:
+        break;
+    }
 
 #ifdef TARGET_ABI32
     /*
@@ -327,6 +467,7 @@ static abi_long G_GNUC_UNUSED do_freebsd_sysctl_oid(CPUArchState *env, int32_t *
         }
     }
 
+out:
     *holdlenp = holdlen;
     return ret;
 }
-- 
2.39.1


