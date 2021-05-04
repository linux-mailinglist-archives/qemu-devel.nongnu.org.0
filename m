Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC66372E2B
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 18:38:21 +0200 (CEST)
Received: from localhost ([::1]:52360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldy3w-0002Ij-BO
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 12:38:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel@ffwll.ch>) id 1ldxwZ-0007pl-EG
 for qemu-devel@nongnu.org; Tue, 04 May 2021 12:30:45 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:35740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <daniel@ffwll.ch>) id 1ldxwV-0004t1-Dd
 for qemu-devel@nongnu.org; Tue, 04 May 2021 12:30:41 -0400
Received: by mail-ej1-x634.google.com with SMTP id m12so14168631eja.2
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 09:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=ctdlXSgA9WB8/LgWtL0CJavRE/GrXThnOTOG0Yn+j2M=;
 b=PV7H9lwE2fkMD9FY3zZI2IQ1LJUNNJi+MErHVDmQXkw7CP2xrU/TYHlHczAfDm5lVa
 KDiLaKQ00UK/IHHZuLCrQoUb6nNF2np0jdBgPOKnW02lTxjNCfGGcqjbWs0FnUqtA2bw
 4MCLLKv0oasjlveEwIDLg7pD/6kl+SgNCQ9ok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=ctdlXSgA9WB8/LgWtL0CJavRE/GrXThnOTOG0Yn+j2M=;
 b=iCd8ykF/Aa/rarxXZnFNZMEyrzjmEC82Wqauaiv234+FaemcU7MsJDhXqvkE3x8poI
 jks12YJrR2Egtl+HCs7u/99jvxSP8yK3W1bsAYW/QpLTreDmmlzlyjDdj25eKZHgjCZe
 qeoo3/UmTF5IGKALI8eTtVpRY99AjUgybO72GrY3sY6vfwAxuypW1Qr/C8uN7NDJ6Oig
 UNXLVUAd36vXJaqg9kj27vnjsAEo7YbhvRAD+WGin3DfGuKXysplU70K07NdgN5N1L4U
 auf31yXMLN7DNuE6mBH78vS8Jq0+vy1O0nIxC7EPlBjcrikkNbRSLSDrutaR8BemMJrJ
 n4vg==
X-Gm-Message-State: AOAM5301KAXgUrAvkYMQ1dZ0Syu+iLqPosSrN0BPQYHiCX3nybAzjjND
 tzSnaIUC37TniVPYlHnRqAemxQ==
X-Google-Smtp-Source: ABdhPJxnDxkwXkTAVEK/PThX9uS74sv8umtjiWwfjWMmVibtFA3GJeFZ5aOd5+yEYTEA4wsXOVzSiw==
X-Received: by 2002:a17:906:d145:: with SMTP id
 br5mr22140782ejb.452.1620145837348; 
 Tue, 04 May 2021 09:30:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id kt21sm1615904ejb.5.2021.05.04.09.30.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 09:30:36 -0700 (PDT)
Date: Tue, 4 May 2021 18:30:34 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: remove the nvlink2 pci_vfio subdriver v2
Message-ID: <YJF2qm+voakTWq9M@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@nvidia.com>, Greg Kurz <groug@kaod.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Christoph Hellwig <hch@lst.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Alex Williamson <alex.williamson@redhat.com>, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Paul Mackerras <paulus@samba.org>,
 linux-api@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20210326061311.1497642-1-hch@lst.de>
 <20210504142236.76994047@bahia.lan> <YJFFG1tSP0dUCxcX@kroah.com>
 <20210504152034.18e41ec3@bahia.lan>
 <YJFY7NjEBtCSlJHw@phenom.ffwll.local>
 <20210504155327.GA94750@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210504155327.GA94750@nvidia.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
Received-SPF: none client-ip=2a00:1450:4864:20::634;
 envelope-from=daniel@ffwll.ch; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Michael Ellerman <mpe@ellerman.id.au>, Greg Kurz <groug@kaod.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, qemu-ppc@nongnu.org,
 linux-api@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 04, 2021 at 12:53:27PM -0300, Jason Gunthorpe wrote:
> On Tue, May 04, 2021 at 04:23:40PM +0200, Daniel Vetter wrote:
> 
> > Just my 2cents from drm (where we deprecate old gunk uapi quite often):
> > Imo it's best to keep the uapi headers as-is, but exchange the
> > documentation with a big "this is removed, never use again" warning:
> 
> We in RDMA have been doing the opposite, the uapi headers are supposed
> to reflect the current kernel. This helps make the kernel
> understandable.
> 
> When userspace needs backwards compat to ABI that the current kernel
> doesn't support then userspace has distinct copies of that information
> in some compat location. It has happened a few times over the last 15
> years.
> 
> We keep full copies of the current kernel headers in the userspace
> source tree, when the kernel headers change in a compile incompatible
> way we fix everything while updating to the new kernel headers.

Yeah we do the same since forever (it's either from libdrm package, or
directly in the corresponding userspace header). So largely include/uapi
is for documentation

> > - it's good to know which uapi numbers (like parameter extensions or
> >   whatever they are in this case) are defacto reserved, because there are
> >   binaries (qemu in this) that have code acting on them out there.
> 
> Numbers and things get marked reserved or the like
> 
> > Anyway feel free to ignore since this might be different than drivers/gpu.
> 
> AFAIK drives/gpu has a lot wider userspace, rdma manages this OK
> because we only have one library package that provides the user/kernel
> interface.

But since we have some many projects we've started asking all the userspace
projects to directly take the kernel ones (after the make step to filter
them) so that there's only one source of truth. And also to make sure they
don't merge stuff before the kernel side is reviewed&landed. Which also
means we can't ditch anything userspace might still need on older trees
and stuff.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

