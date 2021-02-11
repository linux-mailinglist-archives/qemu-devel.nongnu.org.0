Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 010C9318B8C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:10:33 +0100 (CET)
Received: from localhost ([::1]:49698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lABjs-0008WH-1f
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:10:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABYw-00081x-Tr
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:14 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:39917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABYu-0008Ox-J7
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:14 -0500
Received: by mail-wm1-x32f.google.com with SMTP id u14so5649834wmq.4
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=QlIazxiXuq6OlFVvjRA2pSJoSvTPBDYgrUB/CjxIRR8=;
 b=JWTp3FwS9Sx5Of8paQhTdjJiA7660XMjTKuy+nmhyTZSL7w5I1OoQxe15bETl6/Z55
 zHhCoaxxFaxJpUujdxVeDg07uwOoNNHJM3km6LSx14uB7A6/L4SD8r/W2L4aSUd4WUgW
 9WUYhMp5BXRFB0XTxcMFKvG4tFt0RfJUobnmiN/IV8kunQW5JXiqyJafuaDGK4Gz2kAN
 gAZ5kzQmqEvl/MU/FTeQn6ksauiw4wW7iYAbOSs6koA4hF0/pN1BYjM5tbpIoAu++KEu
 hO9TuVXDajRJH2ZBNka29eX1covsAN4AOHT4mvnjFSIKNr21EFJXlh/iMgHVXuSA7u53
 Wa5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QlIazxiXuq6OlFVvjRA2pSJoSvTPBDYgrUB/CjxIRR8=;
 b=silNtgcuJpyE0IKudMN/bM7pjU4ZcmdahUsTb6X7dHKZZDCXSgMSZqLGFhXiMO3mh7
 LFzokoUyf2O5kFbNYB14L4aADOQvrivo0sUr6b5PleFJNr/686oTDmj6CqocqUAVynvh
 rEICuAuVqtIBW60OU8r5hSXljzdC1pN4ZcpxzlbrPYUJlnJB1HGSuUtfazH+vQFD37HD
 f8KiP0zAaJNbKzS9ujDth6mv+AOg1XaDHXDVNIIjQwpZloBQne5KjEpwHq1whhq+ko3b
 GqShfkkEfGYdp4qe9ysM6xMARP/ugMXyDlagoRqD+8B+BhjV+MTjoXlD7lp8oOPkVKBY
 5xZg==
X-Gm-Message-State: AOAM532k4MQjTpWoQRtp7erKoKaJKCn2dvl2kR0WAdhLlA07PUPldnfH
 oXGtFH3Zx3p8QEkKF9BPUFVELvwMe/y/IQ==
X-Google-Smtp-Source: ABdhPJz8hVyfEBx+m7wsyVihk7tjCWIc74Gc1NIYlUM3qRSBtnMSjdj7nN7U9TpL3/97aar9F9OIzg==
X-Received: by 2002:a05:600c:21d2:: with SMTP id
 x18mr5173243wmj.186.1613048351162; 
 Thu, 11 Feb 2021 04:59:11 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g15sm4955716wrx.1.2021.02.11.04.59.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:59:10 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/45] linux-user: Introduce PAGE_ANON
Date: Thu, 11 Feb 2021 12:58:26 +0000
Message-Id: <20210211125900.22777-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211125900.22777-1-peter.maydell@linaro.org>
References: <20210211125900.22777-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

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
Message-id: 20210210000223.884088-3-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/cpu-all.h | 2 ++
 linux-user/mmap.c      | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index af555f1798d..1f47e0fe44a 100644
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
index c693505b601..7fb4c628e11 100644
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
2.20.1


