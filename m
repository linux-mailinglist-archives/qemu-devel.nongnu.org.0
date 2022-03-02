Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C6C4CADA9
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 19:35:28 +0100 (CET)
Received: from localhost ([::1]:48940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPTot-0000HL-Ro
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 13:35:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPTkN-0001A0-P0
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:30:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPTkL-0000H1-T8
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:30:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646245845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tc4udTrpSuesJc2oRGnDMPkB/bGr2BLtznUnOJNu+lc=;
 b=eQ/LSTxGgX/WQ1zhe07cYuYWX3JkCI6IRz5QFBacRGzBiVqD4F9dEehpSDFm7s4C3UvUjg
 LswGv8xWD9Jhy0ZeGgQTKhlkPmb+NO3B2oI8qspXd95XAi1+XPSDSZfkD4OdMVW4lGfGid
 xXupCAyI8Oa+YaYQ72x0gT2te0s8/8U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-345-cStrEprUOO2iKlzSH2J1ng-1; Wed, 02 Mar 2022 13:30:42 -0500
X-MC-Unique: cStrEprUOO2iKlzSH2J1ng-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D15684A5F7;
 Wed,  2 Mar 2022 18:30:41 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F0491059166;
 Wed,  2 Mar 2022 18:30:39 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, f.ebner@proxmox.com, hreitz@redhat.com,
 jinpu.wang@ionos.com, peter.maydell@linaro.org, peterx@redhat.com,
 s.reiter@proxmox.com
Subject: [PULL 06/18] migration/rdma: set the REUSEADDR option for destination
Date: Wed,  2 Mar 2022 18:29:24 +0000
Message-Id: <20220302182936.227719-7-dgilbert@redhat.com>
In-Reply-To: <20220302182936.227719-1-dgilbert@redhat.com>
References: <20220302182936.227719-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jack Wang <jinpu.wang@ionos.com>

We hit following error during testing RDMA transport:
in case of migration error, mgmt daemon pick one migration port,
incoming rdma:[::]:8089: RDMA ERROR: Error: could not rdma_bind_addr

Then try another -incoming rdma:[::]:8103, sometime it worked,
sometimes need another try with other ports number.

Set the REUSEADDR option for destination, This allow address could
be reused to avoid rdma_bind_addr error out.

Signed-off-by: Jack Wang <jinpu.wang@ionos.com>
Message-Id: <20220208085640.19702-1-jinpu.wang@ionos.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
  dgilbert: Fixed up some tabs
---
 migration/rdma.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/migration/rdma.c b/migration/rdma.c
index c7c7a38487..ef1e65ec36 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -2705,6 +2705,7 @@ static int qemu_rdma_dest_init(RDMAContext *rdma, Error **errp)
     char ip[40] = "unknown";
     struct rdma_addrinfo *res, *e;
     char port_str[16];
+    int reuse = 1;
 
     for (idx = 0; idx < RDMA_WRID_MAX; idx++) {
         rdma->wr_data[idx].control_len = 0;
@@ -2740,6 +2741,12 @@ static int qemu_rdma_dest_init(RDMAContext *rdma, Error **errp)
         goto err_dest_init_bind_addr;
     }
 
+    ret = rdma_set_option(listen_id, RDMA_OPTION_ID, RDMA_OPTION_ID_REUSEADDR,
+                          &reuse, sizeof reuse);
+    if (ret) {
+        ERROR(errp, "Error: could not set REUSEADDR option");
+        goto err_dest_init_bind_addr;
+    }
     for (e = res; e != NULL; e = e->ai_next) {
         inet_ntop(e->ai_family,
             &((struct sockaddr_in *) e->ai_dst_addr)->sin_addr, ip, sizeof ip);
-- 
2.35.1


