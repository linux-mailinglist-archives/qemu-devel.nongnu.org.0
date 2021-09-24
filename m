Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7AA416C70
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 08:58:20 +0200 (CEST)
Received: from localhost ([::1]:39256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTfA1-0000VD-UJ
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 02:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1mTf2M-0000pq-Rk; Fri, 24 Sep 2021 02:50:22 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:28072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1mTf2I-0003mQ-CR; Fri, 24 Sep 2021 02:50:22 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18O5lT6o021689; 
 Fri, 24 Sep 2021 02:50:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=unzCWSFY66CE0AZ6DkhJayoErZQFvC34wCeg7jhgO14=;
 b=J6LPt7RAr3g++kas7f6oJG+kAn+3Lqe7m9/62Tg/jjRhc2uBKuJUbbFXST5wbw12k/Wj
 IamxWA29LxQlaDF9qOW8L9XK4l3ZY2pPBmgg47V4vGl/bXp0ikuMFISvJzkbZCAN/rfA
 y+5S2VYW5ZPUKrLxmHWGJL2G+1ReXlE8l9dAL8TK9bybwYJ7DXgR95055aAGZ4oXYaab
 yzONoOm9AHmMsuUMBa+0TB9D4N+H0brg5RkGgwcZiDa9Jp1h5wqa9y2iMHsYyHqDbwlh
 yRbNkUFEhJQQemE7zvA8PVDaeos176MwZHQdtZpFSRkjnk2FQFGaYOvBjjDQF24aQsGT KQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b95xk4nxx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Sep 2021 02:50:12 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18O6oBKN005279;
 Fri, 24 Sep 2021 02:50:11 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b95xk4nwx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Sep 2021 02:50:11 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18O6m36Y010931;
 Fri, 24 Sep 2021 06:50:08 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 3b93g7jfju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Sep 2021 06:50:08 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18O6o6dR64946600
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Sep 2021 06:50:06 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E03D8A4069;
 Fri, 24 Sep 2021 06:50:05 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 67C6FA4055;
 Fri, 24 Sep 2021 06:50:05 +0000 (GMT)
Received: from li-43c5434c-23b8-11b2-a85c-c4958fb47a68.ibm.com (unknown
 [9.171.54.254])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 24 Sep 2021 06:50:05 +0000 (GMT)
Subject: Re: [PATCH] block: introduce max_hw_iov for use in scsi-generic
To: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <michael.roth@amd.com>
References: <20210923130436.1187591-1-pbonzini@redhat.com>
 <5ab3b92b-92ef-e13d-4ec0-f73bec5a3782@de.ibm.com>
 <CABgObfabAj_AyFAr0kXa5tXntpBXBfXxf+mB=Ocbg=jUh5FMzA@mail.gmail.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <83191438-a91d-55d2-233f-ae87b99e29bc@de.ibm.com>
Date: Fri, 24 Sep 2021 08:50:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <CABgObfabAj_AyFAr0kXa5tXntpBXBfXxf+mB=Ocbg=jUh5FMzA@mail.gmail.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ISTkzLFygOss5h5FKkciUwhz1z-rk1O4
X-Proofpoint-ORIG-GUID: Xf6YH-NwH4-zN2xqmzoGPKlBq10jDhRT
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-24_02,2021-09-23_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0
 mlxscore=0 mlxlogscore=999 clxscore=1011 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2109240036
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Halil Pasic <pasic@linux.ibm.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter, Michael,

do we still do stable releases for QEMU or has this stopped?

Am 24.09.21 um 07:27 schrieb Paolo Bonzini:
> Yes, the question is whether it still exists... Paolo El jue., 23 sept. 2021 16:48, Christian Borntraeger <borntraeger@de.ibm.com> escribió: Am 23.09.21 um 15:04 schrieb Paolo Bonzini: > Linux limits the size of iovecs to 1024 (UIO_MAXIOV ZjQcmQRYFpfptBannerStart
> This Message Is From an External Sender
> This message came from outside your organization.
> ZjQcmQRYFpfptBannerEnd
> Yes, the question is whether it still exists...
> 
> Paolo
> 
> El jue., 23 sept. 2021 16:48, Christian Borntraeger <borntraeger@de.ibm.com <mailto:borntraeger@de.ibm.com>> escribió:
> 
> 
> 
>     Am 23.09.21 um 15:04 schrieb Paolo Bonzini:
>      > Linux limits the size of iovecs to 1024 (UIO_MAXIOV in the kernel
>      > sources, IOV_MAX in POSIX).  Because of this, on some host adapters
>      > requests with many iovecs are rejected with -EINVAL by the
>      > io_submit() or readv()/writev() system calls.
>      >
>      > In fact, the same limit applies to SG_IO as well.  To fix both the
>      > EINVAL and the possible performance issues from using fewer iovecs
>      > than allowed by Linux (some HBAs have max_segments as low as 128),
>      > introduce a separate entry in BlockLimits to hold the max_segments
>      > value from sysfs.  This new limit is used only for SG_IO and clamped
>      > to bs->bl.max_iov anyway, just like max_hw_transfer is clamped to
>      > bs->bl.max_transfer.
>      >
>      > Reported-by: Halil Pasic <pasic@linux.ibm.com <mailto:pasic@linux.ibm.com>>
>      > Cc: Hanna Reitz <hreitz@redhat.com <mailto:hreitz@redhat.com>>
>      > Cc: Kevin Wolf <kwolf@redhat.com <mailto:kwolf@redhat.com>>
>      > Cc: qemu-block@nongnu.org <mailto:qemu-block@nongnu.org>
>      > Fixes: 18473467d5 ("file-posix: try BLKSECTGET on block devices too, do not round to power of 2", 2021-06-25)
> 
>     This sneaked in shortly before the 6.1 release (between rc0 and rc1 I think).
>     Shouldnt that go to stable in cass this still exist?
> 
> 
>      > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com <mailto:pbonzini@redhat.com>>
>      > ---
>      >   block/block-backend.c          | 6 ++++++
>      >   block/file-posix.c             | 2 +-
>      >   block/io.c                     | 1 +
>      >   hw/scsi/scsi-generic.c         | 2 +-
>      >   include/block/block_int.h      | 7 +++++++
>      >   include/sysemu/block-backend.h | 1 +
>      >   6 files changed, 17 insertions(+), 2 deletions(-)
>      >
>      > diff --git a/block/block-backend.c b/block/block-backend.c
>      > index 6140d133e2..ba2b5ebb10 100644
>      > --- a/block/block-backend.c
>      > +++ b/block/block-backend.c
>      > @@ -1986,6 +1986,12 @@ uint32_t blk_get_max_transfer(BlockBackend *blk)
>      >       return ROUND_DOWN(max, blk_get_request_alignment(blk));
>      >   }
>      >
>      > +int blk_get_max_hw_iov(BlockBackend *blk)
>      > +{
>      > +    return MIN_NON_ZERO(blk->root->bs->bl.max_hw_iov,
>      > +                        blk->root->bs->bl.max_iov);
>      > +}
>      > +
>      >   int blk_get_max_iov(BlockBackend *blk)
>      >   {
>      >       return blk->root->bs->bl.max_iov;
>      > diff --git a/block/file-posix.c b/block/file-posix.c
>      > index cb9bffe047..1567edb3d5 100644
>      > --- a/block/file-posix.c
>      > +++ b/block/file-posix.c
>      > @@ -1273,7 +1273,7 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>      >
>      >           ret = hdev_get_max_segments(s->fd, &st);
>      >           if (ret > 0) {
>      > -            bs->bl.max_iov = ret;
>      > +            bs->bl.max_hw_iov = ret;
>      >           }
>      >       }
>      >   }
>      > diff --git a/block/io.c b/block/io.c
>      > index a19942718b..f38e7f81d8 100644
>      > --- a/block/io.c
>      > +++ b/block/io.c
>      > @@ -136,6 +136,7 @@ static void bdrv_merge_limits(BlockLimits *dst, const BlockLimits *src)
>      >       dst->min_mem_alignment = MAX(dst->min_mem_alignment,
>      >                                    src->min_mem_alignment);
>      >       dst->max_iov = MIN_NON_ZERO(dst->max_iov, src->max_iov);
>      > +    dst->max_hw_iov = MIN_NON_ZERO(dst->max_hw_iov, src->max_hw_iov);
>      >   }
>      >
>      >   typedef struct BdrvRefreshLimitsState {
>      > diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
>      > index 665baf900e..0306ccc7b1 100644
>      > --- a/hw/scsi/scsi-generic.c
>      > +++ b/hw/scsi/scsi-generic.c
>      > @@ -180,7 +180,7 @@ static int scsi_handle_inquiry_reply(SCSIGenericReq *r, SCSIDevice *s, int len)
>      >           page = r->req.cmd.buf[2];
>      >           if (page == 0xb0) {
>      >               uint64_t max_transfer = blk_get_max_hw_transfer(s->conf.blk);
>      > -            uint32_t max_iov = blk_get_max_iov(s->conf.blk);
>      > +            uint32_t max_iov = blk_get_max_hw_iov(s->conf.blk);
>      >
>      >               assert(max_transfer);
>      >               max_transfer = MIN_NON_ZERO(max_transfer, max_iov * qemu_real_host_page_size)
>      > diff --git a/include/block/block_int.h b/include/block/block_int.h
>      > index f1a54db0f8..c31cbd034a 100644
>      > --- a/include/block/block_int.h
>      > +++ b/include/block/block_int.h
>      > @@ -702,6 +702,13 @@ typedef struct BlockLimits {
>      >        */
>      >       uint64_t max_hw_transfer;
>      >
>      > +    /* Maximal number of scatter/gather elements allowed by the hardware.
>      > +     * Applies whenever transfers to the device bypass the kernel I/O
>      > +     * scheduler, for example with SG_IO.  If larger than max_iov
>      > +     * or if zero, blk_get_max_hw_iov will fall back to max_iov.
>      > +     */
>      > +    int max_hw_iov;
>      > +
>      >       /* memory alignment, in bytes so that no bounce buffer is needed */
>      >       size_t min_mem_alignment;
>      >
>      > diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
>      > index 29d4fdbf63..82bae55161 100644
>      > --- a/include/sysemu/block-backend.h
>      > +++ b/include/sysemu/block-backend.h
>      > @@ -211,6 +211,7 @@ uint32_t blk_get_request_alignment(BlockBackend *blk);
>      >   uint32_t blk_get_max_transfer(BlockBackend *blk);
>      >   uint64_t blk_get_max_hw_transfer(BlockBackend *blk);
>      >   int blk_get_max_iov(BlockBackend *blk);
>      > +int blk_get_max_hw_iov(BlockBackend *blk);
>      >   void blk_set_guest_block_size(BlockBackend *blk, int align);
>      >   void *blk_try_blockalign(BlockBackend *blk, size_t size);
>      >   void *blk_blockalign(BlockBackend *blk, size_t size);
>      >
> 

