Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40942346F19
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 02:55:22 +0100 (CET)
Received: from localhost ([::1]:40724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOsjx-0005r0-0s
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 21:55:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOsYl-0005xL-RW
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 21:43:49 -0400
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35]:42558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOsYb-0005if-SX
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 21:43:45 -0400
Received: by mail-oo1-xc35.google.com with SMTP id
 h3-20020a4ae8c30000b02901b68b39e2d3so5430782ooe.9
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 18:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DsSc9dreF6wvzxcw7uDCKMSE3jEvXRT6fQS54ICyVMQ=;
 b=T5qC0n9bxBGVWypiYHvESuCH1PHIqjSyxIF5fx4XGmlLmF5Jd8/iA+P+PF3zSyn5TA
 V9IId+sDI3JxGbrw/QyaN9XjINMc3c+uStWVndiZHx7BvA1Kq0svS8qawxS5DUoAOZiw
 ukhdp1jbCjQV9aQ2qLf1bibWF0r5gvyD7YqMucRDhIk7dFUQzbg90Og777y6L7P3iWKr
 M0yYWJqUvgXW5MjvpsJM+NPIApBuL6ADn5aXLvMLJk+5iLInJTlTd5geJAcfaA7Vvyrk
 y7XoHXPTvniw0nVDSRZBuSJ465WfhrHfyK5/yQCVHRyrub+gzS4panKUisI7kfsx1S1d
 jHPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DsSc9dreF6wvzxcw7uDCKMSE3jEvXRT6fQS54ICyVMQ=;
 b=Lia7KV9YyugDdC2W8B1LVXYLITbSsZSFKkbq6PzBDB2F1MGGlFmyztLUTie01/SRIW
 fRvJgc8FGgqX4Cj0T1JeC4YS2xX1qnE2yZYLydlSJOhkzlMB4GsFZEZBPOfH4/RExuWZ
 8CmRi5GLj5yuJErye2k5+qalilNcbnOCNw86iy+8ogRnG00s+zqYzPJt0ZH2dkpwg528
 SYNSTEjUguWgifAkRn1iz5CRtp6IerE02XYA+YDOJB7nULX5BxP0D5VfXv/kLDgVD8au
 wcqj0RkSAmrR3ZaJ/90VwVGZXlveXz7OQ1CoYh/CDrCzhRAz9lomeVkikv3jj0Co3ZP0
 RPGQ==
X-Gm-Message-State: AOAM531WZewlepSl3DRFn+MxaCq58GAiZYPcR6SZFsLvYa0ls0cIWjFO
 ni1EVfF8bhl/I+Eviz7zH98ctzpcxPKuueHp
X-Google-Smtp-Source: ABdhPJyq0wsdCDBmMpVtFeSx/KnHOwC0dBstCQRMQrUXJ8on5GMUmptd1a/1ciXbojyVZafveaUsjw==
X-Received: by 2002:a4a:6b44:: with SMTP id h4mr701736oof.38.1616550215886;
 Tue, 23 Mar 2021 18:43:35 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id c9sm203601ooq.31.2021.03.23.18.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 18:43:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/5] tcg: Workaround macOS 11.2 mprotect bug
Date: Tue, 23 Mar 2021 19:43:29 -0600
Message-Id: <20210324014332.6331-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210324014332.6331-1-richard.henderson@linaro.org>
References: <20210324014332.6331-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc35.google.com
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
Cc: peter.maydell@linaro.org, Roman Bolshakov <r.bolshakov@yadro.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's a change in mprotect() behaviour [1] in the latest macOS
on M1 and it's not yet clear if it's going to be fixed by Apple.

As a short-term fix, ignore failures setting up the guard pages.

[1] https://gist.github.com/hikalium/75ae822466ee4da13cbbe486498a191f

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>
Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
Buglink: https://bugs.launchpad.net/qemu/+bug/1914849
Message-Id: <20210320165720.1813545-3-richard.henderson@linaro.org>
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


