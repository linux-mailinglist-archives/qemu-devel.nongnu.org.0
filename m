Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 436F5382CEA
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 15:09:55 +0200 (CEST)
Received: from localhost ([::1]:36328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lid0M-0006PY-Bs
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 09:09:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1liczS-0004Kn-MO
 for qemu-devel@nongnu.org; Mon, 17 May 2021 09:08:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1liczR-000538-27
 for qemu-devel@nongnu.org; Mon, 17 May 2021 09:08:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621256936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y7paTmXM5btGGjUAvTHo5mqZSfLeaPUI/AGJ0cNjJcc=;
 b=LXQiSZITILAz2Fakt0mvJZgQMcSqfbfVSR5UJE09YtcXJmqs0mCTwlneJ1hv9+CZ1ZyynI
 I5ftZgjYyTFRMBKZRmNriUrolv5utQ5enlqbqqFLldmT47Jz1+kNqgAxfSbmakzqzXiBZm
 Eia/XRtp2G/1k7g8lFlvxXrupFqhsO0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-alX5rVflNnW-1OiCnH2EZg-1; Mon, 17 May 2021 09:08:53 -0400
X-MC-Unique: alX5rVflNnW-1OiCnH2EZg-1
Received: by mail-qv1-f72.google.com with SMTP id
 a29-20020a0ca99d0000b02901ec0ad2c871so4739584qvb.0
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 06:08:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=y7paTmXM5btGGjUAvTHo5mqZSfLeaPUI/AGJ0cNjJcc=;
 b=TsdXgP3VO2Z/xg1baaTmxtZivPD8353FuMtXsV0izE52tyaQr1mrh2OVLgpQG+InlT
 bubGwRF1kHFt0LW8SYtgaVGOE0TAFYzUvc7gQEFYL93Zs8PD+mj+raaPCmxAFpMmfGmi
 UAUPVERHaCcMP9fnyXS5Jmfwvg1Yln0Ibs3qJrevGXECselzVRyOCpVhEpg3P5mTgCxp
 8/hdkO/GDoQ3wolL8bQPWcoDQ8RSjRtEDx+6nLAfLYnlLD/jD6c92rWPcYwGME0ocvWt
 6HTT+v75fESHj0JIwhMsu6WWEQo3bexGKTD6NbDfiCGvkRJ0ah82JcCj02j3G68TI5tS
 ABwA==
X-Gm-Message-State: AOAM531DferNHgXtOxhc3Sm+4iTk/1SUJpLL4oO74x1CjpSvhmRkusgi
 AXLjU+mDTxNC0TbVaMhaxHFaYv+5PPNX1iJfZt0qb7e+px8l+rAad7/D0udjj6Co+4Cnt0dGvfU
 asDUsSpBerOCzj9I=
X-Received: by 2002:a37:a24b:: with SMTP id l72mr56128350qke.189.1621256932966; 
 Mon, 17 May 2021 06:08:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzc+ZOAa3jGbkioH6Oo3Ke4oxhLvag7msh0hSGJfk5UOR/YGroTbZnOTd93yLD/B5UIfxgIMQ==
X-Received: by 2002:a37:a24b:: with SMTP id l72mr56128284qke.189.1621256932435; 
 Mon, 17 May 2021 06:08:52 -0700 (PDT)
Received: from horse.lan (pool-173-76-174-238.bstnma.fios.verizon.net.
 [173.76.174.238])
 by smtp.gmail.com with ESMTPSA id j16sm8442624qtr.27.2021.05.17.06.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 06:08:52 -0700 (PDT)
Date: Mon, 17 May 2021 09:08:50 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Connor Kuehl <ckuehl@redhat.com>
Subject: Re: [Virtio-fs] [PATCH 0/7] virtiofsd: Few cleanups in
 virtio_send_data_iov()
Message-ID: <20210517130850.GD546943@horse.lan>
References: <20210511213736.281016-1-vgoyal@redhat.com>
 <34daab90-0e71-20c1-139d-ac0e084f8ed0@redhat.com>
MIME-Version: 1.0
In-Reply-To: <34daab90-0e71-20c1-139d-ac0e084f8ed0@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 13, 2021 at 03:50:33PM -0500, Connor Kuehl wrote:
> On 5/11/21 4:37 PM, Vivek Goyal wrote:
> > Hi,
> > 
> > Code in virtio_send_data_iov() little twisted and complicated. This
> > patch series just tries to simplify it a bit to make it little easier
> > to read this piece of code.
> > 
> > Thanks
> > Vivek
> > 
> > Vivek Goyal (7):
> >   virtiofsd: Check for EINTR in preadv() and retry
> >   virtiofsd: Get rid of unreachable code in read
> >   virtiofsd: Use iov_discard_front() to skip bytes
> >   virtiofsd: get rid of in_sg_left variable
> >   virtiofsd: Simplify skip byte logic
> >   virtiofsd: Check EOF before short read
> >   virtiofsd: Set req->reply_sent right after sending reply
> > 
> >  tools/virtiofsd/fuse_virtio.c | 67 +++++++++++------------------------
> >  1 file changed, 21 insertions(+), 46 deletions(-)
> > 
> 
> With the codestyle fix to appease the bot:
> 
> Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
> 
> (For the series)

Thanks. I will fix the coding style issue and repost the patch series.

Vivek


