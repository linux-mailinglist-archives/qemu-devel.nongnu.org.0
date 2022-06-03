Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A3353CC00
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 17:08:41 +0200 (CEST)
Received: from localhost ([::1]:42022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nx8um-00047M-6I
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 11:08:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nx8s0-0002L6-RR
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 11:05:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nx8rz-0005tS-8I
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 11:05:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654268746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WPOzktgP8+qV4fmhY1epDvCQ0q7ju+YfQIdYpZDIG+w=;
 b=BncFkm60cA27Dd6VcGF0EuCKVSIwrhRqXuQJXPnuqYXGrc2K6pz8WEPHxxNci8ARrPYsg3
 wHjSJKuKS0RYm7zThxBrTLaAaXiKS+TSwPKZOx8KIndqePout1jAE65OeBvTpYpFm6RK/Z
 51JORX2+lQDFmd/EJPlEwK3QQ6AljRA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-280-pteSLRcOP2qhLxJGKy3KCw-1; Fri, 03 Jun 2022 11:05:45 -0400
X-MC-Unique: pteSLRcOP2qhLxJGKy3KCw-1
Received: by mail-ed1-f70.google.com with SMTP id
 eh10-20020a0564020f8a00b0042dd9bf7c57so5657142edb.17
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 08:05:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WPOzktgP8+qV4fmhY1epDvCQ0q7ju+YfQIdYpZDIG+w=;
 b=so1iYpnDOL7gsQa/vgSaQRLg4+eKCs7bDmM4npBsWOM4GZgFkUAux0MMagrN/Iwe2w
 NjkHbDaaHAOMrOaFWrDs28rKexsV/Xf/LcEfIGjkoS6HJ+FwoGfVOulCwqoVPeple2ng
 G4DDu+74INQ5ZiL/V7d4utdSZt6/CClKLjt2LZYg7nhUyZSEOCBNSjn+mL8bue22L+0Z
 PvW2iaKDkxqkXiG5kXtR6Ty2ekhuIbMumBilQN4zmnLaQCKndrNHIBnmbwreH9fH272k
 3yrK98T8dOlhk+tXb4O3WUQhCT5xMkQlE/uyTSyjBIoUtm6Enkh2LwK7H/1A6HVXb8Of
 tpvg==
X-Gm-Message-State: AOAM532rHC3LkfhxfhyJvChX45x1FZk5G7rtOP2X/Z7LZIQGpJknW61q
 KCroNJ7IZUsJ2utpW8A5yeWYYYcQYVnCSfcOJkYHKiPu0irVv1w4/iNGFjYCvDF52oNJbYXxS6W
 xEzr5J8EtX/j80v4=
X-Received: by 2002:a05:6402:f17:b0:42d:d3f3:244c with SMTP id
 i23-20020a0564020f1700b0042dd3f3244cmr11309758eda.52.1654268739150; 
 Fri, 03 Jun 2022 08:05:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzy5trFS1mDV6K84hQImx/ar4t6h6/q6fmBqjunrqz+gHlhLavepNmZSWUmbmOxXYHimB61zQ==
X-Received: by 2002:a05:6402:f17:b0:42d:d3f3:244c with SMTP id
 i23-20020a0564020f1700b0042dd3f3244cmr11309710eda.52.1654268738817; 
 Fri, 03 Jun 2022 08:05:38 -0700 (PDT)
Received: from gator (cst2-175-76.cust.vodafone.cz. [31.30.175.76])
 by smtp.gmail.com with ESMTPSA id
 cz20-20020a0564021cb400b0042dd85bd23bsm3988813edb.55.2022.06.03.08.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 08:05:38 -0700 (PDT)
Date: Fri, 3 Jun 2022 17:05:36 +0200
From: Andrew Jones <drjones@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, f4bug@amsat.org,
 alex.bennee@linaro.org
Subject: Re: [PATCH] tests/avocado: Prefer max cpu type when using AArch64
 virt machine
Message-ID: <20220603150536.pt5jwmoeoqfkeixu@gator>
References: <20220603092505.1450350-1-drjones@redhat.com>
 <892b330e-2b7c-0cf7-f7a7-3419ad9ea040@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <892b330e-2b7c-0cf7-f7a7-3419ad9ea040@linaro.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 03, 2022 at 06:56:41AM -0700, Richard Henderson wrote:
> On 6/3/22 02:25, Andrew Jones wrote:
> > The max cpu type is the best default cpu type for tests to use
> > when specifying the cpu type for AArch64 mach-virt. Switch all
> > tests to it.
> 
> This won't work without further changes.
> 
> > @@ -147,7 +147,7 @@ def test_aarch64_virt(self):
> >           """
> >           :avocado: tags=arch:aarch64
> >           :avocado: tags=machine:virt
> > -        :avocado: tags=cpu:cortex-a53
> > +        :avocado: tags=cpu:max
> >           """
> >           kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
> >                         '/linux/releases/29/Everything/aarch64/os/images/pxeboot'
> 
> For a release this old, we'll see the kernel bugs wrt FEAT_LPA/FEAT_LPA2.
> See 11593544df6f ("tests/avocado: update aarch64_virt test to exercise -cpu max")

Thanks Richard. How about for each test with guest kernels which don't
work, I add a comment about LPA2 and use '-cpu max,lpa2=off' instead?

drew 


