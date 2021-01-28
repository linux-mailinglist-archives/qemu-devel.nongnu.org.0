Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 746C6308144
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 23:44:55 +0100 (CET)
Received: from localhost ([::1]:48154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5G22-0007RM-0y
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 17:44:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5FzD-0005Pv-4M
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:41:59 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:36643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5Fz5-00084t-22
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:41:58 -0500
Received: by mail-pf1-x432.google.com with SMTP id u67so4977696pfb.3
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 14:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kyzjq96nH0KWrOiii6echH6ofV70lplGMBMMhcVo2Uo=;
 b=KvS9dgiqbKO3ebcoIxR4Yrw78r+JAItDFG6rSKiz6tsiOXoFZYxWLyKCmfsRMnw2h9
 Vv9VCBKa7d1ylMd/YcZ2I1pKzbZd6mjRSwdLKpikbSyO1xMEdLyksV8l2/EflSOjjI2v
 ZeMrhLfcpOrl0hDb7H1rhyHAkwUK2zIZ3tSwlrx2O23qtXUGmkWgOWK73Ck9iHg7rag6
 cgJiqdJUewKFfhQlwYWlB93TdKhQdMPmg4tqCtGUTPMk/MZYXnssgitNGMRV+Me7Yn4O
 COm3fZkRWuH5eBkuezZzsfn1ncBY2K+ZE2Nn0MRhsR9Gq2sKabCdp3imG/EhlcPfkHyn
 o7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kyzjq96nH0KWrOiii6echH6ofV70lplGMBMMhcVo2Uo=;
 b=EwW4LZ/aq2mDRwdFQ+EPykBNLBV+dIn4Nc61m5JZMc1D+uVRR4r0s5LG5AZX3QKn8K
 k2dmkf6KJf7j3mnOKWMdPNiDUoWEEqzcdF91dACFLWPbW4HynfDfiJB2kyUrWATQ368R
 jZDi5SyS3R/fc+qpVW/7cJomTobojz3UEljiX5J1Y8JXxfE7Oo5DqrgG8hGfjpce/MNs
 4716aB5Hs+hcTdqnnAjAvYYW7phnw1/pR0TevIoBymvAIHd/FfWjKIFBn9ORZjTG1pPY
 WCUIcZAXaRUI4pQM7QNqFpWd3iwcG5EEP7/SQqYYtPb+Vu2hPAG1GjF2GeygyavK6x2V
 J/Jw==
X-Gm-Message-State: AOAM533/X45aOj1pP3YbNTim8tq9y+S+flk4sti7lUO9By6Qrx0gCju8
 S/bu9BlNW6+l/dcfuE207uhZf/i3ivbB6jkO
X-Google-Smtp-Source: ABdhPJxZnm2XCviJEVTpglJ+1Ql0hniAiWMd0Fw0BeAkx1h739L2eosR3lAhaNqvEP2Kg+lPe32yoA==
X-Received: by 2002:a63:bd4a:: with SMTP id d10mr1589649pgp.18.1611873708278; 
 Thu, 28 Jan 2021 14:41:48 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id m10sm6042358pjs.25.2021.01.28.14.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 14:41:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/23] linux-user: Introduce PAGE_ANON
Date: Thu, 28 Jan 2021 12:41:20 -1000
Message-Id: <20210128224141.638790-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128224141.638790-1-richard.henderson@linaro.org>
References: <20210128224141.638790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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


