Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF52475093
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 02:42:31 +0100 (CET)
Received: from localhost ([::1]:37846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxJJN-0005jz-RL
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 20:42:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mxJGq-0004yk-3d
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 20:39:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mxJGm-00010X-OZ
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 20:39:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639532384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Aj05ngn+pYpi3ih8y+k4SvjxjLitsmtsvL682/gGlzQ=;
 b=fq6nHZI1jszFbvOmbC1za3aPdxKfdraXfGwlq05HN+cE7fvSwWxbq2wEQxevjZjP6BuLJd
 NGzpxL/WDWijADKy3D/2f2QKp6L1G8OfHOgqTZxoqLsg+inayRTUG2JfnsKMEV7AO807My
 AhtG7J2pRR7iC7HDIWx2IG+Wz6v0C9Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-pQMTvxZlMI2KBcRCVCTEpA-1; Tue, 14 Dec 2021 20:39:43 -0500
X-MC-Unique: pQMTvxZlMI2KBcRCVCTEpA-1
Received: by mail-wm1-f69.google.com with SMTP id
 l4-20020a05600c1d0400b00332f47a0fa3so8333736wms.8
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 17:39:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Aj05ngn+pYpi3ih8y+k4SvjxjLitsmtsvL682/gGlzQ=;
 b=mDxsEjkXtxMgSzQBbgvczRJBi26Z/byFXGTPWEKrpK34h7zN5k8J8WQLfkFpqD1+LZ
 pr6kb0JjUGPheakVlkV2iRJ5QRrolIyyaCWoti8aUH7F5lk09BGIswc3EtGKGfNJVOlB
 D51dk3Qy9N1bEyMm7NzuCRRhJC7S/6Ci5hhVCydMWHtnx5vCH0i1d3d7L9KbyeySehJK
 YPUUmGN0XXZ8pvEbYURwI+0XHBwH/RWL2ByvUnPZU2Ep3sxoG/oAlEyMSZ+/0L3gbUKO
 5kQ63sOteGynnRNcNa8uvU9FrtyNG5dNImfFXOklXzmYF6UEM6HGsTBSzYffz5AIRCdx
 tpYw==
X-Gm-Message-State: AOAM531Aj7ZMFTdYrrW/m5xrHjguqUhb5jGnXui9yrmfsCm8JKllpMfU
 bQ2mHyscV3VtpNAuaBMzASSG0P5LKsHmWFvDtpDrqzUjOZp5Jhhi4uto0nOU4YRkk88pdXvYq8T
 /iO3LQ+Gu1rNkJwg=
X-Received: by 2002:a7b:c94e:: with SMTP id i14mr2361622wml.85.1639532382031; 
 Tue, 14 Dec 2021 17:39:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy4x1Vo/BOkZ/PySLNM+Kw1FJsFJpxWRlZranslQTkn+i6F7M4zN6Lbp6tfywGyIF9kRv23jg==
X-Received: by 2002:a7b:c94e:: with SMTP id i14mr2361608wml.85.1639532381731; 
 Tue, 14 Dec 2021 17:39:41 -0800 (PST)
Received: from xz-m1.local ([64.64.123.14])
 by smtp.gmail.com with ESMTPSA id p62sm385553wmp.10.2021.12.14.17.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:39:40 -0800 (PST)
Date: Wed, 15 Dec 2021 09:39:34 +0800
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v3 23/23] migration: Use multifd before we check for the
 zero page
Message-ID: <YblHVs12XLehGhJw@xz-m1.local>
References: <20211124100617.19786-1-quintela@redhat.com>
 <20211124100617.19786-24-quintela@redhat.com>
 <Yaj+V6LstcnNERaZ@work-vm> <87fsragb58.fsf@secure.mitica>
 <Ya8NoTyiXOCQ/MLL@xz-m1.local> <87o85k7u6e.fsf@secure.mitica>
MIME-Version: 1.0
In-Reply-To: <87o85k7u6e.fsf@secure.mitica>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
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
Cc: Leonardo Bras <leobras@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 13, 2021 at 10:03:53AM +0100, Juan Quintela wrote:
> Peter Xu <peterx@redhat.com> wrote:
> > On Thu, Dec 02, 2021 at 06:38:27PM +0100, Juan Quintela wrote:
> >> This needs to be improved to be compatible with old versions.
> >
> > Any plan to let new binary work with old binary?
> 
> Yes, but I was waiting for 7.0 to get out.  Basically I need to do:
> 
> if (old)
>     run the old code
> else
>     new code
> 
> this needs to be done only in a couple of places, but I need the
> machine_type 7.0 created to put the property there.

OK.  We can also have the tunable be false by default until the new machine
type arrives; then the series won't need to be blocked by the machine type
patch and it'll be only one last patch to be adjusted there.

> 
> > Maybe boost the version field for multifd packet (along with a
> > multifd_version=2 parameter and only set on new machine types)?
> 
> For now, we only need to add a flag for the ZERO_PAGE functionality.  if
> we are on older qemu, just don't test for zero pages.  On reception, we
> can just accept everything, i.e. if there are no zero pages, everything
> is ok.

Do you mean zero detection for multifd=on only?  As otherwise it could regress
old machine types in some very common scenarios, iiuc, e.g. idle guests.

> 
> > PS: We should really have some handshake mechanism between src/dst, I dreamt it
> > for a long time..  So that we only need to specify the capability/parameters on
> > src someday and we'll never see incompatible migration failing randomly because
> > the handshake should guarantee no stupid mistake..  Sad.
> 
> That has been on my ToDo list for too long, just need the time to do
> it.  It would make everything much, much easier.
> 
> >> But .... if we don't care about RDMA, why do we care about
> >> control_save_page()?
> >
> > Could anyone help to explain why we don't care?  I still see bugfixes coming..
> 
> Sentence was inside a context.  We don't care for RDMA while we are on
> multifd.  If multifd ever supports RDMA, it would be a new
> implementation that don't use such hooks.
> 
> IMVHO, RDMA implementation in qemu is quite bad.  For historic reasons,
> they needed to use qemu_file abstraction for comunication, so they are
> dropping directly the ability of doing direct copies of pages.
> So, if one is requiring to mlock all the guest memory on both sides to
> use RDMA, the *right* thing to do from my point of view is just
> "remotely" read the page without any overhead.
> 
> Yes, that requires quite a bit of changes, I was not suggesting that it
> was a trivial task.

I see!

Thanks,

-- 
Peter Xu


