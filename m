Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E25E37FCC5
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 19:48:18 +0200 (CEST)
Received: from localhost ([::1]:50986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhFRZ-0002Yl-4d
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 13:48:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lhFHY-0005F2-I0
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:37:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lhFHV-00015x-MB
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:37:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620927473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=itjEzLw2yCT5c7Y7df0J7BR6P6ss6ZSyBTaOr3G63VU=;
 b=Xmp7l6Fk57e2aQ1XKs6fgsHDvTiB/tGCHUdDxAHWPm5bhAG4kVapdnrWl8XaS6idMeQBXK
 krpfTsLA14XQlgcMstYNQ3AyfW/fpma9ewa/y/vJPmLm1UpMg6qL1xjLJ9DLbzs7vyM/Wg
 k2Fvx1a3CLV15fSVMMdmhTFxfTZYB3E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-1m5iYlA9NxO74X5NeXAK0g-1; Thu, 13 May 2021 13:37:50 -0400
X-MC-Unique: 1m5iYlA9NxO74X5NeXAK0g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D6C41927800;
 Thu, 13 May 2021 17:37:49 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-113-200.ams2.redhat.com
 [10.36.113.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA2B35D6AC;
 Thu, 13 May 2021 17:37:47 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, david@redhat.com, zhukeqian1@huawei.com,
 jiangkunkun@huawei.com, armbru@redhat.com, peter.maydell@linaro.org,
 huangy81@chinatelecom.cn
Subject: [PULL 02/17] migration/ram: Reduce unnecessary rate limiting
Date: Thu, 13 May 2021 18:37:22 +0100
Message-Id: <20210513173737.279402-3-dgilbert@redhat.com>
In-Reply-To: <20210513173737.279402-1-dgilbert@redhat.com>
References: <20210513173737.279402-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
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

From: Kunkun Jiang <jiangkunkun@huawei.com>

When the host page is a huge page and something is sent in the
current iteration, migration_rate_limit() should be executed.
If not, it can be omitted.

Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
Reviewed-by: David Edmondson <david.edmondson@oracle.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20210316125716.1243-2-jiangkunkun@huawei.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/ram.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index bee2756cd3..00b579b981 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2035,8 +2035,13 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
 
         pages += tmppages;
         pss->page++;
-        /* Allow rate limiting to happen in the middle of huge pages */
-        migration_rate_limit();
+        /*
+         * Allow rate limiting to happen in the middle of huge pages if
+         * something is sent in the current iteration.
+         */
+        if (pagesize_bits > 1 && tmppages > 0) {
+            migration_rate_limit();
+        }
     } while ((pss->page & (pagesize_bits - 1)) &&
              offset_in_ramblock(pss->block,
                                 ((ram_addr_t)pss->page) << TARGET_PAGE_BITS));
-- 
2.31.1


