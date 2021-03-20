Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB36342E7E
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Mar 2021 18:02:18 +0100 (CET)
Received: from localhost ([::1]:49086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNezR-0006yT-GU
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 13:02:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lNeut-0004Z6-Qp
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 12:57:36 -0400
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30]:44918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lNeuk-000390-DN
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 12:57:35 -0400
Received: by mail-oo1-xc30.google.com with SMTP id
 p2-20020a4aa8420000b02901bc7a7148c4so3090920oom.11
 for <qemu-devel@nongnu.org>; Sat, 20 Mar 2021 09:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0jLCRbOfP8b7p8Z2vRhheskl97O3VX3ZegE0fpM6SkE=;
 b=auXJFJlCl5tHNojb9R7EmjqhQFElUU8z3T6ZlJc072yLEzk5v26fssPBkeJVOOdUSP
 Dz7z5t2FYq/H/vVAaCr28SnWo7kUfyjeH+KmsSCCzZpp9g6xKObF31v4REJvPLpwxbIz
 hQbiwNXegyBNurvlsAvHTbsJmbTYglE4ujgHCx3XwEqKopXX8IEpmubaLabVIok6sUw5
 7rvuLIqUUqxE7hxwEG8HEo4JgbSqXZrscQ0bdLcYAW2aBteptJ3tc4BsuCMhASnAnn/R
 ekq7eWpBh9TBDMjgic2lf1A9NjeSwJFqqfjluyRw4MNySGESwYlqsYHymi754q6ax310
 sGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0jLCRbOfP8b7p8Z2vRhheskl97O3VX3ZegE0fpM6SkE=;
 b=G2vsiOGWvI+S0Qs+O0EYEErbxKUCuedelnJY/kDw9Ig7KRpBWbcfxD9ytLBYc4yw5W
 AQmbnks4zxSKsAWJTzBzgZmCc+4YBM7YI4e1GAY8jDEtD/ijHwJ10/K23t+GVRxZLCbg
 UmqwpZU3NIGNTM6IWCxIGct7OaoOiR6XDdbUQaiXMtOUPpYMk5QB6Ftx0ZRbaU9/i07s
 wTM2gL7nZT84S/3+O8jN/9VXf6OkeI4wMyx1lAMxjq+PKIDA68snkGxtCbIdi8pbvLtC
 m0yTizFbNeqEAmbGmVE7z0hA7jqS3qx5Ad0SQ4POSGSmvvnnGBlujn9affOJ9yrizxz+
 CmRA==
X-Gm-Message-State: AOAM530Ja+D9lPim4YoVBOPRiAMqOU2c+gTl7Jwff//PhfiK9NoR+l3j
 nHwaNWzU3ycHf15sz4684QepcEBNE6SkB0qZ
X-Google-Smtp-Source: ABdhPJzU6kLdeLQQfpsDAcLNQQ4HiSMr6+D5u6YHY7L6mG2JQa5PzbaMIx/twD0L60ahBHBe4xCf7A==
X-Received: by 2002:a4a:d0ce:: with SMTP id u14mr5689275oor.36.1616259445025; 
 Sat, 20 Mar 2021 09:57:25 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i11sm1953966otp.76.2021.03.20.09.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Mar 2021 09:57:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 for-6.0 2/2] tcg: Workaround macOS 11.2 mprotect bug
Date: Sat, 20 Mar 2021 10:57:20 -0600
Message-Id: <20210320165720.1813545-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210320165720.1813545-1-richard.henderson@linaro.org>
References: <20210320165720.1813545-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc30.google.com
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
Cc: r.bolshakov@yadro.com, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's a change in mprotect() behaviour [1] in the latest macOS
on M1 and it's not yet clear if it's going to be fixed by Apple.

As a short-term fix, ignore failures setting up the guard pages.

[1] https://gist.github.com/hikalium/75ae822466ee4da13cbbe486498a191f

Buglink: https://bugs.launchpad.net/qemu/+bug/1914849
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 88c9e6f8a4..1fbe0b686d 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -864,11 +864,15 @@ void tcg_region_init(void)
      */
     for (i = 0; i < region.n; i++) {
         void *start, *end;
-        int rc;
 
         tcg_region_bounds(i, &start, &end);
-        rc = qemu_mprotect_none(end, page_size);
-        g_assert(!rc);
+
+        /*
+         * macOS 11.2 has a bug (Apple Feedback FB8994773) in which mprotect
+         * rejects a permission change from RWX -> NONE.  Guard pages are
+         * nice for bug detection but are not essential; ignore any failure.
+         */
+        (void)qemu_mprotect_none(end, page_size);
     }
 
     tcg_region_trees_init();
-- 
2.25.1


