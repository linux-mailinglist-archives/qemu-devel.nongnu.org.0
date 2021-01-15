Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C19DC2F88C7
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 23:50:05 +0100 (CET)
Received: from localhost ([::1]:55222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Xuu-0005q0-Ra
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 17:50:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0Xrr-0003Vq-Sc
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:46:56 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:51024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0Xrp-0005Bb-Fj
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:46:55 -0500
Received: by mail-pj1-x1031.google.com with SMTP id md11so5895553pjb.0
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 14:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kyzjq96nH0KWrOiii6echH6ofV70lplGMBMMhcVo2Uo=;
 b=NZ6mpl9ggtqxYOyKpx6AdJI2gAJf/R0znj6EoKUUuG9paOIxhpcg7T4sB1yAWe/V7Z
 IoUtTj8vvt2RTaVTsybm0o7IDQZcx0nKTs8oPVac9c4UW0dIZqqCKo5u9KBILg1Fvz5j
 uZkoLbN7RGAbn0umx2kmhRdVdByPHJURB91sIt74Js+4/uZS0RmeN6KZWXItCJ9f2eWQ
 s09YPG7CPAwFMW44echC5/bzf9e1izzo/1+XojkzBTzu/8nu121jLUHyHG+s6SwevA0K
 wxQBYmkwzxIcbwud1/2nHRHh+eMFATw5Ads8Q0NLm3EjC1X2qTQjpv2IakiTH2jIFJzO
 UrEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kyzjq96nH0KWrOiii6echH6ofV70lplGMBMMhcVo2Uo=;
 b=Dae+DrssnoLxUS3+198kNIXIdF4/Wi7zDDw3qz5uwCdOdFv2aoCdlzqqxTJDrEqxDf
 mpMLPOhJo+GS0a5AaMuAboxXoQY/tkQWd5zM+JFslKv4hii/fouw0g2g3IU4upMlX+0y
 kOpzh4NFGbz4do9wOt9tEodQPvfYoY5EFUjSFcyDStozGguYKibxKBfkvSKzzSgkdhEA
 RlOFZ7jOrAJnb2Oa1fjjlxyRX9RDTdl3Y1FSQpqSssqHE9fV/ttYzHWsEMaK0cbUyb/H
 1g4h1cWNixqdXS8PyIT5RwdWAFxb1fXo8kR+B0Em9usi3ycmmbwffGWKCfOWUoJFQVKo
 z+5g==
X-Gm-Message-State: AOAM530D3F3nY/4RH/sMePli+sr1PrQ7rOyAAHC38cCZhSr9HTMf0kXw
 2o1/UfqeoH0Bb1QJ4iuEQ8IFEs4F2Hc/D8y0
X-Google-Smtp-Source: ABdhPJznzaXIC2NbX86/26pXEE79LmI62CMzc96YyvgrR+IOoSh/iFz7gP1yAbYIo475rF/1h3s3+g==
X-Received: by 2002:a17:902:8642:b029:de:2bf1:b061 with SMTP id
 y2-20020a1709028642b02900de2bf1b061mr14643592plt.10.1610750812180; 
 Fri, 15 Jan 2021 14:46:52 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id s13sm9521700pfd.99.2021.01.15.14.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 14:46:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/21] linux-user: Introduce PAGE_ANON
Date: Fri, 15 Jan 2021 12:46:26 -1000
Message-Id: <20210115224645.1196742-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115224645.1196742-1-richard.henderson@linaro.org>
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


