Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6F832EF77
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 16:57:49 +0100 (CET)
Received: from localhost ([::1]:33008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lICpo-0005Ks-Sw
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 10:57:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lICnk-0003xb-1a
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:55:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lICng-0003Mi-00
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:55:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614959735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IaFiDsRsaw9F04tnYksuM1IXglGEgh73g4j2b2sSu60=;
 b=cLAr2/ylT5FZBTgmO6pWSfk7xFSYpxqOfloa6qG70M+PLpZNr+Rml+hUuifo6Co0h8mLgn
 a2BZuFSlPjBIYVH1U6Z672vDSSQbNRZL2PPY3mGjeaF5186l43GFs3CiDHWIGUt23XjtGy
 SzH68ea8bOWzRU2WudKF448vr7EPeQA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-FA8A0hkxMW2MtangpDBUMQ-1; Fri, 05 Mar 2021 10:55:32 -0500
X-MC-Unique: FA8A0hkxMW2MtangpDBUMQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 055951966323;
 Fri,  5 Mar 2021 15:55:31 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-112-55.ams2.redhat.com [10.36.112.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD934648A2;
 Fri,  5 Mar 2021 15:55:29 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 4/8] s390x/pci: restore missing Query PCI Function CLP data
Date: Fri,  5 Mar 2021 16:55:13 +0100
Message-Id: <20210305155517.1604547-5-cohuck@redhat.com>
In-Reply-To: <20210305155517.1604547-1-cohuck@redhat.com>
References: <20210305155517.1604547-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, Matthew Rosato <mjrosato@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matthew Rosato <mjrosato@linux.ibm.com>

Some CLP response data was accidentally dropped when fixing endianness
issues with the Query PCI Function CLP response.  All of these values are
sent as 0s to the guest for emulated devices, so the impact is only
observed on passthrough devices.

Fixes: a4e2fff1b104 ("s390x/pci: fix endianness issues")
Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
Message-Id: <1613681609-9349-1-git-send-email-mjrosato@linux.ibm.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/s390x/s390-pci-inst.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index 654fac6c0a5b..4b8326afa4f2 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -284,10 +284,15 @@ int clp_service_call(S390CPU *cpu, uint8_t r2, uintptr_t ra)
         stq_p(&resquery->sdma, pbdev->zpci_fn.sdma);
         stq_p(&resquery->edma, pbdev->zpci_fn.edma);
         stw_p(&resquery->pchid, pbdev->zpci_fn.pchid);
+        stw_p(&resquery->vfn, pbdev->zpci_fn.vfn);
         resquery->flags = pbdev->zpci_fn.flags;
         resquery->pfgid = pbdev->zpci_fn.pfgid;
+        resquery->pft = pbdev->zpci_fn.pft;
+        resquery->fmbl = pbdev->zpci_fn.fmbl;
         stl_p(&resquery->fid, pbdev->zpci_fn.fid);
         stl_p(&resquery->uid, pbdev->zpci_fn.uid);
+        memcpy(resquery->pfip, pbdev->zpci_fn.pfip, CLP_PFIP_NR_SEGMENTS);
+        memcpy(resquery->util_str, pbdev->zpci_fn.util_str, CLP_UTIL_STR_LEN);
 
         for (i = 0; i < PCI_BAR_COUNT; i++) {
             uint32_t data = pci_get_long(pbdev->pdev->config +
-- 
2.26.2


