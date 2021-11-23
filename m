Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4B245A1E1
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 12:50:19 +0100 (CET)
Received: from localhost ([::1]:57624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpUJW-0004uu-LP
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 06:50:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1mpUIN-000439-F6; Tue, 23 Nov 2021 06:49:07 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:64646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1mpUIL-0001Sh-5T; Tue, 23 Nov 2021 06:49:07 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1ANAknsx034925; 
 Tue, 23 Nov 2021 11:49:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=nyS3yiofOVQAEQNLEMzdAz5aOTjFbiuVfeFvAr7asco=;
 b=tD1qEx473WaM8KPfS+6Mic5IHmQh7eGra70ARPJ0CR6lae1u1CL/0tYLsTnxw3ttEWuI
 uEoFu+r0fqx12urS1EvNZIfLI/hPxwfkBMwJVOb51XouD6cPdZczdX2pwWxLn48bKQPB
 StJt9UO6blowFoYrbhkG7jXV9MaoVZuU2HOGOY2RKlzFyuArSB1ynC6f8l/l4BT6HCNY
 rjg0NSbYhXTAoFsFWqKkMOYryDW6WJDsa70lvFIp5Je0utixaqmNut0hl+B0jEEUSji7
 ur1cksgaIdYf/U0CcyABCRXA3t0au0qs8A5jObyayiqJOrzmC0xHM2tb2ZK+ahkP+PsL GQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cgxun172d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Nov 2021 11:49:01 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1ANBn1GB006472;
 Tue, 23 Nov 2021 11:49:01 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cgxun1722-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Nov 2021 11:49:01 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1ANBmx1Y025728;
 Tue, 23 Nov 2021 11:49:00 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03wdc.us.ibm.com with ESMTP id 3cernahsyh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Nov 2021 11:48:59 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1ANBmw3Z57672020
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Nov 2021 11:48:58 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D2886AC062;
 Tue, 23 Nov 2021 11:48:58 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F449AC060;
 Tue, 23 Nov 2021 11:48:57 +0000 (GMT)
Received: from lagarcia.br.ibm.com (unknown [9.160.47.188])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 23 Nov 2021 11:48:57 +0000 (GMT)
From: lagarcia@linux.ibm.com
To: qemu-trivial@nongnu.org
Subject: [PATCH v3] hw/virtio/vhost: Fix typo in comment.
Date: Tue, 23 Nov 2021 08:48:31 -0300
Message-Id: <a10a0ddab65b474ebea1e1141abe0f4aa463909b.1637668012.git.lagarcia@br.ibm.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bu1M1wl_GxjXk631G7m0aWRn2FalH0Td
X-Proofpoint-GUID: hdyRw9uh93yvlwQcuae-umFLGSIcjoHf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-23_04,2021-11-23_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015 mlxscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111230063
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=lagarcia@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leonardo Garcia <lagarcia@br.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Leonardo Garcia <lagarcia@br.ibm.com>

Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/virtio/vhost.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 437347ad01..20913cf8fb 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -313,7 +313,7 @@ static int vhost_dev_has_iommu(struct vhost_dev *dev)
      * For vhost, VIRTIO_F_IOMMU_PLATFORM means the backend support
      * incremental memory mapping API via IOTLB API. For platform that
      * does not have IOMMU, there's no need to enable this feature
-     * which may cause unnecessary IOTLB miss/update trnasactions.
+     * which may cause unnecessary IOTLB miss/update transactions.
      */
     return virtio_bus_device_iommu_enabled(vdev) &&
            virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
-- 
2.33.1


