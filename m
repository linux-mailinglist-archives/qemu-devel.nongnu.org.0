Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 950F248E4EF
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 08:42:56 +0100 (CET)
Received: from localhost ([::1]:57568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8HEd-0004Kf-LW
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 02:42:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n8Gls-0004Ne-PY
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 02:13:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n8Glq-0001i7-HH
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 02:13:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642144389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QQf5fD35YsYPDugq3JPzmtmQzPv++OzQoOYuAe8dWAc=;
 b=XRHX0AKSriVKZ+R1iyH9lyuP+llGvcuJcJPD192hZYGP7CeHbA4/HGu5Pyc6dy7Tvs4b09
 sAqQNnPF3i8F1H2S/ZJoVnEyaDhZ72GJTmToCKKQo1KJ59VILrhM71lb31ZopTQ3cDJm7+
 MxJzc3LwA65eCVCKTIWnHjrqY0DrakQ=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-475-hJCkhOaQMf2gy9oRukVr6Q-1; Fri, 14 Jan 2022 02:13:08 -0500
X-MC-Unique: hJCkhOaQMf2gy9oRukVr6Q-1
Received: by mail-pj1-f72.google.com with SMTP id
 i8-20020a17090a718800b001b35ee7ac29so8492790pjk.3
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 23:13:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QQf5fD35YsYPDugq3JPzmtmQzPv++OzQoOYuAe8dWAc=;
 b=ukm2HNjanzSEj6ge6CfYMaUw8hgzgx5LMgAcjQUeTOEB/i28tgM0A7+xwvu2QlmzIi
 IcidezvyBZbvSmdktWwCPTSh0DA1yPNS4xSgA2i8QWV5Kl43JgYGQ4S1LALw0/iZ4d6s
 N05ZyfGeYa6Qyciie9HypI58UyL6OD1LthmiveirnTQnoPIMIEyiMaHU3GEdFmIj6Xyd
 wsqHfIVon9RwdrJLhOuKxGz961Q4J6dGDTQaRyk6hrcAJRYCOqbYIbkVYPNFPYwtGHHK
 byUTtakaz2e7pV4lBZaYRjATPfrjekeT5ztz7etBzwifPS47pFiwu7QAMoEKidiqXbV6
 RMiA==
X-Gm-Message-State: AOAM531V0w0HWpva7HYnkUENAP9xk9mwyTireCefyeCB2TuJpEJzFe4z
 uPHok9ZoQFEtjAT7ZBrDWfbPYzOO8Xu4x+3bIIuQ6WP7HybTAkp6i9UGuohDTtP5iSbo9u9tKZd
 yZxH8FGut3QGzJeM=
X-Received: by 2002:a63:f244:: with SMTP id d4mr7000821pgk.65.1642144386855;
 Thu, 13 Jan 2022 23:13:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxuWFajEi9WfXykSSNbucqPA7BzZ/w36FqyZSfHvgUlZ7zloIFXZkvp8iBFaq8fYlWp0dK59w==
X-Received: by 2002:a63:f244:: with SMTP id d4mr7000806pgk.65.1642144386570;
 Thu, 13 Jan 2022 23:13:06 -0800 (PST)
Received: from xz-m1.local ([191.101.132.59])
 by smtp.gmail.com with ESMTPSA id p50sm4329386pfw.51.2022.01.13.23.13.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 23:13:05 -0800 (PST)
Date: Fri, 14 Jan 2022 15:13:00 +0800
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 3/3] intel-iommu: PASID support
Message-ID: <YeEifFCR6Rc5ObGg@xz-m1.local>
References: <20220105041945.13459-1-jasowang@redhat.com>
 <20220105041945.13459-5-jasowang@redhat.com>
 <Yd+zQRouwsB/jnV3@xz-m1.local>
 <8beffd3d-5eff-6462-ce23-faf44c6653f1@redhat.com>
 <YeDumkj9ZgPKGgoN@xz-m1.local>
 <CACGkMEun7WEhXy_ApxfgYmbVofjjKgGuA0ezPZG4ypRK+HtSfA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEun7WEhXy_ApxfgYmbVofjjKgGuA0ezPZG4ypRK+HtSfA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
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
Cc: "Liu, Yi L" <yi.l.liu@intel.com>, yi.y.sun@linux.intel.com,
 qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 14, 2022 at 01:58:07PM +0800, Jason Wang wrote:
> > > Right, but I think you meant to do this only when scalable mode is disabled.
> >
> > Yes IMHO it will definitely suite for !scalable case since that's exactly what
> > we did before.  What I'm also wondering is even if scalable is enabled but no
> > "real" pasid is used, so if all the translations go through the default pasid
> > that stored in the device context entry, then maybe we can ignore checking it.
> > The latter is the "hacky" part mentioned above.
> 
> The problem I see is that we can't know what PASID is used as default
> without reading the context entry?

Can the default NO_PASID being used in mixture of !NO_PASID use case on the
same device?  If that's possible, then I agree..

My previous idea should be based on the fact that if NO_PASID is used on one
device, then all translations will be based on NO_PASID, but now I'm not sure
of it.

> 
> >
> > The other thing to mention is, if we postpone the iotlb lookup to be after
> > context entry, then logically we can have per-device iotlb, that means we can
> > replace IntelIOMMUState.iotlb with VTDAddressSpace.iotlb in the future, too,
> > which can also be more efficient.
> 
> Right but we still need to limit the total slots and ATS is a better
> way to deal with the IOTLB bottleneck actually.

I think it depends on how the iotlb ghash is implemented.  Logically I think if
we can split the cache to per-device it'll be slightly better because we don't
need to iterate over iotlbs of other devices when lookup anymore; meanwhile
each iotlb takes less space too (no devfn needed anymore).

Thanks,

-- 
Peter Xu


