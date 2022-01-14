Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D0048E1D5
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 01:57:09 +0100 (CET)
Received: from localhost ([::1]:46238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8Ats-0005jP-2D
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 19:57:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1n8AhW-00031Z-VE
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 19:44:19 -0500
Received: from [2a00:1450:4864:20::432] (port=44810
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1n8AhV-0007RG-CR
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 19:44:18 -0500
Received: by mail-wr1-x432.google.com with SMTP id k18so13018566wrg.11
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 16:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YSbdZh2dFJwaLvSXX6knvM8l1aJUmBIRrjcxKQD7KkU=;
 b=FIrjJqcq4blM3cUE+wQkn51B5USWwlb5KO50t7JD0H74bL90oBlQdzXEfokcS3Yeup
 f6lucg/MSLiZbJfkxfbQZblcMcZbiVd1wV3EOHs73QPa6TI7fhI1rbbRCO6JCTIrZGxf
 ZTGagrYcOesIYr5FreKWW4AWH1p94U9xMY18VJ4GChAZfV66b0Dq+RvQwOEttjCSaBKR
 6bUu7ygWEk02XQR8xdzuLmWkx5BlgTMCg/vRbshZkC+rBVSH3iSxvDqN//UiWkDhcSpU
 +cC2dccUak5TUJ4PoPHuMUMyWYKyT3aL3OFeLDtXvZejhiGb8Ka6nGpDXxoTO+uAOf+M
 Tmww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YSbdZh2dFJwaLvSXX6knvM8l1aJUmBIRrjcxKQD7KkU=;
 b=2FPVUSW6tTlwWdLe+9KIBPphDMi7ehCIGpv0vQAxTXa3HsBMlMu5GgK2bcb5tWjQbx
 TK+HmXEVkXe8EIXk9WhBOmq+jJD3AL7iLL4SLh7WqTWsPz/XLe+cCegnc1YV9w16yoZx
 IE8coL3iKxT++0kcQBu7IIYbohr4mkTALbkrpWCt78fh42ZH77uLQITetwp5GiPfInHR
 dNGVJk1m5OhDtb6cBJTW3Bsn47bwNt79KgmVF7H4GqWusd2ua7VO6BwMly4loent9C8e
 EEpxJIWYv1HQnYK2Ayr1mu8SoLd9qXJ4jjTnxLoWdtHr9kC0efxIiF1wnqVCgwS2W+UU
 caNg==
X-Gm-Message-State: AOAM533x03yw0zn2TEIrasRWuLEA27cqmioBu4I7jlGgW3hJ+ldUYQ6i
 dVd5I2OMOzAjulnKBn0+L64kian76dQ=
X-Google-Smtp-Source: ABdhPJyqby29ianmTgZe0jJBznZAWc242v8QZ1E2XRS7urPqfbCZeQslfOhncsax8yLcOZCnZI5dMw==
X-Received: by 2002:a5d:64ed:: with SMTP id g13mr5986289wri.197.1642121055778; 
 Thu, 13 Jan 2022 16:44:15 -0800 (PST)
Received: from li-142ea8cc-3370-11b2-a85c-c55585c2aa0e.ibm.com.com
 (bzq-79-176-122-157.red.bezeqint.net. [79.176.122.157])
 by smtp.gmail.com with ESMTPSA id b6sm4230513wri.56.2022.01.13.16.44.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 16:44:15 -0800 (PST)
From: Idan Horowitz <idan.horowitz@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] qemu-timer: Skip empty timer lists before locking in
 qemu_clock_deadline_ns_all
Date: Fri, 14 Jan 2022 02:43:58 +0200
Message-Id: <20220114004358.299534-2-idan.horowitz@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220114004358.299534-1-idan.horowitz@gmail.com>
References: <20220114004358.299534-1-idan.horowitz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=idan.horowitz@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, Idan Horowitz <idan.horowitz@gmail.com>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This decreases qemu_clock_deadline_ns_all's share from 23.2% to 13% in a
profile of icount-enabled aarch64-softmmu.

Signed-off-by: Idan Horowitz <idan.horowitz@gmail.com>
---
 util/qemu-timer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/util/qemu-timer.c b/util/qemu-timer.c
index f36c75e594..e56895ef55 100644
--- a/util/qemu-timer.c
+++ b/util/qemu-timer.c
@@ -261,6 +261,9 @@ int64_t qemu_clock_deadline_ns_all(QEMUClockType type, int attr_mask)
     }
 
     QLIST_FOREACH(timer_list, &clock->timerlists, list) {
+        if (!qatomic_read(&timer_list->active_timers)) {
+            continue;
+        }
         qemu_mutex_lock(&timer_list->active_timers_lock);
         ts = timer_list->active_timers;
         /* Skip all external timers */
-- 
2.34.1


