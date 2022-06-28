Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 326AF55C04A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 12:38:46 +0200 (CEST)
Received: from localhost ([::1]:35900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o68cH-0003br-BB
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 06:38:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o68UH-0006wM-H0
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:30:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o68UC-00020o-5m
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:30:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656412223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jXJPKjpANzJU65+UF5O3nrPjuUvGh+D6dTB55uH0pl0=;
 b=Yun3kg5A+3CmY5uWV/fKem8X3qP8aKSmJzEYMsTqqxy/BbF7AB7PMzv8eqQpvAQOjv2iES
 tCZZ9yCJHhPgzN2dG4c0kpF5YjCATzBH2AUOfzqAaG3ufOdim/n+BsE5zXyyCqRdjxanMQ
 NpHf1+89MUZr5GLzmLXzwFY7wMmHC1k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-CZUW7Gu0PcqmZ5A1vpB6gw-1; Tue, 28 Jun 2022 06:30:22 -0400
X-MC-Unique: CZUW7Gu0PcqmZ5A1vpB6gw-1
Received: by mail-wm1-f70.google.com with SMTP id
 c187-20020a1c35c4000000b003970013833aso4920677wma.1
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 03:30:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jXJPKjpANzJU65+UF5O3nrPjuUvGh+D6dTB55uH0pl0=;
 b=RR8uR4TlPF+O6VGrbuM37upfFQE2Wo+UwS6tOUzfjoe7yDDx0xOEfeglUlwFFEGF+P
 a2bZVKOrzvmKQcR9kgkb713yOOu9yKCGyzwUc1eGVL0ELL0hw8j/9WX07z8an+Ck5sB1
 8adU39NAjjfJS8Q+ioJY2bMA3nwrnVOdVZDr8Zipj5rchvOeP0XzkCOAvfYBwRz10vbp
 NYnaMmIfR0cZ0mLIePDQ/eF9Hq6NB02ji7xxJahYYogtbMzHfFMUAPJF+It/SptEly7j
 nDS0zeaBcGi1y6p22cIvIEDgIeF/0WykhsaFDCXR9/VHrvEg5xWMMMYk6R6Tu0gI9KAb
 DsEg==
X-Gm-Message-State: AJIora+khc1+w83GtvlPsxzll741sSg0f7fAJuCf+WnWSNQzb5b4ly6L
 j1w5PXxRo9Khm98iw6+mzKwqmwCcWVMUNKxPNStPEHGBUAsP5nx5tvCmgOKXM+ABQVjUuFMllti
 ObfKvMe8bvZ6JO3o=
X-Received: by 2002:a5d:6d81:0:b0:21b:b946:ec98 with SMTP id
 l1-20020a5d6d81000000b0021bb946ec98mr16653003wrs.260.1656412220939; 
 Tue, 28 Jun 2022 03:30:20 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1usnyaT/RqNOxsGSz6T34aYJQd/LFcoJevCDX+xJf/Fs0FATDqj9N53bfVcpF77pXVDM5aJRw==
X-Received: by 2002:a5d:6d81:0:b0:21b:b946:ec98 with SMTP id
 l1-20020a5d6d81000000b0021bb946ec98mr16652978wrs.260.1656412220697; 
 Tue, 28 Jun 2022 03:30:20 -0700 (PDT)
Received: from redhat.com ([2.52.23.204]) by smtp.gmail.com with ESMTPSA id
 l13-20020a5d674d000000b0021bbdc3375fsm9868678wrw.68.2022.06.28.03.30.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 03:30:20 -0700 (PDT)
Date: Tue, 28 Jun 2022 06:30:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: Why we should avoid new submodules if possible
Message-ID: <20220628062551-mutt-send-email-mst@kernel.org>
References: <20220628030749-mutt-send-email-mst@kernel.org>
 <7bf5976e-8277-7c78-f412-44f7be8754f4@redhat.com>
 <YrqyWhu8ThAcUGI4@redhat.com>
 <CAARzgwyZNAYK3p16wjeykoCB9C+tmznY+OZAM-vw+Pn_4CdMqQ@mail.gmail.com>
 <Yrq6anPW60FkjmK6@redhat.com>
 <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
 <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <CAARzgwxcjppQuO65aFzyzNBaFvJer7JEWoJeALaoKON=3XAQhg@mail.gmail.com>
 <20220628060210-mutt-send-email-mst@kernel.org>
 <d7a7b28f-a665-2567-0fb6-e31e7ecbb5c8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7a7b28f-a665-2567-0fb6-e31e7ecbb5c8@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Jun 28, 2022 at 12:21:39PM +0200, Thomas Huth wrote:
> On 28/06/2022 12.03, Michael S. Tsirkin wrote:
> [...]
> > For biosbits if we are going this route then I feel a submodule is much
> > better.  It records which version exactly each qemu version wants.
> 
> As far as I know, you can also specify the version when using pip, can't
> you? So that's not really an advantage here.

But of course if you do you do not get updates ;) You do
however rely on a 3rd party to faithfully provide you
correct code based on the version, and host it forever.

> On the contrary, submodules have a couple of disadvantages that I really
> dislike:
> 
> - submodules do not get updated automatically when doing a "git checkout",
> we have to update them via a script instead. This causes e.g. trouble if you
> rsync your source tree to a machine that has no access to the internet and
> you forgot to update the submodule before the sync

how is pip better?

> - the content of submodules is not added to the tarballs that get created on
> the git forges automatically. There were lots of requests from users in the
> past that tried to download a tarball from github and then wondered why they
> couldn't compile QEMU.

how is pip better here?

> - we include the submodule content in our release tarballs, so people get
> the impression that hte submodule content is part of the QEMU sources. This
> has two disadvantages:
>  * We already got bug reports for the code in the submodule,
>    where people did not understand that they should report that
>    rather to the original project instead (i.e. you ship it - you
>    own it)
>  * People get the impression that QEMU is a huge monster
>    application if they count the number of code lines, run
>    their code scanner tools on the tarball contents, etc.
>    Remember "nemu", for example, where one of the main complaints
>    was that QEMU has too many lines of code?

I think we can skip the checkout in the tarball if we like.
If people want to run the test they can checkout then.


> - If programs includes code via submodules, this gets a higher
>   burder for distro maintainers, since they have to patch each
>   and every package when there is a bug, instead of being able to
>   fix it in one central place.

Come on, this is just a test. We *really* don't care if an ISO
we use to test ACPI is using an exploitable version of grub.

> So in my opinion we should avoid new submodules if there is an alternative.
> 
>  Thomas

Interesting take generally, but I don't see how the logic applies in this
case. Would appreciate hearing your answers to the above.

-- 
MST


