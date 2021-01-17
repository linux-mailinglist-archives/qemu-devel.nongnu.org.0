Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 109452F93CC
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 17:08:49 +0100 (CET)
Received: from localhost ([::1]:35688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Abf-0004Fa-J5
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 11:08:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Aav-0003op-VI
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 11:08:01 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:40338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Aau-0003vD-8E
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 11:08:01 -0500
Received: by mail-wr1-x42b.google.com with SMTP id 91so14139980wrj.7
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 08:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9gp4GCWnW/Dfp9of3a78KlM9Oh27jAj5piJO94evM/I=;
 b=b3bjzc2FCs1oskzHN1HyI0/sTskEGcVRuM3SdF6oGHu7+strSs/wcdhp07nf6+9gdI
 hyomHgdHmOK/4j/UYXA7giN+j7Jo9pY1eh7YPEXTaKzkYh/+De2ZcWkL42alLjBUjyar
 c2TzdQlUDs+5lJuZGxBDFpvxSi2JVeVXT2uGueaSJnjEW+TyW1CJZrGQxalGVIrAlCHo
 Hi6exACVOPtagBPq72IIpOYLJ7RVLM2hEnfQdpyBNKub/qgMYSXCcXH2Dlcjai/uC6T4
 WGmGTMKWppxOtqWznxH3hBpoXGQW/U76fr5MGd6kKv61NtaEwMQ4DmEjnzDo7GYeSK3q
 YmBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=9gp4GCWnW/Dfp9of3a78KlM9Oh27jAj5piJO94evM/I=;
 b=fd3HM6tenokubAuQzSAqoiejovH0o2cVeMF/B3etj0r+QXbubb56FJ7Z950wohYIt2
 kFoCgTVlO8wjgxlGOiqo1Jy6RbXMCVnWT2sfK3x0QAMkwa/gP9EVoL5QkBMNvwJDqIAM
 Rt+4SzH86oHCiyi9cJwhKpf3hkFm8ttl0hmpCpUANQlNtB63Nj7qyg3OWkA6hScwlT6i
 dga/VK9kah0OxHnPlI/Qu9q9Eor0yLKysIluCFGGcHlUW/hsvWOiB/t4Zlvn5Etnfezk
 TnQHUsbFlMj62M19/Ak5J6RXjg/1rCmwoGu+dtz/C2WVYQ4vBKoxxusjIN0nBT1u+AhB
 75qg==
X-Gm-Message-State: AOAM532nJaUK1IQdHxM8Jbvd7fVnXeziwX4/juk5gKXAumt0Rq+cYcoZ
 cLx6VpKStWRLEB0cbdrEZTW5CMi9fvY=
X-Google-Smtp-Source: ABdhPJyZuGYJ14NvxVC7fXI6OBwmD49i0f9eN4UP3JSH4wQ/YDy+UseLDT2iG7snV5goyaqSO+77LQ==
X-Received: by 2002:a5d:650f:: with SMTP id x15mr22258159wru.332.1610899678070; 
 Sun, 17 Jan 2021 08:07:58 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id k9sm21279096wma.17.2021.01.17.08.07.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 08:07:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] softmmu/physmem: Hint notifier is not NULL in
 as_translate_for_iotlb()
Date: Sun, 17 Jan 2021 17:07:54 +0100
Message-Id: <20210117160754.4086411-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When using GCC 10.2 configured with --extra-cflags=-Os, we get:

  softmmu/physmem.c: In function ‘address_space_translate_for_iotlb’:
  softmmu/physmem.c:643:26: error: ‘notifier’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
    643 |         notifier->active = true;
        |                          ^
  softmmu/physmem.c:608:23: note: ‘notifier’ was declared here
    608 |     TCGIOMMUNotifier *notifier;
        |                       ^~~~~~~~

Insert assertions as hint to the compiler that 'notifier' can
not be NULL there.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Yet another hole in our CI.
---
 softmmu/physmem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 6301f4f0a5c..65602ed548e 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -605,7 +605,7 @@ static void tcg_register_iommu_notifier(CPUState *cpu,
      * when the IOMMU tells us the mappings we've cached have changed.
      */
     MemoryRegion *mr = MEMORY_REGION(iommu_mr);
-    TCGIOMMUNotifier *notifier;
+    TCGIOMMUNotifier *notifier = NULL;
     int i;
 
     for (i = 0; i < cpu->iommu_notifiers->len; i++) {
@@ -638,6 +638,7 @@ static void tcg_register_iommu_notifier(CPUState *cpu,
         memory_region_register_iommu_notifier(notifier->mr, &notifier->n,
                                               &error_fatal);
     }
+    assert(notifier != NULL);
 
     if (!notifier->active) {
         notifier->active = true;
-- 
2.26.2


