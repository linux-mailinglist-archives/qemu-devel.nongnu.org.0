Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A62C427425
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 01:23:40 +0200 (CEST)
Received: from localhost ([::1]:35990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYzDH-0006xi-AH
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 19:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYz5Q-0000D0-HK
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 19:15:32 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:35543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYz5N-0006n1-U6
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 19:15:32 -0400
Received: by mail-io1-xd2b.google.com with SMTP id b78so12441603iof.2
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 16:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vH3A6hCjitY3ABsVB710hfZ64cv7ryaJ9SdUFmCZAKM=;
 b=o/KcXRuI43t5YMgbYHSWSMioDUHcUyyShczAmRxJlMO626upZ4a2znNdCSseT4Hjdd
 7DZa6ah8aS45u+YuTqQRL7ZNKT+OF7mmCweEWsjw94PfJxexUnfRSNZCumWGkj2wvbAh
 ftZAFVahtRKroPf5E9QRYlTBlG0lvxvYJATBzOfVx6PjUBFdbJ5vZ5dwfvEGJn2nEj+L
 nc9JSgtifxZUnkef1zA/bHVwD4iMd6LAtKJkXJp/hxBGLk7jESwjzkpXb+jLjqCMdFek
 Z8NwG/zyN7l5fUYYVcL2Z1EW9wua7Z1i94Df/2N8LoVnR2HDsfPob46alDfvlAvc8VHJ
 1iaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vH3A6hCjitY3ABsVB710hfZ64cv7ryaJ9SdUFmCZAKM=;
 b=koUZj8ua7hHxaq7niaY0U+SnUn5oVzYevbj3+F8KYBIsB6NE9DXAz4LY0ZeWMwTnTU
 MgGsD5gz/qu2SSOjXljg/ZbNUbsXrpCwZmeN9wT4JQqv2UvDRdLcAWpAq44PxCTZdklH
 GBGvja/K9S/HYc1yD7vPWxvV6SzNJStZlivuvqLTu11eiUddKpdCoS6+CIE/DkG9PKMZ
 d5u60vBCcP7Y3R9y6kh+pmvbl4pks/VlkiQbTV6bz+hyxZTd/KS8PfkNdGcWI+lr+qlF
 P7RYbV5c/tMPH/9Zp1FO4UbARsnqVwLVgZs3/Rn9qbVX1yWoZWQSYJejOJWf/G9MxPt/
 7mIQ==
X-Gm-Message-State: AOAM533yTGTWVF50qW2gEpYsJmy4kE3tJNDXkmSF2RdT7Twl7jSVTtFZ
 AYpuXse5hi2LO7lb4bVMzH6ExknZVGAvaA==
X-Google-Smtp-Source: ABdhPJz0Z5EDEP9XaGlmpxC6yjzGDao2GJJJmAMJXkAkLUrjlu2IQanfGVWHqADooChOgym/QzoLbA==
X-Received: by 2002:a05:6638:4192:: with SMTP id
 az18mr9582685jab.78.1633734928667; 
 Fri, 08 Oct 2021 16:15:28 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id b15sm293628ion.8.2021.10.08.16.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 16:15:28 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/15] bsd-user: Remove used from TaskState
Date: Fri,  8 Oct 2021 17:15:01 -0600
Message-Id: <20211008231506.17471-11-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211008231506.17471-1-imp@bsdimp.com>
References: <20211008231506.17471-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kyle Evans <kevans@freebsd.org>, richard.henderson@linaro.org,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'used' field in TaskState is write only. Remove it from TaskState.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 bsd-user/main.c | 1 -
 bsd-user/qemu.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 48643eeabc..ee84554854 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -210,7 +210,6 @@ void init_task_state(TaskState *ts)
 {
     int i;
 
-    ts->used = 1;
     ts->first_free = ts->sigqueue_table;
     for (i = 0; i < MAX_SIGQUEUE_SIZE - 1; i++) {
         ts->sigqueue_table[i].next = &ts->sigqueue_table[i + 1];
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 3b8475394c..c1170f14d9 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -92,7 +92,6 @@ typedef struct TaskState {
 
     struct TaskState *next;
     struct bsd_binprm *bprm;
-    int used; /* non zero if used */
     struct image_info *info;
 
     struct emulated_sigtable sigtab[TARGET_NSIG];
-- 
2.32.0


