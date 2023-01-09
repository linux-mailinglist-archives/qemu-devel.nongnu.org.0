Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0E5663078
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 20:34:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pExuc-0001a1-Ks; Mon, 09 Jan 2023 14:34:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pExua-0001ZN-WF
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 14:34:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pExuZ-00071n-2b
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 14:34:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673292861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7EVUBU840NUjR5zHhM1cr4SWiBLCBTG8mcIHAc/HZX4=;
 b=fuoO77sEDIuDpyZOr3RojYFxQABGh8i/Ikx3f4iUTLdnop/vNDOe4/7xrPykCv4CvbPBnL
 LLzA36A4kN44Y9qfrgBnyiySCY2+7FK5F/oCzp1MJ+Q9FezRyxPupOwjzyLdQ99u7xHpYH
 PnMWorFjvO4E2xGpnBi71OxR0g08mMs=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-32-AMG9j8CFMIC5yGNENU1s0g-1; Mon, 09 Jan 2023 14:34:20 -0500
X-MC-Unique: AMG9j8CFMIC5yGNENU1s0g-1
Received: by mail-qk1-f199.google.com with SMTP id
 br6-20020a05620a460600b007021e1a5c48so7088093qkb.6
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 11:34:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7EVUBU840NUjR5zHhM1cr4SWiBLCBTG8mcIHAc/HZX4=;
 b=ecSqQtEnC8FTNagYR9KSb65L/qlpiy634sL6puvyO+INdOPqlCaUs4A38pefmU3KNC
 rxfy90IYDBbbWXhoMJud53IUlKAk4/3b/7b3r7+S5S2+qaz59aelPyjF1kDL+pmaCy8g
 0dBJHdHqoJcTXG1+TlFn3aFuK1d+yLIAgcZANBS70N0iNcaUDEX1rVfPhz7S79M+MeoB
 OfgCF5RZ+dKEu2T5uDGgU0b3i+uT3X7Lnm8i3BQr+mDMIZFqlKT1RK+00zkJHMuwjTwA
 olYDD626oXorjtI0Q1FPQ33GFIP6LnyiatczKJTTYb/WvcrgLkHnmdkElgj/JYz/FFSB
 bmfw==
X-Gm-Message-State: AFqh2kox7QBFtOtpZupk4yDb8jb7prrqaEFYcSj252y08MDr8X8icqGr
 aQw8pQ01jQ0SVxfxC4npwb8x/aulCxxX2k+xXzuIjxEmUBZayHNVgiyy4U7GrB3G+1gDKjtWosH
 KTuH0ay6UlHBhoLc=
X-Received: by 2002:ad4:4e09:0:b0:51f:f4f4:e4f8 with SMTP id
 dl9-20020ad44e09000000b0051ff4f4e4f8mr79710269qvb.25.1673292860037; 
 Mon, 09 Jan 2023 11:34:20 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsr6BICr2GsR3NNluXeM0yuFy7T6D7C9LcW68lQOhialKtjQelFklSX7iujWg9ug+A3OJmLAA==
X-Received: by 2002:ad4:4e09:0:b0:51f:f4f4:e4f8 with SMTP id
 dl9-20020ad44e09000000b0051ff4f4e4f8mr79710249qvb.25.1673292859775; 
 Mon, 09 Jan 2023 11:34:19 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-39-70-52-228-144.dsl.bell.ca.
 [70.52.228.144]) by smtp.gmail.com with ESMTPSA id
 bp32-20020a05620a45a000b00705b4001fbasm2949201qkb.128.2023.01.09.11.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 11:34:19 -0800 (PST)
Date: Mon, 9 Jan 2023 14:34:17 -0500
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v3] intel-iommu: Document iova_tree
Message-ID: <Y7xsOWxcGqW4difr@x1n>
References: <20221206221348.396020-1-peterx@redhat.com>
 <CACGkMEtK8w2OkeZR=Ebp3t8t6bfaJusTRyC0eB3BGyA7KuX5-g@mail.gmail.com>
 <Y6XWy9XPHqhK8BMh@x1n>
 <CACGkMEu6OC7eCyR-ztBXGMe-mtWHfLMHPVJrGWO6Rpx3bHTCPQ@mail.gmail.com>
 <Y7RmMvRNFf+YYRyH@x1n>
 <CACGkMEu+7rnSudmZBi1EZjsgD4RwYeFg_ktxqg+e3e5C9SdaaQ@mail.gmail.com>
 <Y7WXwS1qsvOorJlU@x1n>
 <CACGkMEvZh0EdwL5+3o-BNDPez12eAO8YUNq8vWyv0ZruBfw_GA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACGkMEvZh0EdwL5+3o-BNDPez12eAO8YUNq8vWyv0ZruBfw_GA@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Jan 09, 2023 at 05:08:59PM +0800, Jason Wang wrote:
> Either:
> 
> 1) cropping in the memory core and remove the iommu cropping like
> smmu_unmap_notifier_range()
> 
> or
> 
> 2) don't corp in the memory core but move smmu_unmap_notifier_range to
> the core (still, a kind of implicit crop, since the function was
> called without a range)
> 
> 2) seems safer but I can go with 1 if you insist.

No strong opinion here, thanks for checking!  I'm not exactly sure how
it'll look like at last with 2), but so far either way sounds good.

[...]

> > It depends on how to define the "real invalidations".  There're two places
> > that can enlarge an invalidation, here I wanted to reference the case where
> > e.g. a PSI is enlarged to a DSI.  Even if that's the driver behavior, I
> > wanted to make sure the qemu iommu notifiees are aware of the facts that
> > unmap can be bigger than what it used to have mapped.
> 
> Ok, I think the confusion came from "real invalidations". I think
> there's no way for the device to know about the real invalidation
> since the driver can enlarge it at will? If this is true, is this
> better to say the UNAMP messages can cover the range that is not
> mapped?

I can reword, will repost soon.

Thanks,

-- 
Peter Xu


