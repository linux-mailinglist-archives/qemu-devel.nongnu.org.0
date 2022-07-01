Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 943E3563AE8
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 22:26:49 +0200 (CEST)
Received: from localhost ([::1]:44990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7NE0-00048x-7T
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 16:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1o7NCl-0003RK-BW; Fri, 01 Jul 2022 16:25:31 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:48928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1o7NCj-0003fT-10; Fri, 01 Jul 2022 16:25:31 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 261KFpwk022987;
 Fri, 1 Jul 2022 20:25:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=RhiBEeb73h6h7oVX0Hvg7VwKG/pSTnzePr8z5boy0OM=;
 b=WoCia+tC3Q2PQvnUKbWy8AGjB+W/vscx8tgtcAPK8Qv1rcxbqGzyIDIdSQ8DpIYL0rAw
 Xw6OOSwhXydnHS8jE7N6DYNEag80GKpiCqYnlC017vuHUsdEe88vW2oIypONe0yTfSUx
 Pjoh8HgX0QewIIVn5sGfGwyyIdHyRCJgLudgXmBwCp10gT4d48l2LJTKC1Vq8ugqTNTZ
 8MVI08HMRHVRs+qpLFkvr/AUHjEm1z6QeqWTmPOLjEzCM12B7uBLdmz3yedjCc/0kS2Z
 bG1kiHBGT+OUeb2BqG8CKjo89WopB8xuZewPSaWekKfNnNLQ6Otj302BlYEx5AlBNNUu BQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h27tc86v5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Jul 2022 20:25:25 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 261KIUfm011045;
 Fri, 1 Jul 2022 20:25:25 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h27tc86us-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Jul 2022 20:25:25 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 261KLT6x005312;
 Fri, 1 Jul 2022 20:25:24 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04wdc.us.ibm.com with ESMTP id 3gwt0akw0y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Jul 2022 20:25:24 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 261KPNsp32112972
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 1 Jul 2022 20:25:23 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E2F27805E;
 Fri,  1 Jul 2022 20:25:23 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 70B5B7805F;
 Fri,  1 Jul 2022 20:25:22 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.163.2.135])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  1 Jul 2022 20:25:22 +0000 (GMT)
Message-ID: <f25d4b8f7a7abdf523f721652fa23b29c5b4d248.camel@linux.ibm.com>
Subject: Re: [PATCH 09/12] pc-bios/s390-ccw: Split virtio-scsi code from
 virtio_blk_setup_device()
From: Eric Farman <farman@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org, Christian
 Borntraeger <borntraeger@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>, Janosch Frank
 <frankja@linux.ibm.com>
Date: Fri, 01 Jul 2022 16:25:21 -0400
In-Reply-To: <20220628131032.213986-10-thuth@redhat.com>
References: <20220628131032.213986-1-thuth@redhat.com>
 <20220628131032.213986-10-thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Mv1SmV0tXW449IQ4f2QlTp34X4GanELa
X-Proofpoint-GUID: pjaypHhe23FrIMZmyRw52nTGv6Et8QbR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-01_12,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 impostorscore=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2207010081
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2022-06-28 at 15:10 +0200, Thomas Huth wrote:
> The next patch is going to add more virtio-block specific code to
> virtio_blk_setup_device(), and if the virtio-scsi code is also in
> there, this is more cumbersome. And the calling function
> virtio_setup()
> in main.c looks at the device type already anyway, so it's more
> logical to separate the virtio-scsi stuff into a new function in
> virtio-scsi.c instead.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

I think this is a good untangling.

Reviewed-by: Eric Farman <farman@linux.ibm.com>

