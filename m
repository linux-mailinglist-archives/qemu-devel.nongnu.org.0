Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3598A42730A
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 23:26:31 +0200 (CEST)
Received: from localhost ([::1]:51034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYxNu-0005hF-7Q
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 17:26:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYxLX-00038b-NP
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 17:24:03 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:38585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYxLW-0007bC-B7
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 17:24:03 -0400
Received: by mail-il1-x134.google.com with SMTP id r9so11329984ile.5
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 14:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FRKvWo3/8KWpxG4EBP+p+wzC/JzpwAuUb/QshF2UpdE=;
 b=0tGShYQMagLllo792QZkunky4he2qj6RatCuQ/MPN1s9ieRh+Oy/PCmf08+Qp3qbev
 FbOnM4SaKxaJbAZKdYaMabyiJ0KyusoxqHAgzbrjBdAFgwElBuvrHnWxGCEoVSzxS8sM
 g6lLU9sDANmh/hZxMG7aLK/gz4b+oaFccGb91cum6vEBBquJdOuVhRF8JMg9Uu4dLOZq
 IYLunNt1Oacz+nk9ZfOyjO/3zFZGXlWW9wa4nOoZ6aAZTPApwcVYo1KIUiOu+K81E6n4
 FSbXLwkaKBDj1wIU0HS2tNOhBe0LHnRMxRD4w6OvJEkTOUxhEfgx7gb7KQCcEVoPv45c
 KKxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FRKvWo3/8KWpxG4EBP+p+wzC/JzpwAuUb/QshF2UpdE=;
 b=02c3IIPVO5dxnir+V6j8vbsfX8mpkgr5so/0Pex7IP+9VSzGnZ0hWLl3hq8AlAcggy
 LKjxO/yWLCKHUgi7VdLZ9uoH1KN2dYyW7mBoFTYsfYyds9NnJh7wyoG5B/+PKUdvnDYA
 DUo46rjDYdlglPuq1uJ8mKW6++WX8SQMfZKu0I9tgpPfnMKi9IPHu1YKfWPtqhgQ3QdU
 ApZMs3f4hoXbPUZakMCzMBFYoW0qVwbfI+qNvcD4ADypDNwXGHaX8VF0zFjpznN2H7vs
 xIPSgK/qCr0tLlJYZxNXVz+uiF5P2TE6QRAAoPTx9Mx73R6G8zzZvwHk8RyyXsczGKwc
 y0zA==
X-Gm-Message-State: AOAM532lTQDhZtRpeXuboaDrbEG01CDB5y0O8Wf1I3o/LsWxn0ASVqhl
 UJZxFzIC20kZiTY9yLZTVJ9CDoXZn6ytFA==
X-Google-Smtp-Source: ABdhPJyL7ff0vKzHr9+8JqvV8PfbBZWltRCmOkNXzujn+nqwhQpu4wcJnQHJl7Ek+tTPHFYO4VJ6cA==
X-Received: by 2002:a05:6e02:1889:: with SMTP id
 o9mr9799537ilu.219.1633728240668; 
 Fri, 08 Oct 2021 14:24:00 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a4sm186620ild.52.2021.10.08.14.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 14:24:00 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/9] bsd-user/mmap.c: Always zero MAP_ANONYMOUS memory in
 mmap_frag()
Date: Fri,  8 Oct 2021 15:23:36 -0600
Message-Id: <20211008212344.95537-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211008212344.95537-1-imp@bsdimp.com>
References: <20211008212344.95537-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::134;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x134.google.com
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
Cc: kevans@freebsd.org,
 =?UTF-8?q?Mika=C3=ABl=20Urankar?= <mikael.urankar@gmail.com>,
 richard.henderson@linaro.org, f4bug@amsat.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mikaël Urankar <mikael.urankar@gmail.com>

Similar to the equivalent linux-user commit e6deac9cf99

When mapping MAP_ANONYMOUS memory fragments, still need notice about to
set it zero, or it will cause issues.

Signed-off-by: Mikaël Urankar <mikael.urankar@gmail.com>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/mmap.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index b40ab9045f..fc3c1480f5 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -180,10 +180,12 @@ static int mmap_frag(abi_ulong real_start,
         if (prot_new != (prot1 | PROT_WRITE))
             mprotect(host_start, qemu_host_page_size, prot_new);
     } else {
-        /* just update the protection */
         if (prot_new != prot1) {
             mprotect(host_start, qemu_host_page_size, prot_new);
         }
+        if (prot_new & PROT_WRITE) {
+            memset(g2h_untagged(start), 0, end - start);
+        }
     }
     return 0;
 }
-- 
2.32.0


