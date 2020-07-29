Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9442325A4
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jul 2020 21:50:44 +0200 (CEST)
Received: from localhost ([::1]:57124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0s67-0001sy-R8
	for lists+qemu-devel@lfdr.de; Wed, 29 Jul 2020 15:50:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1k0s4c-0000y5-Hj; Wed, 29 Jul 2020 15:49:10 -0400
Received: from charlie.dont.surf ([128.199.63.193]:34376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1k0s4a-0007Cv-25; Wed, 29 Jul 2020 15:49:09 -0400
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 01FA3BF616;
 Wed, 29 Jul 2020 19:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=irrelevant.dk;
 s=default; t=1596052146;
 bh=MUXiPLFvbtuvfjUyGSrKL7mRq5KyT6L0hWe3CilnIe4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Pho4LhrMZfnS+c6l1jUGtQcnkd2SoAABJIGr67YzIk7aq352b4GPqwjQzYeZrxUf5
 ei6RTMBhcGXyQiBFcZyFZLJ2G3CmonzlZNrELAa758POXFHHO0GjUa93XIE/1kuJ7s
 70R07HwopbNqRTM6ORHSbfW5zy6ODS46SuZjuDzFwxy+BN7OWE849bvzs5zkvR83qo
 YgMiqLS7imy4nNgZkvkWZjVWgG9HIPeII1VBYBM0VnBrtvUpMiUwbabBBgb8BAZPse
 bOqXIIojh8BA+tDpqjc5eM4QaGU8kqVeBtDxh01j1NEz36yEjTgfyRj0zqNNYFbiUs
 KF8mHz+0McRLQ==
Date: Wed, 29 Jul 2020 21:49:04 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [PATCH 14/16] hw/block/nvme: consolidate qsg/iov clearing
Message-ID: <20200729194904.GB293496@apples.localdomain>
References: <20200720113748.322965-1-its@irrelevant.dk>
 <20200720113748.322965-15-its@irrelevant.dk>
 <c0b8260ac277f6a3ec5ef21c10abcf9a47e146e1.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c0b8260ac277f6a3ec5ef21c10abcf9a47e146e1.camel@redhat.com>
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/29 14:23:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Jul 29 21:18, Maxim Levitsky wrote:
> On Mon, 2020-07-20 at 13:37 +0200, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> > 
> > Always destroy the request qsg/iov at the end of request use.
> > 
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >  hw/block/nvme.c | 48 +++++++++++++++++-------------------------------
> >  1 file changed, 17 insertions(+), 31 deletions(-)
> > 
> > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > index 54cd20f1ce22..b53afdeb3fb6 100644
> > --- a/hw/block/nvme.c
> > +++ b/hw/block/nvme.c
> > @@ -213,6 +213,14 @@ static void nvme_req_clear(NvmeRequest *req)
> >  {
> >      req->ns = NULL;
> >      memset(&req->cqe, 0x0, sizeof(req->cqe));
> > +
> > +    if (req->qsg.sg) {
> > +        qemu_sglist_destroy(&req->qsg);
> > +    }
> > +
> > +    if (req->iov.iov) {
> > +        qemu_iovec_destroy(&req->iov);
> > +    }
> >  }
> >  
> >  static uint16_t nvme_map_addr_cmb(NvmeCtrl *n, QEMUIOVector *iov, hwaddr addr,
> > @@ -297,15 +305,14 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, QEMUSGList *qsg, QEMUIOVector *iov,
> >  
> >      status = nvme_map_addr(n, qsg, iov, prp1, trans_len);
> >      if (status) {
> > -        goto unmap;
> > +        return status;
> >      }
> >  
> >      len -= trans_len;
> >      if (len) {
> >          if (unlikely(!prp2)) {
> >              trace_pci_nvme_err_invalid_prp2_missing();
> > -            status = NVME_INVALID_FIELD | NVME_DNR;
> > -            goto unmap;
> > +            return NVME_INVALID_FIELD | NVME_DNR;
> >          }
> >  
> >          if (len > n->page_size) {
> > @@ -326,13 +333,11 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, QEMUSGList *qsg, QEMUIOVector *iov,
> >                  if (i == n->max_prp_ents - 1 && len > n->page_size) {
> >                      if (unlikely(!prp_ent || prp_ent & (n->page_size - 1))) {
> >                          trace_pci_nvme_err_invalid_prplist_ent(prp_ent);
> > -                        status = NVME_INVALID_FIELD | NVME_DNR;
> > -                        goto unmap;
> > +                        return NVME_INVALID_FIELD | NVME_DNR;
> >                      }
> >  
> >                      if (prp_list_in_cmb != nvme_addr_is_cmb(n, prp_ent)) {
> > -                        status = NVME_INVALID_USE_OF_CMB | NVME_DNR;
> > -                        goto unmap;
> > +                        return NVME_INVALID_USE_OF_CMB | NVME_DNR;
> >                      }
> >  
> >                      i = 0;
> > @@ -345,14 +350,13 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, QEMUSGList *qsg, QEMUIOVector *iov,
> >  
> >                  if (unlikely(!prp_ent || prp_ent & (n->page_size - 1))) {
> >                      trace_pci_nvme_err_invalid_prplist_ent(prp_ent);
> > -                    status = NVME_INVALID_FIELD | NVME_DNR;
> > -                    goto unmap;
> > +                    return NVME_INVALID_FIELD | NVME_DNR;
> >                  }
> >  
> >                  trans_len = MIN(len, n->page_size);
> >                  status = nvme_map_addr(n, qsg, iov, prp_ent, trans_len);
> >                  if (status) {
> > -                    goto unmap;
> > +                    return status;
> >                  }
> >  
> >                  len -= trans_len;
> > @@ -361,27 +365,16 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, QEMUSGList *qsg, QEMUIOVector *iov,
> >          } else {
> >              if (unlikely(prp2 & (n->page_size - 1))) {
> >                  trace_pci_nvme_err_invalid_prp2_align(prp2);
> > -                status = NVME_INVALID_FIELD | NVME_DNR;
> > -                goto unmap;
> > +                return NVME_INVALID_FIELD | NVME_DNR;
> >              }
> >              status = nvme_map_addr(n, qsg, iov, prp2, len);
> >              if (status) {
> > -                goto unmap;
> > +                return status;
> >              }
> >          }
> >      }
> > +
> >      return NVME_SUCCESS;
> > -
> > -unmap:
> > -    if (iov && iov->iov) {
> > -        qemu_iovec_destroy(iov);
> > -    }
> > -
> > -    if (qsg && qsg->sg) {
> > -        qemu_sglist_destroy(qsg);
> > -    }
> > -
> > -    return status;
> >  }
> >  
> >  static uint16_t nvme_dma_prp(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
> > @@ -601,13 +594,6 @@ static void nvme_rw_cb(void *opaque, int ret)
> >          req->status = NVME_INTERNAL_DEV_ERROR;
> >      }
> >  
> > -    if (req->qsg.nalloc) {
> > -        qemu_sglist_destroy(&req->qsg);
> > -    }
> > -    if (req->iov.nalloc) {
> > -        qemu_iovec_destroy(&req->iov);
> > -    }
> > -
> >      nvme_enqueue_req_completion(cq, req);
> >  }
> >  
> 
> This and former patch I guess answer my own question about why to clear the request after its cqe got posted.
> 
> Looks reasonable.
> 

I ended up with a compromise. I keep clearing as a "before-use" job, but
we don't want to keep the qsg and iovs hanging around until the request
gets reused, so I'm adding a nvme_req_exit() to free that memory when
the cqe has been posted.

