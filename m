Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D4A315A8F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 01:06:15 +0100 (CET)
Received: from localhost ([::1]:48744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9d1K-0005By-G2
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 19:06:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cxp-0003Nm-Ma
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:02:37 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:32979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cxj-0007xw-NV
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:02:37 -0500
Received: by mail-pf1-x42c.google.com with SMTP id z6so118361pfq.0
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 16:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oq1eUfNJ5Tqc2veFWdzskdMZSlKpLHVOgyNg6GN6+/A=;
 b=VHwyeFjEVAgwfbph2sRltWfKTGUpGDBRwG9xdSAm1h6f2/gxDfzVnNtfy8oc3upu2Y
 9Uql6jx37Gnx+LXOrhCdpG3UVAbdiOzHWwnGajKn4kK1/RTfrG2aI65a6t98uKSNzFYN
 QsaCMzzqd/1kaBCiM1Oh5wPq1mqVF0trjUAiPFLLJQMm/9dGofTkZRTC+WFDiCWKhJ8W
 tY672q42x2X8tpoNM5yJsyEFAhdZ2YARRkPEIFk0QMpLmSnBrX2EN0f4J/gjA2ltuxIX
 hJxi9VjJzuTEwoj1Z45KEwgw6GOocjFvVPfpTKr3mMsacf59B/BMlkbHkA3ocO0bAxfh
 k4TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oq1eUfNJ5Tqc2veFWdzskdMZSlKpLHVOgyNg6GN6+/A=;
 b=m79ODfaKc3XF/bikh/fZN6sRuy2O2tz3kWbPHQDm3bDO6KVZRexzzo50JJn92URrwd
 8PCI34Q0ATFUodFTWJPR19CynSGI6kDGj0aKBWuK3NPt8XIlFRb4YJyKIPyuPlL278i9
 j8/sSnIFaBVx4IIEUxtd4md5RdfnIjhu0r9oC8TAdsI55TNU1syPbSYVp0MmjF3ll/uA
 jFSWYxQe7l4e5z3jFwEpGqTNg10tJmt7EoO5BT9WVx0xs/y889tUXEJlAWO3iK1klXcE
 TDvTqPm4i6/uUthiiJ9F5Bhs6xfiYdMn29zrNPFkhtLF8WgznuEaWw+2tpbhj+TE5zjX
 d0ow==
X-Gm-Message-State: AOAM5304hP+a4wvsHUZ1PODFKC61T3cVVJVq4EPUMXoCGX0d8qwWfMLa
 35CvscXMXvqh1E2BUureLNbCdRN/XEFxpA==
X-Google-Smtp-Source: ABdhPJxPi869KyBdjJUMCHYzMes2qebsvqDOwBba4Vx9n70Kj05yfMkGeb/kq4NwRi1rPZjd1cqTvQ==
X-Received: by 2002:aa7:8d8e:0:b029:1d1:f9c9:cff6 with SMTP id
 i14-20020aa78d8e0000b02901d1f9c9cff6mr396226pfr.31.1612915348360; 
 Tue, 09 Feb 2021 16:02:28 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id me3sm164189pjb.32.2021.02.09.16.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 16:02:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 02/31] linux-user: Introduce PAGE_ANON
Date: Tue,  9 Feb 2021 16:01:54 -0800
Message-Id: <20210210000223.884088-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210000223.884088-1-richard.henderson@linaro.org>
References: <20210210000223.884088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Cc: peter.maydell@linaro.org
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
index af555f1798..1f47e0fe44 100644
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


