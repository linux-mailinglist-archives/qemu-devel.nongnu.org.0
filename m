Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F4337AA92
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 17:23:23 +0200 (CEST)
Received: from localhost ([::1]:58702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgUEE-0005sw-KS
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 11:23:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lgU1T-0008OW-C9
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:10:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lgU1R-0004gq-GL
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:10:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620745808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i9HNFa3YZSZS9VVIJ5u+MfN+wq+MtWfjvAyhFk37GTA=;
 b=EgCHitkIQl6I8ah6YCqztJbB/Rsl8jIQQz9ig/05K1A1TVrXhORkQtkw/y6WmIAz3m2PET
 Fv38HAEdOU/vMC0LWoS7ugPR8+hrwVRsWNVCPiL4Xs1Q2rpMMJa6d33278jJbR1/Q4AGU0
 20hd84e4GtOG1Mye1WWj8VYlfXj08zQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-sfkPDa75PZSaCOziZWuMNg-1; Tue, 11 May 2021 11:10:04 -0400
X-MC-Unique: sfkPDa75PZSaCOziZWuMNg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DA611006C81;
 Tue, 11 May 2021 15:10:03 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-113-51.ams2.redhat.com
 [10.36.113.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 63C7E579B1;
 Tue, 11 May 2021 15:09:54 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, david@redhat.com, zhukeqian1@huawei.com,
 jiangkunkun@huawei.com, armbru@redhat.com, peter.maydell@linaro.org,
 huangy81@chinatelecom.cn
Subject: [PULL 13/17] migration/multifd: Print used_length of memory block
Date: Tue, 11 May 2021 16:08:38 +0100
Message-Id: <20210511150842.207155-14-dgilbert@redhat.com>
In-Reply-To: <20210511150842.207155-1-dgilbert@redhat.com>
References: <20210511150842.207155-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

We actually want to print the used_length, against which we check.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210429112708.12291-10-david@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
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
2.31.1


