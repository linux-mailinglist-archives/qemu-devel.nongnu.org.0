Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2105692B10
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Feb 2023 00:23:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQcjF-0007Bl-4l; Fri, 10 Feb 2023 18:22:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pQcj5-0007A7-RF
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 18:22:43 -0500
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pQcj3-00052w-NM
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 18:22:43 -0500
Received: by mail-il1-x12b.google.com with SMTP id v15so2901772ilc.10
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 15:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tDw5vzZ3WF8Nj3x4pvbSGQIQ3uW/UgV5IIjQeiqfa50=;
 b=kCGDjsUWQekmddRA6EUkNZiJ7u/9kTeCWCWZWms8k5yIKa+kIf2SgQQoGzY+ubNu2I
 SyCnJi8YvZfzMIMQXLukBHLyqe8fUSfUNibKqzp82Oxr/0VEKYrbRkCWydoZ2/zcnmiT
 UfZm2W+ZIoY8B9ATkH0AWi7ljH00ZoKSaZxK2GAEsqCA063W+IaVIUFaybHul909VMk5
 p3YnU/7hSLTYUzDbWhJhdEu/GoxrUnj47XQ470Mmjq8jLS7q5TZpTqyTqFMz63yF6imj
 S/wBBIF+EkBtyuJq3+jb7VdltyMy16bVzDjWrOkHSfS4/+N3LxlHcxAsUCqxf8TGIV54
 Xy+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tDw5vzZ3WF8Nj3x4pvbSGQIQ3uW/UgV5IIjQeiqfa50=;
 b=YF1vdKYZuvyYyuTQlx68uU5CnddzXA8EIoqeCE9e1lD1fkn83KnqisVdFgo1avpjIE
 O1N5jfcg5j0ePDWHwGMRCqy3oNrBIPfPv/GLs3VdUR2OzT03zQK3y2X+Jy0EhnIXxJnT
 h3IFZx+q4xEZbRZ+05Ck5Lmbox4eIZzsAECGLI8HClE9BBEEgoBC7ZazCqqwT+ePYlce
 +L74RTKp6JokWMFPUjZOo16+jKbr94hhbOQIvD8egKENhz+VjlkVJg0VGPUpsb9UY9M3
 BqWm+P7LNN6XO+aVsUrNoIis3GOek1UCh5VAQdGpGBJY/jjrqiF1wbcq39i35mdbJWjw
 spMg==
X-Gm-Message-State: AO0yUKVJtlZYhtpCNeUhqDQMSXNsEGUxOhQRAod4twyLpZuq0bDaal3R
 EaMHD+KLGYffNED+Us5g7ixGJZWywbCsf2js
X-Google-Smtp-Source: AK7set/8WY2+Y1nKq2hf/c0LCegKVPhkm9/ay5CNfvIA6cu1mdNV04Qw8PFD5CfhFdbmbRPSDtkbgQ==
X-Received: by 2002:a05:6e02:2141:b0:30c:2b07:547c with SMTP id
 d1-20020a056e02214100b0030c2b07547cmr19315922ilv.26.1676071360020; 
 Fri, 10 Feb 2023 15:22:40 -0800 (PST)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 k18-20020a02c772000000b003a9418e89acsm1850995jao.23.2023.02.10.15.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 15:22:39 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 f4bug@amsat.org, Warner Losh <imp@bsdimp.com>,
 richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Juergen Lock <nox@jelal.kn-bremen.de>,
 Stacey Son <sson@FreeBSD.org>
Subject: [PATCH 6/9] bsd-user: common routine do_freebsd_sysctl_oid for all
 sysctl variants
Date: Fri, 10 Feb 2023 16:18:26 -0700
Message-Id: <20230210231829.39476-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210231829.39476-1-imp@bsdimp.com>
References: <20230210231829.39476-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12b;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12b.google.com
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
where host != target. This commit focuses on the simple sysctls that can
be done in a few lines.

Signed-off-by: Juergen Lock <nox@jelal.kn-bremen.de>
Co-Authored-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/freebsd/os-sys.c | 212 ++++++++++++++++++++++++++++++++++++++
 bsd-user/qemu.h           |   5 +
 2 files changed, 217 insertions(+)

diff --git a/bsd-user/freebsd/os-sys.c b/bsd-user/freebsd/os-sys.c
index ac5ab9b17bc..a8fb29f36b7 100644
--- a/bsd-user/freebsd/os-sys.c
+++ b/bsd-user/freebsd/os-sys.c
@@ -133,6 +133,218 @@ static inline void sysctl_oidfmt(uint32_t *holdp)
     holdp[0] = tswap32(holdp[0]);
 }
 
