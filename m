Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC313B88AF
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 20:46:47 +0200 (CEST)
Received: from localhost ([::1]:38466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyfEU-0000BK-On
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 14:46:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0u-0005ah-6m
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:44 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:53865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0s-00027D-FO
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:43 -0400
Received: by mail-pj1-x102c.google.com with SMTP id q91so2369871pjk.3
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vJrlNdqM0KKCTgAnUoRaR9ScUOgl0wituQHo+qblcXE=;
 b=v6o/lhw3PU34Xvm8Pccrs5MLt15WbtDw7GYUvFr7cxPEKgfvk/6notSOJk+JTma6B0
 MFlnQylLGFXmBmYqbE0oQFiC5cvjRgd3CKkn3XvcFMyBWfyyWMQ9yE2/MRnZKRq8AObp
 PVt22RuRABUbr//Gg/h+Hz4Vwmiy+P+sGRFtZmG0ufg+7eWISoRKsYKddb11o5T2s6K1
 +JY/KXM/cMk2umIyDCA3UP+eXrwxQXMmUwWIh/Wone2E3XGHtFviJpEHef2z1/V/hk1E
 omr6mH6KMLbJ06bAzIL3Zxg9mtJvJlVY+PRZFa4SFaJfcA3EDNBblHWjlzV9fG4lU0ly
 MLfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vJrlNdqM0KKCTgAnUoRaR9ScUOgl0wituQHo+qblcXE=;
 b=XykPN75MKZfXZutlmwoAS21RHdbEPJhu2NRQYvBsu4e+tlrQAEXQMW33dpr8EHIHyo
 nZWqTnnV5WnYpSddPKnXfr6dahbUEf6sSiVZ2Vy6bCmrdeEvJKJnjmz9qbyuYfaLzQbZ
 qGvGQjLIxcrQgYsufVhv99nSLQUvvUCVawceqYknFqc/02RO4hrY+nYnFViTuaL6HJxG
 YrwL9L7UpYKcOrKE+zlBVtbJsOeoy6JWPD9YCA4xHbs9AETpJAw0BLx/ae8wQntzaBiN
 f1ywrALdp3NzDhpolZFK1+7Pf824rPj3pwImzi9J6XDlS759oQCHwQOrs98cTCvB5iK8
 6BIw==
X-Gm-Message-State: AOAM530k46ZUise14/9vjCyCu/qxxtJOuEGoamUFBtdc6w4Kdztb43la
 nNe/9fU60GktQpOCTprhuLq0UVdx0puoPQ==
X-Google-Smtp-Source: ABdhPJyMVqmOriJkmILb8aDZulRms/zvA8yEBFBm3/OSU3KT87ggc4K3zYP2BFwW7DXGo1XjkHdGTA==
X-Received: by 2002:a17:902:8206:b029:129:2e87:a86a with SMTP id
 x6-20020a1709028206b02901292e87a86amr204551pln.5.1625077961190; 
 Wed, 30 Jun 2021 11:32:41 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id m18sm23909517pff.88.2021.06.30.11.32.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 11:32:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/28] target/s390x: Use translator_use_goto_tb
Date: Wed, 30 Jun 2021 11:32:20 -0700
Message-Id: <20210630183226.3290849-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210630183226.3290849-1-richard.henderson@linaro.org>
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/translate.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/target/s390x/translate.c b/target/s390x/translate.c
index 03dab9f350..117a890ecd 100644
--- a/target/s390x/translate.c
+++ b/target/s390x/translate.c
@@ -697,12 +697,7 @@ static bool use_goto_tb(DisasContext *s, uint64_t dest)
     if (unlikely(use_exit_tb(s))) {
         return false;
     }
-#ifndef CONFIG_USER_ONLY
-    return (dest & TARGET_PAGE_MASK) == (s->base.tb->pc & TARGET_PAGE_MASK) ||
-           (dest & TARGET_PAGE_MASK) == (s->base.pc_next & TARGET_PAGE_MASK);
-#else
-    return true;
-#endif
+    return translator_use_goto_tb(&s->base, dest);
 }
 
 static void account_noninline_branch(DisasContext *s, int cc_op)
-- 
2.25.1


