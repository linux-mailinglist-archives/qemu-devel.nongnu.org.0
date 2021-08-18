Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F7E3F0BAD
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:21:56 +0200 (CEST)
Received: from localhost ([::1]:38586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGR8N-0002mt-6c
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:21:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR5z-0008RT-PN
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:27 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:36375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR5y-0008Hk-99
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:27 -0400
Received: by mail-pg1-x531.google.com with SMTP id t1so3313067pgv.3
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Uc/e+W+UczDnwwQ5uBKLp0/+k09GUXeTG97dBWfRO/s=;
 b=h6RMJsGYqSQ+QvQz73qX8D+z5csRsYe+pMRdGjKGOcUoMn6X6O1PWqDQyIHQrl4rnb
 RiHr1aMC06IxB88A2kkWmyHcGiTMGPEmF2FvdOuwpTte4f2peuvzSf5eRK5URIfDnzwd
 4NIPIBOdAYP8DSWphxM6uvQ/7llJqLV7/M6pulUTCJ+gNARo9T4h+7ORjxPN+J7CgoqE
 KEhQx1VIChrNfVueeiIvFF2MQ+mF/aeVF8DO7AoQMv/XS7a3QYbX8OXAHGKU6m4pby+S
 XU23favyO0ueGPhn6OonXRs4yvPozxgr906LQItTS2FCIH4nqRmY+1a/3XOq5b9lXYQW
 jGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Uc/e+W+UczDnwwQ5uBKLp0/+k09GUXeTG97dBWfRO/s=;
 b=KtLTN8PFAjZNiir8eCXj58oCftu9HlUTYlxv0miwix+ooQvCnkZcyMLkIbQOF0AjHv
 4Tcbgp++3qs8yIKGntCzSxPs+R5318ts3WyU3UjtS9k1hHygPV3BUleyzJgzwOflAwNW
 YjNXEDUYhx1neU4CbSvhGBMKJYjja6P2WAON6f2+kTHfHJ/HVPhNCQfy2LOChXvnuuKg
 vVnMWbr1/YaqoxeGi4wlS78dfsmnZYJk7avWeb5V0qPf6cCmQklBKyGEYE121NrXfJyG
 A4LWzQvIbe0zbm9rrKH2OhK6qpgwOAlhR/vHSuYxPL2rpI6zIMpaCM4PtqDT225gYXQ3
 dRBQ==
X-Gm-Message-State: AOAM5325gmJlTiKqxkpHfMnynDjJ3HslklRLxT9/oII3cCZuQVYF51I6
 kF+N6ZG0Tz6nskJHA5Ug1fNUXrekl37nkw==
X-Google-Smtp-Source: ABdhPJxIUDRyCRgP8WAf0iE5k1j2Udqsp1B6YERLkGoT9b7jCkOUnLZra8vr3qBs6Cey0Pc127I5BA==
X-Received: by 2002:a62:ed06:0:b029:32c:a800:ba47 with SMTP id
 u6-20020a62ed060000b029032ca800ba47mr10654364pfh.56.1629314364928; 
 Wed, 18 Aug 2021 12:19:24 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id a6sm524108pjs.40.2021.08.18.12.19.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:19:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/66] util: Suppress -Wstringop-overflow in
 qemu_thread_start
Date: Wed, 18 Aug 2021 09:18:15 -1000
Message-Id: <20210818191920.390759-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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

This seems to be either a glibc or gcc bug, but the code
appears to be fine with the warning suppressed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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
2.25.1


