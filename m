Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE9D56391C
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 20:26:30 +0200 (CEST)
Received: from localhost ([::1]:38912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7LLZ-0003Q8-Kj
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 14:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1o7LKb-0002dh-LD; Fri, 01 Jul 2022 14:25:29 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:9006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1o7LKY-0001DX-LN; Fri, 01 Jul 2022 14:25:28 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 261Hk9u9003752;
 Fri, 1 Jul 2022 18:25:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=5tmjImGFcNMvpTRSaiHnH8tMR1wGrBOjipapD3En9tw=;
 b=KVzpF1kzTePGyG/yZXAnOMhvtqi77NYNRWekLw79fiOEmR79Cbnlbq5JHZc10kchAzNw
 ulNtLcryhNn1269u7MBWEPUvAX9fwUEs0V4YVcMDJWb2d3Vl5fzxFHLF+v1kj42yoeXT
 l72R8zj8tONF4Tq86BQCn4Ala5PtWZUvLVh66U1YUvpHacOCoz2CisBA3qB6DTjWYcFR
 BFX1/r2OyQn6lttdT4Dt822MRL6fZNyjuKmg16pm0vkmxnvU5H1bik/9sFP4hoqVmS8F
 FFMwaJpdM/UI24LenG0XG2sxXSDQZbSKHGnSrdR/CNOZHPhvpeJhXq7ALQgp3CPq3HK6 lA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h25m7s09q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Jul 2022 18:25:24 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 261HkC8H003809;
 Fri, 1 Jul 2022 18:25:24 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h25m7s092-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Jul 2022 18:25:23 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 261ILJlP010791;
 Fri, 1 Jul 2022 18:25:22 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04wdc.us.ibm.com with ESMTP id 3gwt0akbct-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Jul 2022 18:25:22 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 261IPLPX14418546
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 1 Jul 2022 18:25:21 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 99B3C6A051;
 Fri,  1 Jul 2022 18:25:21 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F3B7D6A047;
 Fri,  1 Jul 2022 18:25:20 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.163.2.135])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  1 Jul 2022 18:25:20 +0000 (GMT)
Message-ID: <d2db16c27f7eca38a721c988fccdd0a0acb5ca87.camel@linux.ibm.com>
Subject: Re: [PATCH 05/12] pc-bios/s390-ccw/virtio-blkdev: Remove
 virtio_assume_scsi()
From: Eric Farman <farman@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org, Christian
 Borntraeger <borntraeger@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>, Janosch Frank
 <frankja@linux.ibm.com>
Date: Fri, 01 Jul 2022 14:25:20 -0400
In-Reply-To: <20220628131032.213986-6-thuth@redhat.com>
References: <20220628131032.213986-1-thuth@redhat.com>
 <20220628131032.213986-6-thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 71VCQ4I3wwk2j8pw2_-D0gnXlob_6fzW
X-Proofpoint-GUID: 9ULkLCmDlA0KLjSYwielOly5Wmib4SrW
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
> The virtio_assume_scsi() function is very questionable: First, it
> is only called for virtio-blk, and not for virtio-scsi, so the naming
> is already quite confusing. Second, it is called if we detected a
> "invalid" IPL disk, trying to fix it by blindly setting a sector
> size of 512. This of course won't work in most cases since disks
> might have a different sector size for a reason.
> 
> Thus let's remove this strange function now. The calling code can
> also be removed completely, since there is another spot in main.c
> that does "IPL_assert(virtio_ipl_disk_is_valid(), ...)" to make
> sure that we do not try to IPL from an invalid device.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Agreed.

Reviewed-by: Eric Farman <farman@linux.ibm.com>

> ---
>  pc-bios/s390-ccw/virtio.h        |  1 -
>  pc-bios/s390-ccw/virtio-blkdev.c | 24 ------------------------
>  2 files changed, 25 deletions(-)
> 
> diff --git a/pc-bios/s390-ccw/virtio.h b/pc-bios/s390-ccw/virtio.h
> index 8f917d47a9..303438f159 100644
> --- a/pc-bios/s390-ccw/virtio.h
> +++ b/pc-bios/s390-ccw/virtio.h
> @@ -182,7 +182,6 @@ enum guessed_disk_nature_type {
>  typedef enum guessed_disk_nature_type VirtioGDN;
>  
>  VirtioGDN virtio_guessed_disk_nature(void);
> -void virtio_assume_scsi(void);
>  void virtio_assume_eckd(void);
>  void virtio_assume_iso9660(void);
>  
> diff --git a/pc-bios/s390-ccw/virtio-blkdev.c b/pc-bios/s390-
> ccw/virtio-blkdev.c
> index b14cbc3d9e..11820754f3 100644
> --- a/pc-bios/s390-ccw/virtio-blkdev.c
> +++ b/pc-bios/s390-ccw/virtio-blkdev.c
> @@ -112,23 +112,6 @@ VirtioGDN virtio_guessed_disk_nature(void)
>      return virtio_get_device()->guessed_disk_nature;
>  }
>  
> -void virtio_assume_scsi(void)
> -{
> -    VDev *vdev = virtio_get_device();
> -
> -    switch (vdev->senseid.cu_model) {
> -    case VIRTIO_ID_BLOCK:
> -        vdev->guessed_disk_nature = VIRTIO_GDN_SCSI;
> -        vdev->config.blk.blk_size = VIRTIO_SCSI_BLOCK_SIZE;
> -        vdev->config.blk.physical_block_exp = 0;
> -        vdev->blk_factor = 1;
> -        break;
> -    case VIRTIO_ID_SCSI:
> -        vdev->scsi_block_size = VIRTIO_SCSI_BLOCK_SIZE;
> -        break;
> -    }
> -}
> -
>  void virtio_assume_iso9660(void)
>  {
>      VDev *vdev = virtio_get_device();
> @@ -247,13 +230,6 @@ int virtio_blk_setup_device(SubChannelId schid)
>      switch (vdev->senseid.cu_model) {
>      case VIRTIO_ID_BLOCK:
>          sclp_print("Using virtio-blk.\n");
> -        if (!virtio_ipl_disk_is_valid()) {
> -            /* make sure all getters but blocksize return 0 for
> -             * invalid IPL disk
> -             */
> -            memset(&vdev->config.blk, 0, sizeof(vdev->config.blk));
> -            virtio_assume_scsi();
> -        }
>          break;
>      case VIRTIO_ID_SCSI:
>          IPL_assert(vdev->config.scsi.sense_size ==
> VIRTIO_SCSI_SENSE_SIZE,


