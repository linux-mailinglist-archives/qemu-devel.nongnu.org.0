Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79640416108
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 16:30:32 +0200 (CEST)
Received: from localhost ([::1]:50720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTPk4-0006pZ-LF
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 10:30:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mTPib-000604-BR; Thu, 23 Sep 2021 10:28:57 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:11496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mTPiM-0002dO-Qu; Thu, 23 Sep 2021 10:28:57 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18NE202w017201; 
 Thu, 23 Sep 2021 10:28:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=9Ad0GDhOn7F2pIIIA8DQ4m/oqyDiJo6NEpzF1Gk+chk=;
 b=O2+nu2s+03g/Gmi+RUICA6r3p0DxhzrrCVVeTTYM3pd9JKH/0w7JTspGwnoS39xneHag
 n7CRX/v4/mlcocq8Bka0L+LDF8YI2FpHkUtfGANNM1VrqcqZAqDc+45WMdX5Hq3lAoEh
 scLd+2ICVhPLj0VuspJuR/641pbItRKQIyHSiuebVthJjiUzOQVTXWHZJ2B4I3Mcc5HI
 a3yBOCpYHItxPM4MVI8J9q2vpx6wH9pEbw2VAw+iUFX1fb1vxn+DrKUZju4tW8vkuJCK
 Y6yQMTCPewiAqsCqpP84GCvDE6KYMdIPPHDNE8C+c/0s3ic8GCpX6lhhokTP9TIRSxfo sw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b8tyfrr11-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Sep 2021 10:28:39 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18NE4QJ1027700;
 Thu, 23 Sep 2021 10:28:39 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b8tyfrr06-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Sep 2021 10:28:39 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18NEC8T2003289;
 Thu, 23 Sep 2021 14:28:36 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3b7q6q3kbc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Sep 2021 14:28:36 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 18NENiud51708374
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Sep 2021 14:23:44 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F20CAE063;
 Thu, 23 Sep 2021 14:28:34 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 95835AE051;
 Thu, 23 Sep 2021 14:28:33 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.13.138])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 23 Sep 2021 14:28:33 +0000 (GMT)
Date: Thu, 23 Sep 2021 16:28:11 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] block: introduce max_hw_iov for use in scsi-generic
Message-ID: <20210923162811.3ab68c5f.pasic@linux.ibm.com>
In-Reply-To: <20210923130436.1187591-1-pbonzini@redhat.com>
References: <20210923130436.1187591-1-pbonzini@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: F0Z8S_MQwyLKoyxIufsdanQzT13343u6
X-Proofpoint-ORIG-GUID: P2FkhW504qZbQtRiZv24oeyxmJsKV_eE
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-23_04,2021-09-23_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 adultscore=0 clxscore=1015 malwarescore=0 mlxscore=0 suspectscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109200000 definitions=main-2109230089
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 23 Sep 2021 09:04:36 -0400
Paolo Bonzini <pbonzini@redhat.com> wrote:

> Linux limits the size of iovecs to 1024 (UIO_MAXIOV in the kernel
> sources, IOV_MAX in POSIX).  Because of this, on some host adapters
> requests with many iovecs are rejected with -EINVAL by the
> io_submit() or readv()/writev() system calls.
> 
> In fact, the same limit applies to SG_IO as well.  To fix both the
> EINVAL and the possible performance issues from using fewer iovecs
> than allowed by Linux (some HBAs have max_segments as low as 128),
> introduce a separate entry in BlockLimits to hold the max_segments
> value from sysfs.  This new limit is used only for SG_IO and clamped
> to bs->bl.max_iov anyway, just like max_hw_transfer is clamped to
> bs->bl.max_transfer.

Doesn't this patch render bs->bl.max_iov a constant?

$ git grep -p -e 'bl\(.\|->\)max_iov'
block/block-backend.c=int blk_get_max_iov(BlockBackend *blk)
block/block-backend.c:    return blk->root->bs->bl.max_iov;
block/file-posix.c=static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
block/file-posix.c:            bs->bl.max_iov = ret;
block/io.c=void bdrv_refresh_limits(BlockDriverState *bs, Transaction *tran, Error **errp)
block/io.c:        bs->bl.max_iov = IOV_MAX;
block/mirror.c=static int coroutine_fn mirror_run(Job *job, Error **errp)
block/mirror.c:    s->max_iov = MIN(bs->bl.max_iov, target_bs->bl.max_iov);

Can't we use some of the established constants instead of hard coding a
qemu specific IOV_MAX?

POSIX.1 seems to guarantee the availability of IOV_MAX in <limits.h>
according to: https://man7.org/linux/man-pages/man2/readv.2.html
and <sys/uio.h> may have UIO_MAXIOV defined.

