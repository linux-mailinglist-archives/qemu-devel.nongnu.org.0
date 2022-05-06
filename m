Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BE151E057
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 22:51:17 +0200 (CEST)
Received: from localhost ([::1]:52360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn4uy-0006s4-73
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 16:51:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nn4ss-00046E-Lh
 for qemu-devel@nongnu.org; Fri, 06 May 2022 16:49:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nn4sr-0005uT-4x
 for qemu-devel@nongnu.org; Fri, 06 May 2022 16:49:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651870144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OhPhNKUuWjGB9qxlzssNTf/fRhjvC7K7fdcIvGqVQe8=;
 b=Heo8fakJSmLIoImVsU4sDYUnUL3QFnpaOaKFFXVCQhmZsxrSBIDegLvMj8va/q5LIubENM
 cJCy4jOQIEouNoBw7CLGs959dcwNPcaR48GrtPqwAgvkI7AW+T0YfvljaxizeOp4kq4Mr+
 q6aegBdWQZ7OFLQ+7WT+DUYVck7avf4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-GWTwkLp6MS2LSqdX8jfiAg-1; Fri, 06 May 2022 16:49:03 -0400
X-MC-Unique: GWTwkLp6MS2LSqdX8jfiAg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFE2D811E75;
 Fri,  6 May 2022 20:49:02 +0000 (UTC)
Received: from [172.30.41.16] (unknown [10.2.16.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A8192166B2D;
 Fri,  6 May 2022 20:48:55 +0000 (UTC)
Subject: [PULL 09/11] hw/vfio/pci: fix vfio_pci_hot_reset_result trace point
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>, Yi Liu <yi.l.liu@intel.com>
Date: Fri, 06 May 2022 14:48:55 -0600
Message-ID: <165187013241.4166595.5526182306764482522.stgit@omen>
In-Reply-To: <165186988363.4166595.3147442303200167674.stgit@omen>
References: <165186988363.4166595.3147442303200167674.stgit@omen>
User-Agent: StGit/1.0-8-g6af9-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Auger <eric.auger@redhat.com>

"%m" format specifier is not interpreted by the trace infrastructure
and thus "%m" is output instead of the actual errno string. Fix it by
outputting strerror(errno).

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
Link: https://lore.kernel.org/r/20220502094223.36384-2-yi.l.liu@intel.com
[aw: replace commit log as provided by Eric]
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/pci.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index ef9d7bf326de..cb912bd3f4b2 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2380,7 +2380,7 @@ static int vfio_pci_hot_reset(VFIOPCIDevice *vdev, bool single)
     g_free(reset);
 
     trace_vfio_pci_hot_reset_result(vdev->vbasedev.name,
-                                    ret ? "%m" : "Success");
+                                    ret ? strerror(errno) : "Success");
 
 out:
     /* Re-enable INTx on affected devices */



