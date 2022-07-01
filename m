Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4D356391B
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 20:24:57 +0200 (CEST)
Received: from localhost ([::1]:36698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7LK3-0001s5-KQ
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 14:24:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1o7LIy-000189-Lr; Fri, 01 Jul 2022 14:23:49 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:35436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1o7LIv-0000vM-Pu; Fri, 01 Jul 2022 14:23:48 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 261HkCQS003812;
 Fri, 1 Jul 2022 18:23:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=OyRWojfePCjsE36nZOgtx0oSizWaOKGlWldzxBN3XxQ=;
 b=aa5FNsiNmThjezw3hDDyfNDzjL8yoohc7jrpo2GgLFxVoGQz/Y+GOLeNh4J2w91zHf5K
 SwvcxVNQcOLs60k2BE1DMvhCIW6DBU2pCyoXph08SK3SgiDj2///76gvBueMZoUZ1Bps
 +AL2xuYPWANBWN7hHRiSbSkiQ6ogO9eu50aoS8mAzg8Dnwziug12f2laaSrTbBwkSDd9
 shMNt6gsQQgF6qPFP3ApZ07agSjxcyhDteB5LFRRDL0r14Ay2jANRMikrknmwp/cx9N/
 3EohNd2YrNxzpChsJ2t+4DDka/SaonGFUn/uxgR+qXJDNmUQ/XnlpfW0y/Uk5gIdZ2rV 9g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h25m7rxwj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Jul 2022 18:23:42 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 261I5mdn030489;
 Fri, 1 Jul 2022 18:23:42 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h25m7rxw3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Jul 2022 18:23:42 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 261ILJRS010797;
 Fri, 1 Jul 2022 18:23:41 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04wdc.us.ibm.com with ESMTP id 3gwt0akb6h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Jul 2022 18:23:41 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 261INe6532899500
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 1 Jul 2022 18:23:40 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 82BEC28059;
 Fri,  1 Jul 2022 18:23:40 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 18BAC28058;
 Fri,  1 Jul 2022 18:23:39 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.163.2.135])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  1 Jul 2022 18:23:38 +0000 (GMT)
Message-ID: <f77daa0ce58b4e2ca89feea2177bf40cb6adf81c.camel@linux.ibm.com>
Subject: Re: [PATCH 04/12] pc-bios/s390-ccw/virtio-blkdev: Simplify/fix
 virtio_ipl_disk_is_valid()
From: Eric Farman <farman@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org, Christian
 Borntraeger <borntraeger@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>, Janosch Frank
 <frankja@linux.ibm.com>
Date: Fri, 01 Jul 2022 14:22:07 -0400
In-Reply-To: <20220628131032.213986-5-thuth@redhat.com>
References: <20220628131032.213986-1-thuth@redhat.com>
 <20220628131032.213986-5-thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8Rw0P114yXlF8LDR8_uFAXTyyzG4Ihu-
X-Proofpoint-GUID: t3WgzzmPS_NdCcbMrmGJZ8HEUeIei4JW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-01_10,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2207010071
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
> The s390-ccw bios fails to boot if the boot disk is a virtio-blk
> disk with a sector size of 4096. For example:
> 
>  dasdfmt -b 4096 -d cdl -y -p -M quick /dev/dasdX
>  fdasd -a /dev/dasdX
>  install a guest onto /dev/dasdX1 using virtio-blk
>  qemu-system-s390x -nographic -hda /dev/dasdX1
> 
> The bios then bails out with:
> 
>  ! Cannot read block 0 !
> 
> Looking at virtio_ipl_disk_is_valid() and especially the function
> virtio_disk_is_scsi(), it does not really make sense that we expect
> only such a limited disk geometry (like a block size of 512) for
> our boot disks. Let's relax the check and allow everything that
> remotely looks like a sane disk.

This indeed corrects that problem (thank you!), and I really don't
understand why we'd want to limit the geometry anyhow. I think this is
good.

Reviewed-by: Eric Farman <farman@linux.ibm.com>

> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  pc-bios/s390-ccw/virtio.h        |  2 --
>  pc-bios/s390-ccw/virtio-blkdev.c | 41 ++++++----------------------
> ----
>  2 files changed, 7 insertions(+), 36 deletions(-)
> 
> diff --git a/pc-bios/s390-ccw/virtio.h b/pc-bios/s390-ccw/virtio.h
> index c2c17c29ca..8f917d47a9 100644
> --- a/pc-bios/s390-ccw/virtio.h
> +++ b/pc-bios/s390-ccw/virtio.h
> @@ -186,8 +186,6 @@ void virtio_assume_scsi(void);
>  void virtio_assume_eckd(void);
>  void virtio_assume_iso9660(void);
>  
> -extern bool virtio_disk_is_scsi(void);
> -extern bool virtio_disk_is_eckd(void);
>  extern bool virtio_ipl_disk_is_valid(void);
>  extern int virtio_get_block_size(void);
>  extern uint8_t virtio_get_heads(void);
> diff --git a/pc-bios/s390-ccw/virtio-blkdev.c b/pc-bios/s390-
> ccw/virtio-blkdev.c
> index 49ed2b4bee..b14cbc3d9e 100644
> --- a/pc-bios/s390-ccw/virtio-blkdev.c
> +++ b/pc-bios/s390-ccw/virtio-blkdev.c
> @@ -166,46 +166,19 @@ void virtio_assume_eckd(void)
>          virtio_eckd_sectors_for_block_size(vdev-
> >config.blk.blk_size);
>  }
>  
> -bool virtio_disk_is_scsi(void)
> -{
> -    VDev *vdev = virtio_get_device();
> -
> -    if (vdev->guessed_disk_nature == VIRTIO_GDN_SCSI) {
> -        return true;
> -    }
> -    switch (vdev->senseid.cu_model) {
> -    case VIRTIO_ID_BLOCK:
> -        return (vdev->config.blk.geometry.heads == 255)
> -            && (vdev->config.blk.geometry.sectors == 63)
> -            && (virtio_get_block_size()  == VIRTIO_SCSI_BLOCK_SIZE);
> -    case VIRTIO_ID_SCSI:
> -        return true;
> -    }
> -    return false;
> -}
> -
> -bool virtio_disk_is_eckd(void)
> +bool virtio_ipl_disk_is_valid(void)
>  {
> +    int blksize = virtio_get_block_size();
>      VDev *vdev = virtio_get_device();
> -    const int block_size = virtio_get_block_size();
>  
> -    if (vdev->guessed_disk_nature == VIRTIO_GDN_DASD) {
> +    if (vdev->guessed_disk_nature == VIRTIO_GDN_SCSI ||
> +        vdev->guessed_disk_nature == VIRTIO_GDN_DASD) {
>          return true;
>      }
> -    switch (vdev->senseid.cu_model) {
> -    case VIRTIO_ID_BLOCK:
> -        return (vdev->config.blk.geometry.heads == 15)
> -            && (vdev->config.blk.geometry.sectors ==
> -                virtio_eckd_sectors_for_block_size(block_size));
> -    case VIRTIO_ID_SCSI:
> -        return false;
> -    }
> -    return false;
> -}
>  
> -bool virtio_ipl_disk_is_valid(void)
> -{
> -    return virtio_disk_is_scsi() || virtio_disk_is_eckd();
> +    return (vdev->senseid.cu_model == VIRTIO_ID_BLOCK ||
> +            vdev->senseid.cu_model == VIRTIO_ID_SCSI) &&
> +           blksize >= 512 && blksize <= 4096;
>  }
>  
>  int virtio_get_block_size(void)


