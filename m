Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD16854CC4B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 17:13:44 +0200 (CEST)
Received: from localhost ([::1]:50568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1UiF-00024S-Ud
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 11:13:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UOY-0007IA-Eo
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:53:24 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:44196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UOW-00013a-Rr
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:53:22 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25FE6ttO002488;
 Wed, 15 Jun 2022 14:52:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2021-07-09;
 bh=xHkvHEipDJ5d9aid8thw4P4U+q++R/wD7aoWuop3g+c=;
 b=bylSyhrVfTRf09gJgSp71pcYrSdUtT18Nqs1YBsId/rS7UuVzcZYS3Hh4jzx16rqTR3f
 PZd7wLymbMxiVKdi4mPOqJ+d4LW/Sx+ew4Yg+CsaiavNHUt/ZvCNVHfIj2bWYry3if/O
 roq0JfG4/pHOXfueerTrG1jbFg9b2Ph8cSpkZTAZX+IuPmaYhyDHGFxu8wl/MGkmbuGr
 +MD+INVItxj5AgWaQxOXO35sSRlCsI23ZU1ojwTRrgi97ZaXPUOAzZt94x5BSapdYAvb
 xQ9zgUWJDAQnoKy2vdd50GoWaJeM/aUA2oLqAHMXgI7lcwN1wc4E3KnboADb6uax8Cjh Vg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmhfcrsk4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:52:58 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25FEQ7CF023114; Wed, 15 Jun 2022 14:52:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpx4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:52:57 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 25FEqSNV018501;
 Wed, 15 Jun 2022 14:52:57 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpfm-25; Wed, 15 Jun 2022 14:52:56 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>, 
 Igor Mammedov <imammedo@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>
Subject: [PATCH V8 24/39] pci: export export msix_is_pending
Date: Wed, 15 Jun 2022 07:52:11 -0700
Message-Id: <1655304746-102776-25-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-ORIG-GUID: 3ONCUe6pdFv0v4Eku8NcLI-QjS-xYkJy
X-Proofpoint-GUID: 3ONCUe6pdFv0v4Eku8NcLI-QjS-xYkJy
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Export msix_is_pending for use by cpr.  No functional change.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hw/pci/msix.c         | 2 +-
 include/hw/pci/msix.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/pci/msix.c b/hw/pci/msix.c
index ae9331c..e492ce0 100644
--- a/hw/pci/msix.c
+++ b/hw/pci/msix.c
@@ -64,7 +64,7 @@ static uint8_t *msix_pending_byte(PCIDevice *dev, int vector)
     return dev->msix_pba + vector / 8;
 }
 
-static int msix_is_pending(PCIDevice *dev, int vector)
+int msix_is_pending(PCIDevice *dev, unsigned int vector)
 {
     return *msix_pending_byte(dev, vector) & msix_pending_mask(vector);
 }
diff --git a/include/hw/pci/msix.h b/include/hw/pci/msix.h
index 4c4a60c..0065354 100644
--- a/include/hw/pci/msix.h
+++ b/include/hw/pci/msix.h
@@ -32,6 +32,7 @@ int msix_present(PCIDevice *dev);
 bool msix_is_masked(PCIDevice *dev, unsigned vector);
 void msix_set_pending(PCIDevice *dev, unsigned vector);
 void msix_clr_pending(PCIDevice *dev, int vector);
+int msix_is_pending(PCIDevice *dev, unsigned vector);
 
 int msix_vector_use(PCIDevice *dev, unsigned vector);
 void msix_vector_unuse(PCIDevice *dev, unsigned vector);
-- 
1.8.3.1


