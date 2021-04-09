Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E78D359ED9
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 14:35:44 +0200 (CEST)
Received: from localhost ([::1]:56274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUqMR-0005jp-7M
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 08:35:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lUqID-0002Ps-Tx; Fri, 09 Apr 2021 08:31:21 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:38556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lUqIC-0005il-5c; Fri, 09 Apr 2021 08:31:21 -0400
Received: by mail-pg1-x533.google.com with SMTP id w10so3791984pgh.5;
 Fri, 09 Apr 2021 05:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=V/MEUL4p5cmiEjYvhiillfBRUDcxzwONZbAaZ9BJjpg=;
 b=QmwD+SxYAI1WUz9smK58o005iCgXMe+0omjYjarcTB9Gp822l8VUYIdihWaYzcqRwp
 nXFL+Bp06UfIsvU0w+6atjcEtb4Af6CvyqJsrzdPO9OTkVDBnOvR33ah92e6eo1uj6Pj
 FdbTPe1hXWZMN+p+qbz8SsozFP46VrvB+LoKpgjQYFqMGP+r55aRWWFJ514Oy0Fsda9h
 bMaDZ6ZxRCPjWq8/tirT/TA/ywZ8+l0+6fFpP40Ke8uhOlPFRFuQL5QlXy6Ll/Ymdg2t
 6GOZ9l934bt1nrlp9QypyaxQV0ctMaH4zzu0iz/wfusJqOe3qOBiAbvjBL9jqrpY64lE
 iI1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=V/MEUL4p5cmiEjYvhiillfBRUDcxzwONZbAaZ9BJjpg=;
 b=LmjHlALlaUKbPezA9hxxAL0rEzjl1K+w8eIKupEbrORYXw9f6ztCnpWUClmfGEAWPC
 Gb7tNzFsu9hUt3CqP2qVjZBD863j5UR5k7P+JTEQbqa1geai3dDDO6q6nq9zrYIPEXbD
 50eJNEn1Oc8551NAVKzZ1nppdAZi6xJ2t3ROZKy6aX3yn2wfjk1yCHMNXJ1fOqQ2ew2M
 VryHl0mETgLOfdnkBCQwK5IWuAxlHP+pZJ2I2wbi13Z/X00fFbeVliQkOlP6DuY0nrEO
 UGl5CzCXJwzo2WXOTktOTMMY9RuasnxdU1kDyoVYHbyM5Y4FlXdBGXXrdQfzdINzegwB
 mWCw==
X-Gm-Message-State: AOAM531d263fLqYmuRlJ2eM2RmBmsp2d5LzC5HKWjIkCkquPsJ02n+WG
 mBBWYgd/Mx/jS/77BOnB4Ak=
X-Google-Smtp-Source: ABdhPJyihwtGR/UMuI5XwQ1PCoEm6bqczFJeB2XXcBgt1duOXBMkNhgqbY4XCb2Z41s+fzzetlHiUw==
X-Received: by 2002:a63:4924:: with SMTP id w36mr13131040pga.212.1617971478220; 
 Fri, 09 Apr 2021 05:31:18 -0700 (PDT)
Received: from localhost ([58.127.46.74])
 by smtp.gmail.com with ESMTPSA id z195sm1416246pfc.146.2021.04.09.05.31.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 05:31:17 -0700 (PDT)
Date: Fri, 9 Apr 2021 21:31:15 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH] hw/block/nvme: slba equal to nsze is out of bounds if
 nlb is 1-based
Message-ID: <20210409123115.GG2085@localhost>
References: <CGME20210409074451epcas5p391e5b072e6245b8fe691d67bb42fb234@epcas5p3.samsung.com>
 <20210409074402.7342-1-anaidu.gollu@samsung.com>
 <20210409110518.GC2085@localhost>
 <YHBAlXnRdYTU1m1P@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YHBAlXnRdYTU1m1P@apples.localdomain>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pg1-x533.google.com
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

On 21-04-09 13:55:01, Klaus Jensen wrote:
> On Apr  9 20:05, Minwoo Im wrote:
> > On 21-04-09 13:14:02, Gollu Appalanaidu wrote:
> > > NSZE is the total size of the namespace in logical blocks. So the max
> > > addressable logical block is NLB minus 1. So your starting logical
> > > block is equal to NSZE it is a out of range.
> > > 
> > > Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> > > ---
> > >  hw/block/nvme.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > > index 953ec64729..be9edb1158 100644
> > > --- a/hw/block/nvme.c
> > > +++ b/hw/block/nvme.c
> > > @@ -2527,7 +2527,7 @@ static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest *req)
> > >              uint64_t slba = le64_to_cpu(range[i].slba);
> > >              uint32_t nlb = le32_to_cpu(range[i].nlb);
> > > 
> > > -            if (nvme_check_bounds(ns, slba, nlb)) {
> > > +            if (nvme_check_bounds(ns, slba, nlb) || slba == ns->id_ns.nsze) {
> > 
> > This patch also looks like check the boundary about slba.  Should it be
> > also checked inside of nvme_check_bounds() ?
> 
> The catch here is that DSM is like the only command where the number of
> logical blocks is a 1s-based value. Otherwise we always have nlb > 0, which
> means that nvme_check_bounds() will always "do the right thing".
> 
> My main gripe here is that (in my mind), by definition, a "zero length
> range" does not reference any LBAs at all. So how can it result in LBA Out
> of Range?

Even if this is not the LBA out of range case which is currently what
nvme_check_bounds() checking, but I thought the function checks the
bounds so that we can add one more check inside of that function like:
(If SLBA is 0-based or not, slba should not be nsze, isn't it ?)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 7244534a89e9..25a7db5ecbd8 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1415,6 +1415,10 @@ static inline uint16_t nvme_check_bounds(NvmeNamespace *ns, uint64_t slba,
 {
     uint64_t nsze = le64_to_cpu(ns->id_ns.nsze);
 
+    if (slba == nsze) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
     if (unlikely(UINT64_MAX - slba < nlb || slba + nlb > nsze)) {
         return NVME_LBA_RANGE | NVME_DNR;
     }

Or am I missing something here ;) ?

