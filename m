Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2799F694036
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 09:59:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRUew-0000PU-Te; Mon, 13 Feb 2023 03:58:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pRUev-0000PC-HI
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 03:58:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pRUes-0002sn-Rd
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 03:58:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676278678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aku3Smvsd7foub2ZcjYodstE9WWFFvGfDbRG9BvKPnM=;
 b=Mz6YBv4uyKpBbJXSNrfJARer32RDwXRPDMMwhQPDy2goxyZjL294LYopDdOsRduwhyD5pM
 p3ZuG2sbVHLTB7UaYzMplzudx/nSUAFUeVG18o1jl/bYoEXeayoc1S3e4eEL0k/YHbOxl+
 cX7n5Hzq6Xrmzm8EFLxb2fXvKWr/DOg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-119-eNDc7PJrNiy97BU9_JlOLg-1; Mon, 13 Feb 2023 03:57:54 -0500
X-MC-Unique: eNDc7PJrNiy97BU9_JlOLg-1
Received: by mail-wr1-f71.google.com with SMTP id
 i9-20020a0560001ac900b002bfda39265aso2203228wry.13
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 00:57:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aku3Smvsd7foub2ZcjYodstE9WWFFvGfDbRG9BvKPnM=;
 b=LmvZGAAfSzw8E8IAnVQe0fgp0QYYgwekohqDNRPZk4E7psWWGVmUJFdIZZOLhhtrFz
 AQ9CL0XXIZRqKs4JoBbB1+JknZWhYrDSqTGuUWTHmjrVBOtyDf9u9wDI6EbTHwhMum4k
 zPQZlK4xqDPmQi+B5iFytblsMicaSzav4VLPYBfhLIKr/88O+L4bWiWwa87SbuC03/ji
 4Bc7hXAUZfBoT4FJA8ye5x2hNnAWWnVrWguNrK1XUokZVGIPp4pIOkO/fOoy0kzHSr6R
 2+5ugMOyHvIzaoyNVAKy3AfWy3hJ+dbtXUdy5shkEyoVTuNZw4vq12IPJiCDilZY99vT
 1qcw==
X-Gm-Message-State: AO0yUKUGlniRKecRLV1VZfJ/S48JA/YfFFFcScNKhoBG5C+taMUg8gRR
 PaLxcqHN6bCOHazPt0PVswRH1CH1qgStOeOlEo/KEo24rk18O3JXCvq9T52rF1QHgvfjLZo+eqd
 SwvQ+v282cUL1pJpDtXrKho7B3AQ+pJEa2qUOXEQCOcPJyKmd1oLJT04Ph75ZQKxrlj8sFPM/la
 0=
X-Received: by 2002:a5d:6707:0:b0:2c3:db5c:55c with SMTP id
 o7-20020a5d6707000000b002c3db5c055cmr18739918wru.2.1676278673341; 
 Mon, 13 Feb 2023 00:57:53 -0800 (PST)
X-Google-Smtp-Source: AK7set9UUbtPkftD5+GvCNFCySAjJDSckQUfbt9uZjuo/GTd7CY6vi3Kj8LIgQA4BDncOcNFLHQIEQ==
X-Received: by 2002:a5d:6707:0:b0:2c3:db5c:55c with SMTP id
 o7-20020a5d6707000000b002c3db5c055cmr18739895wru.2.1676278673025; 
 Mon, 13 Feb 2023 00:57:53 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 k2-20020a5d6d42000000b002c4061a687bsm10113885wri.31.2023.02.13.00.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 00:57:52 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Leonardo Bras <leobras@redhat.com>, Li Xiaohui <xiaohli@redhat.com>,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH v5 3/8] migration/multifd: Join all multifd threads in order
 to avoid leaks
Date: Mon, 13 Feb 2023 09:57:41 +0100
Message-Id: <20230213085746.75586-4-quintela@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213085746.75586-1-quintela@redhat.com>
References: <20230213085746.75586-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

From: Leonardo Bras <leobras@redhat.com>

Current approach will only join threads that are still running.

For the threads not joined, resources or private memory are always kept in
the process space and never reclaimed before process end, and this risks
serious memory leaks.

This should usually not represent a big problem, since multifd migration
is usually just ran at most a few times, and after it succeeds there is
not much to be done before exiting the process.

Yet still, it should not hurt performance to join all of them.

Fixes: b5eea99ec2 ("migration: Add yank feature")
Reported-by: Li Xiaohui <xiaohli@redhat.com>
Signed-off-by: Leonardo Bras <leobras@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 3dd569d0c9..840d5814e4 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -1030,8 +1030,9 @@ void multifd_load_cleanup(void)
              * however try to wakeup it without harm in cleanup phase.
              */
             qemu_sem_post(&p->sem_sync);
-            qemu_thread_join(&p->thread);
         }
+
+        qemu_thread_join(&p->thread);
     }
     for (i = 0; i < migrate_multifd_channels(); i++) {
         MultiFDRecvParams *p = &multifd_recv_state->params[i];
-- 
2.39.1


