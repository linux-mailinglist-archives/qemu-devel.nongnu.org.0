Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 955D16A7369
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 19:26:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXR7j-0005Xq-UY; Wed, 01 Mar 2023 13:24:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pXR7g-0005UQ-KC
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 13:24:16 -0500
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pXR7e-0006p8-Ui
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 13:24:16 -0500
Received: by mail-io1-xd2e.google.com with SMTP id b5so5770454iow.0
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 10:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1677695053;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LeG5y+LKFT9Lmm5LAxfaRkWHoGaakH0jIgaTmEbfdPg=;
 b=4uqLZ3usCa2Btp+P1Z1FgTHGS9sa+a2QLJF3uLjEb6opdduag5KH0rkJYSUpo9rmoK
 qGEUZiFF2OXZcM8p6X1kUJkDPIVSFKQV2mazJ5Jccs7odrjqL5z20JYmpABI07F29p2O
 edpbYES81D1jTyOF/9qiB0P7Sx30RQDCb7gDUaUq/igIK9JsmHi9nEHXKGJgxOw5NXUc
 0iYnEO/Mh+9CDQZ+OaNunckHjQBnOynYqHd3CeGAAVyP+JjB4EQbGZymgi8NDuVDDyM7
 N3Pted3JwBgHQCrXSej+4LGOGJvZgXC9LOtp0/Y3/cWv9KpfPQeBSX/nGtmHwUL2N97Z
 XIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677695053;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LeG5y+LKFT9Lmm5LAxfaRkWHoGaakH0jIgaTmEbfdPg=;
 b=8FLOPyvwDV6mH6dAlo/xf9HtMbpm7os2ulvPhMkTqeSLXfq1jzNnyTYz0BXe89PB0S
 wYTnoDG/4qleZAj2Fc85BintfIWAq96Gc9i/3imySZRH8RaSH4lcq/6dB5fz3N/oPOHJ
 MX1PEQRtPobepKljokBrmh5u3Yszl4yjz2YYhiCIShO7sBFZX8Hoc2CxCynbhFU8LjwO
 ahifV18rmyNCeGTTHeIYY29+4nCP0dSYBN/g9Yrbt5nMSirrq5ZJX/7WAU/Z+6ybdtuz
 sejkLRcSyt1iSakrlQ8nYf9Wi4hkCm3jop8qgKggAUazJyKb+1/BvM6tY9c1CGr3UT9r
 UYoQ==
X-Gm-Message-State: AO0yUKU1/AtYJkZXBpvg3WiuaojuFxGTrRiPnMgIhrGQthzHkQYwYBl7
 ghV3H0ZVYwdVfE+41WMKoTXQoaZOeToULF2l
X-Google-Smtp-Source: AK7set8iSEn/HJq7Q6m6oXlbljf8m9kqn53mGNLzV83zAP7p+sGJlMA9doaRFLnaPXmDNtt1pnApwA==
X-Received: by 2002:a5e:8f41:0:b0:713:7b7c:46d7 with SMTP id
 x1-20020a5e8f41000000b007137b7c46d7mr5224239iop.21.1677695053591; 
 Wed, 01 Mar 2023 10:24:13 -0800 (PST)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 l5-20020a6b7b05000000b0073f8a470bacsm4169316iop.16.2023.03.01.10.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 10:24:13 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 Paolo Bonzini <pbonzini@redhat.com>, Juergen Lock <nox@jelal.kn-bremen.de>,
 Stacey Son <sson@FreeBSD.org>
Subject: [PULL 08/10] bsd-user: Start translation of arch-specific sysctls
Date: Wed,  1 Mar 2023 11:23:51 -0700
Message-Id: <20230301182353.21559-9-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230301182353.21559-1-imp@bsdimp.com>
References: <20230301182353.21559-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2e.google.com
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
index 625018b185b..6c9c2f8fd0b 100644
--- a/bsd-user/freebsd/os-sys.c
+++ b/bsd-user/freebsd/os-sys.c
@@ -67,13 +67,13 @@ static const int host_ctl_size[CTLTYPE + 1] = {
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
@@ -263,6 +263,146 @@ static abi_long G_GNUC_UNUSED do_freebsd_sysctl_oid(CPUArchState *env, int32_t *
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
+                    (*(abi_ulong *)holdp) = tswapal((abi_ulong)TARGET_PAGE_SIZE);
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
@@ -326,6 +466,7 @@ static abi_long G_GNUC_UNUSED do_freebsd_sysctl_oid(CPUArchState *env, int32_t *
         }
     }
 
+out:
     *holdlenp = holdlen;
     return ret;
 }
-- 
2.39.1


