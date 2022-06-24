Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD5055965F
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 11:24:04 +0200 (CEST)
Received: from localhost ([::1]:55178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4fXn-0002xB-9T
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 05:24:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1o4fUc-0008M1-K3; Fri, 24 Jun 2022 05:20:47 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:37188
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1o4fUa-0005Gk-Mj; Fri, 24 Jun 2022 05:20:46 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25O7qFu7028757;
 Fri, 24 Jun 2022 09:20:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=v+fGv+XcgcoNFZNNJpVWw4arI2S1yVLgFw6WqLhyUx0=;
 b=Ftr7Z7ZtqH8HosKbbg7EBC4a4NQmQFWOC6F3mCXJ33OrQpZi4hNj1pxYB+mHAT2nIQ4+
 Y1AO3fWlDqSnrmFn9N9Ow9fIjE6FiCQtGSUJjp8k+cFJWWkSMnQDpr7wmQ8MIqnb99ZO
 Rxt1d6C5wgNdkyfj+zo3LrvFN415bSHlvt0c9H9cl6X2xpCgvGWS/blVPRgu+FCHon/Q
 DRGd6HZW9N3i7BplGn7RpJ/P2f+4MYV6vWP1clYzVWrL5ZpB+VqP3QrG91M+fwYF8o6Q
 Db1QOINewNUhPC3X8g662awMF2hGFxUnAtaxVO4fHE/D9I6Emz+KQcsaeD9Gb28nRImm Fw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gw98sa1k6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jun 2022 09:20:41 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25O8kOHW008423;
 Fri, 24 Jun 2022 09:20:40 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gw98sa1jm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jun 2022 09:20:40 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25O9K7Wx009979;
 Fri, 24 Jun 2022 09:20:38 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3gs6b98r1w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jun 2022 09:20:38 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25O9Kava14287350
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Jun 2022 09:20:36 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8AA9B52050;
 Fri, 24 Jun 2022 09:20:36 +0000 (GMT)
Received: from [9.171.24.107] (unknown [9.171.24.107])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 5031D52052;
 Fri, 24 Jun 2022 09:20:36 +0000 (GMT)
Message-ID: <fe1d0e25-b582-0220-db7e-c69df5460f51@linux.ibm.com>
Date: Fri, 24 Jun 2022 11:20:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] pc-bios/s390-ccw/virtio-blkdev: Simplify/fix
 virtio_ipl_disk_is_valid()
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Eric Farman <farman@linux.ibm.com>
Cc: qemu-devel@nongnu.org
References: <20220624085037.612235-1-thuth@redhat.com>
 <20220624085037.612235-2-thuth@redhat.com>
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <20220624085037.612235-2-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ZLLAMddaNjRZ2_bzRXYsxzMyORq2ySMb
X-Proofpoint-GUID: eFWp_ZQMgH6NhA3Ctq1ya2FpDkbhAVsm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-24_05,2022-06-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 mlxscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206240035
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



Am 24.06.22 um 10:50 schrieb Thomas Huth:
> The s390-ccw bios fails to boot if the boot disk is a virtio-blk
> disk with a sector size of 4096. For example:
> 
>   dasdfmt -b 4096 -d cdl -y -p -M quick /dev/dasdX
>   fdasd -a /dev/dasdX
>   install a guest onto /dev/dasdX1 using virtio-blk
>   qemu-system-s390x -nographic -hda /dev/dasdX1

Interestingly enough a real DASD (dasdX and not dasdX1) did work in the
past and I also successfully uses an NVMe disk. So I guess the NVMe
was 512 byte sector size then?

> 
> The bios then bails out with:
> 
>   ! Cannot read block 0 !
> 
> Looking at virtio_ipl_disk_is_valid() and especially the function
> virtio_disk_is_scsi(), it does not really make sense that we expect
> only such a limited disk geometry (like a block size of 512) for
> out boot disks. Let's relax the check and allow everything that
> remotely looks like a sane disk.

I agree that we should accept as much list-directed IPL formats as possible.
I have not fully looked into your changes though.

> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   pc-bios/s390-ccw/virtio.h        |  2 --
>   pc-bios/s390-ccw/virtio-blkdev.c | 41 ++++++--------------------------
>   2 files changed, 7 insertions(+), 36 deletions(-)
> 
> diff --git a/pc-bios/s390-ccw/virtio.h b/pc-bios/s390-ccw/virtio.h
> index 19fceb6495..07fdcabd9f 100644
> --- a/pc-bios/s390-ccw/virtio.h
> +++ b/pc-bios/s390-ccw/virtio.h
> @@ -186,8 +186,6 @@ void virtio_assume_scsi(void);
>   void virtio_assume_eckd(void);
>   void virtio_assume_iso9660(void);
>   
> -extern bool virtio_disk_is_scsi(void);
> -extern bool virtio_disk_is_eckd(void);
>   extern bool virtio_ipl_disk_is_valid(void);
>   extern int virtio_get_block_size(void);
>   extern uint8_t virtio_get_heads(void);
> diff --git a/pc-bios/s390-ccw/virtio-blkdev.c b/pc-bios/s390-ccw/virtio-blkdev.c
> index 7d35050292..b5506bb29d 100644
> --- a/pc-bios/s390-ccw/virtio-blkdev.c
> +++ b/pc-bios/s390-ccw/virtio-blkdev.c
> @@ -166,46 +166,19 @@ void virtio_assume_eckd(void)
>           virtio_eckd_sectors_for_block_size(vdev->config.blk.blk_size);
>   }
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
>   {
> +    int blksize = virtio_get_block_size();
>       VDev *vdev = virtio_get_device();
> -    const int block_size = virtio_get_block_size();
>   
> -    if (vdev->guessed_disk_nature == VIRTIO_GDN_DASD) {
> +    if (vdev->guessed_disk_nature == VIRTIO_GDN_SCSI ||
> +        vdev->guessed_disk_nature == VIRTIO_GDN_DASD) {
>           return true;
>       }
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
>   }
>   
>   int virtio_get_block_size(void)

