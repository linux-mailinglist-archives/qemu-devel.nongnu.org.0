Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D15049E0AB
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 12:22:44 +0100 (CET)
Received: from localhost ([::1]:45672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD2rT-0002Dv-NY
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 06:22:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nD2fw-0006mf-K1
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:10:51 -0500
Received: from [2a00:1450:4864:20::32f] (port=44946
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nD2fu-00067p-21
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:10:47 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so1600102wms.3
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 03:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DM6390IblKITC2WUseBCeDBsNtvZZl5g/IOpmBC35RU=;
 b=ioL1QOJJd1L7r+5EuGtZR2ODgb9Tk/qxDMmuiUcvlP6kUBBVmOjvXMrqNIuBs/4BEz
 WZOWjOrMUc98wjLZmJPCX4NLzgzPgj0l3Ztn2rYfIu8Fg6vzHmfd/GwGcw4SEoFbxvUp
 yhC2uuSmJDR9Tjh6r3mmZ59+N7DPkymTkqTRRV6rNI3yy4W2Qs4bIh/ttA0/ZQsVpz1x
 PcnD15kxziYNFjRGnHNB9dmpNarkyfAeHdlrGLh1YSJve+AEJBMbOkJ19Bx6BbARGyBr
 9yFkCZU5mKLct9Oc8NJdyif5GkU/4vvorFUh15cfJpIQ/ivaWi5/uoiAbtEEnj5H7cz8
 OuTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DM6390IblKITC2WUseBCeDBsNtvZZl5g/IOpmBC35RU=;
 b=rgaxKO6uzu38k1UbSzWYW89wiImMrTv10wbbFg4wI6LLYr7KiXVAQ/23/CXlq73/DL
 IA5Iomu6M+1LGhO66H6AsAG9nkHBxpk2FKDRtVzQF5pTvdx8P2p/NYJc91Zij0+rf/rG
 /hZXAOoSiPdsW2SAml3FfRF2KrTWuFZPbGy55qL3jdITkchvlV87Kl7nhJL9mWBTQ8Z3
 PuzK9VhC6fGkCJNnKGSjyP571jQfF6d3bPZeZqsxP3j1yGu/ZQBpEneKMD5DN9yH/NYs
 ZCk/gekicIyIB/ZYMrvnpx76lYpcuf12y5SJp8lwDs1/kTLKlVtFG6DXhKXZev91eoLS
 iYaA==
X-Gm-Message-State: AOAM532idPUnV7oqIfpCUS5s5dewSiCygBeaRR0fat5p7B3sZoLnH3CS
 SnZ3MSaAaUE1yGII90v6daIkcIcP5tk=
X-Google-Smtp-Source: ABdhPJyRGqtcz14hNDMz/oTA1rWztVwZ8plyh2p9w8WAXDJRLDuilxU1WIfgEp4Z4Y8huU8qf2XLOg==
X-Received: by 2002:a05:600c:3641:: with SMTP id
 y1mr2701686wmq.53.1643281844357; 
 Thu, 27 Jan 2022 03:10:44 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s17sm1825742wrm.62.2022.01.27.03.10.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 03:10:44 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/14] exec/cpu: Make host pages variables / macros 'target
 agnostic'
Date: Thu, 27 Jan 2022 12:10:29 +0100
Message-Id: <20220127111037.457901-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220127111037.457901-1-pbonzini@redhat.com>
References: <20220127111037.457901-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

"host" pages are related to the *host* not the *target*,
thus the qemu_host_page_size / qemu_host_page_mask variables
and the HOST_PAGE_ALIGN() / REAL_HOST_PAGE_ALIGN() macros
can be moved to "exec/cpu-common.h" which is target agnostic.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20220120000836.229419-1-f4bug@amsat.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/exec/cpu-all.h    | 9 ---------
 include/exec/cpu-common.h | 9 +++++++++
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index bb37239efa..84caf5c3d9 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -234,15 +234,6 @@ extern const TargetPageBits target_page;
 
 #define TARGET_PAGE_ALIGN(addr) ROUND_UP((addr), TARGET_PAGE_SIZE)
 
-/* Using intptr_t ensures that qemu_*_page_mask is sign-extended even
- * when intptr_t is 32-bit and we are aligning a long long.
- */
-extern uintptr_t qemu_host_page_size;
-extern intptr_t qemu_host_page_mask;
-
-#define HOST_PAGE_ALIGN(addr) ROUND_UP((addr), qemu_host_page_size)
-#define REAL_HOST_PAGE_ALIGN(addr) ROUND_UP((addr), qemu_real_host_page_size)
-
 /* same as PROT_xxx */
 #define PAGE_READ      0x0001
 #define PAGE_WRITE     0x0002
diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 039d422bf4..de5f444b19 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -7,6 +7,15 @@
 #include "exec/hwaddr.h"
 #endif
 
+/* Using intptr_t ensures that qemu_*_page_mask is sign-extended even
+ * when intptr_t is 32-bit and we are aligning a long long.
+ */
+extern uintptr_t qemu_host_page_size;
+extern intptr_t qemu_host_page_mask;
+
+#define HOST_PAGE_ALIGN(addr) ROUND_UP((addr), qemu_host_page_size)
+#define REAL_HOST_PAGE_ALIGN(addr) ROUND_UP((addr), qemu_real_host_page_size)
+
 /* The CPU list lock nests outside page_(un)lock or mmap_(un)lock */
 void qemu_init_cpu_list(void);
 void cpu_list_lock(void);
-- 
2.34.1



