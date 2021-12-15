Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFFA4756F0
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 11:52:21 +0100 (CET)
Received: from localhost ([::1]:52226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxRtU-0002zw-JP
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 05:52:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mxRaj-0003LI-TR
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:32:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mxRai-0007MU-2h
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:32:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639564375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B4waSI4gV6dbjnmMNF5mGnkKzgxhUaslyVOMARJOIZ4=;
 b=FPGxm+tD6D/AdIiWCWXGCQyp5i2ica4Xy+rik9q2Hlt5ceY55A8Irod0KdeAHaAQZeP8YA
 fW9ZS0nc3YS5IEyJUcxaEzPNQ2eU63/6QhlVAIG8fAwex/G6zND+YBOgDv85R6bsddQ/pn
 yav9U4BqCt1+uk5cEWMzHfuDd+Rdh4o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-OAaH8pm5On6lRNEJz3JO-Q-1; Wed, 15 Dec 2021 05:32:54 -0500
X-MC-Unique: OAaH8pm5On6lRNEJz3JO-Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 256852F24;
 Wed, 15 Dec 2021 10:32:53 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BCFF76E978;
 Wed, 15 Dec 2021 10:32:51 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/18] multifd: Fill offset and block for reception
Date: Wed, 15 Dec 2021 11:32:14 +0100
Message-Id: <20211215103218.17527-15-quintela@redhat.com>
In-Reply-To: <20211215103218.17527-1-quintela@redhat.com>
References: <20211215103218.17527-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We were using the iov directly, but we will need this info on the
following patch.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/multifd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/migration/multifd.c b/migration/multifd.c
index 55d99a8232..0533da154a 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -354,6 +354,7 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
         return -1;
     }
 
+    p->pages->block = block;
     for (i = 0; i < p->pages->num; i++) {
         uint64_t offset = be64_to_cpu(packet->offset[i]);
 
@@ -363,6 +364,7 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
                        offset, block->used_length);
             return -1;
         }
+        p->pages->offset[i] = offset;
         p->pages->iov[i].iov_base = block->host + offset;
         p->pages->iov[i].iov_len = page_size;
     }
-- 
2.33.1


