Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7198C318CF9
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 15:10:46 +0100 (CET)
Received: from localhost ([::1]:59852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lACg6-00010I-Pq
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 09:10:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lACLR-00023q-5P; Thu, 11 Feb 2021 08:49:21 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:41183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lACLO-0003dJ-CB; Thu, 11 Feb 2021 08:49:20 -0500
Received: by mail-pf1-x432.google.com with SMTP id q20so3724077pfu.8;
 Thu, 11 Feb 2021 05:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=gffmh44fqUFF2qUgEH9CQz4oYc3qY1f+mQpH2/npVQk=;
 b=cDYSbkXJ/s/Ynr2D6dNWmMSHb+7Yp2sIO4FpIBtjbNjTqBN9kpbUifPY1CLGLJ8KYd
 l3ic2+PIfkEzJkIrnsT8dMXoczcdWKq3TcPzPBOO0WJQpghmBSzEkdHlZE8w1CTuSGXA
 dqtmLkYelDxQzw9WOtl2WMrjtp7R4+V4rg2TvYeTkTY2ld49zOstviRQFyQ8pS91HlnZ
 tNkSdZhFJ3wXIWiUn4Io7HxTx/lelI5ppttDu1hlnOqzV9ve2DZ1mAQ9PdEUWnWlVDTI
 o08b2rcGCXSRkHDq+CneK4YyPgAJAIV+Djkk1uPwOewMs1OTRmSt+5vL66LuYq3c1RMs
 VQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gffmh44fqUFF2qUgEH9CQz4oYc3qY1f+mQpH2/npVQk=;
 b=mjS9XPGLh0t4so71b3PMFLGH3ThIwsPKw5GCMG7b7WzUsVUfZcj65jIPl6V5uNLxwM
 ubV6jEGTzcedBlfvNIPJKJOjVlSW2YdQfzqB8MCkn4g9nx+TvxXOCcJmgy6NgWJP113Z
 ifmS7cP/CGHKZ7VfJeHGZ5oxZhY/Aj6ugqrrKXJNClt1F1KlCvKfLHW5vDvzIwZDYMqo
 BEKDz6G7gdeFEFDvHiJG66PnDLRTyXisBIfF9frR2EFokH4dmDNUxiFe9j76cHsokvdX
 0pfYluZdpiOIB/kmEtb9jBA8TRTfqMphKQuUp2KG3GTXa0GDUoNY26BTUGTXgK/g9B0K
 SD8A==
X-Gm-Message-State: AOAM531KJrJgP2UZ+tX4Z3NfMz+I27mljWuDQRQDw8ihDvz5dj2BIL0/
 a3UoB9JpmDhKpUl+OvOCqBw=
X-Google-Smtp-Source: ABdhPJyzgJxrralPhv5Iu37+pIo69wkm+S13350tjyHqMUAfdUzXf0PPKgrZgr5Xj2RjFAewKBd19w==
X-Received: by 2002:a63:2214:: with SMTP id i20mr8016576pgi.189.1613051356259; 
 Thu, 11 Feb 2021 05:49:16 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id x20sm4852559pfi.115.2021.02.11.05.49.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 11 Feb 2021 05:49:15 -0800 (PST)
Date: Thu, 11 Feb 2021 22:49:13 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH] hw/block/nvme: drain namespaces on sq deletion
Message-ID: <20210211134913.GJ24885@localhost.localdomain>
References: <20210127131505.394550-1-its@irrelevant.dk>
 <20210211024902.GA24885@localhost.localdomain>
 <YCUd7IT28icjAV07@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YCUd7IT28icjAV07@apples.localdomain>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-02-11 13:07:08, Klaus Jensen wrote:
> On Feb 11 11:49, Minwoo Im wrote:
> > On 21-01-27 14:15:05, Klaus Jensen wrote:
> > > From: Klaus Jensen <k.jensen@samsung.com>
> > > 
> > > For most commands, when issuing an AIO, the BlockAIOCB is stored in the
> > > NvmeRequest aiocb pointer when the AIO is issued. The purpose of storing
> > > this is to allow the AIO to be cancelled when deleting submission
> > > queues (it is currently not used for Abort).
> > > 
> > > Since the addition of the Dataset Management command and Zoned
> > > Namespaces, NvmeRequests may involve more than one AIO and the AIOs are
> > > issued without saving a reference to the BlockAIOCB. This is a problem
> > > since nvme_del_sq will attempt to cancel outstanding AIOs, potentially
> > > with an invalid BlockAIOCB.
> > > 
> > > Fix this by instead of explicitly cancelling the requests, just allow
> > > the AIOs to complete by draining the namespace blockdevs.
> > > 
> > > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > > ---
> > >  hw/block/nvme.c | 18 +++++++++++++-----
> > >  1 file changed, 13 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > > index 316858fd8adf..91f6fb6da1e2 100644
> > > --- a/hw/block/nvme.c
> > > +++ b/hw/block/nvme.c
> > > @@ -403,6 +403,7 @@ static void nvme_req_clear(NvmeRequest *req)
> > >  {
> > >      req->ns = NULL;
> > >      req->opaque = NULL;
> > > +    req->aiocb = NULL;
> > >      memset(&req->cqe, 0x0, sizeof(req->cqe));
> > >      req->status = NVME_SUCCESS;
> > >  }
> > > @@ -2396,6 +2397,7 @@ static uint16_t nvme_del_sq(NvmeCtrl *n, NvmeRequest *req)
> > >      NvmeSQueue *sq;
> > >      NvmeCQueue *cq;
> > >      uint16_t qid = le16_to_cpu(c->qid);
> > > +    int i;
> > >  
> > >      if (unlikely(!qid || nvme_check_sqid(n, qid))) {
> > >          trace_pci_nvme_err_invalid_del_sq(qid);
> > > @@ -2404,12 +2406,18 @@ static uint16_t nvme_del_sq(NvmeCtrl *n, NvmeRequest *req)
> > >  
> > >      trace_pci_nvme_del_sq(qid);
> > >  
> > > -    sq = n->sq[qid];
> > > -    while (!QTAILQ_EMPTY(&sq->out_req_list)) {
> > > -        r = QTAILQ_FIRST(&sq->out_req_list);
> > > -        assert(r->aiocb);
> > > -        blk_aio_cancel(r->aiocb);
> > > +    for (i = 1; i <= n->num_namespaces; i++) {
> > > +        NvmeNamespace *ns = nvme_ns(n, i);
> > > +        if (!ns) {
> > > +            continue;
> > > +        }
> > > +
> > > +        nvme_ns_drain(ns);
> > 
> > If we just drain the entire namespaces here, commands which has nothing
> > to do with the target sq to be deleted will be drained.  And this might
> > be a burden for a single SQ deletion.
> > 
> 
> That is true. But how often would you dynamically delete and create I/O
> submission queues in the fast path?

Delete I/O queues are not that often in the working NVMe controller, but
it might be a good case for the exception test from the host side like:
I/O queue deletion during I/O workloads.  If delete I/O queues are
returning by aborting their own requests only and quickly respond to the
host, then I think it might be a good one to test with.  Handling
requests gracefully sometimes don't cause corner cases from the host
point-of-view.  But, QEMU is not only for the host testing, so I am not
sure that QEMU NVMe device should handle things gracefully or try to do
something exactly as the real hardware(but, we don't know all the
hardware behavior ;)).

(But, Right. If I'm only talking about the kernel, then kernel does not
delete queues during the fast-path hot workloads.  But it's sometimes
great to test something on their own driver or application)

> > By the way, agree with the multiple AIOs references problem for newly added
> > commands.  But, shouldn't we manage the inflight AIO request references for
> > the newlly added commands with some other way and kill them all
> > explicitly as it was?  Maybe some of list for AIOCBs?
> 
> I was hesitant to add more stuff to NvmeRequest (like a QTAILQ to track
> this). Getting a steady-state with draining was an easy fix.

Graceful handling is easy to go with.  I am not expert for the overall
purpose of the QEMU NVMe device model, but I'm curious that which one we
need to take first between `Easy to go vs. What device should do`.

