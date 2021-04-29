Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9928436E9BA
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 13:44:50 +0200 (CEST)
Received: from localhost ([::1]:46454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc569-0001K4-OB
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 07:44:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lc4qx-0000jB-1d
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 07:29:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lc4qm-000444-Ar
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 07:29:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619695735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kAwwnZs2To7cMUKg45elufUxRzYsBFQyMnkBZTeGzJY=;
 b=L4frkaGfceM1Vxt3nKexudaX66qq/+gRwO1cOiQsB9kHCswmT4X8M01z6BJxgZoTucjSsh
 GtTpsNXjswtBSV8P+vAjeNU0+rk5jFnllN5EnIypJrth/2Nn8Rim4o7mWIAfGzMbShXIoI
 QzGAQgTIIphDss3isQua7hfIFQrfhQU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-G6h8zzf4OHCfHwnZMwzXAQ-1; Thu, 29 Apr 2021 07:28:53 -0400
X-MC-Unique: G6h8zzf4OHCfHwnZMwzXAQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D3C3107ACE3;
 Thu, 29 Apr 2021 11:28:52 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-50.ams2.redhat.com [10.36.114.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 48A6467CC4;
 Thu, 29 Apr 2021 11:28:46 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 09/10] migration/multifd: Print used_length of memory block
Date: Thu, 29 Apr 2021 13:27:07 +0200
Message-Id: <20210429112708.12291-10-david@redhat.com>
In-Reply-To: <20210429112708.12291-1-david@redhat.com>
References: <20210429112708.12291-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We actually want to print the used_length, against which we check.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 migration/multifd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index a6677c45c8..0a4803cfcc 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -361,7 +361,7 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
         if (offset > (block->used_length - qemu_target_page_size())) {
             error_setg(errp, "multifd: offset too long %" PRIu64
                        " (max " RAM_ADDR_FMT ")",
-                       offset, block->max_length);
+                       offset, block->used_length);
             return -1;
         }
         p->pages->iov[i].iov_base = block->host + offset;
-- 
2.30.2


