Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2268D54213B
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 07:25:35 +0200 (CEST)
Received: from localhost ([::1]:41742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyoCE-0004ir-0Q
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 01:25:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyo6h-0006q4-W3
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 01:19:52 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:41583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyo6g-000228-8d
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 01:19:51 -0400
Received: by mail-pg1-x534.google.com with SMTP id e66so17882269pgc.8
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 22:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oYsK2DCkJDRZ/LkA4A11UkQEUx69l+6MA6r9SJofgvk=;
 b=WlAIQPL8OiayRjLCifNs79QaDKpEifcUQx1z3uPK0G0t2ggLy2kCimAFrJ+iXzf1YO
 etta8vcg0eV+IhdsGEcZvz5dWwY64o7GfrH8lrnSXOvN+AuLKXX+l3UcJDc90IKlI7fN
 iUjOnCqPr4InW7iIS+JOm8AkvsJdMcAZnZ7I7YpZMc5HDB1LEw6zF6T9UoEFzYqnRVd5
 1R8BDqK63kuA0uasFRaoQwaI/+YXuoVunEuitPbyh6Pb32F8+tN3THz4A+EXA0z32WQ0
 detY71+Ut4RB5ITQk7d6IU7n0zbpyNVbJ5ND1gjA1BdhsVlh98Kizxe4s1IraOoAadkX
 uOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oYsK2DCkJDRZ/LkA4A11UkQEUx69l+6MA6r9SJofgvk=;
 b=XydYEaFkswnUtqmlWjbZwHIfZ31kOFTaSmdfj9kjmAkpXU19MHpqhnwaPj4f+fJw/g
 9B4YUBANCVya6G2gF3jZ/EBWEQoiHylf6nM+UKphhYuiWNk/b1WsFGuFKWhsPyROaxbe
 45AW7QA2eigtUdzKxbqNQqObCBFEetS8XFLMqQPk/lJ8oQULxlGPtc6MyMgBBdhyHi9u
 tf5dLBR1lg0HdWQIDvgGIW2NTbe3oerCkQLPXSQhjl/SMdrshuom4fOJ47BJB3FCdSga
 F2iOkA2+Tt1LpofemzeQ1Q6Ce3r82VilHqiamnzDG4pz6MDC1B3wSvrwlZTU6dM453YN
 3Odg==
X-Gm-Message-State: AOAM5306XSEBIHrlzxXRQuwLEK+DNhntGYUVHdm0aONIGHvKURHez/QT
 zx49FuQj5/1cAOpF7PEKAbcfuft/KPXr0Q==
X-Google-Smtp-Source: ABdhPJyc/ltR41BJbz8jfMpE+vHSZrLozXJc/cenkIZwu5SwnPmKw6QEIbUtH1ut6VSkl85YPFBfLw==
X-Received: by 2002:a62:1784:0:b0:51b:bc40:28a7 with SMTP id
 126-20020a621784000000b0051bbc4028a7mr32905577pfx.55.1654665588789; 
 Tue, 07 Jun 2022 22:19:48 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:c626:2f70:ac99:7c97])
 by smtp.gmail.com with ESMTPSA id
 k8-20020a170902d58800b001641244d051sm13378807plh.257.2022.06.07.22.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 22:19:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org
Subject: [PATCH v4 02/11] target/mips: Add UHI errno values
Date: Tue,  7 Jun 2022 22:19:36 -0700
Message-Id: <20220608051945.802339-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220608051945.802339-1-richard.henderson@linaro.org>
References: <20220608051945.802339-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From the Unified Hosting Interface, MD01069 Reference Manual,
version 1.1.6, 06 July 2015.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/sysemu/mips-semi.c | 40 ++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/target/mips/tcg/sysemu/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
index ac12c802a3..2a039baf4c 100644
--- a/target/mips/tcg/sysemu/mips-semi.c
+++ b/target/mips/tcg/sysemu/mips-semi.c
@@ -74,6 +74,46 @@ enum UHIOpenFlags {
     UHIOpen_EXCL   = 0x800
 };
 
+enum UHIErrno {
+    UHI_EACCESS         = 13,
+    UHI_EAGAIN          = 11,
+    UHI_EBADF           = 9,
+    UHI_EBADMSG         = 77,
+    UHI_EBUSY           = 16,
+    UHI_ECONNRESET      = 104,
+    UHI_EEXIST          = 17,
+    UHI_EFBIG           = 27,
+    UHI_EINTR           = 4,
+    UHI_EINVAL          = 22,
+    UHI_EIO             = 5,
+    UHI_EISDIR          = 21,
+    UHI_ELOOP           = 92,
+    UHI_EMFILE          = 24,
+    UHI_EMLINK          = 31,
+    UHI_ENAMETOOLONG    = 91,
+    UHI_ENETDOWN        = 115,
+    UHI_ENETUNREACH     = 114,
+    UHI_ENFILE          = 23,
+    UHI_ENOBUFS         = 105,
+    UHI_ENOENT          = 2,
+    UHI_ENOMEM          = 12,
+    UHI_ENOSPC          = 28,
+    UHI_ENOSR           = 63,
+    UHI_ENOTCONN        = 128,
+    UHI_ENOTDIR         = 20,
+    UHI_ENXIO           = 6,
+    UHI_EOVERFLOW       = 139,
+    UHI_EPERM           = 1,
+    UHI_EPIPE           = 32,
+    UHI_ERANGE          = 34,
+    UHI_EROFS           = 30,
+    UHI_ESPIPE          = 29,
+    UHI_ETIMEDOUT       = 116,
+    UHI_ETXTBSY         = 26,
+    UHI_EWOULDBLOCK     = 11,
+    UHI_EXDEV           = 18,
+};
+
 static int errno_mips(int host_errno)
 {
     /* Errno values taken from asm-mips/errno.h */
-- 
2.34.1


