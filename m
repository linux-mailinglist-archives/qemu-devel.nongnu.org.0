Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 208C34B1BA3
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 02:52:00 +0100 (CET)
Received: from localhost ([::1]:50896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIL6N-0001uX-7Y
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 20:51:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKmy-00042x-NW
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:31:58 -0500
Received: from [2607:f8b0:4864:20::102f] (port=45928
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKmv-0007Lm-SS
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:31:56 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 q11-20020a17090a304b00b001b94d25eaecso2841894pjl.4
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 17:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xC7suoa36jFUtiePZKS+9H0vArd6rlJO37NOOnD8sis=;
 b=xYU8pXjzTNLQLkVtwpVD0yClayBGR/HKi694bjz4Mg3X1cyp/J5ENO5niSnq0t4WKF
 5teB9nlY4emK1xG1jzRNJpYtgNCtpxBkM/Rgn78rdZBwxsii22AaGDdE6E2u8bqQ+z93
 uuR1USrGCziMJMMRQl5UaR5j/xg9ViOUGkzeJMYO0lDpOyNYI495EpFuBZpwRT+aedIF
 hxF3pz/MvK4uGVCyKkooTWPL0D2DtTzx/mbiwJwuTjO3YqSeJJpSxTGhR2MGjZBXMjfb
 OmXH9rFRnf+zMYj5mnhhXxSme4qPKFHJZneciJx8OgCgFu2jO38zUODM4I/AVPWPkq+A
 Oqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xC7suoa36jFUtiePZKS+9H0vArd6rlJO37NOOnD8sis=;
 b=UMmzUFvJCxYe9EySVqbCeh3ZoSToA4HqOdfsyGFSePTOJVZoFm3+VGfoZg72TJerCU
 SJbV2LaKbsYqW2HyVXCzSlQzE51NgrabhQOXqGvcXNaVkUP2ArjqNII60+b2/SRxsBDz
 haXBdgD8WIGb/5qdG0S69Agoi08UI0FV87OwFNnvAQLsYTcsV8hf6U37FET+p+BS4Ujy
 bQ4QekCF5nbox8Fjm5T7IavbhqIL6QIliilvE+PzTbwYtY+vYTrdXiMfkATCviriadLG
 Jz8bbIUw2qCilTU2iYYnjOmd9RJoDM84fk7u3nrDv5rWkcInwR3gA9uw9mDNYDeKb8Gk
 hCHQ==
X-Gm-Message-State: AOAM53202FwBAMtXOR1vVXasI+XCKUQuN/GDIyoeGi4y1sDq43hM3GFR
 qyz25uWdjBri9iS/edsMyGlvLJhWqu/z8jfr
X-Google-Smtp-Source: ABdhPJz+k+1NFwITEbuV+A6RZsTpWTxTGzMBQEXO71SM7x6GdbGO9/k0hZHdWl+eOxfo7liLGEFL9A==
X-Received: by 2002:a17:902:7595:: with SMTP id
 j21mr10007349pll.79.1644543112629; 
 Thu, 10 Feb 2022 17:31:52 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id h5sm25738788pfi.111.2022.02.10.17.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 17:31:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/34] softmmu/cpus: Check if the cpu work list is empty
 atomically
Date: Fri, 11 Feb 2022 12:30:32 +1100
Message-Id: <20220211013059.17994-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211013059.17994-1-richard.henderson@linaro.org>
References: <20220211013059.17994-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Idan Horowitz <idan.horowitz@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Idan Horowitz <idan.horowitz@gmail.com>

Instead of taking the lock of the cpu work list in order to check if it's
empty, we can just read the head pointer atomically. This decreases
cpu_work_list_empty's share from 5% to 1.3% in a profile of icount-enabled
aarch64-softmmu.

Signed-off-by: Idan Horowitz <idan.horowitz@gmail.com>
Message-Id: <20220114004358.299534-1-idan.horowitz@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 softmmu/cpus.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 23bca46b07..035395ae13 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -73,12 +73,7 @@ bool cpu_is_stopped(CPUState *cpu)
 
 bool cpu_work_list_empty(CPUState *cpu)
 {
-    bool ret;
-
-    qemu_mutex_lock(&cpu->work_mutex);
-    ret = QSIMPLEQ_EMPTY(&cpu->work_list);
-    qemu_mutex_unlock(&cpu->work_mutex);
-    return ret;
+    return QSIMPLEQ_EMPTY_ATOMIC(&cpu->work_list);
 }
 
 bool cpu_thread_is_idle(CPUState *cpu)
-- 
2.25.1


