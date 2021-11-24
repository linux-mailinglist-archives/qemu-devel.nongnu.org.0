Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 618DD45B85C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 11:28:26 +0100 (CET)
Received: from localhost ([::1]:48362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mppVp-0002Iw-Hp
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 05:28:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mppCc-0002rV-LT
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:08:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mppCa-0007D2-FW
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:08:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637748511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fWLu1gDUHJoczILbqPDLLwc9AxRBP9TW0JEGRBMzOFU=;
 b=CugBLEdxR3+PTc3ZmIVZI3tS6RrJIJ+WC+t/IFLfxwOCIQ02TpbD2+1Mg7/WLWPNO9l0Ur
 j1DjFh6J8P+MD8sifoo53XwAIQWK41e/F7bVh3vr9nnu1r3N/AJhuPxS7DGo8Q5NsdAiZ0
 wuxl3xlVAsu8FZETe6nCHN52KfZhV1o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-95-Pb8QUOV_OsmKP1493F7_eg-1; Wed, 24 Nov 2021 05:08:30 -0500
X-MC-Unique: Pb8QUOV_OsmKP1493F7_eg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4FA51023F4D
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 10:08:29 +0000 (UTC)
Received: from redhat.mitica.com (unknown [10.39.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ADA1F60843;
 Wed, 24 Nov 2021 10:08:00 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 20/23] multifd: Rename pages_used to normal_pages
Date: Wed, 24 Nov 2021 11:06:14 +0100
Message-Id: <20211124100617.19786-21-quintela@redhat.com>
In-Reply-To: <20211124100617.19786-1-quintela@redhat.com>
References: <20211124100617.19786-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Leonardo Bras <leobras@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd.h | 3 ++-
 migration/multifd.c | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index ab32baebd7..39e55d7f05 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -44,7 +44,8 @@ typedef struct {
     uint32_t flags;
     /* maximum number of allocated pages */
     uint32_t pages_alloc;
-    uint32_t pages_used;
+    /* non zero pages */
+    uint32_t normal_pages;
     /* size of the next packet that contains pages */
     uint32_t next_packet_size;
     uint64_t packet_num;
diff --git a/migration/multifd.c b/migration/multifd.c
index dc76322137..d1ab823f98 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -262,7 +262,7 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)
 
     packet->flags = cpu_to_be32(p->flags);
     packet->pages_alloc = cpu_to_be32(p->pages->allocated);
-    packet->pages_used = cpu_to_be32(p->normal_num);
+    packet->normal_pages = cpu_to_be32(p->normal_num);
     packet->next_packet_size = cpu_to_be32(p->next_packet_size);
     packet->packet_num = cpu_to_be64(p->packet_num);
 
@@ -316,7 +316,7 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
         return -1;
     }
 
-    p->normal_num = be32_to_cpu(packet->pages_used);
+    p->normal_num = be32_to_cpu(packet->normal_pages);
     if (p->normal_num > packet->pages_alloc) {
         error_setg(errp, "multifd: received packet "
                    "with %d pages and expected maximum pages are %d",
-- 
2.33.1