> 
> Reported-by: Halil Pasic <pasic@linux.ibm.com>
> Cc: Hanna Reitz <hreitz@redhat.com>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: qemu-block@nongnu.org
> Fixes: 18473467d5 ("file-posix: try BLKSECTGET on block devices too, do not round to power of 2", 2021-06-25)
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/block-backend.c          | 6 ++++++
>  block/file-posix.c             | 2 +-
>  block/io.c                     | 1 +
>  hw/scsi/scsi-generic.c         | 2 +-
>  include/block/block_int.h      | 7 +++++++
>  include/sysemu/block-backend.h | 1 +
>  6 files changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/block/block-backend.c b/block/block-backend.c
> index 6140d133e2..ba2b5ebb10 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -1986,6 +1986,12 @@ uint32_t blk_get_max_transfer(BlockBackend *blk)
>      return ROUND_DOWN(max, blk_get_request_alignment(blk));
>  }
>  
> +int blk_get_max_hw_iov(BlockBackend *blk)
> +{
> +    return MIN_NON_ZERO(blk->root->bs->bl.max_hw_iov,
> +                        blk->root->bs->bl.max_iov);
> +}
> +
>  int blk_get_max_iov(BlockBackend *blk)
>  {
>      return blk->root->bs->bl.max_iov;
> diff --git a/block/file-posix.c b/block/file-posix.c
> index cb9bffe047..1567edb3d5 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1273,7 +1273,7 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>  
>          ret = hdev_get_max_segments(s->fd, &st);
>          if (ret > 0) {
> -            bs->bl.max_iov = ret;
> +            bs->bl.max_hw_iov = ret;
>          }
>      }
>  }
> diff --git a/block/io.c b/block/io.c
> index a19942718b..f38e7f81d8 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -136,6 +136,7 @@ static void bdrv_merge_limits(BlockLimits *dst, const BlockLimits *src)
>      dst->min_mem_alignment = MAX(dst->min_mem_alignment,
>                                   src->min_mem_alignment);
>      dst->max_iov = MIN_NON_ZERO(dst->max_iov, src->max_iov);
> +    dst->max_hw_iov = MIN_NON_ZERO(dst->max_hw_iov, src->max_hw_iov);
>  }
>  
>  typedef struct BdrvRefreshLimitsState {
> diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
> index 665baf900e..0306ccc7b1 100644
> --- a/hw/scsi/scsi-generic.c
> +++ b/hw/scsi/scsi-generic.c
> @@ -180,7 +180,7 @@ static int scsi_handle_inquiry_reply(SCSIGenericReq *r, SCSIDevice *s, int len)
>          page = r->req.cmd.buf[2];
>          if (page == 0xb0) {
>              uint64_t max_transfer = blk_get_max_hw_transfer(s->conf.blk);
> -            uint32_t max_iov = blk_get_max_iov(s->conf.blk);
> +            uint32_t max_iov = blk_get_max_hw_iov(s->conf.blk);
>  
>              assert(max_transfer);
>              max_transfer = MIN_NON_ZERO(max_transfer, max_iov * qemu_real_host_page_size)
> diff --git a/include/block/block_int.h b/include/block/block_int.h
> index f1a54db0f8..c31cbd034a 100644
> --- a/include/block/block_int.h
> +++ b/include/block/block_int.h
> @@ -702,6 +702,13 @@ typedef struct BlockLimits {
>       */
>      uint64_t max_hw_transfer;
>  
> +    /* Maximal number of scatter/gather elements allowed by the hardware.
> +     * Applies whenever transfers to the device bypass the kernel I/O
> +     * scheduler, for example with SG_IO.  If larger than max_iov
> +     * or if zero, blk_get_max_hw_iov will fall back to max_iov.
> +     */
> +    int max_hw_iov;
> +
>      /* memory alignment, in bytes so that no bounce buffer is needed */
>      size_t min_mem_alignment;
>  
> diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
> index 29d4fdbf63..82bae55161 100644
> --- a/include/sysemu/block-backend.h
> +++ b/include/sysemu/block-backend.h
> @@ -211,6 +211,7 @@ uint32_t blk_get_request_alignment(BlockBackend *blk);
>  uint32_t blk_get_max_transfer(BlockBackend *blk);
>  uint64_t blk_get_max_hw_transfer(BlockBackend *blk);
>  int blk_get_max_iov(BlockBackend *blk);
> +int blk_get_max_hw_iov(BlockBackend *blk);
>  void blk_set_guest_block_size(BlockBackend *blk, int align);
>  void *blk_try_blockalign(BlockBackend *blk, size_t size);
>  void *blk_blockalign(BlockBackend *blk, size_t size);


