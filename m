Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7734A534440
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 21:36:06 +0200 (CEST)
Received: from localhost ([::1]:50690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntwnd-0004eg-FN
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 15:36:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ntwgt-0004bA-0h
 for qemu-devel@nongnu.org; Wed, 25 May 2022 15:29:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ntwgr-0003pW-ID
 for qemu-devel@nongnu.org; Wed, 25 May 2022 15:29:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653506945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xc61ioXjJqs4GYPUXx9rha0+l8QYITFxPw67Rmvb6ME=;
 b=VuZ4bwRmcIpIfjLXglNuC0t6I/ZGJMOkLUd6hlZwrHK2yA4+sn1lYMzZzEmip4BIJ4Fvuu
 4p2UXJDie9CFzJif13Cv6hRsSC6F7YxglahYBpUxHLeNMYE0C6FkmLu7UnnZtF3NMAFrC6
 1eNUwOR4jeIFFwRepKdRbU6GRkKbCXI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-z--XoHUTNkClVx-rswHMJg-1; Wed, 25 May 2022 15:29:03 -0400
X-MC-Unique: z--XoHUTNkClVx-rswHMJg-1
Received: by mail-ej1-f69.google.com with SMTP id
 ks1-20020a170906f84100b006fee53b22c2so4991729ejb.10
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 12:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xc61ioXjJqs4GYPUXx9rha0+l8QYITFxPw67Rmvb6ME=;
 b=sWXre1KygPJntzpRGYqhsIAPah2nbYieev4iI2TQdHJ5F+jBL+dJvrxQvuKflSsRu0
 X78uBf3WNrwpDZGP2bn3386fFwnuTKobolQrZzF0gnSxxvmbOMKKWik6gafFFxj0cBQY
 gt3LRPIUrzCr2HlhwzSk66JJaBMlxfboy0lSLvyehOilldicrvbJaPWIwKBdFpxbmEq0
 8KSOswLtTP9GiBMxjnH1F2bGIr1zefCpyyCxiiq6/SuljWcnWMHLaFeJawzVhX0HKfO5
 1Fu7lPqSt6RdKCL7MfuX0smDq0zKYjmprpVYACRl1zGhTAtbadIhtqgW8vZXfVMrhPg1
 5apA==
X-Gm-Message-State: AOAM532pK8jCTQhmohDzTnl6qryBMiUDwiihiCuoA2tZY5+hkiSKWkuu
 f/tZ7f2qj88VmqmB/pEO0DZPxP9DnoU6zYuQngTNC6MvbPw+kMZOJew/PnZtmia1MJb+rH4dd5U
 lCKONcoo3I4XG7kE/6eltjRnRD+qWkDj7Pk7tmL4UDPt951BYLEcD/nMgt4YMZTy7avs=
X-Received: by 2002:a05:6402:1010:b0:42b:5afd:a506 with SMTP id
 c16-20020a056402101000b0042b5afda506mr20185942edu.276.1653506941897; 
 Wed, 25 May 2022 12:29:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8WbW8i4iC7KsbComCYTDWfmREO0z7rkmp87oHMSpn05nAgdN0Jc1FTMpjeOb2Zwg08ikcGA==
X-Received: by 2002:a05:6402:1010:b0:42b:5afd:a506 with SMTP id
 c16-20020a056402101000b0042b5afda506mr20185917edu.276.1653506941618; 
 Wed, 25 May 2022 12:29:01 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 hs33-20020a1709073ea100b006feb71acbb3sm5415381ejc.105.2022.05.25.12.29.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 12:29:00 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Nicolas Saenz Julienne <nsaenzju@redhat.com>
Subject: [PULL 03/17] thread-pool: optimize scheduling of completion bottom
 half
Date: Wed, 25 May 2022 21:28:38 +0200
Message-Id: <20220525192852.301633-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525192852.301633-1-pbonzini@redhat.com>
References: <20220525192852.301633-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The completion bottom half was scheduled within the pool->lock
critical section.  That actually results in worse performance,
because the worker thread can run its own small critical section
and go to sleep before the bottom half starts running.

Note that this simple change does not produce an improvement without
changing the thread pool QemuSemaphore to a condition variable.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Nicolas Saenz Julienne <nsaenzju@redhat.com>
Message-Id: <20220514065012.1149539-2-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/thread-pool.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/util/thread-pool.c b/util/thread-pool.c
index 196835b4d3..4979f30ca3 100644
--- a/util/thread-pool.c
+++ b/util/thread-pool.c
@@ -127,9 +127,8 @@ static void *worker_thread(void *opaque)
         smp_wmb();
         req->state = THREAD_DONE;
 
-        qemu_mutex_lock(&pool->lock);
-
         qemu_bh_schedule(pool->completion_bh);
+        qemu_mutex_lock(&pool->lock);
     }
 
     pool->cur_threads--;
-- 
2.36.1



