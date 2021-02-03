Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2609730E31E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 20:14:07 +0100 (CET)
Received: from localhost ([::1]:47616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7NbK-00080C-7N
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 14:14:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOJ-0007ER-3o
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:00:39 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:38522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NO0-0001Wy-9o
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:00:35 -0500
Received: by mail-pj1-x1029.google.com with SMTP id l18so240895pji.3
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 11:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kyzjq96nH0KWrOiii6echH6ofV70lplGMBMMhcVo2Uo=;
 b=F1CpBz6KI8pwYOdtsjrzYcnoFUgg6t6MPUbKQ37abf29plDfhp5Ia/GX5cs0qA//dA
 3N0wtxcry/4ZS8oP9TuNzIFnTfMQonvee2WpyQ/XBdvDLA/81beZqcP45SpWqAdBX5/J
 xNQh8gi8cGdjBLOzxVKiTBtQ91cP7g/BdsWQmRtU7LyJXn/w6HzB89pqP7xX9AxVR1go
 AxJxXP+KNHMWjObKeaYVHjhOrsILHx86Hysz4ncDKyN9tXnef2CzmpYdPiSRMsCeZgtI
 QIdNtJNgXb+2m9mnd3OF5qS0qqRD5PIAQIzQtvkTnA3GFSWOtqslFoa2MIejmPJmY5Tk
 P+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kyzjq96nH0KWrOiii6echH6ofV70lplGMBMMhcVo2Uo=;
 b=nvyY0f3WCbx3lWkltZdZnpIoitLcAdg4efwtkDPcGPi/IUZ3hqZ/H7QMWfY7zmcRfj
 CPvQApls0rk7j2txUqT7CzDdCttNGWahMI+nD9tuJHF6DngbSl+8++b6mqtx7BXwD5uk
 pBqNItSoYkllWv7tuHa2v/fwRHRWUt68O0gC3ushSgrgnyyxs3RBuzeAJCCH34gIrJTb
 +EwmtLB5ib962z/p09Rg2sU1ErPboF4MCyJ+aZdJ7XHOa5hz2Lt3F160lqaMk2F5vUMn
 TYXcxOv3qw7wl7R406G1zVRqTJBtOA/NJojgGld4zA6+GMGbuCw62QExz7Nk40pCgDuT
 HwLA==
X-Gm-Message-State: AOAM5311u6I/7RJcjHVFh4Ru8cXhU6i+DtNNHAPb42z2h3JV2uqqyOx8
 /19tkpMRcnWGhSssk1ELZXhLhgLU9DIuc5pO
X-Google-Smtp-Source: ABdhPJwzi21rq1Ox8a5PAeAhT9E3texglbeKrHnLId8Pez9C22NdeuKfcV+w7THrz6lfOvWOrVDEjA==
X-Received: by 2002:a17:90a:fa09:: with SMTP id
 cm9mr4235955pjb.160.1612378818964; 
 Wed, 03 Feb 2021 11:00:18 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l2sm2906666pju.25.2021.02.03.11.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:00:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 02/31] linux-user: Introduce PAGE_ANON
Date: Wed,  3 Feb 2021 08:59:41 -1000
Message-Id: <20210203190010.759771-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203190010.759771-1-richard.henderson@linaro.org>
References: <20210203190010.759771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Record whether the backing page is anonymous, or if it has file
backing.  This will allow us to get close to the Linux AArch64
ABI for MTE, which allows tag memory only on ram-backed VMAs.

The real ABI allows tag memory on files, when those files are
on ram-backed filesystems, such as tmpfs.  We will not be able
to implement that in QEMU linux-user.

Thankfully, anonymous memory for malloc arenas is the primary
consumer of this feature, so this restricted version should
still be of use.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h | 2 ++
 linux-user/mmap.c      | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 99a09ee137..c23c77589b 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -275,6 +275,8 @@ extern intptr_t qemu_host_page_mask;
 #define PAGE_WRITE_INV 0x0020
 /* For use with page_set_flags: page is being replaced; target_data cleared. */
 #define PAGE_RESET     0x0040
+/* For linux-user, indicates that the page is MAP_ANON. */
+#define PAGE_ANON      0x0080
 
 #if defined(CONFIG_BSD) && defined(CONFIG_USER_ONLY)
 /* FIXME: Code that sets/uses this is broken and needs to go away.  */
diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index c693505b60..7fb4c628e1 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -599,6 +599,9 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
         }
     }
  the_end1:
+    if (flags & MAP_ANONYMOUS) {
+        page_flags |= PAGE_ANON;
+    }
     page_flags |= PAGE_RESET;
     page_set_flags(start, start + len, page_flags);
  the_end:
-- 
2.25.1


