Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6219C423086
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 21:05:53 +0200 (CEST)
Received: from localhost ([::1]:33170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXplA-0004Nb-FS
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 15:05:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mXpdr-0003vA-AD
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 14:58:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mXpdo-0004Z3-Cu
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 14:58:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633460295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+W7Y6rnsDDZf/ETt0uqjFCnv3qWeNLJXTQ9FgIMtpVs=;
 b=LuWTkjx8hm+188Y2/v/zZjjdsO1fkVRxbcfXzCsOx/pO87Q/WgnV0loOdyUs6FfCt8DGLt
 U5X2aV6hWBBPv/V+xsdpGAkjgXS4N1W/ZJImtYS6WYz276j+ORlOygWKDRbAVSV+uhkR2u
 +/oeBRgtY6YvK5Q04gUQ0R5iwbwGRY4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-aD_lphQpNiCGc2pVOkIvNQ-1; Tue, 05 Oct 2021 14:58:14 -0400
X-MC-Unique: aD_lphQpNiCGc2pVOkIvNQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 x14-20020a5d60ce000000b00160b27b5fd1so77041wrt.5
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 11:58:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+W7Y6rnsDDZf/ETt0uqjFCnv3qWeNLJXTQ9FgIMtpVs=;
 b=K/KHpOaHpVjZRfI9/uvqSprF1Yq63FsegxRzcQH/C6PDaodQB/ho8n+jERYyuEcljJ
 ZAq8O+mpMvODSddjKMr5eKi4f6wqHRb0GZNOSxCKBgxBTL6SfF9mJAKLd67Ar/2Pmj8j
 pLNeIHRpD+FaAsN3iIv+voFG+1zQu4XYAMOs+9j2I8sAK8FvAAwugEnMY2QoeKbVkd1O
 HK+1nEBUrkSagsB70UZpLeA5OOc1Z8A6+FaWelAdzSeCSzbILOmXXjbEMLM/dy5/gjZH
 5ZcX7X4bJBFB4WtQ8wTGeCSOKS2kArHCHuDM5Z+3IiX6kPKE/9p6b8pe6JJkupnaIE2q
 HrwQ==
X-Gm-Message-State: AOAM530wl0L5JdKSlzbZgxwgmDIrIrqJvDDxzqWHfOtv0OPZN+B1LsbF
 b4yg355X9zFMjRxa6q3qFjDbAQ11rBdZv5/hOUpse12JPE55PFPbXXge24FU7wpBe6i7Lm1WtFV
 Wa6+cOiUFvqeStvEimFKc3w79xRWVNG3MDt/m8bCWu25us2DVyHLozT/hxIsLn9y6
X-Received: by 2002:a7b:c954:: with SMTP id i20mr5325384wml.126.1633460293311; 
 Tue, 05 Oct 2021 11:58:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwidVFBmid0TDIDnJBkgBPtHJbHDrccdTXyE39Dq8J28z1hKYZoZJx3yeUgSE41KAWAMMDktg==
X-Received: by 2002:a7b:c954:: with SMTP id i20mr5325359wml.126.1633460293104; 
 Tue, 05 Oct 2021 11:58:13 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id e14sm8762358wrw.33.2021.10.05.11.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 11:58:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 1/4] block/aio: Add automatically released aio_context
 variants
Date: Tue,  5 Oct 2021 20:58:04 +0200
Message-Id: <20211005185807.4134557-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211005185807.4134557-1-philmd@redhat.com>
References: <20211005185807.4134557-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.066, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similarly to commit 5626f8c6d46 ("rcu: Add automatically
released rcu_read_lock variants"):

AIO_CONTEXT_ACQUIRE_GUARD() acquires the aio context and then uses
glib's g_auto infrastructure (and thus whatever the compiler's hooks
are) to release it on all exits of the block.

WITH_AIO_CONTEXT_ACQUIRE_GUARD() is similar but is used as a wrapper
for the lock, i.e.:

   WITH_AIO_CONTEXT_ACQUIRE_GUARD() {
       stuff with context acquired
   }

Inspired-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/block/aio.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/include/block/aio.h b/include/block/aio.h
index 47fbe9d81f2..4fa5a5c2720 100644
--- a/include/block/aio.h
+++ b/include/block/aio.h
@@ -294,6 +294,30 @@ void aio_context_acquire(AioContext *ctx);
 /* Relinquish ownership of the AioContext. */
 void aio_context_release(AioContext *ctx);
 
+static inline AioContext *aio_context_auto_acquire(AioContext *ctx)
+{
+    aio_context_acquire(ctx);
+    return ctx;
+}
+
+static inline void aio_context_auto_release(AioContext *ctx)
+{
+    aio_context_release(ctx);
+}
+
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(AioContext, aio_context_auto_release)
+
+#define WITH_AIO_CONTEXT_ACQUIRE_GUARD(ctx) \
+    WITH_AIO_CONTEXT_ACQUIRE_GUARD_(glue(_aio_context_auto, __COUNTER__), ctx)
+
+#define WITH_AIO_CONTEXT_ACQUIRE_GUARD_(var, ctx) \
+    for (g_autoptr(AioContext) var = aio_context_auto_acquire(ctx); \
+        (var); aio_context_auto_release(var), (var) = NULL)
+
+#define AIO_CONTEXT_ACQUIRE_GUARD(ctx) \
+    g_autoptr(AioContext) _aio_context_auto __attribute__((unused)) \
+        = aio_context_auto_acquire(ctx)
+
 /**
  * aio_bh_schedule_oneshot_full: Allocate a new bottom half structure that will
  * run only once and as soon as possible.
-- 
2.31.1


