Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED624EE608
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 04:29:31 +0200 (CEST)
Received: from localhost ([::1]:50932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na72X-0004yz-PN
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 22:29:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1na71e-0004KH-0Q
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 22:28:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1na71b-000567-Vh
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 22:28:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648780111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eugiayE55MF6iO8DOTok7j2QntmtmWkVacMz0ErL3zI=;
 b=KBDOeEEgGfTojRA2tOpzIvEHYqFF4JCDAx+b7unPZaHxNJa7Kl+HLUu8tzll/Sh30wcnNB
 waMBy2AiGJETxvZy6xITfr9PTP1C8N/NLJ5BYsXT4nxrg59K7tMFVwCdcDSHeoVbeCVmu2
 e7BC/T2uCRLOAgXpIvrSB9xBJBvAMPY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-151-mEsXRCfDM72tSCq9ExWDxg-1; Thu, 31 Mar 2022 22:28:29 -0400
X-MC-Unique: mEsXRCfDM72tSCq9ExWDxg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B4782800173
 for <qemu-devel@nongnu.org>; Fri,  1 Apr 2022 02:28:29 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-216.pek2.redhat.com
 [10.72.13.216])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4571D401E67;
 Fri,  1 Apr 2022 02:28:26 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	peterx@redhat.com
Subject: [PATCH] intel-iommu: correct the value used for error_setg_errno()
Date: Fri,  1 Apr 2022 10:28:24 +0800
Message-Id: <20220401022824.9337-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: jasowang@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

error_setg_errno() expects a normal errno value, not a negated
one, so we should use ENOTSUP instead of -ENOSUP.

Fixes: Coverity CID 1487174
Fixes: ("intel_iommu: support snoop control")
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/i386/intel_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index c64aa81a83..e05d69a2c0 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -3032,7 +3032,7 @@ static int vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
 
     /* TODO: add support for VFIO and vhost users */
     if (s->snoop_control) {
-        error_setg_errno(errp, -ENOTSUP,
+        error_setg_errno(errp, ENOTSUP,
                          "Snoop Control with vhost or VFIO is not supported");
         return -ENOTSUP;
     }
-- 
2.25.1


