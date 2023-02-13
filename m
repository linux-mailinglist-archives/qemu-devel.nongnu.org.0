Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BD1694038
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 09:59:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRUeu-0000OV-Ab; Mon, 13 Feb 2023 03:58:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pRUeq-0000O1-Rv
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 03:57:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pRUep-0002rd-DY
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 03:57:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676278674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=826zd0O7d2WRwLdAeNQrO2BCJWaXFymU9+RS+HRc/0Y=;
 b=A4VQRVdvBCSYgtvXpZjeCJOrCgFK7CoU6F2JUexsXbwis19+kQTZUXIXMizYliNTGpi6HW
 sDpbgEA10x33JLGY1W2F4YSLM3Tv4n7GGFt8cS+zTg28uxWRMGn/2G5bVWW9lYYH+4F4qO
 F9nMWUcASjBN5q70kx9fx+WP2glIYAA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-602-QWgKsFpWMJSOxk588oOHCQ-1; Mon, 13 Feb 2023 03:57:53 -0500
X-MC-Unique: QWgKsFpWMJSOxk588oOHCQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 v5-20020adf8b45000000b002bde0366b11so2179738wra.7
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 00:57:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=826zd0O7d2WRwLdAeNQrO2BCJWaXFymU9+RS+HRc/0Y=;
 b=s+8NpAjIEHpgzS7rN2KXJMwG7nortDT4S3GBREUENzI4DM5EfdmPDAJWlZdLEuUqJi
 If51s6dsUGhauU97SgVuos0FZhjdTa9R7rQNylbnpR2zN+eqHjy3hl1R3unmk7l8gpQ0
 l2I0sq78tS7Z4xp54tlGD3KcxVFHjsdPkZXH7kJGL5Vyl2enlsBS22mJfTHxUBotcpkV
 IUV6edEF4IA1c/I69Hdb6Vft+2Dif5mF518kkWpIY006RL/A2E/9n6zSwPhg5eFgW4pm
 5KZCMthu1+FvoXHnffJV4mereOVI84l70p5X4IUgAxlAovKl+KaZuiF16sn3D43MOR7w
 1hgg==
X-Gm-Message-State: AO0yUKW5Ju3O2TPGk92MHduWImYsxuA2IclexG9uuhiDg53l2OL347Qp
 QgkCJePztCe5f+3ur4kQxvs0yETvIfOiUvbzuvMjt8wD1Y5Gp0qToBsr7rc7Vw8VoxPqrnn49d0
 SdZU03pS8KJs+/IBeU3JuRYOAzEGmIkQYGYefp4N6DzR2/xiByz5aTFXCwQsWoXffZ7njBJSjy1
 o=
X-Received: by 2002:a5d:5646:0:b0:2bf:f4f7:be9c with SMTP id
 j6-20020a5d5646000000b002bff4f7be9cmr20412180wrw.14.1676278671757; 
 Mon, 13 Feb 2023 00:57:51 -0800 (PST)
X-Google-Smtp-Source: AK7set+37IlLnII1ykRALYVOZpigWoP+p5BIZV4xSEgNgtS/ZZvls2iMmYYe2w6PicwglDPz35+kJQ==
X-Received: by 2002:a5d:5646:0:b0:2bf:f4f7:be9c with SMTP id
 j6-20020a5d5646000000b002bff4f7be9cmr20412158wrw.14.1676278671482; 
 Mon, 13 Feb 2023 00:57:51 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 a1-20020adff7c1000000b002c54a2037d1sm7834869wrq.75.2023.02.13.00.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 00:57:50 -0800 (PST)
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
Subject: [PATCH v5 2/8] migration/multifd: Remove unnecessary assignment on
 multifd_load_cleanup()
Date: Mon, 13 Feb 2023 09:57:40 +0100
Message-Id: <20230213085746.75586-3-quintela@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213085746.75586-1-quintela@redhat.com>
References: <20230213085746.75586-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

Before assigning "p->quit = true" for every multifd channel,
multifd_load_cleanup() will call multifd_recv_terminate_threads() which
already does the same assignment, while protected by a mutex.

So there is no point doing the same assignment again.

Fixes: b5eea99ec2 ("migration: Add yank feature")
Reported-by: Li Xiaohui <xiaohli@redhat.com>
Signed-off-by: Leonardo Bras <leobras@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index cac8496edc..3dd569d0c9 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -1025,7 +1025,6 @@ void multifd_load_cleanup(void)
         MultiFDRecvParams *p = &multifd_recv_state->params[i];
 
         if (p->running) {
-            p->quit = true;
             /*
              * multifd_recv_thread may hung at MULTIFD_FLAG_SYNC handle code,
              * however try to wakeup it without harm in cleanup phase.
-- 
2.39.1


