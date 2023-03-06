Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CCE6AD1A2
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 23:34:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZJOe-0004NZ-EO; Mon, 06 Mar 2023 17:33:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZJOc-0004Mv-Hh
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:33:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZJOb-0003YB-B1
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:33:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678142008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PDtlNyvpurp2Cm3xJcc1yMYSCuDM+6/Oexiu9ICXnaI=;
 b=RS6gTSgxaplRuoff3ZwEXIiCt4TYJjzd25FQuuf+3Nhi6SLF2YWs/tO8s1c6rrwFn3xj3C
 zY+XLMjz9h0vG8BZYAPeu4hDFSG+l+zQoOI7JCBH9MxKM98jAJ7DMGUKeevzs5mqVPHyN6
 XP+rz++GvTOKSx94eW7j4Glw+UHh4EI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-BgRjYIrVMhORR6MnXQnqMw-1; Mon, 06 Mar 2023 17:33:27 -0500
X-MC-Unique: BgRjYIrVMhORR6MnXQnqMw-1
Received: by mail-ed1-f72.google.com with SMTP id
 d35-20020a056402402300b004e37aed9832so6509543eda.18
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 14:33:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678142006;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PDtlNyvpurp2Cm3xJcc1yMYSCuDM+6/Oexiu9ICXnaI=;
 b=hChbW0xoH2l/P1XkZw7v68BbH0tzATNRctCuiYsIznxfucsQaSOkXwSB21bXCj2dcH
 1B2RgbieSR7YIMvK7eNvXzo/elMm3NuQJt0OiWiXkd54Q8zm5OVvSdaDsaQX/jkoBI2o
 DTjSaTAlcEznIioN/K8D4n5Ybflo59LK1koElsCUKKfKeRfzRSSFFBeAgP3SNcfyX4n2
 /WJEWSOTe9/xUHeR+e573+7bBC23bsxkkS3IGrOCXSln+vKGuyUkKSqiqOllVHoDQ9+b
 bJ9KTRHkq4q2D6NGvlQuvmAZWVLcKhvuY6pDzVfp8O7DTcMAMFjDuLQVc9KMBji2QU0b
 PbDA==
X-Gm-Message-State: AO0yUKVzxHFERy3cQ7CpKaVO18nZyrpwKGcMc8TaJJbd46jdkLibX0Ob
 H7bhQUecT6b4aScXIKhKKnxDYxdHklRqJ9tdT9X/lzCFOOuSnhk+3Ji2F+y7NwcxN3GznLcrPTN
 fGN0TtOnf6n0w/8HNr9GJiYH4PU3ywn5Srcfk00KWkJUsPdiWT6YpXpy9dgh6xXCS/JdtgkYzK/
 o=
X-Received: by 2002:a17:907:9702:b0:8b2:d30:e722 with SMTP id
 jg2-20020a170907970200b008b20d30e722mr15987783ejc.3.1678142006090; 
 Mon, 06 Mar 2023 14:33:26 -0800 (PST)
X-Google-Smtp-Source: AK7set+zLAL5/HeUHoEfMnyEVOtw0KnQh2C5cx80Vnpz55rNIky7NzLRHfJ1hwbZnjpZBhvX3ki0xw==
X-Received: by 2002:a17:907:9702:b0:8b2:d30:e722 with SMTP id
 jg2-20020a170907970200b008b20d30e722mr15987757ejc.3.1678142005742; 
 Mon, 06 Mar 2023 14:33:25 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 v12-20020a170906338c00b008ba9e67ea4asm5154594eja.133.2023.03.06.14.33.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 14:33:25 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, david@redhat.com,
 stefanha@redhat.com, cohuck@redhat.com, eauger@redhat.com,
 richard.henderson@linaro.org
Subject: [PATCH v2 5/9] aio-wait: switch to smp_mb__after_rmw()
Date: Mon,  6 Mar 2023 23:33:02 +0100
Message-Id: <20230306223306.84383-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230306223306.84383-1-pbonzini@redhat.com>
References: <20230306223306.84383-1-pbonzini@redhat.com>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The barrier comes after an atomic increment, so it is enough to use
smp_mb__after_rmw(); this avoids a double barrier on x86 systems.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/block/aio-wait.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/block/aio-wait.h b/include/block/aio-wait.h
index dd9a7f6461ef..da13357bb8cf 100644
--- a/include/block/aio-wait.h
+++ b/include/block/aio-wait.h
@@ -85,7 +85,7 @@ extern AioWait global_aio_wait;
     /* Increment wait_->num_waiters before evaluating cond. */     \
     qatomic_inc(&wait_->num_waiters);                              \
     /* Paired with smp_mb in aio_wait_kick(). */                   \
-    smp_mb();                                                      \
+    smp_mb__after_rmw();                                           \
     if (ctx_ && in_aio_context_home_thread(ctx_)) {                \
         while ((cond)) {                                           \
             aio_poll(ctx_, true);                                  \
-- 
2.39.1


