Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF0D313D33
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 19:23:32 +0100 (CET)
Received: from localhost ([::1]:40688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9BC3-0001Ss-O7
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 13:23:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l94lH-00028g-9f
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:31:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l94lD-0002cq-8W
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:31:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612783878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7YabO/CEY+7XD5lg6JCMp9Vam8xUVPB2mzdlOxK1GAQ=;
 b=Un/4VM4dAPvLn+ro1O2rbsCsNmBeQfAI/RTQyUteXTqEgqYqzzjkRtQxbduKElKiUFI2pS
 gnE5gt+cDsF5tiZHdLw4sKoMgOnO4+GVxbMtTFbvYXSQh1KBiIdUfntNcxbJp761hErY5E
 ZlrWIKE+9EfJWBVE2gC+I6kj/GrRvN4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-tbwrQwjeOnGTGVckTGlDSg-1; Mon, 08 Feb 2021 06:31:16 -0500
X-MC-Unique: tbwrQwjeOnGTGVckTGlDSg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE7081020C20;
 Mon,  8 Feb 2021 11:31:14 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-22.ams2.redhat.com
 [10.36.115.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E47341002388;
 Mon,  8 Feb 2021 11:31:09 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, andrey.gruzdev@virtuozzo.com, berrange@redhat.com,
 gaojinhao@huawei.com, armbru@redhat.com, mst@redhat.com, philmd@redhat.com,
 wainersm@redhat.com, s.reiter@proxmox.com
Subject: [PULL 27/27] migration: only check page size match if RAM postcopy is
 enabled
Date: Mon,  8 Feb 2021 11:29:18 +0000
Message-Id: <20210208112918.185058-28-dgilbert@redhat.com>
In-Reply-To: <20210208112918.185058-1-dgilbert@redhat.com>
References: <20210208112918.185058-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Reiter <s.reiter@proxmox.com>

Postcopy may also be advised for dirty-bitmap migration only, in which
case the remote page size will not be available and we'll instead read
bogus data, blocking migration with a mismatch error if the VM uses
hugepages.

Fixes: 58110f0acb ("migration: split common postcopy out of ram postcopy")
Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
Message-Id: <20210204163522.13291-1-s.reiter@proxmox.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/ram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/ram.c b/migration/ram.c
index 46e9d4d145..72143da0ac 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3808,7 +3808,7 @@ static int ram_load_precopy(QEMUFile *f)
                         }
                     }
                     /* For postcopy we need to check hugepage sizes match */
-                    if (postcopy_advised &&
+                    if (postcopy_advised && migrate_postcopy_ram() &&
                         block->page_size != qemu_host_page_size) {
                         uint64_t remote_page_size = qemu_get_be64(f);
                         if (remote_page_size != block->page_size) {
-- 
2.29.2


