Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF7E596401
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 22:51:58 +0200 (CEST)
Received: from localhost ([::1]:44748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO3XZ-00019R-J4
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 16:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO3Gr-0004ss-4n
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 16:34:41 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32]:36742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO3Gm-0004Yg-VY
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 16:34:40 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-10ea9ef5838so12958794fac.3
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 13:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=21coxlkQNnNjbgRrssaJT5btbr5A+uXZSpoWQo/gmIc=;
 b=RQ7cq6OQSyl/ZNAxxoMYMMxBRVuTnEGsudt5CU6TahwAPP60Fkj1V4qs4QuL3reGhn
 umbUv7vXzKp62soNbPTJ2lJhxRLco4DBjsDGkWoW3OTzOLZMm1ic24Mh9UPi9iA7GTR5
 /WLlfNQJXsDNxL1gUI/ynPFpCupt/v0M9ZoOB06I+XKqkPFdNpxGLIb1mbZcmtMY0Swr
 uL0+bfx7UgyksctqS5IAry2HPgwoFOCwMT4OZ2c2Qn9SAp1PZ0w8jKyHgLuZBqDLV+cU
 DCJv6oWZOzXnmWM2lpXAVHwTO2YT07fx4VslNwNvRPQXLvNaK3n/lr3ZxwUBUxhEJCH1
 p2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=21coxlkQNnNjbgRrssaJT5btbr5A+uXZSpoWQo/gmIc=;
 b=MxFtZFa+MjdQ3iciV1ySvNDb250om2KU9AiZNs5tYhqvpIvENT/yMvibTjqJtGwCqz
 d63RXq4zYW9CSKB3hfvUiidMYsLfflFMGwoGkNse7OVmsrgXHvbETqYYw26UGaiaw5df
 3Mm2T++DwA+7fHb6m7INi1rihaYIaBLGvQeLDOJhDj46GsdoSU6kpUfrNBTHe76aIm/7
 8sPPtHuiPC5yG7iSSQvYyOWZqOdkZ4v06fzY1atK1nUZfKN/0eG0SHnpBxltRbWjSozm
 3W7uhYUIEerlZBRKfGTYivAhUBgf5O8kVO3lOidWP5Fk9tp7ohqZHFBDVYIxMNeDBxE4
 kTIw==
X-Gm-Message-State: ACgBeo1DF+M/Hg5LvNjQx6cU5XVLzd071kNE3Kvq66fMdPL/5LEGSUQL
 PgQjJpEzLFzxqiVheSS6BogcRZ7w4KKIJQ==
X-Google-Smtp-Source: AA6agR6fhLPdyHarGUDx1LVj42NmZAZZTi3JDTtEOfkpskMj+5PLDxdLnyb2aBwWgwVyF0huoZ55BQ==
X-Received: by 2002:a05:6870:d78a:b0:10e:45a6:a400 with SMTP id
 bd10-20020a056870d78a00b0010e45a6a400mr146048oab.27.1660682075902; 
 Tue, 16 Aug 2022 13:34:35 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
 by smtp.gmail.com with ESMTPSA id
 y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.34.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 13:34:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 13/33] accel/tcg: Unlock mmap_lock after longjmp
Date: Tue, 16 Aug 2022 15:33:40 -0500
Message-Id: <20220816203400.161187-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The mmap_lock is held around tb_gen_code.  While the comment
is correct that the lock is dropped when tb_gen_code runs out
of memory, the lock is *not* dropped when an exception is
raised reading code for translation.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 711859d4d4..7887af6f45 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -523,13 +523,11 @@ void cpu_exec_step_atomic(CPUState *cpu)
         cpu_tb_exec(cpu, tb, &tb_exit);
         cpu_exec_exit(cpu);
     } else {
-        /*
-         * The mmap_lock is dropped by tb_gen_code if it runs out of
-         * memory.
-         */
 #ifndef CONFIG_SOFTMMU
         clear_helper_retaddr();
-        tcg_debug_assert(!have_mmap_lock());
+        if (have_mmap_lock()) {
+            mmap_unlock();
+        }
 #endif
         if (qemu_mutex_iothread_locked()) {
             qemu_mutex_unlock_iothread();
@@ -936,7 +934,9 @@ int cpu_exec(CPUState *cpu)
 
 #ifndef CONFIG_SOFTMMU
         clear_helper_retaddr();
-        tcg_debug_assert(!have_mmap_lock());
+        if (have_mmap_lock()) {
+            mmap_unlock();
+        }
 #endif
         if (qemu_mutex_iothread_locked()) {
             qemu_mutex_unlock_iothread();
-- 
2.34.1


