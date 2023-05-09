Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FFE6FC24C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 11:06:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwJHc-0005GK-Kx; Tue, 09 May 2023 05:05:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwJHa-0005Fo-ES
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:05:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwJHV-0004up-Jw
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:05:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683623109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k+Hy7863bVVg2b9P3/Vu2bssKtfYLZ8Nym6z4eY/5m0=;
 b=W++dyYLF3kAwMfWehG37SwBu8bdHJxkWsX9v5feohkL/5HVJNBQH10zqjs5CMoMZYbqKOk
 HMw78SnS9u7CXoXXr019qXkZ6xPhAAHB4IKk3WpaQCKITlUkmlgdfJuLVj3iEhmAmy9AdF
 lUmsLnhOE1i16F01kcKsD/smS1odFOg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-EO7W7GGhOqmt5Ym0KlHNoQ-1; Tue, 09 May 2023 05:05:08 -0400
X-MC-Unique: EO7W7GGhOqmt5Ym0KlHNoQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-94a341ee4fcso694836866b.0
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 02:05:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683623107; x=1686215107;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k+Hy7863bVVg2b9P3/Vu2bssKtfYLZ8Nym6z4eY/5m0=;
 b=h6H8X/UooAMAL8ZvW8rVCedYA8EoWwcl5gi7pAzvVms50vJ4ayEQ172HISPiiTkaZV
 nRuqxpReFGBkxirQr5UznNjoko5L3H4z2ucy03SJr1VZXgrwIdn7Sz+17+kG/ez6MHlF
 LCnY2RvZ4ksmWJtJoQFmwylUlLPqwtPQpJCO9Eanp3xmJ9ctA0Wwxbskjwn5otcKgv3h
 SfMJof6/BjjBc/nMFkHCd8IIib8NS9s10qYOAP5mNWHka3twzF3Ce0NjsjuMRPNibkXw
 v5FD3jbIqAYnr+EkW1h8hlul4CLtB4d60ewIaIXqJrB2h3qzfceAUk25nUzGZ60zHPxn
 NWxw==
X-Gm-Message-State: AC+VfDy35sziqFTSqNLfGr4d2fIRyMyGnWYGMnbMF+Lr/iCbA5HQaPt0
 BD77vB1lyrErWCf7LiSHhmson5e5swsgwZ8VK7buWL+7tHzG7tmMVk0ZDEkRdfCvDQSxa/xHb9C
 HcHT449j1fGquOI5zRMEX538ZZDuBckd+1b7dj5cRjwy0V8tI+/W8Ewne4kId5699AmQHZSWQ/o
 8=
X-Received: by 2002:a17:906:ef04:b0:94a:4eba:45d3 with SMTP id
 f4-20020a170906ef0400b0094a4eba45d3mr10165701ejs.30.1683623106971; 
 Tue, 09 May 2023 02:05:06 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ67d4TBaODHtMI5WYC56BF/VYtiKygmHpPL5b1yn38xffVG5L3iOQdBrTFDzm3pmAjLFz+pWQ==
X-Received: by 2002:a17:906:ef04:b0:94a:4eba:45d3 with SMTP id
 f4-20020a170906ef0400b0094a4eba45d3mr10165690ejs.30.1683623106724; 
 Tue, 09 May 2023 02:05:06 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 ia6-20020a170907a06600b00969c3a9769csm891938ejc.201.2023.05.09.02.05.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 02:05:05 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 05/16] tb-maint: do not use mb_read/mb_set
Date: Tue,  9 May 2023 11:04:42 +0200
Message-Id: <20230509090453.37884-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509090453.37884-1-pbonzini@redhat.com>
References: <20230509090453.37884-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The load side can use a relaxed load, which will surely happen before
the work item is run by async_safe_run_on_cpu() or before double-checking
under mmap_lock.  The store side can use an atomic RMW operation.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/tcg/tb-maint.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index cb1f806f00d4..0dd173fbf048 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -746,7 +746,7 @@ static void do_tb_flush(CPUState *cpu, run_on_cpu_data tb_flush_count)
 
     tcg_region_reset_all();
     /* XXX: flush processor icache at this point if cache flush is expensive */
-    qatomic_mb_set(&tb_ctx.tb_flush_count, tb_ctx.tb_flush_count + 1);
+    qatomic_inc(&tb_ctx.tb_flush_count);
 
 done:
     mmap_unlock();
@@ -758,7 +758,7 @@ done:
 void tb_flush(CPUState *cpu)
 {
     if (tcg_enabled()) {
-        unsigned tb_flush_count = qatomic_mb_read(&tb_ctx.tb_flush_count);
+        unsigned tb_flush_count = qatomic_read(&tb_ctx.tb_flush_count);
 
         if (cpu_in_exclusive_context(cpu)) {
             do_tb_flush(cpu, RUN_ON_CPU_HOST_INT(tb_flush_count));
-- 
2.40.1


