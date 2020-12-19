Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5962DF013
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 15:53:59 +0100 (CET)
Received: from localhost ([::1]:55344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqdcM-0007Vn-Bs
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 09:53:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maahiuzeon@gmail.com>)
 id 1kqRkp-0007pw-Sm
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 21:13:56 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:46230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maahiuzeon@gmail.com>)
 id 1kqRkm-0002as-BU
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 21:13:54 -0500
Received: by mail-pg1-x530.google.com with SMTP id c22so2435838pgg.13
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 18:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=TZT7Bxnx0o4z9Zavs414/y2IyeVN+7EscVkavAaWRmA=;
 b=HoqA6637NQB8Ysr4Cy/6nv9g9UAp/HoxbYkOGeJCsuUcU3HGbExMlYTygNNtxyIeBT
 jhGXh8sSHVoCSg74nmFvRVKIW09Xz+INPs2lO88LIAVVzKjpAIGRn8HDFFJBuptnzcXl
 dwTGtNpJ4CPmB9sDU88CHlwHlHoP4r8ilSpPqmJu4C+8YNkbJ1vToqyv4UGEABeJzOCK
 iHjlpP71IPnqQ7rwU5V4BrIQKMR3toXsrW8h3BL6wPgv132TjDAmHuLsfhKir+Hm45OP
 LO6OvogMDqi7RD/rkSG5YIF70mq6oRcZlRPMiADK8m3HoEagiEFdpDppoN1piAXa+EjW
 112g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=TZT7Bxnx0o4z9Zavs414/y2IyeVN+7EscVkavAaWRmA=;
 b=NBfcEHVZYTjpq+AHLNWXOB05Ul42jQFytJykEI3sR0kwH6bF9eiyUx97Mi39ICwLd3
 LAEcI5PAO7/q2fJ13790N3sYps1C9UfNwCWu420PEi/+QNtZLgtEniVGFzWkDQJR/ks6
 1uQMQlJyKXfuw7m9GVLm5lrn8Ey5oyVnoJLwYN6LmBoDhgblVGIJ/rUzEUf+rjTkHdQ+
 uq3hN3mcmq8p4IpfhUrYGsVs+WhNQHmtAa6jpYCtzNBQcSKT5SQO0FncqVmrqOOxiUqz
 DIcHchaNPa6eFKmlhE1sH9hR/bGBnCjxFfgmoblQI3K6AMJQGZBEqww3838VPILArM4s
 i44A==
X-Gm-Message-State: AOAM531XVuYegWcU53jekePHxz+yLno6Bge1ioqfXCkPaix5dxrWbohK
 s+VWoNmK8RHjsbz4Y1fptBU=
X-Google-Smtp-Source: ABdhPJwQ7Ch176HgV0oqzodAx0EHhOHM/2R6+JUyK+yxn61amB9NRd4r5C95qeE2TPewRzlraA9Npg==
X-Received: by 2002:a63:f919:: with SMTP id h25mr6652749pgi.440.1608344030350; 
 Fri, 18 Dec 2020 18:13:50 -0800 (PST)
Received: from Hills-Mac-Pro.local (c-73-222-199-61.hsd1.ca.comcast.net.
 [73.222.199.61])
 by smtp.gmail.com with ESMTPSA id gk8sm6920100pjb.52.2020.12.18.18.13.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Dec 2020 18:13:49 -0800 (PST)
Date: Fri, 18 Dec 2020 18:13:47 -0800
From: Hill Ma <maahiuzeon@gmail.com>
To: dirty@apple.com, r.bolshakov@yadro.com
Subject: [PATCH] hvf: guard xgetbv call.
Message-ID: <X91h2yoy7qVrO1kv@Hills-Mac-Pro.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=maahiuzeon@gmail.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 19 Dec 2020 09:52:59 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This prevents illegal instruction on cpus do not support xgetbv.

Buglink: https://bugs.launchpad.net/qemu/+bug/1758819
Signed-off-by: Hill Ma <maahiuzeon@gmail.com>
---
 target/i386/hvf/x86_cpuid.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/target/i386/hvf/x86_cpuid.c b/target/i386/hvf/x86_cpuid.c
index a6842912f5..b4b7111fc3 100644
--- a/target/i386/hvf/x86_cpuid.c
+++ b/target/i386/hvf/x86_cpuid.c
@@ -100,11 +100,16 @@ uint32_t hvf_get_supported_cpuid(uint32_t func, uint32_t idx,
         break;
     case 0xD:
         if (idx == 0) {
-            uint64_t host_xcr0 = xgetbv(0);
-            uint64_t supp_xcr0 = host_xcr0 & (XSTATE_FP_MASK | XSTATE_SSE_MASK |
+            uint64_t supp_xcr0 = XSTATE_FP_MASK | XSTATE_SSE_MASK |
                                   XSTATE_YMM_MASK | XSTATE_BNDREGS_MASK |
                                   XSTATE_BNDCSR_MASK | XSTATE_OPMASK_MASK |
-                                  XSTATE_ZMM_Hi256_MASK | XSTATE_Hi16_ZMM_MASK);
+                                  XSTATE_ZMM_Hi256_MASK | XSTATE_Hi16_ZMM_MASK;
+            if ((ecx & CPUID_EXT_AVX) &&
+                (ecx & CPUID_EXT_XSAVE) &&
+                (ecx & CPUID_EXT_OSXSAVE)) {
+                uint64_t host_xcr0 = xgetbv(0);
+                supp_xcr0 &= host_xcr0;
+            }
             eax &= supp_xcr0;
         } else if (idx == 1) {
             hv_vmx_read_capability(HV_VMX_CAP_PROCBASED2, &cap);
-- 
2.20.1 (Apple Git-117)


