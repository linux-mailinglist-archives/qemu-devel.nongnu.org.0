Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 842D45EAFFF
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 20:35:18 +0200 (CEST)
Received: from localhost ([::1]:44858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocswn-0006em-9K
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 14:35:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ocrax-0005t6-Pu
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:08:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ocraw-0005az-0N
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:08:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664212117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9lPOAqZfg9rzjqPje7bAd5Cwg1uqVDVcDW6g9wQdaJo=;
 b=NiVoxaVN+teI9w2iaX7BuJ8Ct/VH/9I/EAAUa7QXNCsMfUI86nwpkpfuvXTx1T09LMBy0i
 n6Qc3UgVe4DkBjuzYQoBVKWrrWZ7B91vGXklFor6ErdLdwtVePgqEsyzU4baO1/iXvBdFo
 OB1zyPEhPpgxJxvRFpSqeYOHwZ837/Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-QNYdumNFMRqmiGgYO5Gy3g-1; Mon, 26 Sep 2022 13:08:36 -0400
X-MC-Unique: QNYdumNFMRqmiGgYO5Gy3g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA215380450C;
 Mon, 26 Sep 2022 17:08:35 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF44A140EBF5;
 Mon, 26 Sep 2022 17:08:33 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Pierre Morel <pmorel@linux.ibm.com>
Subject: [PULL 12/14] s390x/pci: reflect proper maxstbl for groups of
 interpreted devices
Date: Mon, 26 Sep 2022 19:08:02 +0200
Message-Id: <20220926170804.453855-13-thuth@redhat.com>
In-Reply-To: <20220926170804.453855-1-thuth@redhat.com>
References: <20220926170804.453855-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matthew Rosato <mjrosato@linux.ibm.com>

The maximum supported store block length might be different depending
on whether the instruction is interpretively executed (firmware-reported
maximum) or handled via userspace intercept (host kernel API maximum).
Choose the best available value during group creation.

Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>
Message-Id: <20220902172737.170349-8-mjrosato@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/s390x/s390-pci-vfio.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
index 338f436e87..2aefa508a0 100644
--- a/hw/s390x/s390-pci-vfio.c
+++ b/hw/s390x/s390-pci-vfio.c
@@ -213,7 +213,11 @@ static void s390_pci_read_group(S390PCIBusDevice *pbdev,
         resgrp->msia = cap->msi_addr;
         resgrp->mui = cap->mui;
         resgrp->i = cap->noi;
-        resgrp->maxstbl = cap->maxstbl;
+        if (pbdev->interp && hdr->version >= 2) {
+            resgrp->maxstbl = cap->imaxstbl;
+        } else {
+            resgrp->maxstbl = cap->maxstbl;
+        }
         resgrp->version = cap->version;
         resgrp->dtsm = ZPCI_DTSM;
     }
-- 
2.31.1


