Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B166222A3
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 04:34:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osbr4-0003xD-Qg; Tue, 08 Nov 2022 22:34:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1osbr2-0003v8-G1
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 22:34:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1osbr0-0005Zc-Vj
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 22:34:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667964858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S0mlaz4swd3cgXIaeduugKGgzE0ty1i00VOen4Rb7i4=;
 b=FoEl+fpowu5LpQ7T57DgExHsKdfRJt+DoPnyp+0/rit0qOOuK5/uNXt0AKPBoGX8FY3ULA
 nBn51/0v82VUgn9ZhT21Oqa5Qn8r4YlfNQdcqkQ9aVryRu+VFOiNiLKTu6SCx79IzCvkVM
 U8BSKzEvZfbL2LO7E/PKIB5BCxzq8vg=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-490-IbUgYj_4P0KiHCA8-jvGFg-1; Tue, 08 Nov 2022 22:34:16 -0500
X-MC-Unique: IbUgYj_4P0KiHCA8-jvGFg-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-13c2cedb93bso7959482fac.4
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 19:34:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S0mlaz4swd3cgXIaeduugKGgzE0ty1i00VOen4Rb7i4=;
 b=k3LNlb7rw6PvIcU1cP1/4eoJxpc3Tan1GtwrPeQAtxTpSsPkHbRHiwaQAKlp6bL1WO
 7DF3RSxHAX6b7DMcLsDen72xWNcaIjvfn8Y2swoegg/Bg3axcZer+LAL6owqzvrmk4oR
 szAJEjomWrhnHKWxFU9b4kwzyTPqTZsKskKQmhsJcK5ASba1vFlM+UD66zQnqmLv8KHd
 SMAIQNb8deoBF1RmpT/2YiGb33trSqglhQWEiVcGAQ+KyuVWz9Mvs8p1N48aroeXbUaB
 8aLVsMC1yR/fzQp/A5/rrzlX7664mGlLADIWh4978eMS9QHx3p+8kKRes5OhiE4jaP9j
 OPWw==
X-Gm-Message-State: ACrzQf1yyD6d80yQdQuvkgRPqA02TZifCxP4oSuRZUAnXeKMfGQVnSug
 6Hcn22Ut7n1yY20g6QNfjnaHSlMiViZyGCkkb0iulzDm2Uz0qBg1YTThMY/SoPZ9oe1ZFLt2W7q
 EjbvBXTGt34L/6Vi+sZqzDPuaunL8zPA=
X-Received: by 2002:a05:6808:181e:b0:35a:5959:5909 with SMTP id
 bh30-20020a056808181e00b0035a59595909mr14792284oib.35.1667964856169; 
 Tue, 08 Nov 2022 19:34:16 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4qhZss1WNuXBn35mx8pz922eXY6c4ntUAi396b0GaQ/rycy/k3PKT0OrbLQ/JXm7aDGCFFm0X4rNN7/WacVDE=
X-Received: by 2002:a05:6808:181e:b0:35a:5959:5909 with SMTP id
 bh30-20020a056808181e00b0035a59595909mr14792283oib.35.1667964856019; Tue, 08
 Nov 2022 19:34:16 -0800 (PST)
MIME-Version: 1.0
References: <20221108041929.18417-1-jasowang@redhat.com>
 <CAJSP0QVNFCCni5iXz5Dvu0C2oKipNuKk7pKX4t=Gh9zVpzPVZA@mail.gmail.com>
In-Reply-To: <CAJSP0QVNFCCni5iXz5Dvu0C2oKipNuKk7pKX4t=Gh9zVpzPVZA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 9 Nov 2022 11:34:04 +0800
Message-ID: <CACGkMEsGE5HOM3fcq4V+_BgU-+Y4OoXc3knBmcAGMzGwZA6KDA@mail.gmail.com>
Subject: Re: [PULL 0/2] Net patches
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Laurent Vivier <lvivier@redhat.com>, stefanha@redhat.com,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Wed, Nov 9, 2022 at 12:33 AM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> On Mon, 7 Nov 2022 at 23:20, Jason Wang <jasowang@redhat.com> wrote:
> >
> > The following changes since commit 524fc737431d240f9d9f10aaf381003092868bac:
> >
> >   util/log: Ignore per-thread flag if global file already there (2022-11-07 16:00:02 -0500)
> >
> > are available in the git repository at:
> >
> >   https://github.com/jasowang/qemu.git tags/net-pull-request
> >
> > for you to fetch changes up to fd2c87c7b0c97be2ac8d334885419f51f5963b51:
> >
> >   tests/qtest: netdev: test stream and dgram backends (2022-11-08 12:10:26 +0800)
> >
> > ----------------------------------------------------------------
> >
> > ----------------------------------------------------------------
> > Laurent Vivier (1):
> >       tests/qtest: netdev: test stream and dgram backends
>
> This test does not pass in CI:
> https://gitlab.com/qemu-project/qemu/-/jobs/3290964536
> https://gitlab.com/qemu-project/qemu/-/jobs/3290964524
> https://gitlab.com/qemu-project/qemu/-/jobs/3290964471
> https://gitlab.com/qemu-project/qemu/-/jobs/3290964475
> https://gitlab.com/qemu-project/qemu/-/jobs/3290964569
>
> We're in soft freeze now. Please hold off on new tests unless they
> verify regressions/blockers.

Ok, so I think the netdev socket test could go for 7.3.

Thanks

>
> Thanks,
> Stefan
>


