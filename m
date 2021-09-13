Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A79CE408B10
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 14:29:04 +0200 (CEST)
Received: from localhost ([::1]:56458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPl55-0002u6-O2
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 08:29:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mPkbE-0002x8-NS
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:58:13 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:37750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mPkbD-000663-AV
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:58:12 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso6748032wmb.2
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 04:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BR3kp9x1U17N8tBq/3eXPV/aD82EtrsCdplx3rKkI4c=;
 b=F0qp3RZH/SBIQt6FAhI+Il7X+7rvRFAbOL/xZPlIuMadCXe/UACD/fvySCOoJ4/GWD
 hCmlIPHpzHViyEQ2k33Vi7PGVGMCtmIIZ6lAVFt1Nw+KvWet7npdf2x8bVgNGA/ZI3pt
 N48LQoz2Q8ykrP52/damXf6tMLW9CKo7fGZFz2LoZHKXzTyUd1EEhhBAHCgXzHZmijCW
 gK8mBZfRGP72xfMvib+ZoyIwAViIs35Pz7ty18HsM0lY2ilblT8PvGw9jKc9Jn1eh+za
 +Aa1qFBlXO56eFJGK6C0rF1OTFcKw8nHu8Cd/NGEImTpV2USjvgkQetx9TFOn7VSKt0B
 bkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BR3kp9x1U17N8tBq/3eXPV/aD82EtrsCdplx3rKkI4c=;
 b=MjLJCdNVlsXK4iMS5ViWbe0JS/0Ga/IIaz0dwXY6XkvycCxw68fBbUTSCg6CT5ZAkK
 y0WO7fLRKaXji+9sCgaBCxYV9Yqe7Q4Or0pGEwHxkPL+/xGFBLgbvZSgPjfcZKla8gro
 QZEbeo9aAtzkpkHzcgWYGoQbkD3hBm82q9Q9u+6SjLz9eM9Evn1hBYq9Hp5KpcET4Z3i
 +aiIsBpotiyVRLTDb4Ef1NDwfVORTJoZLg4dp5qsJyYW7cIZxKEWltTcTA6bDtyhAMYO
 rJ6XRh28EwxUWPIdPf0l7vjDudJpEe5Isq+MkD0hfsRVbQMSh8ZtTyTVD7DkBwZMKiKM
 IQ1Q==
X-Gm-Message-State: AOAM531b8jpmWRcbzvxI/tewUd5Zoi16MlLUyq1N0pWadqmVXBtMgx8r
 9zQ6JsdVduq+ALyaAri2fs0PkJfKcNg=
X-Google-Smtp-Source: ABdhPJwK48x1fYbk4me5rWM8m2BeXsFledJDbrA8zLhStbVRdPJO5dz4eZHbKbe9KsR/BEc+7Jz9UQ==
X-Received: by 2002:a1c:2547:: with SMTP id l68mr10641906wml.23.1631534289981; 
 Mon, 13 Sep 2021 04:58:09 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n186sm6011037wme.31.2021.09.13.04.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 04:58:09 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/21] util: Suppress -Wstringop-overflow in qemu_thread_start
Date: Mon, 13 Sep 2021 13:57:39 +0200
Message-Id: <20210913115742.533197-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210913115742.533197-1-pbonzini@redhat.com>
References: <20210913115742.533197-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

This seems to be either a glibc or gcc bug, but the code
appears to be fine with the warning suppressed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210803211907.150525-1-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-thread-posix.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/util/qemu-thread-posix.c b/util/qemu-thread-posix.c
index fd9d714038..6c5004220d 100644
--- a/util/qemu-thread-posix.c
+++ b/util/qemu-thread-posix.c
@@ -537,9 +537,28 @@ static void *qemu_thread_start(void *args)
     QEMU_TSAN_ANNOTATE_THREAD_NAME(qemu_thread_args->name);
     g_free(qemu_thread_args->name);
     g_free(qemu_thread_args);
+
+    /*
+     * GCC 11 with glibc 2.17 on PowerPC reports
+     *
+     * qemu-thread-posix.c:540:5: error: ‘__sigsetjmp’ accessing 656 bytes
+     *   in a region of size 528 [-Werror=stringop-overflow=]
+     * 540 |     pthread_cleanup_push(qemu_thread_atexit_notify, NULL);
+     *     |     ^~~~~~~~~~~~~~~~~~~~
+     *
+     * which is clearly nonsense.
+     */
+#pragma GCC diagnostic push
+#ifndef __clang__
+#pragma GCC diagnostic ignored "-Wstringop-overflow"
+#endif
+
     pthread_cleanup_push(qemu_thread_atexit_notify, NULL);
     r = start_routine(arg);
     pthread_cleanup_pop(1);
+
+#pragma GCC diagnostic pop
+
     return r;
 }
 
-- 
2.31.1



