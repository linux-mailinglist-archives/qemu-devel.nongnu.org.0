Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB6E46E5A6
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 10:33:17 +0100 (CET)
Received: from localhost ([::1]:36526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvFng-0000Ap-39
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 04:33:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oro@il.ibm.com>)
 id 1mvFjD-0005b1-FU; Thu, 09 Dec 2021 04:28:39 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:11212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oro@il.ibm.com>)
 id 1mvFjB-0006OT-Ho; Thu, 09 Dec 2021 04:28:39 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B97SZnx027687; 
 Thu, 9 Dec 2021 09:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=CERrMKld2g3smjjfVP4uoYpCJbF+hDBnNRLMHsOK1a8=;
 b=OUQRddJQfz2J7OXqlsFSYrEr/d5SCCZo9NmhgBkrmjZDyc9i+RlZXZvcRioCjsVsSqLJ
 Ikk0NBDAHbDkJ4ZGjmOvR6ur6DZq1/7HsKvqNMuQ+JIJ0UvR6fmoYbT5+wSdVJUH0+DD
 2o4ik9L8IMI7jZIxOspjiRXPbH8rW8nYbRKT1dNoF/birHSEC2biW9hU1KDysxrod/MT
 U8stuXvBuJ6XEF7Nht8sGBcvIzL1mmc2CGSroekdaeYS60ankDpBTDijfoZTqYdgIp4f
 EpHq1RGVQ1cvvYdXIuLwmUXOoYPU0vNUtfh/g1Vc1/mwXy+4f6NP72YMkMOcLiLv4Bn0 Ig== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cudept8a1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Dec 2021 09:28:33 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B99JKg4027681;
 Thu, 9 Dec 2021 09:28:33 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cudept89r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Dec 2021 09:28:33 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B99RxaG003701;
 Thu, 9 Dec 2021 09:28:32 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma05wdc.us.ibm.com with ESMTP id 3cqyybm9ev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Dec 2021 09:28:32 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B99SUPj28770646
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Dec 2021 09:28:30 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F40528083;
 Thu,  9 Dec 2021 09:28:30 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E37F28067;
 Thu,  9 Dec 2021 09:28:29 +0000 (GMT)
Received: from oro.sl.cloud9.ibm.com (unknown [9.59.192.176])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  9 Dec 2021 09:28:29 +0000 (GMT)
From: Or Ozeri <oro@il.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/1] virtio-block: switch to blk_get_max_hw_transfer
Date: Thu,  9 Dec 2021 03:28:14 -0600
Message-Id: <20211209092815.778066-1-oro@il.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5ev5UaHt0BM1EtZOOh0uIlEhyuEHnEDP
X-Proofpoint-GUID: ms27Ib3Jweye5eW5QYBnaHzCmUd2gBjw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-09_04,2021-12-08_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=906 phishscore=0
 spamscore=0 clxscore=1011 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112090045
Received-SPF: pass client-ip=148.163.156.1; envelope-from=oro@il.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Cc: dupadhya@redhat.com, oro@il.ibm.com, to.my.trociny@gmail.com,
 qemu-block@nongnu.org, dannyh@il.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since moving to qemu 6.1.0 we've been seeing disk failures inside a qemu guest VM.
This happened when using if=virtio on a host /dev/nbdX device.
Binary searching on qemu commit history, I found these errors start on this commit:

Commit 18473467
file-posix: try BLKSECTGET on block devices too, do not round to power of 2

The above commit switched posix block device limits (including host /dev/nbdX devices)
to query limits from /sys/dev/block/..., instead of using predefined limits.

The scsi-generic driver was changed to use the queried limits,
whereas the virtio-blk driver was only the queried max_iov,
but still using the predefined max_transfer, which is unlimited in qemu.

For NBD devices, max_iov is unlimited by the kernel nbd driver.
As as consequence, the virtio-blk merged requests over the limit of our host /dev/nbdX device,
which apparently caused the guest disk errors.

The solution that worked for me was to change the virtio-blk driver to use the max_transfer
limit queried from the posix host device (given by blk_get_max_hw_transfer).

Or Ozeri (1):
  virtio-block: switch to blk_get_max_hw_transfer

 hw/block/virtio-blk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.25.1


