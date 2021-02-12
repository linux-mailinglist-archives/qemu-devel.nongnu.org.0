Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7FB31A4CF
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 19:56:07 +0100 (CET)
Received: from localhost ([::1]:55460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAdbq-0007Ho-Fv
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 13:56:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVB-0001VI-8z
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:13 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:35003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdV6-0007fq-EN
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:12 -0500
Received: by mail-pl1-x630.google.com with SMTP id g20so332478plo.2
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 10:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oq1eUfNJ5Tqc2veFWdzskdMZSlKpLHVOgyNg6GN6+/A=;
 b=hMl1JnXxUm+aWxE69SXTyDaTzFB7ZU6bT5+zPQYO/ppU8c1bR5WTqwdwk6UUnsIuxN
 auWyIsSDmCEx8cEq0gzpUj6UItq1ABoUv+ks9CD6n7TYK939KF4Wl4jIlgr2iKXcq58h
 oLN/ePq3UgA/7wH7tklb0++9vePXstKE6fuLDjvFW5uuWj2cR+AtdwnFUHInOf2oX1vo
 iIp8c209mt8krXoLtawg0UIcCrLYzEnOboBIBRx0/pnD9DWuueyMoYvMV1s4fDZeN8OE
 5BeXAka5wHd+z1w4KNtSESWfwz8L2sLt3o5JZ/PMiyYlzQHYodN4cuOXh7tX6BORk+zV
 Dp0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oq1eUfNJ5Tqc2veFWdzskdMZSlKpLHVOgyNg6GN6+/A=;
 b=sMUyO+lXzwEmG5ioN58AHv4WjmLyM3AwOVkbkGi6lnMpcadaEyq6zbp4cHYwFNgAO8
 SHHpKsigvWyqEElhW0XSEGlv0VPumNf2cAE8iNiv4tR3SmNzo53Ql3SxAheMKQq/wcks
 iClBnCuN7T6CSnYjUAxlT3yZ2zq5IdzHvT1EOYKp7vqal0S90SMJLl/sKjUOI3RYINkM
 dZndAFKF87bnUYFM6jlTrciTbRUvEEoIfNsfliZZjagOJ1LIIOv7lmJ6/hJb6Le9SR8c
 oGsBNp7Lgtkzg6dgj6N4vkeT6nZAwPGObpejS3B3rFyp1TvFQC8+FUyJqx9X2KceaN5W
 ObiQ==
X-Gm-Message-State: AOAM532UwyUDKaZYu92YqyUWyXhMaGMKus9l8SUzXlyOQW7aQ3Ko6gPp
 oH9VGOCZG93uaoSkZegk5I00XFEXuNoL2Q==
X-Google-Smtp-Source: ABdhPJyt0y/c9ZhHNWak/Jj96l4zeWGhU2USW80xscbbkmNqqd95mRaljYS97GOixr9ujyaZ2zPVEg==
X-Received: by 2002:a17:90a:66ce:: with SMTP id
 z14mr3971227pjl.123.1613155746594; 
 Fri, 12 Feb 2021 10:49:06 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id k5sm9427618pfi.31.2021.02.12.10.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 10:49:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 02/31] linux-user: Introduce PAGE_ANON
Date: Fri, 12 Feb 2021 10:48:33 -0800
Message-Id: <20210212184902.1251044-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210212184902.1251044-1-richard.henderson@linaro.org>
References: <20210212184902.1251044-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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


