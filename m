Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DB649E142
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 12:37:51 +0100 (CET)
Received: from localhost ([::1]:39890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD366-0000yO-Mf
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 06:37:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nD2uX-000104-Iz
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:25:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nD2uU-0008SB-VC
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:25:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643282750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2o4bR97oN2i6VG2aec1T4YVnCkGQ4JcA5PZBDTzUZR0=;
 b=TH5EON6aaT5tMm9xoQy563ZWloILPBh7ohc2K8pfqwCPgAp6KtEiIdwCoXok+pnSyM/2Hh
 lM5KbycH/A1Fh+1N+/kBDONXT7dDLlps3kndFgpYFyKR0m3kBrT2begSiCZ1ELEU8/YYog
 JCDNurGlWi4LQgcneMueWaIAbnYT9w0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-RZGF5ASbMRy1RU_TosLBTg-1; Thu, 27 Jan 2022 06:25:41 -0500
X-MC-Unique: RZGF5ASbMRy1RU_TosLBTg-1
Received: by mail-wm1-f71.google.com with SMTP id
 m3-20020a7bcb83000000b0034f75d92f27so1361471wmi.2
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 03:25:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2o4bR97oN2i6VG2aec1T4YVnCkGQ4JcA5PZBDTzUZR0=;
 b=u9De4thbV15qgaRMxKwZd/pwf64GfhblRI9xoEPBuDWjNzuJC3azJBUsgqe4M4c5Re
 PafqIwnccLaQzUu1XFYdJd3GYuUtxzEAy8wbInFCLdtCNRELDbMEtr4Saa+Qx/6h0DpZ
 M3yjjfLHTautvzZl1StoQwwVcxDVX0Iz/BEbZLsK6MTH0uVSft0CyaRsZaZsSEBgR8jZ
 uII/QdOZa6f4s4cvDYGgHeq8m831oVj26/7bZ5qfbScz9KeKL5kxoC2uL1T4jaNJEkJJ
 efE/7V+06Doo3sZnrwdoo4w+n4dKWlkAIyKbRerL3fvkG1xsGhUt2JwZkyGymcTyPEbT
 yt7Q==
X-Gm-Message-State: AOAM531oAdnB9y/dLuCd8vb+wYn4UbAASfY4tSsduT8w5a5Jo/Koi6l+
 1hMSnPedpwNT0EC2o+4LDPEO2G6rA3ZAFCUmF8ZInjG3yt4eP5/jxs4mth/LLleErovHbRoRn1H
 NHftZVHD2UADDXQI=
X-Received: by 2002:a05:600c:1e1a:: with SMTP id
 ay26mr11298027wmb.75.1643282740647; 
 Thu, 27 Jan 2022 03:25:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwc2yr02BKE4J2NT4vPIVpdhpyT6toQJ73XSOnuIQbceTgdUDWNpFvb+cmnt/JpyUsuIAWWGg==
X-Received: by 2002:a05:600c:1e1a:: with SMTP id
 ay26mr11298004wmb.75.1643282740378; 
 Thu, 27 Jan 2022 03:25:40 -0800 (PST)
Received: from xz-m1.local ([85.203.46.170])
 by smtp.gmail.com with ESMTPSA id n13sm1881967wrm.68.2022.01.27.03.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 03:25:40 -0800 (PST)
Date: Thu, 27 Jan 2022 19:25:22 +0800
From: Peter Xu <peterx@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Subject: Re: [RFC PATCH v5 23/26] util: Add iova_tree_alloc
Message-ID: <YfKBIuTzsoOF9Mj5@xz-m1.local>
References: <20211029183525.1776416-1-eperezma@redhat.com>
 <20211029183525.1776416-24-eperezma@redhat.com>
 <YfJeZPn6nsCUxFiL@xz-m1.local>
 <CAJaqyWd52cXWHnLsgo=kP2Z7=VG6YKtxFGhTe7OamfYcZxhz6w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWd52cXWHnLsgo=kP2Z7=VG6YKtxFGhTe7OamfYcZxhz6w@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Parav Pandit <parav@mellanox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 27, 2022 at 11:09:44AM +0100, Eugenio Perez Martin wrote:
> > > +/**
> > > + * Try to accomodate a map of size ret->size in a hole between
> > > + * max(end(hole_left), iova_start).
> >
> > I think this functions need the most comments, and above sentence is more or
> > less not sounding correct... My try...
> >
> > /*
> >  * Try to find an unallocated IOVA range between LEFT and RIGHT elements.
> >  *
> >  * There're three cases:
> >  *
> >  * (1) When LEFT==NULL, RIGHT must be non-NULL and it means we're iterating at
> >  *     the 1st element.
> >  *
> >  * (2) When RIGHT==NULL, LEFT must be non-NULL and it means we're iterating at
> >  *     the last element.
> >  *
> >  * (3) When both LEFT and RIGHT are non-NULL, this is the most common case,
> >  *     we'll try to find a hole between LEFT and RIGHT mapping.
> >  */
> >
> 
> This is also called with left == NULL and right == NULL in the first
> allocation with an empty tree. This allows iova_tree_alloc to have the
> same code path both if the three is empty or not.
> 
> But I can add the use cases in the doc for sure.

Ah, right.

> 
> > > + *
> > > + * @args Arguments to allocation
> > > + */
> > > +static bool iova_tree_alloc_map_in_hole(const struct IOVATreeAllocArgs *args)
> > > +{
> > > +    const DMAMap *left = args->hole_left, *right = args->hole_right;
> > > +    uint64_t hole_start, hole_last;
> > > +
> > > +    if (right && right->iova + right->size < args->iova_begin) {
> > > +        return false;
> > > +    }
> > > +
> > > +    if (left && left->iova > args->iova_last) {
> > > +        return false;
> > > +    }
> > > +
> > > +    hole_start = MAX(left ? left->iova + left->size + 1 : 0, args->iova_begin);
> > > +    hole_last = MIN(right ? right->iova : HWADDR_MAX, args->iova_last);
> >
> > I assume these values should be always inclusive, hence
> >
> > s/right->iova/right->iova + 1/
> >
> > ?
> >
> 
> Right, it is confusing the way it's written. But I think it should be
> right->iova - 1 in any case to make it the hole last element, isn't
> it?

I was thinking "-1" but I failed to make it coherent with the thought when
typing.. Heh.

> 
> Would it work better to rename variable hole_last to hole_end? If not,
> we have a special case of the second allocation when iova_begin == 0:
> - We successfully allocate a DMAMap of size N. By the way the
> algorithm works,  it starts at 0, so [0, N] is allocated.

If we're always talking about inclusive ranges, shouldn't it be [0, N-1]?

> - We try to allocate a second one of size M. At the first iteration,
> "right" is the previously allocated DMAMap.
> Using the -1 trick we get hole_end == HWADDR_MAX.

I'm not sure I get the point, but both naming look fine to me.  As long as we
use inclusive ranges, then hole_end/last will be limited to HWADDR_MAX.

> > > +static gboolean iova_tree_alloc_traverse(gpointer key, gpointer value,
> > > +                                         gpointer pargs)
> > > +{
> > > +    struct IOVATreeAllocArgs *args = pargs;
> > > +    DMAMap *node = value;
> > > +
> > > +    assert(key == value);
> > > +
> > > +    iova_tree_alloc_args_iterate(args, node);
> > > +    if (args->hole_left && args->hole_left->iova > args->iova_last) {
> >
> > IMHO this check is redundant and can be dropped, as it's already done in
> > iova_tree_alloc_map_in_hole().
> >
> 
> Assuming we add "iova_found" to iova_tree_alloc_map_in_hole to
> IOVATreeAllocArgs as you propose, it returns true if we are able to
> allocate a DMAMap entry, so no more iterations are needed. But if it
> returns false, it simply means that DMAMap cannot be allocated between
> left (or iova_begin) and right (iova_end). It doesn't tell if you can
> keep iterating or not. In other words, false == keep iterating if you
> can.
> 
> This other check signals the end of the available hole, and to avoid
> iterating beyond iova_last in the (unlikely?) case we have more nodes
> to iterate beyond that.
> 
> I'll try to make it more explicit.

Makes sense.  Comment works.

Thanks,

-- 
Peter Xu


