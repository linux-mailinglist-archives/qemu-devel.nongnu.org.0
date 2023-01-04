Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CE965E047
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 23:59:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDCCy-0003Mw-8Y; Wed, 04 Jan 2023 17:26:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pDCCv-0003Ij-OG
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 17:26:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pDCCu-0007yr-Bx
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 17:26:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672871159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ec8hwymR8sCBfHDz8lCN9OyT+4HdTWbJ+yfJgvzvOu8=;
 b=TfmoKUlW0xWxUcZ34Oelk1fz3Lzy5tcqRYWkksslndktRVgTHJ63X3Bnk+EtjUBSHbswnF
 ediHLCZD4lxav36lyCaSe0m/Czwk5ap/42XnCnXnPzoffR20SaFwghlO7F7C3emTNh0y4R
 wsrozUOe5FCIOkDyrGW01/Lo+pDZDIM=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-167-pPWdGDyHOX6HO3wtG4d3Fg-1; Wed, 04 Jan 2023 17:25:58 -0500
X-MC-Unique: pPWdGDyHOX6HO3wtG4d3Fg-1
Received: by mail-lf1-f69.google.com with SMTP id
 q9-20020a19a409000000b004b6ee156e03so12058082lfc.5
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 14:25:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ec8hwymR8sCBfHDz8lCN9OyT+4HdTWbJ+yfJgvzvOu8=;
 b=fC7n2FZkArom/O5itgzvSMiqk/qwl+25MGOBT3ogYs1XK2QMLQGGIMf6Ir/yStuAlr
 Eswr81iRUI0L38rLtxIwAp44g+3TExwfg/YEhF/GTPxlYg8RwG0pVxL6uWVoF/aafaK5
 pddgILRR74qodFFxjHtqEUPfH2mbQxZOEq9hmoTTvQeZ/9UfS2HYAcqyK0Vsx60t0Kmq
 LfiLLQkLFWEr8LJkTYeeBuZYCEB7r6DEoZpko8tEZ4bARo50juOBvfra/m5iMTMVmVgT
 CSlfr9AeRcf6Kf9+CkOb30i/ZnJQA6NuV3ZpEFz33qcS4g+1vLHOqugYxWtoOHPFwBVz
 gxzQ==
X-Gm-Message-State: AFqh2kpRVSHlETWg1QwhxcAFm6Wptz4w2MotnEaHtP5G+0hkBEw/qbUV
 D26hox7b7kktX8TWeumdWGigwMCeo8i1G/NAXkNkr+vmLI0XIIA+xVb3SYgQJj8SxGHvNvpOojw
 34EMNE7UuTRPhGKtnGn+mlIqYnC7AvxY=
X-Received: by 2002:a05:6512:2392:b0:4b5:1414:415e with SMTP id
 c18-20020a056512239200b004b51414415emr2708120lfv.21.1672871156734; 
 Wed, 04 Jan 2023 14:25:56 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvfj+sjsNAXcyLUJbLYSHL8/v9Sv6Gkf9vts2Vmqrcuq3Yk89s7V6o6Z6we4Anbv13VlzUg76BXN1QtRVKpswo=
X-Received: by 2002:a05:6512:2392:b0:4b5:1414:415e with SMTP id
 c18-20020a056512239200b004b51414415emr2708115lfv.21.1672871156559; Wed, 04
 Jan 2023 14:25:56 -0800 (PST)
MIME-Version: 1.0
References: <20221203005234.620788-1-jsnow@redhat.com>
 <42bbc7e8420283f834cff7e3df362ba98c5d7346.camel@wdc.com>
In-Reply-To: <42bbc7e8420283f834cff7e3df362ba98c5d7346.camel@wdc.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 4 Jan 2023 17:25:45 -0500
Message-ID: <CAFn=p-bn0Mw1hXNpEX8WVD2841DemS0y9jqUXYKphct5RSkgkA@mail.gmail.com>
Subject: Re: [PATCH 0/3] python: testing fixes
To: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "hreitz@redhat.com" <hreitz@redhat.com>, 
 "kwolf@redhat.com" <kwolf@redhat.com>, "bleal@redhat.com" <bleal@redhat.com>, 
 "crosa@redhat.com" <crosa@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Sun, Dec 4, 2022 at 5:39 PM Wilfred Mallawa <wilfred.mallawa@wdc.com> wrote:
>
> On Fri, 2022-12-02 at 19:52 -0500, John Snow wrote:
> > A few tiny touchups needed for cutting edge 'flake8' tooling, a minor
> > type touchup in iotests, and extending the python tests to cover the
> > recently released Python 3.11.
> >
> > John Snow (3):
> >   Python: fix flake8 config
> >   iotests/check: Fix typing for sys.exit() value
> >   python: add 3.11 to supported list
> >
> >  python/setup.cfg         | 6 ++++--
> >  tests/qemu-iotests/check | 2 +-
> >  2 files changed, 5 insertions(+), 3 deletions(-)
> >
> > --
> > 2.38.1
> >
> I see you've left Westeros! xD

I'm not a huge fan of these ...

>
> Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>

... but thank you for the review.

--js