> ---
>  pc-bios/s390-ccw/virtio-scsi.h   |  2 +-
>  pc-bios/s390-ccw/main.c          | 24 +++++++++++++++++-------
>  pc-bios/s390-ccw/virtio-blkdev.c | 20 ++------------------
>  pc-bios/s390-ccw/virtio-scsi.c   | 19 ++++++++++++++++++-
>  4 files changed, 38 insertions(+), 27 deletions(-)
> 
> diff --git a/pc-bios/s390-ccw/virtio-scsi.h b/pc-bios/s390-
> ccw/virtio-scsi.h
> index 4b14c2c2f9..e6b6cd4815 100644
> --- a/pc-bios/s390-ccw/virtio-scsi.h
> +++ b/pc-bios/s390-ccw/virtio-scsi.h
> @@ -67,8 +67,8 @@ static inline bool virtio_scsi_response_ok(const
> VirtioScsiCmdResp *r)
>          return r->response == VIRTIO_SCSI_S_OK && r->status ==
> CDB_STATUS_GOOD;
>  }
>  
> -int virtio_scsi_setup(VDev *vdev);
>  int virtio_scsi_read_many(VDev *vdev,
>                            ulong sector, void *load_addr, int
> sec_num);
> +int virtio_scsi_setup_device(SubChannelId schid);
>  
>  #endif /* VIRTIO_SCSI_H */
> diff --git a/pc-bios/s390-ccw/main.c b/pc-bios/s390-ccw/main.c
> index 835341457d..a2def83e82 100644
> --- a/pc-bios/s390-ccw/main.c
> +++ b/pc-bios/s390-ccw/main.c
> @@ -14,6 +14,7 @@
>  #include "s390-ccw.h"
>  #include "cio.h"
>  #include "virtio.h"
> +#include "virtio-scsi.h"
>  #include "dasd-ipl.h"
>  
>  char stack[PAGE_SIZE * 8] __attribute__((__aligned__(PAGE_SIZE)));
> @@ -218,6 +219,7 @@ static int virtio_setup(void)
>  {
>      VDev *vdev = virtio_get_device();
>      QemuIplParameters *early_qipl = (QemuIplParameters
> *)QIPL_ADDRESS;
> +    int ret;
>  
>      memcpy(&qipl, early_qipl, sizeof(QemuIplParameters));
>  
> @@ -225,18 +227,26 @@ static int virtio_setup(void)
>          menu_setup();
>      }
>  
> -    if (virtio_get_device_type() == VIRTIO_ID_NET) {
> +    switch (vdev->senseid.cu_model) {
> +    case VIRTIO_ID_NET:
>          sclp_print("Network boot device detected\n");
>          vdev->netboot_start_addr = qipl.netboot_start_addr;
> -    } else {
> -        int ret = virtio_blk_setup_device(blk_schid);
> -        if (ret) {
> -            return ret;
> -        }
> +        return 0;
> +    case VIRTIO_ID_BLOCK:
> +        ret = virtio_blk_setup_device(blk_schid);
> +        break;
> +    case VIRTIO_ID_SCSI:
> +        ret = virtio_scsi_setup_device(blk_schid);
> +        break;
> +    default:
> +        panic("\n! No IPL device available !\n");
> +    }
> +
> +    if (!ret) {
>          IPL_assert(virtio_ipl_disk_is_valid(), "No valid IPL device
> detected");
>      }
>  
> -    return 0;
> +    return ret;
>  }
>  
>  static void ipl_boot_device(void)
> diff --git a/pc-bios/s390-ccw/virtio-blkdev.c b/pc-bios/s390-
> ccw/virtio-blkdev.c
> index 11820754f3..a2b157b2c0 100644
> --- a/pc-bios/s390-ccw/virtio-blkdev.c
> +++ b/pc-bios/s390-ccw/virtio-blkdev.c
> @@ -222,27 +222,11 @@ uint64_t virtio_get_blocks(void)
>  int virtio_blk_setup_device(SubChannelId schid)
>  {
>      VDev *vdev = virtio_get_device();
> -    int ret = 0;
>  
>      vdev->schid = schid;
>      virtio_setup_ccw(vdev);
>  
> -    switch (vdev->senseid.cu_model) {
> -    case VIRTIO_ID_BLOCK:
> -        sclp_print("Using virtio-blk.\n");
> -        break;
> -    case VIRTIO_ID_SCSI:
> -        IPL_assert(vdev->config.scsi.sense_size ==
> VIRTIO_SCSI_SENSE_SIZE,
> -            "Config: sense size mismatch");
> -        IPL_assert(vdev->config.scsi.cdb_size ==
> VIRTIO_SCSI_CDB_SIZE,
> -            "Config: CDB size mismatch");
> +    sclp_print("Using virtio-blk.\n");
>  
> -        sclp_print("Using virtio-scsi.\n");
> -        ret = virtio_scsi_setup(vdev);
> -        break;
> -    default:
> -        panic("\n! No IPL device available !\n");
> -    }
> -
> -    return ret;
> +    return 0;
>  }
> diff --git a/pc-bios/s390-ccw/virtio-scsi.c b/pc-bios/s390-
> ccw/virtio-scsi.c
> index 2c8d0f3097..3b7069270c 100644
> --- a/pc-bios/s390-ccw/virtio-scsi.c
> +++ b/pc-bios/s390-ccw/virtio-scsi.c
> @@ -329,7 +329,7 @@ static void scsi_parse_capacity_report(void
> *data,
>      }
>  }
>  
> -int virtio_scsi_setup(VDev *vdev)
> +static int virtio_scsi_setup(VDev *vdev)
>  {
>      int retry_test_unit_ready = 3;
>      uint8_t data[256];
> @@ -430,3 +430,20 @@ int virtio_scsi_setup(VDev *vdev)
>  
>      return 0;
>  }
> +
> +int virtio_scsi_setup_device(SubChannelId schid)
> +{
> +    VDev *vdev = virtio_get_device();
> +
> +    vdev->schid = schid;
> +    virtio_setup_ccw(vdev);
> +
> +    IPL_assert(vdev->config.scsi.sense_size ==
> VIRTIO_SCSI_SENSE_SIZE,
> +               "Config: sense size mismatch");
> +    IPL_assert(vdev->config.scsi.cdb_size == VIRTIO_SCSI_CDB_SIZE,
> +               "Config: CDB size mismatch");
> +
> +    sclp_print("Using virtio-scsi.\n");
> +
> +    return virtio_scsi_setup(vdev);
> +}


