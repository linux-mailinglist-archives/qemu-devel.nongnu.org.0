Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 427B011D7DA
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Dec 2019 21:26:45 +0100 (CET)
Received: from localhost ([::1]:37016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifV2q-0001F6-9W
	for lists+qemu-devel@lfdr.de; Thu, 12 Dec 2019 15:26:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42654)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanb@linux.vnet.ibm.com>) id 1ifV1T-0008J5-Cx
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 15:25:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanb@linux.vnet.ibm.com>) id 1ifV1R-0001r5-VM
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 15:25:19 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:55874)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1ifV1R-0001ow-MJ; Thu, 12 Dec 2019 15:25:17 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBCKOPBU126671; Thu, 12 Dec 2019 15:25:13 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wuq3wkws3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Dec 2019 15:25:13 -0500
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xBCKOXe0127393;
 Thu, 12 Dec 2019 15:25:13 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wuq3wkwrm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Dec 2019 15:25:13 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBCKOeek012391;
 Thu, 12 Dec 2019 20:25:12 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03wdc.us.ibm.com with ESMTP id 2wr3q70ydc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Dec 2019 20:25:12 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBCKPBK846858748
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Dec 2019 20:25:11 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 657C6AC05F;
 Thu, 12 Dec 2019 20:25:11 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E930AC05B;
 Thu, 12 Dec 2019 20:25:11 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 12 Dec 2019 20:25:11 +0000 (GMT)
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH v5 0/5] Add vTPM emulator support for ppc64 platform
Date: Thu, 12 Dec 2019 15:24:25 -0500
Message-Id: <20191212202430.1079725-1-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-12_06:2019-12-12,2019-12-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 mlxlogscore=999 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912120157
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
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
Cc: marcandre.lureau@redhat.com, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following series of patches adds vTPM emulator support for the
ppc64 platform (pSeries). 

It can be tested as follows with swtpm/libtpms:

mkdir /tmp/mytpm1
swtpm socket --tpmstate dir=/tmp/mytpm1 \
  --ctrl type=unixio,path=/tmp/mytpm1/swtpm-sock \
  --log level=20

If TPM 2 is desired, add --tpm2 as parameter to the above.

In another terminal start QEMU:

sudo ./ppc64-softmmu/qemu-system-ppc64 -display sdl \
	-machine pseries,accel=kvm \
	-m 1024 -bios slof.bin -boot menu=on \
	-nodefaults -device VGA -device pci-ohci -device usb-kbd \
	-chardev socket,id=chrtpm,path=/tmp/mytpm1/swtpm-sock \
	-tpmdev emulator,id=tpm0,chardev=chrtpm \
	-device tpm-spapr,tpmdev=tpm0 \
	-device spapr-vscsi,id=scsi0,reg=0x00002000 \
	-device virtio-blk-pci,scsi=off,bus=pci.0,addr=0x3,drive=drive-virtio-disk0,id=virtio-disk0 \
	-drive file=test.img,format=raw,if=none,id=drive-virtio-disk0

Links:
 - libtpms: https://github.com/stefanberger/libtpms/wiki
 - swtpm: https://github.com/stefanberger/swtpm/wiki

Changes:
 v4->v5:
  - use runstate_check(RUN_STATE_FINISH_MIGRATE) to check whether devices
    are suspending; ditch 3 patches in this series that tried to do similar

 v3->v4:
  - addressed comments to v3
  - reworked suspend/resume support that requires extensions to backends

 v2->v3:
  - patch 1: a TPM 2 is identified by IBM,vtpm20 in the compatible node
  - patch 1: convert to tracing to display Tx and Rx buffers
  - added documentation patch
  - added patch to enable TPM device as part of pSeries

 v1->v2:
  - followed Cedric Le Goater's suggestions to patch 1
  - send appropriate CRQ error responses if DMA read or write fails
  - renamed tpm_spapr_got_payload to tpm_spapr_process_cmd and
    pass endianess-adjusted data pointer from CRQ to it

Regards,
    Stefan

Stefan Berger (5):
  tpm_spapr: Support TPM for ppc64 using CRQ based interface
  tpm: Return bool from tpm_backend_finish_sync
  tpm_spapr: Support suspend and resume
  hw/ppc/Kconfig: Enable TPM_SPAPR as part of PSERIES config
  docs: tpm: Add example command line for ppc64 and tpm-spapr

 backends/tpm.c               |   6 +-
 docs/specs/tpm.txt           |  20 +-
 hw/ppc/Kconfig               |   1 +
 hw/tpm/Kconfig               |   6 +
 hw/tpm/Makefile.objs         |   1 +
 hw/tpm/tpm_spapr.c           | 458 +++++++++++++++++++++++++++++++++++
 hw/tpm/trace-events          |  14 ++
 include/sysemu/tpm.h         |   3 +
 include/sysemu/tpm_backend.h |   4 +-
 qapi/tpm.json                |   6 +-
 10 files changed, 513 insertions(+), 6 deletions(-)
 create mode 100644 hw/tpm/tpm_spapr.c

-- 
2.21.0


