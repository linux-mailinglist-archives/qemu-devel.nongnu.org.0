Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 657E63F3D5A
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 05:57:31 +0200 (CEST)
Received: from localhost ([::1]:41358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHeby-00024n-FG
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 23:57:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaG-0007gT-DA
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:44 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:36494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaE-0000aG-Rs
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:44 -0400
Received: by mail-pl1-x633.google.com with SMTP id f1so1365725plg.3
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 20:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BtM7var2ggs0sC3CkTYi8ly4990ZgrcQeQZtuDarh58=;
 b=L2j01erIoPdFBFriRxhnvxopl6a3DUivI6y6/350cFG8fO6eUlEoFJqZ6uxsMl5r0Y
 CgMaVDitjhaM1LN+17BcHiKzNagTyKOIlYf5pEbUzrRV4Yw494Vxh2XIbmUyI1bkytfa
 exkJ11I87RDhDm0jRt6962ivO4LSKEaCGt7BaTe8MmcXwXhVu9e7ANcXkHXNuWd0wiUm
 boZiIopLEWHR3GjK1W2e0T4MbcWHrjnIPjC4Kx9FMY0nNPcFVx4gdRp6Rc6MLa3SND6j
 6q24JFcuRCr2boV1iGsY+amfWbwaKpxz4b2N+2xlmtDIb1OO+zpkYnAlMaezcEAyJff0
 3OCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BtM7var2ggs0sC3CkTYi8ly4990ZgrcQeQZtuDarh58=;
 b=bqASQUt0VCUhS+5Dse3OOFcUacqxkg9IUh5mu5IV2HiSi/5XXQiP40NVUlGZC9Z848
 jezNnbgaI3m8divJbuVM+D8aUabkXtbjjjSmkFmyzFqLZ3rjvA9At3kbvALY0TpX6/rv
 Myxpup27weYoqPWwWGOuS2ESVL+TzmF6nTNhDHPS7Ic9EVIs79rMjjXpARmkMd0tgDm0
 a0Sjw702dP9Uwh5wTo/86FcWPjdwVwAeY7LAdXxY0Sr4HSy2SgTF62m+DZFBAbx3TVs1
 m6F8hD8bB3JEgyrLR4+mPItdNoVb4l3dhuEpZ3lIzK1cgTDvpzZkGNYDK/1WlT3yOCq/
 UPTQ==
X-Gm-Message-State: AOAM531l3W8uswwYvfG2IYx4uczxoauFMeKJ5pl+u8ijcrP+gorwWyT1
 qy0K7nRrLXIZpQhHqgei4/x7hxn9qaClGg==
X-Google-Smtp-Source: ABdhPJyZ5Zvthp3CpPKSI9GPh8HW/R81l1cqPQtoBY2XnqU+EUy9m/qOmcDnIqeTYQ/FkdfkpOB/wQ==
X-Received: by 2002:a17:90a:9292:: with SMTP id
 n18mr12881447pjo.120.1629604541385; 
 Sat, 21 Aug 2021 20:55:41 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x12sm11560533pfu.21.2021.08.21.20.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 20:55:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/30] linux-user: Zero out target_siginfo_t in force_sig()
Date: Sat, 21 Aug 2021 20:55:11 -0700
Message-Id: <20210822035537.283193-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210822035537.283193-1-richard.henderson@linaro.org>
References: <20210822035537.283193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

The target_siginfo_t we populate in force_sig() will eventually
get copied onto the target's stack. Zero it out so that any extra
padding in the sifields union is consistently zero when the guest
sees it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210813131809.28655-5-peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/signal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index a8faea6f09..fd3c6a3e60 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -636,7 +636,7 @@ void force_sig(int sig)
 {
     CPUState *cpu = thread_cpu;
     CPUArchState *env = cpu->env_ptr;
-    target_siginfo_t info;
+    target_siginfo_t info = {};
 
     info.si_signo = sig;
     info.si_errno = 0;
-- 
2.25.1


