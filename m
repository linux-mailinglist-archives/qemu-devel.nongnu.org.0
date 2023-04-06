Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D186D93B5
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 12:09:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkMXL-0005vo-Sl; Thu, 06 Apr 2023 06:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pkMXH-0005vS-In
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 06:08:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pkMXF-0006Ln-5v
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 06:08:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680775684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Xitcq6J1Wfwuna3Y2hnE6Uowk/aE/Q5WE7yuJGp2k4U=;
 b=fOJ+FqOqfpMv6vZMqcefVKJKK7AE4jxBRexV1ugBKHH965/6uYQQeZBODkZl8Xu3kpqe6E
 X4Wgs9kzUAvm5UqlYB8AZbOky/lmwsVm2DZKxaxPFzX2W6nV++C4HxgIuYm69hrJvXnzkV
 JoviHhHHX/OySATJ+ylkvkI6Sto1vfc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-412-fEg8qQm8Mlm2okVQdhAfcA-1; Thu, 06 Apr 2023 06:08:02 -0400
X-MC-Unique: fEg8qQm8Mlm2okVQdhAfcA-1
Received: by mail-ed1-f69.google.com with SMTP id
 c11-20020a509f8b000000b00501e2facf47so52695623edf.16
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 03:08:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680775681; x=1683367681;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xitcq6J1Wfwuna3Y2hnE6Uowk/aE/Q5WE7yuJGp2k4U=;
 b=APSuJJlDrNao0WdOorCykBGcBPiSOcWyhwbYFXu0Rq4FsuoLrroO6IQv/vQJvXvZX7
 9QiYPdyhjC3zEVtRXdLXsGOIUXOYT3xZ4V6IBzWHiMHG2jQrp7vxF91Y4MwmWwg0nAdO
 9i5OmIdPzbNdlxZrLpM39GEWean/Cfno2pWkD6Nw890P5KJ/Dg3jl2jLPHI3Ki4ibyne
 ZPzo8ax4xz9MhSKsxxF2JXm9y24aYkt3DHuEkFTN1+Jpm6gfhIgQ4xAL/EcpQSr+/UUl
 6+4P5HPGe3Ycxyttwj3qdecypfYuOANYlAth5hAfTcRGk/ys5ONLVtUzpa36JfWsFK3f
 Otsg==
X-Gm-Message-State: AAQBX9fWVg278HVrf5YB8Z3tHXhAx7P/HzuvaK5grHlmFMrI9z+Z/FCZ
 3selxPnDKRDAOpS0iaPcfkHnpDc+cDapM90WVLTeYNQjOXuayiphBJuM0lDdAZ0VB3LXF3ozOhz
 itKhQAcp4J/c+PEHIcEReD10KjhUSkvJmEeKe03QNnVmVOy6439MQ7xWWO0KBiukHag2zjeKKs5
 E=
X-Received: by 2002:a17:906:2cd5:b0:8b8:c06e:52d8 with SMTP id
 r21-20020a1709062cd500b008b8c06e52d8mr5509814ejr.36.1680775681267; 
 Thu, 06 Apr 2023 03:08:01 -0700 (PDT)
X-Google-Smtp-Source: AKy350b8WzpYVxzSnmtW4c7y9h+9l7FzMPxL8WZLKibJ/e1KCnagEVLDLY3cIsa/1nNDFo2tDrLvgA==
X-Received: by 2002:a17:906:2cd5:b0:8b8:c06e:52d8 with SMTP id
 r21-20020a1709062cd500b008b8c06e52d8mr5509796ejr.36.1680775680893; 
 Thu, 06 Apr 2023 03:08:00 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a17090668c700b009327ed171f2sm599494ejr.129.2023.04.06.03.07.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 03:08:00 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com
Subject: [PATCH for-8.1] qemu-coroutine: remove qatomic_mb_read()
Date: Thu,  6 Apr 2023 12:07:58 +0200
Message-Id: <20230406100759.240870-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
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

Replace with an explicit barrier and a comment.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-coroutine.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/util/qemu-coroutine.c b/util/qemu-coroutine.c
index 849452369201..17a88f65053e 100644
--- a/util/qemu-coroutine.c
+++ b/util/qemu-coroutine.c
@@ -127,9 +127,13 @@ void qemu_aio_coroutine_enter(AioContext *ctx, Coroutine *co)
         Coroutine *to = QSIMPLEQ_FIRST(&pending);
         CoroutineAction ret;
 
-        /* Cannot rely on the read barrier for to in aio_co_wake(), as there are
-         * callers outside of aio_co_wake() */
-        const char *scheduled = qatomic_mb_read(&to->scheduled);
+        /*
+         * Read to before to->scheduled; pairs with qatomic_cmpxchg in
+         * qemu_co_sleep(), aio_co_schedule() etc.
+         */
+        smp_read_barrier_depends();
+
+        const char *scheduled = qatomic_read(&to->scheduled);
 
         QSIMPLEQ_REMOVE_HEAD(&pending, co_queue_next);
 
-- 
2.39.2


