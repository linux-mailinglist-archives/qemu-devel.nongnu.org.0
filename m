Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B52695556
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 01:29:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRjBB-0007Ry-QY; Mon, 13 Feb 2023 19:28:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pRjB7-0007RN-6m
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 19:28:13 -0500
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pRjB5-00060B-FE
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 19:28:12 -0500
Received: by mail-il1-x132.google.com with SMTP id v6so876309ilc.10
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 16:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XQOYBxgR23EvKF+EuGnmtn+Ceb+bOBIn7DIZLpdNiBw=;
 b=EUCQW19vk4UVvuv4EIv/YOLM0S9wcHJFDAoD3Ox2in/+tVBKNyiUz7e2YH9J3cjknE
 fXJJRyjN6pPywYJz5R0gKztDMfOl/ZvpAgM3xYiShkrWKno/48aQ0sLHTk9tf9TRyJmF
 mfWN2EyzTWdHco+uPHeWawoqtCSJJJBd4jiYXaq4HviLwGQIsaNDv7AOsgCvIP57ep20
 8EXQ8j/xxBK+BJtbN8aL8HzqBFqXf9cUIiLZkoOSEEwI1w4gt19kR+wbjVDtuRYJovxA
 4qg2IVUoCsN6/7eTI4H0YthfnqXhfJ1Q5ALipSqE9ifbL5cNPuc5A4wTOcyRRcSsUdis
 oCvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XQOYBxgR23EvKF+EuGnmtn+Ceb+bOBIn7DIZLpdNiBw=;
 b=u1hDdn8tBO9td3Qx8/CLMxeBkQOB6ch+JdqMpsNhKBadI8PVGzmV3HOIT5LLNIcLq9
 URRS+/ARpaBL6LE2JtS1zWON4bm6rSIosdqTw8V5H6TXhRgimEJcLiq1L/guPo2ORtg3
 BIc/EiQADHiGlZkAUCctFu0xbV4SSMXxlRewJwU4OI3t1C5QC/QJeLPgqo/jsm2+5gT0
 3zHp/YAtEZjPpb2Sv2lwoIPMfoQREdd1AgJCgcrOnmSUgzzvVaIGpm+HcdUOrGjqlmRB
 S4PsTa6gEGSfPeck2rC2Dq9YS+0itVdpGqBzGea5q19cNSbbTvgmJU8+iVN4STmTLvcH
 wIPg==
X-Gm-Message-State: AO0yUKW0aHeuCJEujLAMdUkCntbxlCAKHXMyHzZ0DKhOQLQWet3Z/Cqq
 f52qRE0yAEEvLjhEEmCi8BVZWSC9HD7ZTvJS
X-Google-Smtp-Source: AK7set9ADxJjgp9jrxEHmCokWNZsuj0U6WBYs9Z0gf7xA5SqRbFTfJIDbXSZSxeA1iVVJn3wD6gNug==
X-Received: by 2002:a05:6e02:b4c:b0:315:564b:f3da with SMTP id
 f12-20020a056e020b4c00b00315564bf3damr571217ilu.8.1676334490042; 
 Mon, 13 Feb 2023 16:28:10 -0800 (PST)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 r17-20020a028811000000b003af4300d670sm4500923jai.27.2023.02.13.16.28.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 16:28:09 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>, richard.henderson@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, kevans@freebsd.org, f4bug@amsat.org,
 Thomas Huth <thuth@redhat.com>, Juergen Lock <nox@jelal.kn-bremen.de>,
 Stacey Son <sson@FreeBSD.org>
Subject: [PATCH v2 09/12] bsd-user: Start translation of arch-specific sysctls
Date: Mon, 13 Feb 2023 17:27:54 -0700
Message-Id: <20230214002757.99240-10-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214002757.99240-1-imp@bsdimp.com>
References: <20230214002757.99240-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::132;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x132.google.com
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
---
 bsd-user/freebsd/os-sys.c | 145 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 143 insertions(+), 2 deletions(-)

diff --git a/bsd-user/freebsd/os-sys.c b/bsd-user/freebsd/os-sys.c
index e847404af66..cbaa70958b9 100644
--- a/bsd-user/freebsd/os-sys.c
+++ b/bsd-user/freebsd/os-sys.c
@@ -67,7 +67,7 @@ static const int host_ctl_size[CTLTYPE+1] = {
  */
 static const abi_ulong target_max_mem = UINT32_MAX - 0x100c000 + 1;
 
-static abi_ulong G_GNUC_UNUSED cap_memory(uint64_t mem)
+static abi_ulong cap_memory(uint64_t mem)
 {
     if (((unsigned long)target_max_mem) < mem) {
         mem = target_max_mem;
@@ -79,7 +79,7 @@ static abi_ulong G_GNUC_UNUSED cap_memory(uint64_t mem)
 
 static unsigned long host_page_size;
 
-static abi_ulong G_GNUC_UNUSED scale_to_target_pages(uint64_t pages)
+static abi_ulong scale_to_target_pages(uint64_t pages)
 {
     if (host_page_size == 0) {
         host_page_size = getpagesize();
@@ -273,6 +273,146 @@ static abi_long G_GNUC_UNUSED do_freebsd_sysctl_oid(CPUArchState *env, int32_t *
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
+                (*(int32_t *)holdp) = tswap32(bsd_get_ncpu());
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
+            holdlen = sizeof(int32_t);
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
+                        lvalue = scale_to_target_pages(lvalue);
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
@@ -336,6 +476,7 @@ static abi_long G_GNUC_UNUSED do_freebsd_sysctl_oid(CPUArchState *env, int32_t *
         }
     }
 
+out:
     *holdlenp = holdlen;
     return ret;
 }
-- 
2.39.1