+#define bsd_get_ncpu() 1 /* Placeholder */
+
+static abi_long do_freebsd_sysctl_oid(CPUArchState *env, int32_t *snamep,
+        int32_t namelen, void *holdp, size_t *holdlenp, void *hnewp,
+        size_t newlen)
+{
+    uint32_t kind = 0;
+#if TARGET_ABI_BITS != HOST_LONG_BITS
+    const abi_ulong maxmem = -0x100c000;
+#endif
+    abi_long ret;
+    size_t holdlen, oldlen;
+
+    holdlen = oldlen = *holdlenp;
+    oidfmt(snamep, namelen, NULL, &kind);
+
+    /* Handle some arch/emulator dependent sysctl()'s here. */
+    switch (snamep[0]) {
+#if defined(TARGET_PPC) || defined(TARGET_PPC64)
+    case CTL_MACHDEP:
+        switch (snamep[1]) {
+        case 1:    /* CPU_CACHELINE */
+            holdlen = sizeof(uint32_t);
+            (*(uint32_t *)holdp) = tswap32(env->dcache_line_size);
+            ret = 0;
+            goto out;
+        }
+        break;
+#endif
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
+                (*(int32_t *)holdp) = tswap32(bsd_get_ncpu());
+            }
+            holdlen = sizeof(int32_t);
+            ret = 0;
+            goto out;
+#if defined(TARGET_ARM)
+        case HW_FLOATINGPT:
+            if (oldlen) {
+#ifdef ARM_FEATURE_VFP /* XXX FIXME XXX */
+                if (env->features & ((1ULL << ARM_FEATURE_VFP)|
+                                     (1ULL << ARM_FEATURE_VFP3)|
+                                     (1ULL << ARM_FEATURE_VFP4)))
+                    *(int32_t *)holdp = 1;
+                else
+                    *(int32_t *)holdp = 0;
+#else
+                *(int32_t *)holdp = 1;
+#endif
+            }
+            holdlen = sizeof(int32_t);
+            ret = 0;
+            goto out;
+#endif
+
+
+#if TARGET_ABI_BITS != HOST_LONG_BITS
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
+                    if (((unsigned long)maxmem) < lvalue) {
+                        lvalue = maxmem;
+                    }
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
+#if TARGET_ABI_BITS != HOST_LONG_BITS
+                        abi_ulong maxpages = maxmem / (abi_ulong)getpagesize();
+                        if (((unsigned long)maxpages) < lvalue) {
+                            lvalue = maxpages;
+                        }
+#endif
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
+
+    ret = get_errno(sysctl(snamep, namelen, holdp, &holdlen, hnewp, newlen));
+    if (!ret && (holdp != 0)) {
+
+        if (0 == snamep[0] &&
+            (2 == snamep[1] || 3 == snamep[1] || 4 == snamep[1])) {
+            switch (snamep[1]) {
+            case 2:
+            case 3:
+                /* Handle the undocumented name2oid special case. */
+                sysctl_name2oid(holdp, holdlen);
+                break;
+
+            case 4:
+            default:
+                /* Handle oidfmt */
+                sysctl_oidfmt(holdp);
+                break;
+            }
+        } else {
+            sysctl_oldcvt(holdp, &holdlen, kind);
+        }
+    }
+
+out:
+    *holdlenp = holdlen;
+    return ret;
+}
+
 /* sysarch() is architecture dependent. */
 abi_long do_freebsd_sysarch(void *cpu_env, abi_long arg1, abi_long arg2)
 {
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 0ceecfb6dfa..e24a8cfcfb1 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -252,6 +252,11 @@ bool is_error(abi_long ret);
 int host_to_target_errno(int err);
 
 /* os-sys.c */
+abi_long do_freebsd_sysctl(CPUArchState *env, abi_ulong namep, int32_t namelen,
+        abi_ulong oldp, abi_ulong oldlenp, abi_ulong newp, abi_ulong newlen);
+abi_long do_freebsd_sysctlbyname(CPUArchState *env, abi_ulong namep,
+        int32_t namelen, abi_ulong oldp, abi_ulong oldlenp, abi_ulong newp,
+        abi_ulong newlen);
 abi_long do_freebsd_sysarch(void *cpu_env, abi_long arg1, abi_long arg2);
 
 /* user access */
-- 
2.39.1


