Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4D46FE21D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 18:05:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwmJS-0004fM-So; Wed, 10 May 2023 12:05:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwmJB-0004SL-IF
 for qemu-devel@nongnu.org; Wed, 10 May 2023 12:04:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwmJ7-0006zE-Sb
 for qemu-devel@nongnu.org; Wed, 10 May 2023 12:04:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683734686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GxZUIL8ZRc+jI61JL7bfHIiOabQ6MVo42eXQ13VfCiA=;
 b=Axoc7goLZ5wStNC5loNj3MM1RVOobKQZdbvzdZPvakC+PpRyntw8jiCobTixpZI5fu6HDB
 j5RlPokFIl5d0Cph3ryOCHgyjtHFWDpKBhpzQUhzFF0xty1jF5EXhyi8AYjYRkJ+UeBQ0C
 bGxMWYXU6g08RMMtyEi9Rq8rrSm0Axg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-MrWSoMArOQGnXHGBCl2Z1g-1; Wed, 10 May 2023 12:04:45 -0400
X-MC-Unique: MrWSoMArOQGnXHGBCl2Z1g-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-965b73d8b7eso721364166b.2
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 09:04:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683734684; x=1686326684;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GxZUIL8ZRc+jI61JL7bfHIiOabQ6MVo42eXQ13VfCiA=;
 b=PRPMB7ZgZNgFUXbLkvaoUqDOMKkWQIXLGwl2OgvGed/BLlDq3ck6hUlXk96ZxnrSZL
 xNntw+T5dR0J4GuQ/Hd66i0uMFg8bg34aeHDGztmMc09/sJCXXlco867ENxEqdvMGRM8
 tOohLqXKan6xvggep3CYvWhYUtK6zq/klS9niynI/a7f6GUFWuX+S0fJ+AoDeA6UxG4Z
 0xzx792WQ8uy10HKTUNUnMOmlh5ZRMTVCBP6EEqWRMMNFV9Mto6JH/ygC4fxrfpNRMM4
 l70vBZuNeA3j/qhIn66BCFHBeuhpqKRDZb2pZeMb6KqPIZruH/ys3zpiRgCON8PVISUN
 PAZQ==
X-Gm-Message-State: AC+VfDyVnggvfDFd854R5zAhJkFLWPytjG01HgaWdPluGgUnsAAF7Tn4
 3FLMtJkYQ/EXEjzlmgONWMo3ygt/ozGGoMkeTs42pYLD7ExRjll53+KRFNYMSKg+hmOpW+6RNvH
 EPNf7PE+niuz4VNIW+Xd06UUT9uUN/H+aTs4lJ6WHVC6mKTW0c5kHCvZjiUUmMjL6vuvpsflFbr
 I=
X-Received: by 2002:a17:907:1c84:b0:969:f677:11b7 with SMTP id
 nb4-20020a1709071c8400b00969f67711b7mr6581145ejc.20.1683734683741; 
 Wed, 10 May 2023 09:04:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Y/bn5sWM2RZT88xx+3Tv6dHZWzZRarui2dDWqXbA109DZCc8pd773lkWHtB9TFBx18IHikA==
X-Received: by 2002:a17:907:1c84:b0:969:f677:11b7 with SMTP id
 nb4-20020a1709071c8400b00969f67711b7mr6581111ejc.20.1683734683299; 
 Wed, 10 May 2023 09:04:43 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 fy7-20020a1709069f0700b00965af4c7f07sm2828200ejc.20.2023.05.10.09.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 09:04:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [PATCH] tcg: round-robin: do not use mb_read for rr_current_cpu
Date: Wed, 10 May 2023 18:04:40 +0200
Message-Id: <20230510160441.1249170-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


