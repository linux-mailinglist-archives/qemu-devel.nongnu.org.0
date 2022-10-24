Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 097BD60BE7F
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 01:25:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on6oT-0000fi-9Z; Mon, 24 Oct 2022 19:24:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1on6oP-00008D-UI
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 19:24:53 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1on6oL-0000F4-AV
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 19:24:53 -0400
Received: by mail-pl1-x635.google.com with SMTP id j12so9742762plj.5
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 16:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LJ+JQv3dsaa9WWtb7Vu+unKKfyu5T/tcB60KushyFxs=;
 b=th02GPJzxhvyjQqh/DI514LqgLPG5l5afg+cE66ZxkF58AfCb46aBuVzv2VWzlEw0y
 JmcGlI9XiNTrgVZtG8x7hd4aCuqTGIZkTCC0+SLgDOToRD9LiDKM899xcH5TbJ7FDVId
 GhlkITIP/jdTDM1Zc6ZVPffekqc8Mg+W1daqdMzw2g3NqNyrm1NI1f9z0VonwYwkjrer
 fy2UMYrTK6CnyoEbC2yQnbVDTH7o3gAeHoc72u/BogW60jOQtw9xrOAq1SdCkB2YXF30
 oV47tRWq4xWcnLjdMuP366+Wr36USKMQ3qdZyTBTZX74r0WWO1qlPpmIrZCkFSjzqsle
 rXjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LJ+JQv3dsaa9WWtb7Vu+unKKfyu5T/tcB60KushyFxs=;
 b=K2CVuuBiPH9ErDh0CXmpJ8YMBs6RgohbMHDMEo1fOpKy7vMHvj02u/PvuPIfcEUWPM
 3yGabhgaX1E0CH00rRuv4eQhFjg0/Q+k7pdJCgOZNnSczqHNbRYGteTKJcZEDE6OpDsX
 3G/tMO9uXrJTER7jSV8gv96q8pnWSUCVqDk3PYQ46nIioqcMHiyzxy3cacqx5T7I5jHT
 RMrHuTQp5DBdbHeYXXorhia5Ny/0zLhjj7ViaLu1knJEPU2HXH1NhWFCagFF6tDa6vLp
 soh8Kj8zVMn2HTelpwIOPkL6Ci1Vd5hBDZeWxD2DWNBOKRQQvCCf3o8LmiH9dzlIQ+d3
 XPIA==
X-Gm-Message-State: ACrzQf33SRy/RHThIrxo3VFfjuX4PVqYTInUuVQlgdUmuhct9zjGQIuW
 gReKIy+U9npCuxRhztIaDOvln/cUvliDIQ==
X-Google-Smtp-Source: AMsMyM6/9JFyx5xXWhnPerH3Y+sfydMdvh38OuKOfiS92lDuOOCHWpeUyE8WxztiSaL6CIBb9oLmzg==
X-Received: by 2002:a17:902:d484:b0:17f:7437:565d with SMTP id
 c4-20020a170902d48400b0017f7437565dmr35518531plg.154.1666653887892; 
 Mon, 24 Oct 2022 16:24:47 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 k3-20020aa79983000000b0056bfa2cf517sm324788pfh.3.2022.10.24.16.24.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 16:24:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] include/qemu/thread: Use qatomic_* functions
Date: Tue, 25 Oct 2022 09:24:34 +1000
Message-Id: <20221024232435.3334600-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024232435.3334600-1-richard.henderson@linaro.org>
References: <20221024232435.3334600-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Use qatomic_*, which expands to __atomic_* in preference
to the "legacy" __sync_* functions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/thread.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/qemu/thread.h b/include/qemu/thread.h
index af19f2b3fc..976e1ab995 100644
--- a/include/qemu/thread.h
+++ b/include/qemu/thread.h
@@ -227,7 +227,7 @@ struct QemuSpin {
 
 static inline void qemu_spin_init(QemuSpin *spin)
 {
-    __sync_lock_release(&spin->value);
+    qatomic_set(&spin->value, 0);
 #ifdef CONFIG_TSAN
     __tsan_mutex_create(spin, __tsan_mutex_not_static);
 #endif
@@ -246,7 +246,7 @@ static inline void qemu_spin_lock(QemuSpin *spin)
 #ifdef CONFIG_TSAN
     __tsan_mutex_pre_lock(spin, 0);
 #endif
-    while (unlikely(__sync_lock_test_and_set(&spin->value, true))) {
+    while (unlikely(qatomic_xchg(&spin->value, true))) {
         while (qatomic_read(&spin->value)) {
             cpu_relax();
         }
@@ -261,7 +261,7 @@ static inline bool qemu_spin_trylock(QemuSpin *spin)
 #ifdef CONFIG_TSAN
     __tsan_mutex_pre_lock(spin, __tsan_mutex_try_lock);
 #endif
-    bool busy = __sync_lock_test_and_set(&spin->value, true);
+    bool busy = qatomic_xchg(&spin->value, true);
 #ifdef CONFIG_TSAN
     unsigned flags = __tsan_mutex_try_lock;
     flags |= busy ? __tsan_mutex_try_lock_failed : 0;
@@ -280,7 +280,7 @@ static inline void qemu_spin_unlock(QemuSpin *spin)
 #ifdef CONFIG_TSAN
     __tsan_mutex_pre_unlock(spin, 0);
 #endif
-    __sync_lock_release(&spin->value);
+    qatomic_store_release(&spin->value, 0);
 #ifdef CONFIG_TSAN
     __tsan_mutex_post_unlock(spin, 0);
 #endif
-- 
2.34.1


