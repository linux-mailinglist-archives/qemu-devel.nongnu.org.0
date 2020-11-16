Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E212B41BE
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 11:54:06 +0100 (CET)
Received: from localhost ([::1]:37804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kec97-0002Ya-EB
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 05:54:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1kebzo-0002Pu-Tj; Mon, 16 Nov 2020 05:44:30 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:36866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1kebzm-0001EP-DD; Mon, 16 Nov 2020 05:44:28 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AGAe5pQ177677;
 Mon, 16 Nov 2020 10:44:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2020-01-29; bh=IRueGR9N/lYsXui3hmxmUp2jLPMwb2OKHPR6iDadU98=;
 b=wVOVGP60zg9pODuUfTpZtS+Crxg8M61YxVSPQRNPiI2SEZXDtD6jc7NqSlDLDk8xTV6a
 zNB2hynBE03N0+77O6ylH8FOhHRvU/ABGoudIwaisa92QUwRZ2IZKRG0Xcx5laiSkzk0
 o3Y4wImXCTKBDRSfpLOM2vP24TFIZBIFhlDHdRQDnZh9jY2hikOLYJpuImNv7H352ASt
 Uon+y18PJsnE5AEpzMw3Fv2j49sUq7ZCMt7eiMaDkvpui9qw6yNlIaYQMQkUN6+h40uM
 W+/pKRCNfK8Stq0j3ZkNsH31aFWrK4QHAUK+VoC4nshWyia1Idvkhx5MonA4QUF6ScC6 dQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 34t76kmd3e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 16 Nov 2020 10:44:22 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AGAfUof165218;
 Mon, 16 Nov 2020 10:42:21 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 34trtkf47c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Nov 2020 10:42:21 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0AGAgJG6016854;
 Mon, 16 Nov 2020 10:42:19 GMT
Received: from disaster-area.hh.sledj.net (/81.187.26.238)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 16 Nov 2020 02:42:18 -0800
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id d79d65cf;
 Mon, 16 Nov 2020 10:42:16 +0000 (UTC)
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/5] ARM: reduce the memory consumed when mapping UEFI
 flash images
Date: Mon, 16 Nov 2020 10:42:11 +0000
Message-Id: <20201116104216.439650-1-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9806
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=1 mlxscore=0
 bulkscore=0 malwarescore=0 spamscore=0 mlxlogscore=600 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011160062
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9806
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 phishscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 mlxlogscore=619
 malwarescore=0 mlxscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011160062
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=david.edmondson@oracle.com; helo=aserp2120.oracle.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 05:42:28
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently ARM UEFI images are typically built as 2MB/768kB flash
images for code and variables respectively. These images are both then
padded out to 64MB before being loaded by QEMU.

Because the images are 64MB each, QEMU allocates 128MB of memory to
read them, and then proceeds to read all 128MB from disk (dirtying the
memory). Of this 128MB less than 3MB is useful - the rest is zero
padding.

On a machine with 100 VMs this wastes over 12GB of memory.

This set of patches aims to reclaim the wasted memory by allowing QEMU
to respect the size of the flash images and allocate only the
necessary memory. This will, of course, require that the flash build
process be modified to avoid padding the images to 64MB.

Because existing machine types expect the full 128MB reserved for
flash to be occupied, do so for machine types older than virt-5.2. The
changes are beneficial even in this case, because while the full 128MB
of memory is allocated, only that required to actually load the flash
images from disk is touched.

David Edmondson (5):
  hw/block: blk_check_size_and_read_all should report backend name
  hw/block: Flash images can be smaller than the device
  hw/arm: Convert assertions about flash image size to error_report
  hw/arm: Flash image mapping follows image size
  hw/arm: Only minimise flash size on older machines

 hw/arm/trace-events      |  2 +
 hw/arm/virt-acpi-build.c | 30 ++++++++------
 hw/arm/virt.c            | 86 +++++++++++++++++++++++++++++-----------
 hw/block/block.c         | 26 ++++++------
 include/hw/arm/virt.h    |  2 +
 5 files changed, 97 insertions(+), 49 deletions(-)

-- 
2.28.0


