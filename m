Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BBD2330BE
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jul 2020 13:10:56 +0200 (CEST)
Received: from localhost ([::1]:57970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k16Sd-0006Pq-88
	for lists+qemu-devel@lfdr.de; Thu, 30 Jul 2020 07:10:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1k16RT-0005nK-PJ; Thu, 30 Jul 2020 07:09:44 -0400
Received: from charlie.dont.surf ([128.199.63.193]:35786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1k16RP-0002PB-QX; Thu, 30 Jul 2020 07:09:43 -0400
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 78A8ABF5AF;
 Thu, 30 Jul 2020 11:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=irrelevant.dk;
 s=default; t=1596107377;
 bh=rbYGzWTjduOLsEG3zE8MOeIQeIAnlsdW0p4pBlX9e5I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LJU8ddBy/tSH0yY1U3xRoNEToyLtFH5SoSFzpBrH+3eco6sRCDzk0P2UU98Fi/9cM
 M4h/SAK2llMSUoISAgpBpVm6hSXF5hfvGjenlhJlzIJ4M9v/RiVgy1BSKbfItrWw2F
 4yYaI/DCwnnpqC+0Z9SaGl+do7nXt0JZ5LGiQOYm1YL0ICY+Ubmg652P5So/okQayr
 AYcpAVYZC9F7T/Eijnj+o7By4p39Vjt5dl42Ico5m/GxLxc1ovEoVVlZmZKWGxAyHg
 rTQOXgv9SUzZRHg3fzz8AcCeVg/8HSTGmCOjb+rvF/SvJXL7j++7n8skRqBaKI7atR
 NqGAFG1PWNyMw==
Date: Thu, 30 Jul 2020 13:09:33 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH v2 14/16] hw/block/nvme: consolidate qsg/iov clearing
Message-ID: <20200730110933.GA504315@apples.localdomain>
References: <20200729220638.344477-1-its@irrelevant.dk>
 <20200729220638.344477-15-its@irrelevant.dk>
 <20200730103117.5f7pd6cv3vgqh2mx@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200730103117.5f7pd6cv3vgqh2mx@localhost.localdomain>
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/30 07:09:37
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 Andrzej Jakowski <andrzej.jakowski@linux.intel.com>,
 Keith Busch <kbusch@kernel.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Jul 30 19:31, Minwoo Im wrote:
> On 20-07-30 00:06:36, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> > 
> > Always destroy the request qsg/iov at the end of request use.
> > 
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >  hw/block/nvme.c | 52 ++++++++++++++++++++-----------------------------
> >  1 file changed, 21 insertions(+), 31 deletions(-)
> > 
> > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > index 3d7275eae369..045dd55376a5 100644
> > --- a/hw/block/nvme.c
> > +++ b/hw/block/nvme.c
> > @@ -217,6 +217,17 @@ static void nvme_req_clear(NvmeRequest *req)
> >      memset(&req->cqe, 0x0, sizeof(req->cqe));
> >  }
> >  
> > +static void nvme_req_exit(NvmeRequest *req)
> > +{
> > +    if (req->qsg.sg) {
> > +        qemu_sglist_destroy(&req->qsg);
> > +    }
> > +
> > +    if (req->iov.iov) {
> > +        qemu_iovec_destroy(&req->iov);
> > +    }
> > +}
> > +
> 
> Klaus,
> 
> What is differences between 'clear' and 'exit' from the request
> perspective?
> 

Hi Minwoo,

The is that on 'exit' we release request resources (like the qsg and
iov). On 'clear' we initialize the request by clearing the struct. I
guess I could call it nvme_req_init instead maybe, but really - it is
clearing it.

