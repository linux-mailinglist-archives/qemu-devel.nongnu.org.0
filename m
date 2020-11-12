Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D44202B13EE
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 02:39:42 +0100 (CET)
Received: from localhost ([::1]:34104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdO3x-0003GM-TA
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 20:39:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.christie@oracle.com>)
 id 1kdLsP-0003Zx-8V
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 18:19:37 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:46882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.christie@oracle.com>)
 id 1kdLsM-0006xb-Sl
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 18:19:36 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0ACN9sRO118600;
 Thu, 12 Nov 2020 23:19:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject : date : message-id; s=corp-2020-01-29;
 bh=zkd61/tba/h2odvP0fuyY9lA39g2B4FPo68/2n7cZQ0=;
 b=NFV3M+9XhIfMAGZwDUA+eZc3za2cVBT9z/U9iR+cXh3S++ZKGSTGipMrKeK3ACyL4k2H
 vukmoxPsuIpor1bVPxigI7Ga4xesUwnOcvOjfGsvVm9ZtOk1zxS5WDnabmQweX1L27r0
 CH/koP60dwqgV9U1pwBAnQkiZbJQA2zybkzX9SOAm/TmgdUhbWOdGkiKocVxVMJlhXOq
 /TFmaHT8+FE8yrWVmMeuyTjS7nZyUVRXMyPM1um4SzNFHhu7FRGNiWvG/h1GgS0SZ0AA
 fkDqYJZhzS/5DdmM+CZeEmEweh3oFoShItgh2xNvjxbXI3QU67RhXLaFojriaSlO9SKS NQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 34nkhm83v4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 12 Nov 2020 23:19:22 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0ACNAH2k075845;
 Thu, 12 Nov 2020 23:19:21 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 34rtksk4xm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Nov 2020 23:19:21 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0ACNJJwk011448;
 Thu, 12 Nov 2020 23:19:20 GMT
Received: from ol2.localdomain (/73.88.28.6)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 12 Nov 2020 15:19:19 -0800
From: Mike Christie <michael.christie@oracle.com>
To: stefanha@redhat.com, qemu-devel@nongnu.org, fam@euphon.net,
 linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
 mst@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 virtualization@lists.linux-foundation.org
Subject: [PATCH 00/10] vhost/qemu: thread per IO SCSI vq 
Date: Thu, 12 Nov 2020 17:18:59 -0600
Message-Id: <1605223150-10888-1-git-send-email-michael.christie@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9803
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 phishscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011120130
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9803
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 priorityscore=1501
 mlxscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1011 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011120130
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=michael.christie@oracle.com; helo=aserp2120.oracle.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 15:44:20
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 12 Nov 2020 20:29:31 -0500
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

The following kernel patches were made over Michael's vhost branch:

https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git/log/?h=vhost

and the vhost-scsi bug fix patchset:

https://lore.kernel.org/linux-scsi/20201112170008.GB1555653@stefanha-x1.localdomain/T/#t

And the qemu patch was made over the qemu master branch.

vhost-scsi currently supports multiple queues with the num_queues
setting, but we end up with a setup where the guest's scsi/block
layer can do a queue per vCPU and the layers below vhost can do
a queue per CPU. vhost-scsi will then do a num_queue virtqueues,
but all IO gets set on and completed on a single vhost-scsi thread.
After 2 - 4 vqs this becomes a bottleneck.

This patchset allows us to create a worker thread per IO vq, so we
can better utilize multiple CPUs with the multiple queues. It
implments Jason's suggestion to create the initial worker like
normal, then create the extra workers for IO vqs with the
VHOST_SET_VRING_ENABLE ioctl command added in this patchset.



