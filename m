Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1313B4A95DB
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 10:17:32 +0100 (CET)
Received: from localhost ([::1]:57652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFuig-0004nQ-Jw
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 04:17:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbhat@linux.ibm.com>)
 id 1nFtl4-0003Ar-O8; Fri, 04 Feb 2022 03:15:54 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:55288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbhat@linux.ibm.com>)
 id 1nFtl1-0004Zn-KJ; Fri, 04 Feb 2022 03:15:54 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21477nnA005870; 
 Fri, 4 Feb 2022 08:15:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=DWU69EpMOz/s1BMj8sfp7YPLhDQ54xoGuDg1600kSxE=;
 b=mWJwi1qxVT9BwoT0zMKU/3B0WtlwXiwEJ6vCGg5iTyUURq6EZqeli3TMmSpln+bRHfUa
 ZGPpPBtFwAtJICfGCEmusZAjeeLXOuK8MsnnRGHupY7T1v8IrGhYOnoh9BcLNeprj/Vl
 IVoGALa9FFlqS3u9QlhFpV0e4pFyzwD56gYEeS6Vb3U2zjcyr/gdQBiT8SM2ycJ2FI6m
 ID87j5as7ZfTNmnfURXrjKjaPZZtQKB7cgb3FNuDH1TTcGOeFf9bJtt2YJJ9VP/JWD8l
 f38KCFPXXmmcILdYyaTNoXjaGfs3TxlkHx3XD8PHslZVeEIQuUI8qLVWGoLgqqYMFWgm Hg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e0qx403ke-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 08:15:32 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21487K6r040780;
 Fri, 4 Feb 2022 08:15:32 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e0qx403jh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 08:15:31 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21487Kli011027;
 Fri, 4 Feb 2022 08:15:29 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3e0r0u2mst-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 08:15:29 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2148FQ4o37683624
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Feb 2022 08:15:26 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A75B52059;
 Fri,  4 Feb 2022 08:15:26 +0000 (GMT)
Received: from ltczzess4.aus.stglabs.ibm.com (unknown [9.40.194.150])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 8B07052057;
 Fri,  4 Feb 2022 08:15:24 +0000 (GMT)
Subject: [PATCH v7 0/3] spapr: nvdimm: Introduce spapr-nvdimm device
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: clg@kaod.org, mst@redhat.com, ani@anisinha.ca, danielhb413@gmail.com,
 david@gibson.dropbear.id.au, groug@kaod.org, imammedo@redhat.com,
 xiaoguangrong.eric@gmail.com, david@gibson.dropbear.id.au,
 qemu-ppc@nongnu.org
Date: Fri, 04 Feb 2022 08:15:24 +0000
Message-ID: <164396252398.109112.13436924292537517470.stgit@ltczzess4.aus.stglabs.ibm.com>
User-Agent: StGit/1.1
Content-Type: text/plain; charset="utf-8"
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 11J2ybFcl5TPX6oXqPTSrsupSuL2fptt
X-Proofpoint-ORIG-GUID: 03y2vwQDQDwhRoUylA1PVCJ7IzVdnTZE
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-04_03,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 mlxlogscore=999 malwarescore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202040041
Received-SPF: pass client-ip=148.163.156.1; envelope-from=sbhat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: aneesh.kumar@linux.ibm.com, qemu-devel@nongnu.org, kvm-ppc@vger.kernel.org,
 nvdimm@lists.linux.dev
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the device backend is not persistent memory for the nvdimm, there
is need for explicit IO flushes to ensure persistence.

On SPAPR, the issue is addressed by adding a new hcall to request for
an explicit flush from the guest when the backend is not pmem.
So, the approach here is to convey when the hcall flush is required
in a device tree property. The guest once it knows the device needs
explicit flushes, makes the hcall as and when required.

It was suggested to create a new device type to address the
explicit flush for such backends on PPC instead of extending the
generic nvdimm device with new property. So, the patch introduces
the spapr-nvdimm device. The new device inherits the nvdimm device
with the new bahviour such that if the backend has pmem=no, the
device tree property is set by default.

