Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D626FE21A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 18:05:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwmIK-0003Wo-3n; Wed, 10 May 2023 12:04:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwmIH-0003WO-KM
 for qemu-devel@nongnu.org; Wed, 10 May 2023 12:03:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwmIF-0006rN-4r
 for qemu-devel@nongnu.org; Wed, 10 May 2023 12:03:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683734634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GxZUIL8ZRc+jI61JL7bfHIiOabQ6MVo42eXQ13VfCiA=;
 b=Nokncgfi+42P09095hLZBufQMnnJ3sNHKP+zsNGsBSVQa3SN134hH0X2tRLdg5zY7iBq6g
 z2niNEPeNuQPb+OC84RfK9Xvp/fXNrTzXZDRnkE4mgEgQ2p3odAsyYOQy0Ztyo7+QAZ990
 O7NsqIHm8InHm+irMPKMPrKa3s6oCTU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-d34rTyT6PrCzBpzRpfeQyg-1; Wed, 10 May 2023 12:03:50 -0400
X-MC-Unique: d34rTyT6PrCzBpzRpfeQyg-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-94a355c9028so851954966b.3
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 09:03:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683734628; x=1686326628;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GxZUIL8ZRc+jI61JL7bfHIiOabQ6MVo42eXQ13VfCiA=;
 b=kMxvy5MvdiioMe5aejpAnHlBzzJCaIXtuT/rGMk0AJiqRDPIzTnJj0Raj2ndxEIQTJ
 T8xHev84Y+v/uNUjPOvYmDdDoKuEg+zkAO7cDVJ/EfR6ca2+YTSfWP6hl6zuQPDVtdoq
 ES0p63MtQIJcU/Ef91mtzTki4q9sbqTEFjC62Z44Omka0Qhx+UYBVBcpBb15t8u9lZEa
 CD9+UzM4zE+yn41raryr1dR4gfwBk8GZ8yk2QMkxvZ30fOCjEJ0U7AZKcpREy+T7Ihyq
 HwX5R7LTT58tpbKFgDfQGfZZzmL4ECyqf+9RksJGSfclpiP0zaQyUy+a8ZwWnH4DvZPV
 +YoA==
X-Gm-Message-State: AC+VfDy9HzUiP1XcHh6LMF+a+tj03QY2MjEejkWIHLv6VqQQUH088RCp
 CrDR9Q1FtRYUJtFFEBjzFdHcYu4U7IcDP1wSdI43tyafcA5VUpdB+YSEiTntXNzXS+5ZRqw3EeG
 rDziBaqebrWpkq0hYgLp5AI9MMxTLvRhZzypyutrmDtA9bkdyQXzvpyb1DuqnnUS7plSxL0snC4
 k=
X-Received: by 2002:a17:906:fe02:b0:94b:4a4:2836 with SMTP id
 wy2-20020a170906fe0200b0094b04a42836mr14847248ejb.69.1683734628122; 
 Wed, 10 May 2023 09:03:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5ejKJ2nhJTnUCYc8+PzokcqNo9w5tzeRdRn9+d7zzaZPyTHEPJ7u1gi2RnLsTWKywSP+AXDQ==
X-Received: by 2002:a17:906:fe02:b0:94b:4a4:2836 with SMTP id
 wy2-20020a170906fe0200b0094b04a42836mr14847211ejb.69.1683734627736; 
 Wed, 10 May 2023 09:03:47 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 jx26-20020a170907761a00b0096629607bb2sm2815201ejc.98.2023.05.10.09.03.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 09:03:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [PATCH] tcg: round-robin: do not use mb_read for rr_current_cpu
Date: Wed, 10 May 2023 18:03:45 +0200
Message-Id: <20230510160346.1248626-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Note that qatomic_mb_set can remain, similar to how Linux has smp_store_mb
(an optimized version of following a store with a full memory barrier).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/tcg/tcg-accel-ops-rr.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
index 290833a37fb2..055f6ae29553 100644
--- a/accel/tcg/tcg-accel-ops-rr.c
+++ b/accel/tcg/tcg-accel-ops-rr.c
@@ -71,11 +71,13 @@ static void rr_kick_next_cpu(void)
 {
     CPUState *cpu;
     do {
-        cpu = qatomic_mb_read(&rr_current_cpu);
+        cpu = qatomic_read(&rr_current_cpu);
         if (cpu) {
             cpu_exit(cpu);
         }
-    } while (cpu != qatomic_mb_read(&rr_current_cpu));
+        /* Finish kicking this cpu before reading again.  */
+        smp_mb();
+    } while (cpu != qatomic_read(&rr_current_cpu));
 }
 
 static void rr_kick_thread(void *opaque)
@@ -206,8 +208,9 @@ static void *rr_cpu_thread_fn(void *arg)
         }
 
         while (cpu && cpu_work_list_empty(cpu) && !cpu->exit_request) {
-
+            /* Store rr_current_cpu before evaluating cpu_can_run().  */
             qatomic_mb_set(&rr_current_cpu, cpu);
+
             current_cpu = cpu;
 
             qemu_clock_enable(QEMU_CLOCK_VIRTUAL,
@@ -245,7 +248,7 @@ static void *rr_cpu_thread_fn(void *arg)
             cpu = CPU_NEXT(cpu);
         } /* while (cpu && !cpu->exit_request).. */
 
-        /* Does not need qatomic_mb_set because a spurious wakeup is okay.  */
+        /* Does not need a memory barrier because a spurious wakeup is okay.  */
         qatomic_set(&rr_current_cpu, NULL);
 
         if (cpu && cpu->exit_request) {
-- 
2.40.1


