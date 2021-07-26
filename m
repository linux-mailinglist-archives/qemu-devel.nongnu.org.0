Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5883D5C91
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 17:03:11 +0200 (CEST)
Received: from localhost ([::1]:36336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m828M-0007PF-5D
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 11:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m826O-0005a4-Fo
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 11:01:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m826I-0000rM-W3
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 11:01:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627311662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bVEPeT2fAo+aTHVkGlK+mH5+bLtJzpS16QGQ1PU5LXY=;
 b=GGlF7Z1DAADhmbPmMweCEQrL4FNfZQLHDjIcaUZWARwOuqbfvssfJi+Mjq2vw9sxw2DvVk
 FIAKEbySp52DENrkGS5voOf9zcmLmWYtYP5qvjhdmzyp2TuFmrXEQQKG48WW0XdXk55cy6
 qyou8KfFBSsZ4QGo3YuuYoAkhbBgprc=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-OKAvBMUCNVW6w4Hs_jxUMg-1; Mon, 26 Jul 2021 11:01:00 -0400
X-MC-Unique: OKAvBMUCNVW6w4Hs_jxUMg-1
Received: by mail-qk1-f197.google.com with SMTP id
 p14-20020a05620a22eeb02903b94aaa0909so9161883qki.15
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 08:01:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bVEPeT2fAo+aTHVkGlK+mH5+bLtJzpS16QGQ1PU5LXY=;
 b=iw3JXbyf1nXJRmWjyCUjssnUdexHUXmlK5hqfg3Q7k6T+/EZSSst+ujcuAHG5jHFbE
 4t9Mmro7a/VShyXa2SFo66MxGvLDDWFiT7VtpEZWLL7TMvsbKfgdX9XB8QIwztq3c6wi
 gl44KffVtE5hSNz8PmmZIdGEJqO1yknycTsmm9AXUdDWrVDcyahzpkxaOlz/YmzW2xD1
 Vs8Gua3uUWMqNWV0EWPlwlzX0Rh7yEMdHSHjLVd6OgpSdwgrPgMbJQbsYa/g0xvgm2NL
 QoDTQPYJRynAHg+99dVbFCQEUDDEDO5dwDEaB+T4DJiCBAb10HRKRB/rkqM+dtxHxogi
 7qdA==
X-Gm-Message-State: AOAM5328ftz5SCzm6WsdUK0AZhQz0T/pGc7VnuioyALZM8BjVF1QQSBJ
 ugtSXQyAdnbCxEJ7hDr95AyZIjB1Idy8My+TwxNx2ykNRSHgyazWsf2HCyE+qTVbTrnvZfYuvNb
 9waU++UYwY2WgddE=
X-Received: by 2002:a05:620a:1907:: with SMTP id
 bj7mr14142273qkb.315.1627311659835; 
 Mon, 26 Jul 2021 08:00:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyh/gtWxQ3UPTi7BVzkR81gYd0MPM7JLRgQoRKNORbZWDONWNrB00JYax7IJhjvw7HmjjHPBQ==
X-Received: by 2002:a05:620a:1907:: with SMTP id
 bj7mr14142247qkb.315.1627311659624; 
 Mon, 26 Jul 2021 08:00:59 -0700 (PDT)
Received: from gator ([140.82.166.162])
 by smtp.gmail.com with ESMTPSA id l12sm103027qtx.45.2021.07.26.08.00.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 08:00:59 -0700 (PDT)
Date: Mon, 26 Jul 2021 17:00:56 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 0/3] target/arm: Add sve-default-vector-length cpu
 property
Message-ID: <20210726150056.2sis5ssif2l3xjcf@gator>
References: <20210723203344.968563-1-richard.henderson@linaro.org>
 <CAFEAcA_AKpibWQuX4gapGD+u=KCL9-er-ejPGS_cVyNbsuLJJQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_AKpibWQuX4gapGD+u=KCL9-er-ejPGS_cVyNbsuLJJQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 26, 2021 at 01:42:45PM +0100, Peter Maydell wrote:
> On Fri, 23 Jul 2021 at 21:34, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > This is intended to resolve #482.
> >
> > Changes for v2:
> >   * Split out length bounding fix to new patch.
> >   * Use byte units for sve-default-vector-length.
> >   * Support undocumented -1 "maximum".
> >   * Add documentation.
> 
> I'm going to apply this to target-arm.next with the following
> docs tweak squashed into patch 3:
> 
> diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
> index 4ff36cc83f0..7b97df442aa 100644
> --- a/docs/system/arm/cpu-features.rst
> +++ b/docs/system/arm/cpu-features.rst
> @@ -379,11 +379,14 @@ example's (1), (4), and (6) exhibit recommended
> uses of the properties.
>  SVE User-mode Default Vector Length Property
>  --------------------------------------------
> 
> -For qemu-aarch64, the cpu property `sve-default-vector-length=N` is
> +For qemu-aarch64, the cpu property ``sve-default-vector-length=N`` is
>  defined to mirror the Linux kernel parameter file
> -`/proc/sys/abi/sve_default_vector_length`.  The default length, `N`,
> -is in units of bytes and must be between 16 and 8192.
> +``/proc/sys/abi/sve_default_vector_length``.  The default length, ``N``,
> +is in units of bytes and must be between 16 and 8192.
>  If not specified, the default vector length is 64.
> 
>  If the default length is larger than the maximum vector length enabled
> -with `sve<N>` properties, the actual vector length will be reduced.
> +with ``sve<N>`` properties, the actual vector length will be reduced.
> +
> +If this property is set to ``-1`` then the default vector length
> +is set to the maximum possible length.

This file is full of single backtick usage. Isn't it better to stay
consistent? Or do we need a patch that converts all the rest now?

Thanks,
drew

> 
> thanks
> -- PMM
> 