The below demonstration shows the map_sync behavior for non-pmem
backends.
(https://github.com/avocado-framework-tests/avocado-misc-tests/blob/master/memory/ndctl.py.data/map_sync.c)

The pmem0 is from spapr-nvdimm with with backend pmem=on, and pmem1 is
from spapr-nvdimm with pmem=off, mounted as
/dev/pmem0 on /mnt1 type xfs (rw,relatime,attr2,dax=always,inode64,logbufs=8,logbsize=32k,noquota)
/dev/pmem1 on /mnt2 type xfs (rw,relatime,attr2,dax=always,inode64,logbufs=8,logbsize=32k,noquota)

[root@atest-guest ~]# ./mapsync /mnt1/newfile ----> When pmem=on
[root@atest-guest ~]# ./mapsync /mnt2/newfile ----> when pmem=off
Failed to mmap  with Operation not supported

First patch adds the realize/unrealize call backs to the generic device
for the new device's vmstate registration. The second patch implements
the hcall, adds the necessary vmstate properties to spapr machine structure
for carrying the hcall status during save-restore. The nature of the hcall
being asynchronus, the patch uses aio utilities to offload the flush. The
third patch introduces the spapr-nvdimm device, adds the device tree
property for the guest when spapr-nvdimm is used with pmem=no on the
backend. Also adds new property pmem-override(?, suggest if you have better
name) to the spapr-nvdimm which hints at forcing the hcall based flushes even
on pmem backed devices.

The kernel changes to exploit this hcall is at
https://github.com/linuxppc/linux/commit/75b7c05ebf9026.patch

---
v6 - https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg00322.html
Changes from v6:
      - Addressed commen from Daniel.
        Fixed a typo
        Fetch the memory backend FD in the flush_worker_cb(), updated hcall
        return values in the comments description)
      - Updated the signatures.

v5 - https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg01741.html
Changes from v5:
      - Taken care of all comments from David
      - Moved the flush lists from spapr machine into the spapr-nvdimm device
        state structures. So, all corresponding data structures adjusted
	accordingly as required.
      - New property pmem-overrride is added to the spapr-nvdimm device. The
        hcall flushes are allowed when pmem-override is set for the device.
      - The flush for pmem backend devices are made to use pmem_persist().
      - The vmstate structures are also made part of device state instead of
        global spapr.
      - Passing the flush token to destination during migration, I think its
        better than finding, deriving it from the outstanding ones.

v4 - https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg05982.html
Changes from v4:
      - Introduce spapr-nvdimm device with nvdimm device as the parent.
      - The new spapr-nvdimm has no new properties. As this is a new
        device and there is no migration related dependencies to be
        taken care of, the device behavior is made to set the device tree
        property and enable hcall when the device type spapr-nvdimm is
        used with pmem=off
      - Fixed commit messages
      - Added checks to ensure the backend is actualy file and not memory
      - Addressed things pointed out by Eric

v3 - https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg07916.html
Changes from v3:
      - Fixed the forward declaration coding guideline violations in 1st patch.
      - Removed the code waiting for the flushes to complete during migration,
        instead restart the flush worker on destination qemu in post load.
      - Got rid of the randomization of the flush tokens, using simple
        counter.
      - Got rid of the redundant flush state lock, relying on the BQL now.
      - Handling the memory-backend-ram usage
      - Changed the sync-dax symantics from on/off to 'unsafe','writeback' and 'direct'.
	Added prevention code using 'writeback' on arm and x86_64.
      - Fixed all the miscellaneous comments.

v2 - https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg07031.html
Changes from v2:
      - Using the thread pool based approach as suggested
      - Moved the async hcall handling code to spapr_nvdimm.c along
        with some simplifications
      - Added vmstate to preserve the hcall status during save-restore
        along with pre_save handler code to complete all ongoning flushes.
      - Added hw_compat magic for sync-dax 'on' on previous machines.
      - Miscellanious minor fixes.

v1 - https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg06330.html
Changes from v1
      - Fixed a missed-out unlock
      - using QLIST_FOREACH instead of QLIST_FOREACH_SAFE while generating token

Shivaprasad G Bhat (3):
      nvdimm: Add realize, unrealize callbacks to NVDIMMDevice class
      spapr: nvdimm: Implement H_SCM_FLUSH hcall
      spapr: nvdimm: Introduce spapr-nvdimm device


 hw/mem/nvdimm.c               |  16 ++
 hw/mem/pc-dimm.c              |   5 +
 hw/ppc/spapr.c                |   2 +
 hw/ppc/spapr_nvdimm.c         | 394 ++++++++++++++++++++++++++++++++++
 include/hw/mem/nvdimm.h       |   2 +
 include/hw/mem/pc-dimm.h      |   1 +
 include/hw/ppc/spapr.h        |   4 +-
 include/hw/ppc/spapr_nvdimm.h |   1 +
 8 files changed, 424 insertions(+), 1 deletion(-)

--
Signature


