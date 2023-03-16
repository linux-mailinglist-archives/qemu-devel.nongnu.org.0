Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AB16BD316
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 16:14:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcpHh-0001ay-1E; Thu, 16 Mar 2023 11:12:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pcpHT-0001RP-Bf
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 11:12:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pcpHR-0003Iu-TZ
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 11:12:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678979557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kJLO7E81w+2tfpouAoYTRxbBc1A1C7rZpQoVjfCfXsU=;
 b=CoCbH7Mftb2nHFJw5d3Vb5LMtJmmNlgVOP+SoMbcJxoMhC06ND1Csp3cW65l/fFzbuya7S
 740dUwhjeN2iiEVuupsa0N4WFmzayLkRhdjB+gmlHfnwluVWTacjwSfMukNj80m2VCYPdh
 Pf50bzGIgvFweWA9L8I73IvmlEL/If0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-yz-xIymoPIeiLy69eu7hFg-1; Thu, 16 Mar 2023 11:12:34 -0400
X-MC-Unique: yz-xIymoPIeiLy69eu7hFg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 995253815F73;
 Thu, 16 Mar 2023 15:12:33 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E14E1492B00;
 Thu, 16 Mar 2023 15:12:32 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Wei Wang <wei.w.wang@intel.com>
Subject: [PULL 6/7] migration/multifd: correct multifd_send_thread to trace
 the flags
Date: Thu, 16 Mar 2023 16:12:24 +0100
Message-Id: <20230316151225.11362-7-quintela@redhat.com>
In-Reply-To: <20230316151225.11362-1-quintela@redhat.com>
References: <20230316151225.11362-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

From: Wei Wang <wei.w.wang@intel.com>

The p->flags could be updated via the send_prepare callback, e.g. OR-ed
with MULTIFD_FLAG_ZLIB via zlib_send_prepare. Assign p->flags to the
local "flags" before the send_prepare callback could only get partial of
p->flags. Fix it by moving the assignment of p->flags to the local flags
after the callback, so that the correct flags can be traced.

Fixes: ab7cbb0b9a3b ("multifd: Make no compression operations into its own structure")
Signed-off-by: Wei Wang <wei.w.wang@intel.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 5e85c3ea9b..cbc0dfe39b 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -677,7 +677,7 @@ static void *multifd_send_thread(void *opaque)
 
         if (p->pending_job) {
             uint64_t packet_num = p->packet_num;
-            uint32_t flags = p->flags;
+            uint32_t flags;
             p->normal_num = 0;
 
             if (use_zero_copy_send) {
@@ -699,6 +699,7 @@ static void *multifd_send_thread(void *opaque)
                 }
             }
             multifd_send_fill_packet(p);
+            flags = p->flags;
             p->flags = 0;
             p->num_packets++;
             p->total_normal_pages += p->normal_num;
-- 
2.39.2


