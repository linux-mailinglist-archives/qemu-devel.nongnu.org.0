Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2FC33CEB9
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 08:35:39 +0100 (CET)
Received: from localhost ([::1]:57808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM4Es-0002GI-R5
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 03:35:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lM4Dr-0001ot-Gc; Tue, 16 Mar 2021 03:34:35 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:39561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lM4Do-0000KH-E1; Tue, 16 Mar 2021 03:34:35 -0400
Received: by mail-pg1-x535.google.com with SMTP id x29so22028645pgk.6;
 Tue, 16 Mar 2021 00:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=krt/I0KLKdD+kG+Di2uVHNCE8MZKpU6prnTmmXAW7w0=;
 b=Bvjlmb4ZBH0C2b0ScOtVyQeDn1gj5fLXecTLx2XWFuKt+0qUWtphafPttOTOykfuyF
 lFKwNynJHTtp6uLD92K3XmkQygiz6BMEx4j2w13ZQDzYetOjFiY4cDMwO42Nuku9IB6I
 OpY+P38780mikzFEVzYZ8fqETGIyBPdoCWVizYmXIu6HSlYe+RpAIR/w2L6DnH/3uTTl
 UHkvGin/SXGMjkeJyyVNdSqIWJmU5Y1IR+24pvj587GX2zR2bnYvwMqXfxKTSq+D8nh9
 2Uc95Cn9jtZNFGy/z9SO6nw9UmN4+X8SmeGLZUm57ERtRz+0qlWsKJyOtIvb5POszbyh
 +DFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=krt/I0KLKdD+kG+Di2uVHNCE8MZKpU6prnTmmXAW7w0=;
 b=jXrisbpJE9hWEcfejLvCDTXwa/iOJONXaZaYow4CqT5G9GfqCSP17xUb/XYqPDDDxx
 ZgJbjAE/RZPdaMYRc1yirPQYKm1mdJpkGvhp3IRD66n2CVBZRhl0LJHxtiztXZX2wz2Y
 9+8p8xyY0e+haPXeMs2JN41iqDD0lil6N8FDuP8gltHvBsuv3kDoYS79eOhZBh2nT3Un
 DUuJ8hcPefwlkXWOVLJJxiFR3DvkjFIQ892D4fGf3vaUK+/Rml0jW9qr0Bf/h4JlP7/5
 ltAq39Hi+y5pXcaQQrRRQmjRJNguxpb9O+rLE+Sh2Nt8Q/8f1fTHatUij6VrwSjmHTYA
 jDfQ==
X-Gm-Message-State: AOAM531BbMA4jRUKBcNDq2SxVcV0I/CRwTmLULGyrO9S06nzTnIPF1bv
 1Sg26vphxS5srn6gELhZHd4=
X-Google-Smtp-Source: ABdhPJzL1DoLTmKyAiC81pa6OPZ0vflU1pT4hehiTEnhkDW1tDjeWfrEV89H5e0K1kydiKcblfNGCA==
X-Received: by 2002:a62:e502:0:b029:1e4:d7c3:5c59 with SMTP id
 n2-20020a62e5020000b02901e4d7c35c59mr13783566pff.51.1615880070530; 
 Tue, 16 Mar 2021 00:34:30 -0700 (PDT)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id y15sm17548714pgi.31.2021.03.16.00.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 00:34:30 -0700 (PDT)
Date: Tue, 16 Mar 2021 16:34:27 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v5 09/13] hw/block/nvme: parameterize nvme_ns_nlbas
Message-ID: <20210316073427.GA2794@localhost.localdomain>
References: <20210310095347.682395-1-its@irrelevant.dk>
 <20210310095347.682395-10-its@irrelevant.dk>
 <20210316065301.GC23761@localhost.localdomain>
 <YFBb7NdIrbzkftIc@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YFBb7NdIrbzkftIc@apples.localdomain>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pg1-x535.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-03-16 08:19:08, Klaus Jensen wrote:
> On Mar 16 15:53, Minwoo Im wrote:
> > On 21-03-10 10:53:43, Klaus Jensen wrote:
> > > From: Klaus Jensen <k.jensen@samsung.com>
> > > 
> > > Provide a more flexible nlbas helper.
> > > 
> > > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > > ---
> > >  hw/block/nvme-ns.h | 14 ++++++++++----
> > >  1 file changed, 10 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
> > > index 07e16880801d..34f9474a1cd1 100644
> > > --- a/hw/block/nvme-ns.h
> > > +++ b/hw/block/nvme-ns.h
> > > @@ -136,12 +136,18 @@ static inline bool nvme_ns_ext(NvmeNamespace *ns)
> > >  }
> > >  
> > >  /* calculate the number of LBAs that the namespace can accomodate */
> > > +static inline uint64_t __nvme_nlbas(size_t size, uint8_t lbads, uint16_t ms)
> > > +{
> > > +    if (ms) {
> > > +        return size / ((1 << lbads) + ms);
> > > +    }
> > > +
> > > +    return size >> lbads;
> > > +}
> > > +
> > >  static inline uint64_t nvme_ns_nlbas(NvmeNamespace *ns)
> > >  {
> > > -    if (nvme_msize(ns)) {
> > > -        return ns->size / (nvme_lsize(ns) + nvme_msize(ns));
> > > -    }
> > > -    return ns->size >> nvme_ns_lbads(ns);
> > > +    return __nvme_nlbas(ns->size, nvme_ns_lbads(ns), nvme_msize(ns));
> > >  }
> > 
> > Hmm.. I think it looks like __nvme_nlbas does the same with the
> > nvme_ns_nlbas, but flexible argument attributes.  But I think those
> > three attributes are all for ns-specific fields which is not that
> > generic so that I don't think we are going to take the helper from much
> > more general perspective with __nvme_nlbas.
> > 
> 
> This patch should be moved two patches forward in the series - it is
> used in [12/13] to check the zone geometry before the values are set on
> the namespace proper. This is also used in Format NVM to verify the
> format before formatting ("commiting" the values on the NvmeNamespace
> structure).

Checked [12/13] right before.  Thanks for pointing that out!

Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>

