Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5463AB0CE
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 12:01:25 +0200 (CEST)
Received: from localhost ([::1]:42536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltopv-0006ZH-OR
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 06:01:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNe-0003Fl-Vc
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:32:11 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:38905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNc-0006Rx-SZ
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:32:10 -0400
Received: by mail-ed1-x52c.google.com with SMTP id t7so3048386edd.5
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 02:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w/ZDHFj/sj/zgSbYdluGkx019Z0PuVQHSdt6mo9xSR4=;
 b=MrXphbJ/KQ/joNv3lsNS+yXiCVYhwrhLx7EMEn7Vn5FnZDoEJYaGcdhq2EdPGPtiKo
 DmV+fRLDkrI8LUVLV4h4pNq1QdIiuV1G+i6NAxp0BF3GFi3oBWM+C9COjQIzhxwWV0kI
 IWJfbjiESS9MP4TpyxKLD/V+DQqkLEf2B8LNpLvRkitvIUkDGsozkxC363lg0goGjZcD
 WR65MTwpPYBQhavnWIQmyGE0Z2Zcu6c5zm4HM6SBnrewFOx0hRqeEGUwc7urmIqlSfm8
 U9vTwYTUU6sTK53VpMUzpBOWAmtKzHBjKHKzJroeBTofmvw8e4gdO4cCnMNXkS7zcaCw
 1fdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=w/ZDHFj/sj/zgSbYdluGkx019Z0PuVQHSdt6mo9xSR4=;
 b=ta+od7WrDDBMs6WESGz6bwYPRJhLBoAmsY3Ig2cBRrRVJsbw930EeGRGFhZEs58iBR
 s7uj6NQWM4SUJ8sEzlprR/IOK3i6aTqg12IibL7HZ30KAv+v87r4I5ndOdnoo740wX6a
 rl81jNLQ3lWqujuDfBb/J97xX3OpICcI7Pr7/0NPkObwpQM8fj+jWfdKOOlsZf7z7npV
 rJe8Cb80W9Dyn1e+YCv7B2Mvb5rUrhA/w/i/r8eMYnaWz+PGeD1ZwogEyH8PCQ4L0Xbd
 DHNuseUZ/s6hHO+StfOgafTNC8Z28QyKtU4A8aIFu2mG75pmY0OQUFAPGJvwwIHJSpko
 OdoQ==
X-Gm-Message-State: AOAM530h7hFLzWOY9LTrKo2GpwXX1N55NTtFZdLN8HrIXpdoO+Dfocnt
 5Ox0WDkZV2+crBGZ3HdmAQ1hVqNaaYw=
X-Google-Smtp-Source: ABdhPJyX2CpCY2nViwaOkdKd9GB2hxpNwkxQk4JXb+kLwNx8I+SfQY+aFbsYNxGqSXw4l6XA3uH2Wg==
X-Received: by 2002:a05:6402:4255:: with SMTP id
 g21mr5252335edb.103.1623922327685; 
 Thu, 17 Jun 2021 02:32:07 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m18sm3328140ejx.56.2021.06.17.02.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 02:32:07 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 44/45] qemu/compiler: Remove QEMU_GENERIC
Date: Thu, 17 Jun 2021 11:31:33 +0200
Message-Id: <20210617093134.900014-45-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617093134.900014-1-pbonzini@redhat.com>
References: <20210617093134.900014-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

All previous users now use C11 _Generic.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210614233143.1221879-8-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/compiler.h | 40 ----------------------------------------
 1 file changed, 40 deletions(-)

diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index 091c45248b..5766d61589 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -173,46 +173,6 @@
 #define QEMU_ALWAYS_INLINE
 #endif
 
-/* Implement C11 _Generic via GCC builtins.  Example:
- *
- *    QEMU_GENERIC(x, (float, sinf), (long double, sinl), sin) (x)
- *
- * The first argument is the discriminator.  The last is the default value.
- * The middle ones are tuples in "(type, expansion)" format.
- */
-
-/* First, find out the number of generic cases.  */
-#define QEMU_GENERIC(x, ...) \
-    QEMU_GENERIC_(typeof(x), __VA_ARGS__, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0)
-
-/* There will be extra arguments, but they are not used.  */
-#define QEMU_GENERIC_(x, a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, count, ...) \
-    QEMU_GENERIC##count(x, a0, a1, a2, a3, a4, a5, a6, a7, a8, a9)
-
-/* Two more helper macros, this time to extract items from a parenthesized
- * list.
- */
-#define QEMU_FIRST_(a, b) a
-#define QEMU_SECOND_(a, b) b
-
-/* ... and a final one for the common part of the "recursion".  */
-#define QEMU_GENERIC_IF(x, type_then, else_)                                   \
-    __builtin_choose_expr(__builtin_types_compatible_p(x,                      \
-                                                       QEMU_FIRST_ type_then), \
-                          QEMU_SECOND_ type_then, else_)
-
-/* CPP poor man's "recursion".  */
-#define QEMU_GENERIC1(x, a0, ...) (a0)
-#define QEMU_GENERIC2(x, a0, ...) QEMU_GENERIC_IF(x, a0, QEMU_GENERIC1(x, __VA_ARGS__))
-#define QEMU_GENERIC3(x, a0, ...) QEMU_GENERIC_IF(x, a0, QEMU_GENERIC2(x, __VA_ARGS__))
-#define QEMU_GENERIC4(x, a0, ...) QEMU_GENERIC_IF(x, a0, QEMU_GENERIC3(x, __VA_ARGS__))
-#define QEMU_GENERIC5(x, a0, ...) QEMU_GENERIC_IF(x, a0, QEMU_GENERIC4(x, __VA_ARGS__))
-#define QEMU_GENERIC6(x, a0, ...) QEMU_GENERIC_IF(x, a0, QEMU_GENERIC5(x, __VA_ARGS__))
-#define QEMU_GENERIC7(x, a0, ...) QEMU_GENERIC_IF(x, a0, QEMU_GENERIC6(x, __VA_ARGS__))
-#define QEMU_GENERIC8(x, a0, ...) QEMU_GENERIC_IF(x, a0, QEMU_GENERIC7(x, __VA_ARGS__))
-#define QEMU_GENERIC9(x, a0, ...) QEMU_GENERIC_IF(x, a0, QEMU_GENERIC8(x, __VA_ARGS__))
-#define QEMU_GENERIC10(x, a0, ...) QEMU_GENERIC_IF(x, a0, QEMU_GENERIC9(x, __VA_ARGS__))
-
 /**
  * qemu_build_not_reached()
  *
-- 
2.31.1



