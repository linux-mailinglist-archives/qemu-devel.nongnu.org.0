Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 079CD3E373E
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 23:54:05 +0200 (CEST)
Received: from localhost ([::1]:55088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCUGZ-0006XV-Vq
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 17:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU6C-0007ce-DO
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:20 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:36830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU6A-00050C-8E
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:20 -0400
Received: by mail-io1-xd32.google.com with SMTP id f11so19876520ioj.3
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 14:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zZ2V1vsBzx1QDxkiUAUegs9PmelXvmX9ctk5L5IAdd8=;
 b=jP5dvwGi3qdfRNweydk9U1o2FUZy2yHfyB/xTmTkxPQGUM/AU+mQqJpHyH2/7onpQQ
 Ad6QiCSndpLxTFeb7+bNBCfzN5XKsfm5PgA4ihsn3z8je/QnsuqaEys24JuBjthJlc0l
 U2x6nEY77vCAoQAIWpRUVRtN7CY7m+9aalDqIN4TSaJRD1XVvO96xL6p3upibHiSyvkp
 xAiuvJtkKFE8HQvz4a3G2e6xoYvJGwORX4hqEMioVCLx9WdLINGh7108vqBg8opObb8Q
 LR5K9CY7WKrkpxnKHWNiW5lx5xjNJZtC9iW2AbwOy2a04/S648YgV+ZfpyKjUHey6zZx
 CIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zZ2V1vsBzx1QDxkiUAUegs9PmelXvmX9ctk5L5IAdd8=;
 b=YXzz3uTorc5y9JzMghH4e4WNfeybBRr6RwldlQYnm9byYZxmKz3SSIjfNBW7VDOBlQ
 udgiSxajoZAYb7IEPOz9GpQi0q1+hwelK3yktqLgowDUe+j+6661kfwN8Ff7mqBE1oR8
 +/LClXRUQJVcvaFHbW/OqFf4moY4YaPhgod0Ivft2fR4O0Nl2/CfShwZOVaIPhAmdCe8
 UfYgdjmnvIisKJF94jLpJYbdninM4QXOQe6Ikfmyvi4f7uYpNGxJlGFc6+RlrvEXdrq4
 kX4hEH6iOEs6ig9rSuZu74efww1BVKdRJbuspDok3Yk1DtmTzK16eMCzzp3khlLGqs4I
 UGQQ==
X-Gm-Message-State: AOAM533yXXedf7D2XU6DHVlymWnZ1I1HEdq5W45DV5xPrOFKbN928+9z
 PuZVua689r2IycnkPaVvxn3zWhEc+El7v6CO
X-Google-Smtp-Source: ABdhPJxQDs1K/uhxEsKw/8S3JC3L1YdfNJvVuZTFO6DDPcIPdQDCFygeYST31eex06jqizXoJra5Rg==
X-Received: by 2002:a92:ae03:: with SMTP id s3mr63395ilh.248.1628372597041;
 Sat, 07 Aug 2021 14:43:17 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm8062827ios.36.2021.08.07.14.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 14:43:16 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 25/49] bsd-user: define max args in terms of pages
Date: Sat,  7 Aug 2021 15:42:18 -0600
Message-Id: <20210807214242.82385-26-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210807214242.82385-1-imp@bsdimp.com>
References: <20210807214242.82385-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d32;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

For 32-bit platforms, pass in up to 256k of args. For 64-bit, bump that
to 512k.

Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/qemu.h | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 02e6e8327a..9322187891 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -107,11 +107,17 @@ extern const char *qemu_uname_release;
 extern unsigned long mmap_min_addr;
 
 /*
- * MAX_ARG_PAGES defines the number of pages allocated for arguments
- * and envelope for the new program. 32 should suffice, this gives
- * a maximum env+arg of 128kB w/4KB pages!
+ * TARGET_ARG_MAX defines the number of bytes allocated for arguments
+ * and envelope for the new program. 256k should suffice for a reasonable
+ * maxiumum env+arg in 32-bit environments, bump it up to 512k for !ILP32
+ * platforms.
  */
-#define MAX_ARG_PAGES 32
+#if TARGET_ABI_BITS > 32
+#define TARGET_ARG_MAX (512 * 1024)
+#else
+#define TARGET_ARG_MAX (256 * 1024)
+#endif
+#define MAX_ARG_PAGES (TARGET_ARG_MAX / TARGET_PAGE_SIZE)
 
 /*
  * This structure is used to hold the arguments that are
-- 
2.32.0


