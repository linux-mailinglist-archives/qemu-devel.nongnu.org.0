Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAC85EDD12
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 14:43:14 +0200 (CEST)
Received: from localhost ([::1]:58828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odWPB-00054x-Av
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 08:43:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1odTLA-0008OY-HE
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 05:26:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1odTL8-0001lA-Kb
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 05:26:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664357209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2TKotPrHkV5VHU1WXrrJlbKy+Tg95jF5F4vtZv/JVdQ=;
 b=G9TLCderuJkO2xkvYGTBnaiUhyXrFzPFtU6jrZAdf/ewFqGwkwOXB7soRWQTBUEH2uISxd
 Ve28GA8YWZCR1kGQrjY66BLepx/OOC9wNZxA7qYeQp8QvkBWBin/Hm/SVSgTSGMA3ubvUH
 KoxLCp0N8AEGKHrZwk+9LhYRwCL3axw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-225-SSpBf2QCPYq81b3d_QInYw-1; Wed, 28 Sep 2022 05:26:48 -0400
X-MC-Unique: SSpBf2QCPYq81b3d_QInYw-1
Received: by mail-wr1-f71.google.com with SMTP id
 h20-20020adfaa94000000b0022cc1de1251so1079735wrc.15
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 02:26:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=2TKotPrHkV5VHU1WXrrJlbKy+Tg95jF5F4vtZv/JVdQ=;
 b=mW40w8CX8JHjugon9y9esIMrBPw94WFDq79VtNaqn1T/LhX7aC9BPq8XvwUJREgk5J
 W03KDAP8BUi3w9bepQMIO0yZ7UCJgcYemYOw9nFAVPVyNmaueWtmfEYQx6oiOA5IPXXu
 xdNBXUi4suLQvVUzE6xANNNj7J+2l7oimcUv/SzpQb0xi8r/z/N07EsQmW/e/k3bfq4/
 s8O25zT6fwvcPsVGK9gNuUlBUIjFUWnO1gfwqAFPHdtLEMeBtQbfMoMkIFi/Cbx3vkqH
 3BGawIRRnYmloWRTx28Fvm7Y0ctPkGxjWJkrwn/yRDnehcXJiZs8JNZ8Lqb0cbEGQpFs
 kGSQ==
X-Gm-Message-State: ACrzQf1tAMm6OpT4lJROjj1r27NHIAzLrTF6bBqGky87hTgj3bG8WHI4
 PZshXM1cqwkBpCHnbT1yvViRu8R1UOyVJ42V4qTfgM4nR29rq4csLibs1dy48Cuf7iUqxkhL0DL
 aLdXCS2bqzXeeU2M=
X-Received: by 2002:a05:6000:1849:b0:228:c87d:2578 with SMTP id
 c9-20020a056000184900b00228c87d2578mr19993193wri.274.1664357207254; 
 Wed, 28 Sep 2022 02:26:47 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7zCOfhiF+//xh1RHM0P37/zW2PmAi0WUEuWPU0OZ/5SnOrSesO58ss7v4Kh1pVPZWxMEH4eQ==
X-Received: by 2002:a05:6000:1849:b0:228:c87d:2578 with SMTP id
 c9-20020a056000184900b00228c87d2578mr19993174wri.274.1664357207014; 
 Wed, 28 Sep 2022 02:26:47 -0700 (PDT)
Received: from redhat.com ([2.55.47.213]) by smtp.gmail.com with ESMTPSA id
 k18-20020a05600c1c9200b003b5054c6cd2sm1508507wms.36.2022.09.28.02.26.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 02:26:46 -0700 (PDT)
Date: Wed, 28 Sep 2022 05:26:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: Why we should avoid new submodules if possible
Message-ID: <20220928052352-mutt-send-email-mst@kernel.org>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 28, 2022 at 12:21:39PM +0200, Thomas Huth wrote:
> On 28/06/2022 12.03, Michael S. Tsirkin wrote:
> [...]
> > For biosbits if we are going this route then I feel a submodule is much
> > better.  It records which version exactly each qemu version wants.
> 
> As far as I know, you can also specify the version when using pip, can't
> you? So that's not really an advantage here.
> 
> On the contrary, submodules have a couple of disadvantages that I really
> dislike:
> 
> - submodules do not get updated automatically when doing a "git checkout",
> we have to update them via a script instead. This causes e.g. trouble if you
> rsync your source tree to a machine that has no access to the internet and
> you forgot to update the submodule before the sync
> 
> - the content of submodules is not added to the tarballs that get created on
> the git forges automatically. There were lots of requests from users in the
> past that tried to download a tarball from github and then wondered why they
> couldn't compile QEMU.
> 
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
> 
> - If programs includes code via submodules, this gets a higher
>   burder for distro maintainers, since they have to patch each
>   and every package when there is a bug, instead of being able to
>   fix it in one central place.
> 
> So in my opinion we should avoid new submodules if there is an alternative.
> 
>  Thomas

So looking at the latest proposals downloading files from CI,
checksumming them etc etc. No auto checkout, not added automatically
either, right?

This seems to be the only difference:
- we include the submodule content in our release tarballs

How about we just fix that? Thomas would that address your
concern at least wrt tests?


-- 
MST


