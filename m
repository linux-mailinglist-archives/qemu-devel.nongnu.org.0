Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1C0693C89
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 03:53:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pROxE-0002Hm-LL; Sun, 12 Feb 2023 21:52:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROxD-0002H3-JW
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:52:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROxC-0006wU-5u
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:52:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676256749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aku3Smvsd7foub2ZcjYodstE9WWFFvGfDbRG9BvKPnM=;
 b=VJ1eXcyL/QEKiI4IAviGrkNbvKJ9DLSFs3hQcZnomTdGxxwmus4Td00ceqcNljRd7LAdqP
 PCwECCLK/GxUVwDQYji/1sMDY85OVacOEJNmqH9gvUrAIgHDgMBPlHwONxgpxAbYH8VyxT
 EoeIxjkp6SThD8GVRP7xzjy6wSir5pw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-478-aFAZzmkNMmaKJE6tWKg7nA-1; Sun, 12 Feb 2023 21:52:28 -0500
X-MC-Unique: aFAZzmkNMmaKJE6tWKg7nA-1
Received: by mail-wm1-f70.google.com with SMTP id
 fl9-20020a05600c0b8900b003dfe4bae099so6075832wmb.0
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 18:52:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aku3Smvsd7foub2ZcjYodstE9WWFFvGfDbRG9BvKPnM=;
 b=PUvIzJIBRDLVjIyjpIGcuxwUig10NkJarKPKX7TfeR5FbppaHtyQlHmJ9saUU3gYn4
 XnsuXSvpXgysgZE+OH0IAoPIa+E7yX8YYeHK2lLKYXnMFO3/XCMj5M+d8lKDHMFmmSOH
 dxuYr3GmyE3EYb5DhpCFjgOseGjKfkri+6mlRf9VAEa9RcGiSu9zscv2xQpzbYFlkwma
 NdV63IMFhdMIwqKTZwk2gxMXP9H66GYMWa9cTffbRA2/EPF4G80MtGvViNjpESopIkOP
 wP8iua/RjpKjJmle6OUifHb5WuVRpcsbk+YVQdZtoKyAJMDzYYonuvYK7a2mxFTY2cqp
 dmIQ==
X-Gm-Message-State: AO0yUKXiJb/sY25d29HhZer2Mn/C3O1q/RtMndee4bTwSi4hSWBa+VE6
 FU6JfipLvJHwf9p0ZW8GNHUx9JSaSddu/BHzQIXpO7d61O7aeQMi+3bbpZhCunpdLI9KDIpB60E
 2B/lV9dgTfwhTgAsTh6aYcvCuG9kSTK2ekdIrcyOkHvh70JW6TFeWmhezbgSWeua57tFU+gTK
X-Received: by 2002:a1c:545e:0:b0:3df:9858:c03f with SMTP id
 p30-20020a1c545e000000b003df9858c03fmr4483883wmi.20.1676256746908; 
 Sun, 12 Feb 2023 18:52:26 -0800 (PST)
X-Google-Smtp-Source: AK7set+S3+gDNfnn+jOTzy9l1YpKX33WuB9LJ3aeiZkM4Qf3sBxd+W06a96lPgLIX4LtF7uwJNMqAQ==
X-Received: by 2002:a1c:545e:0:b0:3df:9858:c03f with SMTP id
 p30-20020a1c545e000000b003df9858c03fmr4483863wmi.20.1676256746658; 
 Sun, 12 Feb 2023 18:52:26 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 k21-20020a05600c1c9500b003dd1c45a7b0sm13099849wms.23.2023.02.12.18.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 18:52:26 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Li Xiaohui <xiaohli@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: [PULL 20/22] migration/multifd: Join all multifd threads in order to
 avoid leaks
Date: Mon, 13 Feb 2023 03:51:48 +0100
Message-Id: <20230213025150.71537-21-quintela@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213025150.71537-1-quintela@redhat.com>
References: <20230213025150.71537-1-quintela@redhat.com>
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


