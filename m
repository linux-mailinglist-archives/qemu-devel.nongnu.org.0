Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E283AB12F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 12:18:23 +0200 (CEST)
Received: from localhost ([::1]:59102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltp6M-0003O4-5M
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 06:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNe-0003Fj-V5
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:32:10 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:45601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNY-0006My-AZ
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:32:09 -0400
Received: by mail-ed1-x52f.google.com with SMTP id r7so3016939edv.12
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 02:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fB1DEpUXUs5bLKT6hBBiKcj8AC7+sYf8pppcVv3D4tA=;
 b=kpYp5u39PNQgotaElkbs2+5cTMuuOqP7FN4bFYSvgOWzlhBVK9kYosaFmtpFohZlAZ
 S63G8IQKU2D67OjQazV2zudlm9pecYpqNeHaUA0EbOyR4rINeeLAa3D/VTigxWNx9BQq
 SuBl2cMA2XPUGhpTKEdQVvxiA/NxfUTz+Oyk83w9rPuCy4P0NC5HEjU5qIu6fm3LdDlj
 Qb5YsAS38v7becJoJ5xjlkvJrG8hOr/ep/2VP3eChT6I/8gZMboaOaIEHVq59agE1/rN
 ufd2WDezapQrsDj9ZiOieRTaHSirN1KXXYOZRYwBaLjnO+k4WzUxy8cd3EnopCzVFruC
 cGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fB1DEpUXUs5bLKT6hBBiKcj8AC7+sYf8pppcVv3D4tA=;
 b=VRFVJeUNkyxmgUGolZAaH4ZVxUn/8AqUbNH36RngaSenddxATqumt3psj1YDRPD/oC
 oFz1m1lXm6EWYl6fJIEFII5+0Qpbh51BIpy33mWbmp+gTdFo3Aoab6P6/Plvxqxhm2YT
 V20kro+DcNI84z486HUw1MEhBg6fc0OCe1z6J7dLw6rG0s41zrGPxmS/rzZAbjwY6oTN
 bEHpic/6MSSjZvxDy5Bf+jzCnLbo2UDRb8ertmJv4Poe3cx7IbgjGEhxofIwRvOx2ZMO
 zhRzwGrRoJhC565jwVIOZeyd0nxlSwGzxK2QLRUEh0OD+w2iq3QGSk2GfKXIIxFFOUpL
 0s9A==
X-Gm-Message-State: AOAM530U4tpXCZGQiKeMI1ydt3J7/LY4I9Y4UwacOATF8SuhuuO3pPQm
 vXJ7ugciYcdZf3jJ1wFAZu/aP7JlWBw=
X-Google-Smtp-Source: ABdhPJy23m9sxOi91979Hyuguf/FVpesrQ+hWwwCnYo5/ByIHLzx4Mp7ZT1LSref5685KdDN92+U9A==
X-Received: by 2002:a50:ccd8:: with SMTP id b24mr1943333edj.386.1623922322859; 
 Thu, 17 Jun 2021 02:32:02 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m18sm3328140ejx.56.2021.06.17.02.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 02:32:02 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 37/45] target/i386: Added Intercept CR0 writes check
Date: Thu, 17 Jun 2021 11:31:26 +0200
Message-Id: <20210617093134.900014-38-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617093134.900014-1-pbonzini@redhat.com>
References: <20210617093134.900014-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Lara Lazier <laramglazier@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lara Lazier <laramglazier@gmail.com>

When the selective CR0 write intercept is set, all writes to bits in
CR0 other than CR0.TS or CR0.MP cause a VMEXIT.

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
Message-Id: <20210616123907.17765-5-laramglazier@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/sysemu/misc_helper.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/i386/tcg/sysemu/misc_helper.c b/target/i386/tcg/sysemu/misc_helper.c
index 0cef2f1a4c..db0d8a9d79 100644
--- a/target/i386/tcg/sysemu/misc_helper.c
+++ b/target/i386/tcg/sysemu/misc_helper.c
@@ -84,6 +84,15 @@ void helper_write_crN(CPUX86State *env, int reg, target_ulong t0)
 {
     switch (reg) {
     case 0:
+        /*
+        * If we reach this point, the CR0 write intercept is disabled.
+        * But we could still exit if the hypervisor has requested the selective
+        * intercept for bits other than TS and MP
+        */
+        if (cpu_svm_has_intercept(env, SVM_EXIT_CR0_SEL_WRITE) &&
+            ((env->cr[0] ^ t0) & ~(CR0_TS_MASK | CR0_MP_MASK))) {
+            cpu_vmexit(env, SVM_EXIT_CR0_SEL_WRITE, 0, GETPC());
+        }
         cpu_x86_update_cr0(env, t0);
         break;
     case 3:
-- 
2.31.1



