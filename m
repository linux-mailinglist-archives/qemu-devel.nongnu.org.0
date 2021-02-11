Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE94E318BFC
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:28:51 +0100 (CET)
Received: from localhost ([::1]:59950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAC1a-0000Z0-OP
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:28:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABZ0-00088H-8g
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:18 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:51159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABYy-0008Rb-IR
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:17 -0500
Received: by mail-wm1-x329.google.com with SMTP id 190so5475533wmz.0
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=r4/XUYibNUpbYwhy/01KppmQNmZXhGw9VCHepnGtsvI=;
 b=wsYhXN0ewg11CKys2fvCscPEwk7i4vvxRNe4k1Lv5yDyPgU+Dj9drN0/zE5d6lBfLK
 EXxr+SGwIMKheWvQlpaLfeNdlY2FUZVE6Gn9RfDtyvOv3FlzU8idTiLpHJBoZMmgqLix
 PKPtU0lgroOe+LGxfoA8F15/7tj20QNE8PMez99GupEKsfTjTOIm5j0uRqwRLhNSQP1X
 eZygP5HQGL5biLDuMeRUZ/zhs+4sRaEhm2AFgrwEiwJrgdw5T3R+gjmRlQavRlsn35wZ
 X5pDIdaGwwdW/9l8tmzw//L2cnrVDkBdejd1CBBU6s6aQjiKlyrekJ/Tzq9eEaTQxk+O
 kWAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r4/XUYibNUpbYwhy/01KppmQNmZXhGw9VCHepnGtsvI=;
 b=VHCeCK6jSm7PVDfOD+1GIBC+uG9kvJFV13iPJau+wNsMvykZVrRluNjB/Pdc9LGOnv
 jr+6HcK6zsTSw7+zvF7jPkySPeyKFSGy9GHUMTmIcvRFDZUIKHd0ZAMrmwA+lRMY+Nz4
 HRKyK6R2NCkRPzgBx74bdVn/+0hUBolR+wKi+i4LEwdCiK/nij7if87m3zDDlVew7EY5
 g1FYdTPw2JzQTt6SZJ+6vpazv73nJekHg7yQPIlaKzyy1UWT3hZynf93g5ORqiTBjDte
 Uir0I2djybFjLyXbMz6+ATW8Uz6Vg8LbtSNXzA3q0bULaZ6gEaRosnp3pkebd8OicuR8
 9cYg==
X-Gm-Message-State: AOAM5300u2gr85fMQqVjd+mesXp1fqOWZN9KZwRVKx5UQ034b3B66M/D
 IhD9HGBedH+e4L0Tkm2lYydKeShqZ1rw9w==
X-Google-Smtp-Source: ABdhPJxQAbtVtDFlaOrSZgcENcZnhqUQZ8I/PPCtqZO3tgLx91/61rqpxEIhwH3hRw43zjdUF1PpIg==
X-Received: by 2002:a1c:5f82:: with SMTP id t124mr5141010wmb.55.1613048355270; 
 Thu, 11 Feb 2021 04:59:15 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g15sm4955716wrx.1.2021.02.11.04.59.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:59:14 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/45] bsd-user: Tidy VERIFY_READ/VERIFY_WRITE
Date: Thu, 11 Feb 2021 12:58:32 +0000
Message-Id: <20210211125900.22777-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211125900.22777-1-peter.maydell@linaro.org>
References: <20210211125900.22777-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

These constants are only ever used with access_ok, and friends.
Rather than translating them to PAGE_* bits, let them equal
the PAGE_* bits to begin.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210210000223.884088-9-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 bsd-user/qemu.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index f8bb1e5459d..4076adabd08 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -218,13 +218,12 @@ extern unsigned long x86_stack_size;
 
 /* user access */
 
-#define VERIFY_READ 0
-#define VERIFY_WRITE 1 /* implies read access */
+#define VERIFY_READ  PAGE_READ
+#define VERIFY_WRITE (PAGE_READ | PAGE_WRITE)
 
-static inline int access_ok(int type, abi_ulong addr, abi_ulong size)
+static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
 {
-    return page_check_range((target_ulong)addr, size,
-                            (type == VERIFY_READ) ? PAGE_READ : (PAGE_READ | PAGE_WRITE)) == 0;
+    return page_check_range((target_ulong)addr, size, type) == 0;
 }
 
 /* NOTE __get_user and __put_user use host pointers and don't check access. */
-- 
2.20.1


