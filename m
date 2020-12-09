Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C2E2D4717
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 17:48:14 +0100 (CET)
Received: from localhost ([::1]:51142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn2dP-00041V-O9
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 11:48:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kn2aF-0002kS-Kr
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 11:44:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kn2aC-0003IU-7W
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 11:44:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607532291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LjARZZQ93Yi2jO25c2MoH/1rJ5AGJI/lx7Ttbk0VCHA=;
 b=i1hnYruppKArH81Sd6HLBYzNyx60K8HLZEWbFbnxZ3pq/100W22NgIJzikm1/I9Ax/DK/Q
 wEZFLJcQNlJ0HEviv68MgzJTigyftlWrs3LoJgq51Cl62a8nqunJrColCfc0NjEtO2hVAO
 e59W7DQDUE/JslkK1PsxmVIdr2THFtM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-CAOij9UKOt2BMGcV1S5-2w-1; Wed, 09 Dec 2020 11:44:48 -0500
X-MC-Unique: CAOij9UKOt2BMGcV1S5-2w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E7661005504;
 Wed,  9 Dec 2020 16:44:47 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 546BD63B8C;
 Wed,  9 Dec 2020 16:44:45 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/4] crypto: luks: Fix tiny memory leak
Date: Wed,  9 Dec 2020 18:44:38 +0200
Message-Id: <20201209164441.867945-2-mlevitsk@redhat.com>
In-Reply-To: <20201209164441.867945-1-mlevitsk@redhat.com>
References: <20201209164441.867945-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the underlying block device doesn't support the
bdrv_co_delete_file interface, an 'Error' object was leaked.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
---
 block/crypto.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/block/crypto.c b/block/crypto.c
index aef5a5721a..b3a5275132 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -735,6 +735,8 @@ fail:
          */
         if ((r_del < 0) && (r_del != -ENOTSUP)) {
             error_report_err(local_delete_err);
+        } else {
+            error_free(local_delete_err);
         }
     }
 
-- 
2.26.2


