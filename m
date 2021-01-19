Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 262872FB3B0
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 09:05:58 +0100 (CET)
Received: from localhost ([::1]:37114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1m1V-0006vm-8c
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 03:05:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1lzr-0006F5-L3; Tue, 19 Jan 2021 03:04:16 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:36494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1lzi-0004H5-5p; Tue, 19 Jan 2021 03:04:14 -0500
Received: by mail-pj1-x102f.google.com with SMTP id l23so11660391pjg.1;
 Tue, 19 Jan 2021 00:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xd8Azo/jEdZ5Rb51vp9Z05whaK09GrcrJYWMCHSLwCw=;
 b=H4ehC6TsMIq0muorbi1CA3+IIxi84VQW29rsZyyZFkO4oD4flRihcM1ArT2DcEBjVm
 5Uzc+3UudECXUxhHeOr8XCSyFrgF9e4FX8kuXcbdt8sik+CiEq23ip3VRY58plTveiL+
 Gu0FYQ5vMNjFp0jSmYsIJV2+0gMCuG/5SSCIhk/AZk203kD9yKB+psX3P+4j7eyGSbMu
 /vbPQM8qtXM9sN7IGOufPa0r6KB3sOB66eD88lmD1pUnR4gIIcI9nk9wO1L3otewVL21
 cM2xPIy62JFL5B1RNqjg2yi2Fwn0Ol2SFCCl3EEit7zBTFYxIA8QmXksAisY4LZbHalv
 hknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xd8Azo/jEdZ5Rb51vp9Z05whaK09GrcrJYWMCHSLwCw=;
 b=iuGhfYZJmIZXTYMvj+ZQQ75awhWXSse85noRsIXPz86KbUiVgkWpOXcBA2NatfHcBS
 oCMHltHjfl5s6Z94MLYU4PiA7wUxInxd52Ma+A4Qt9l2iJQZ7OzgabwMiEV94AzEoLaI
 mlaOtMHJeQIt7qC0LRuFl0DH7F68QZAcHrILMpIcxxzDFumu7DfBh44E742PErLnQxwV
 tCyvHJZ19Q+dawZGkEl3kYv8XOYr7taYV+SkgcKoN2fc5bwR1eHvY1Qg2hT9gYe1xvwV
 gymsqrdHcbCOOzA5oYQNSbFB8YwRuCs2D95ju5wiBnF9/CZeCcl36WxP4GGC8MAvtIm9
 K/sw==
X-Gm-Message-State: AOAM531As0oifsVWFERniFwhkfH5+B8tBGZHGA5j58IzCk5nzirHXjDS
 zPqMO2VxB6XBv4oWMid5vN4=
X-Google-Smtp-Source: ABdhPJwYwuBQaDxgwwXTjdwM9UtylnKkY+Iiw8+ikRhJPbsPdnNxV+qcqU8UzP9TegqXDIbxxqMNtQ==
X-Received: by 2002:a17:90a:6407:: with SMTP id
 g7mr4127143pjj.56.1611043443721; 
 Tue, 19 Jan 2021 00:04:03 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id bt8sm2664258pjb.0.2021.01.19.00.04.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 19 Jan 2021 00:04:03 -0800 (PST)
Date: Tue, 19 Jan 2021 17:04:01 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [RFC PATCH V2 02/11] hw/block/nvme: open code for volatile write
 cache
Message-ID: <20210119080401.GH5939@localhost.localdomain>
References: <20210117145341.23310-1-minwoo.im.dev@gmail.com>
 <20210117145341.23310-3-minwoo.im.dev@gmail.com>
 <YAaLBWVT+g5q/paE@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YAaLBWVT+g5q/paE@apples.localdomain>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pj1-x102f.google.com
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
Cc: Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-01-19 08:32:21, Klaus Jensen wrote:
> On Jan 17 23:53, Minwoo Im wrote:
> > Volatile Write Cache(VWC) feature is set in nvme_ns_setup() in the
> > initial time.  This feature is related to block device backed,  but this
> > feature is controlled in controller level via Set/Get Features command.
> > 
> > This patch removed dependency between nvme and nvme-ns to manage the VWC
> > flag value.  Also, it open coded the Get Features for VWC to check all
> > namespaces attached to the controller, and if false detected, return
> > directly false.
> > 
> > Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
> > ---
> >  hw/block/nvme-ns.c |  4 ----
> >  hw/block/nvme.c    | 15 ++++++++++++---
> >  hw/block/nvme.h    |  1 -
> >  3 files changed, 12 insertions(+), 8 deletions(-)
> > 
> > diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
> > index 32662230130b..c403cd36b6bd 100644
> > --- a/hw/block/nvme-ns.c
> > +++ b/hw/block/nvme-ns.c
> > @@ -89,10 +89,6 @@ static int nvme_ns_init_blk(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
> >          return -1;
> >      }
> >  
> > -    if (blk_enable_write_cache(ns->blkconf.blk)) {
> > -        n->features.vwc = 0x1;
> > -    }
> > -
> >      return 0;
> >  }
> >  
> > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > index cf0fe28fe6eb..b2a9c48a9d81 100644
> > --- a/hw/block/nvme.c
> > +++ b/hw/block/nvme.c
> > @@ -3033,6 +3033,7 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
> >      NvmeGetFeatureSelect sel = NVME_GETFEAT_SELECT(dw10);
> >      uint16_t iv;
> >      NvmeNamespace *ns;
> > +    int i;
> >  
> >      static const uint32_t nvme_feature_default[NVME_FID_MAX] = {
> >          [NVME_ARBITRATION] = NVME_ARB_AB_NOLIMIT,
> > @@ -3108,7 +3109,17 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
> >          result = ns->features.err_rec;
> >          goto out;
> >      case NVME_VOLATILE_WRITE_CACHE:
> > -        result = n->features.vwc;
> > +        for (i = 1; i <= n->num_namespaces; i++) {
> > +            ns = nvme_ns(n, i);
> > +            if (!ns) {
> > +                continue;
> > +            }
> > +
> > +            result = blk_enable_write_cache(ns->blkconf.blk);
> > +            if (!result) {
> > +                break;
> > +            }
> > +        }
> 
> I did a small tweak here and changed `if (!result)` to `if (result)`. We
> want to report that a volatile write cache is present if ANY of the
> namespace backing devices have a write cache.

Oh.... Thanks for the fix!

