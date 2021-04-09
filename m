Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0500E359F42
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 14:51:12 +0200 (CEST)
Received: from localhost ([::1]:39390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUqbM-0002l2-28
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 08:51:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lUqZG-0001TY-IR; Fri, 09 Apr 2021 08:48:58 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:44836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lUqZE-0007G4-FW; Fri, 09 Apr 2021 08:48:58 -0400
Received: by mail-pf1-x429.google.com with SMTP id m11so4162255pfc.11;
 Fri, 09 Apr 2021 05:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=S9UsGb+ECXzsLCw72XVuLK3RsABVnWcsKixLg4LxuOo=;
 b=FgOzt6dtKN7GnS0RPCMwDbm+4qEf+hmyRpMmvSwUXMuj5eHbtn7qcIyIWZqkLrK9xs
 01XQhp6egP+U9dG0oPKuwI3KQlpP3pyBgbIsW7Sr5sMQVvy2KcmaDT0YrraLeWO/EtuY
 FcikVlM/2kTEaxkCkO5MPPgvYZNYcWDMS4J4AVj/BqZGsvSmFkWYZqpaW8K4RBpkVvrX
 /fJLz2yPU6YvdKbVZtoaYs2TcguQIrUdkH3JPiNzM2I29BRnounRRovFqh3kgk/ml9ab
 teHvzEZvZzVLiRRJN1ZMcXrWJt3ke7NPmiGpDTM1Awo8AAoCvPCg/w/+87HAAH8WlPIi
 Wrzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=S9UsGb+ECXzsLCw72XVuLK3RsABVnWcsKixLg4LxuOo=;
 b=V283L0NF5xFYsnqCosl3lCt+/BAmUcK0p6G5oMYfKbmSTzlU+sCA5bu9q5Iep/G8mb
 U0TxwVHHtoqSTkHPExSlaEYqwzniP7TXIWDtFiGSCAviVWF9oFJMoQIr6SHMQWzMQmWm
 r5Gnfv1DA7LYSRZOQ+b639bpG6TeAsggnUIKo3rZLBlQus2oiPCj6YfJdG9C+9AnyNs1
 iJY78q55H2eNHVNwoMkbvdAahzm5JzNZRqdUt0ZwDM2/dz1tNUsMF3lULfzM1t8Kt0O3
 RUfiY+P/5NZ8Ickf+OhNNdTbLOC9OdbF9R07I6+dbA3Lev9c7/WZLqbO8ZHdcutpizRP
 3Ltw==
X-Gm-Message-State: AOAM5303Ai70LFHCcU0TfYOtwfy0vjqNf6QKjnTnNgJjhSvuGWHSk+TA
 CirbARaZqQaypZUaw3GBiwk=
X-Google-Smtp-Source: ABdhPJyZM9u7MBLfZRmGZdNyv1weMivG7ricSWtohRuSTb2nQ6yYp/7+4ohLO2kSJ6KsEPfRZAGAXw==
X-Received: by 2002:a05:6a00:1384:b029:242:9979:b1d with SMTP id
 t4-20020a056a001384b029024299790b1dmr11378332pfg.63.1617972534600; 
 Fri, 09 Apr 2021 05:48:54 -0700 (PDT)
Received: from localhost ([58.127.46.74])
 by smtp.gmail.com with ESMTPSA id f6sm2953417pgd.61.2021.04.09.05.48.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 05:48:54 -0700 (PDT)
Date: Fri, 9 Apr 2021 21:48:51 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH] hw/block/nvme: slba equal to nsze is out of bounds if
 nlb is 1-based
Message-ID: <20210409124851.GH2085@localhost>
References: <CGME20210409074451epcas5p391e5b072e6245b8fe691d67bb42fb234@epcas5p3.samsung.com>
 <20210409074402.7342-1-anaidu.gollu@samsung.com>
 <20210409110518.GC2085@localhost>
 <YHBAlXnRdYTU1m1P@apples.localdomain>
 <20210409123115.GG2085@localhost>
 <YHBKQwhAR8RcLTTD@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YHBKQwhAR8RcLTTD@apples.localdomain>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pf1-x429.google.com
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 mreitz@redhat.com, stefanha@redhat.com, kbusch@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-04-09 14:36:19, Klaus Jensen wrote:
> On Apr  9 21:31, Minwoo Im wrote:
> > On 21-04-09 13:55:01, Klaus Jensen wrote:
> > > On Apr  9 20:05, Minwoo Im wrote:
> > > > On 21-04-09 13:14:02, Gollu Appalanaidu wrote:
> > > > > NSZE is the total size of the namespace in logical blocks. So the max
> > > > > addressable logical block is NLB minus 1. So your starting logical
> > > > > block is equal to NSZE it is a out of range.
> > > > >
> > > > > Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> > > > > ---
> > > > >  hw/block/nvme.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > > > > index 953ec64729..be9edb1158 100644
> > > > > --- a/hw/block/nvme.c
> > > > > +++ b/hw/block/nvme.c
> > > > > @@ -2527,7 +2527,7 @@ static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest *req)
> > > > >              uint64_t slba = le64_to_cpu(range[i].slba);
> > > > >              uint32_t nlb = le32_to_cpu(range[i].nlb);
> > > > >
> > > > > -            if (nvme_check_bounds(ns, slba, nlb)) {
> > > > > +            if (nvme_check_bounds(ns, slba, nlb) || slba == ns->id_ns.nsze) {
> > > >
> > > > This patch also looks like check the boundary about slba.  Should it be
> > > > also checked inside of nvme_check_bounds() ?
> > > 
> > > The catch here is that DSM is like the only command where the number of
> > > logical blocks is a 1s-based value. Otherwise we always have nlb > 0, which
> > > means that nvme_check_bounds() will always "do the right thing".
> > > 
> > > My main gripe here is that (in my mind), by definition, a "zero length
> > > range" does not reference any LBAs at all. So how can it result in LBA Out
> > > of Range?
> > 
> > Even if this is not the LBA out of range case which is currently what
> > nvme_check_bounds() checking, but I thought the function checks the
> > bounds so that we can add one more check inside of that function like:
> > (If SLBA is 0-based or not, slba should not be nsze, isn't it ?)
> > 
> > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > index 7244534a89e9..25a7db5ecbd8 100644
> > --- a/hw/block/nvme.c
> > +++ b/hw/block/nvme.c
> > @@ -1415,6 +1415,10 @@ static inline uint16_t nvme_check_bounds(NvmeNamespace *ns, uint64_t slba,
> > {
> >     uint64_t nsze = le64_to_cpu(ns->id_ns.nsze);
> > 
> > +    if (slba == nsze) {
> > +        return NVME_INVALID_FIELD | NVME_DNR;
> > +    }
> > +
> >     if (unlikely(UINT64_MAX - slba < nlb || slba + nlb > nsze)) {
> >         return NVME_LBA_RANGE | NVME_DNR;
> >     }
> > 
> > Or am I missing something here ;) ?
> 
> No, not at all, it's just that this additional check is never needed for any
> other command than DSM since, as far as I remember, DSM is the only command
> with the 1s-based NLB value fuckup.
> 
> This means that nlb will always be at least 1, so slba + 1 > nsze will be
> false if slba == nsze.

Understood :)

Please have:

Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>

