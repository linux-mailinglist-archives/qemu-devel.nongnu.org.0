Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA56A36DFDB
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 21:46:50 +0200 (CEST)
Received: from localhost ([::1]:48222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbq93-0000gT-Fp
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 15:46:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbpwv-0005sI-FQ
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:34:17 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:39441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbpwr-0004cC-SG
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:34:17 -0400
Received: by mail-pl1-x62b.google.com with SMTP id s15so5014161plg.6
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 12:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N/2oVwTgtFzi/+6uPZ9HD/sYjxDk5kmDDtru0pgwsuU=;
 b=TObIAaV5V0JHvtPwBUbYZtw815b+i3Mh1i+lfPpQmdtDJ0GDN89wzDcB8Vi89ZVg/c
 N+p3OZBGn7GWPpCEx7Y3wjdaTmWSMNnlMJm9mAROFUACooTdHT/Ndy1dCTz0pKt8jDY9
 dLg6hMxe8k5S7hDO+OGV8850fYAD3uZzaRW2vT7H+BA8MsJYohjGUY4lhg6ql3t7c6Tf
 TKgYHBgtA+9MeStfGEALR0MyYyyLjlfdTNMThRynFUXlBNKqfRNpJGOYj4rmfsLhRdfK
 +9C3s6lwIXKiL18vtAAy/QsNZTFYbwE9MfeUJNMnkmA1DyTFqWijoRXe7NMKxKrfmg1S
 jszg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N/2oVwTgtFzi/+6uPZ9HD/sYjxDk5kmDDtru0pgwsuU=;
 b=pkEAFBCYq1XMGcWO6K9K6a6kbEdPv4TIRdfJ3Tqf9j95ze1fDc3bMVFkZD5fOnmx9Q
 ouCO/dMNb7i0EVDeHwVCHG0lu9X5EzT+g7+6BJmPmme0UDbJRiumk4InvSSqudKYgWeS
 GSwga0GBQYe/ma5XR366Cv/ZrDoZfRkUfatmjrTtYuc69UiqrVeSpcbwT6qLjxlRsh0m
 0qU2jOlmKFhLNnShUmqT/uqcZR7xN+OheI3BAh4K/qgKbe+YcCaVQFcQEuKqIGBgEDEF
 aSCV7Ze80m3DQB/GZOyaCKLN0F6MyCOAobFnkwJwHuyzRHNYbkTOd50VV4nBaUe3cToi
 D15Q==
X-Gm-Message-State: AOAM533vXN7FoCqdilGFMEBfBArCZOYHB89fwJ80MYruX0etDwmFd7n7
 f3kIuLa+qCDDfuj7XA7RXrnMyatoSYCYkw==
X-Google-Smtp-Source: ABdhPJx6ehJTHzIFaGN7GQ2y0bqILT/VLD+lxFPqXxK4JEemEGYI41s3eSg4MtjsS3/s7HnXiViyOA==
X-Received: by 2002:a17:902:c244:b029:ed:4d5a:cdaf with SMTP id
 4-20020a170902c244b02900ed4d5acdafmr12989731plg.5.1619638452527; 
 Wed, 28 Apr 2021 12:34:12 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id h21sm403725pfo.211.2021.04.28.12.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 12:34:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/15] linux-user/s390x: Fix trace in restore_regs
Date: Wed, 28 Apr 2021 12:33:58 -0700
Message-Id: <20210428193408.233706-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210428193408.233706-1-richard.henderson@linaro.org>
References: <20210428193408.233706-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Cc: thuth@redhat.com, qemu-s390x@nongnu.org, cohuck@redhat.com,
 laurent@vivier.eu, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Directly reading sc->regs.psw.addr misses the bswap
that may be performed by __get_user.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/s390x/signal.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index e455a9818d..dcc6f7bc02 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -232,16 +232,17 @@ give_sigsegv:
 
 static void restore_sigregs(CPUS390XState *env, target_sigregs *sc)
 {
+    target_ulong prev_addr;
     int i;
 
     for (i = 0; i < 16; i++) {
         __get_user(env->regs[i], &sc->regs.gprs[i]);
     }
 
+    prev_addr = env->psw.addr;
     __get_user(env->psw.mask, &sc->regs.psw.mask);
-    trace_user_s390x_restore_sigregs(env, (unsigned long long)sc->regs.psw.addr,
-                                     (unsigned long long)env->psw.addr);
     __get_user(env->psw.addr, &sc->regs.psw.addr);
+    trace_user_s390x_restore_sigregs(env, env->psw.addr, prev_addr);
 
     for (i = 0; i < 16; i++) {
         __get_user(env->aregs[i], &sc->regs.acrs[i]);
-- 
2.25.1


