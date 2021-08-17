Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB5D3EE935
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 11:11:15 +0200 (CEST)
Received: from localhost ([::1]:38352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFv7p-0007dm-Ua
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 05:11:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFv6e-0006ox-7d
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 05:10:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFv6b-0007Ur-V6
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 05:09:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629191396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d5aV5NJrLYbT4gZs6SvuZeXms1bkCW+DzLIokC+9yu0=;
 b=iqnoMQ77OI5P2uOCnPJvtrhcFnAvaF8kKZtT7I+4z1724k9xyxOlYo87eNSyyi1Nnu47y6
 bXNTimM5lsHcS37wQXn6UEaRLSnSLy9qvf9e7wLGnxfxlbeP4s3rEcVuqKHP2Nna6hgxvb
 Ac4IYUNHaYI6l+JuXiN++RNEQUfCUGc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-ZXn8u7fpOYOKljMWFPITYw-1; Tue, 17 Aug 2021 05:09:54 -0400
X-MC-Unique: ZXn8u7fpOYOKljMWFPITYw-1
Received: by mail-wr1-f71.google.com with SMTP id
 n18-20020adfe792000000b00156ae576abdso2636848wrm.9
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 02:09:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d5aV5NJrLYbT4gZs6SvuZeXms1bkCW+DzLIokC+9yu0=;
 b=oqDpfLSYqyvjPqkb2a4g1UF0l0Pz+CSrjBtWhEPQkzbfknIGeUV9YhVimBkmmflC1G
 6eXMTry9qnr4AqkWBfrHv4DtdS5Y5l8IGej7Nq60YevJz53QsUeqVDW3tfrdXtHf9oR3
 GIQUUHwOiXK+Ki89y/QmPvnxszzYzGRv0Q6rwhPfIPwq/7tJJc3ZCRY7KzOPl7JffHwt
 Gjp/pJWDDU1+xz2wSy87NkAUDN4cj562wGZrGUcyB+jjcZKhTEplO5RA0X5UsZedPm+r
 MYuT/26+WYq9Q+2hDHmqOUdTcb+Xv8SmD3uPgAOy7W/CYI/A7dc9DqsPPLSyBbpSK5we
 +8Lg==
X-Gm-Message-State: AOAM531fMHOvxDqTSr6dVT/I2A/J/dMcnHMdaLt5r+z8OLSOUQdMb58i
 ajE36Tn2WAQc9NlCWoqr4gnaoxx9fKs1RNTbEgzMT+Uwwe5YKKg0riCMm9dIFx3yI9mJcrxfBKw
 taBugy6J9QqoXi1Q=
X-Received: by 2002:a7b:c3d8:: with SMTP id t24mr2257570wmj.88.1629191393151; 
 Tue, 17 Aug 2021 02:09:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZcnUDYpG22W14fRRlweIHsTJwklxjgBHISbupf0ha6Ohq73RjSeHZU3LZrZy7Ii3pkBoBtA==
X-Received: by 2002:a7b:c3d8:: with SMTP id t24mr2257537wmj.88.1629191392835; 
 Tue, 17 Aug 2021 02:09:52 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id s13sm1418107wmc.47.2021.08.17.02.09.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 02:09:52 -0700 (PDT)
Subject: Re: [PATCH 0/7] floppy: build as modules.
To: John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <20210804142737.3366441-1-kraxel@redhat.com>
 <477961d5-576b-a588-9cea-dad796c592d2@amsat.org>
 <20210805071155.pkvs4fjjdlx3juoo@sirius.home.kraxel.org>
 <CAFn=p-Y-EinfLODwbSNKMov-h1W=Y5XbJNZTwdAE9L4BM+-GJw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8e1504d9-3214-ba45-1edb-6bf8ae0aa2d5@redhat.com>
Date: Tue, 17 Aug 2021 11:09:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFn=p-Y-EinfLODwbSNKMov-h1W=Y5XbJNZTwdAE9L4BM+-GJw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.71, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi John,

On 8/16/21 11:55 PM, John Snow wrote:
> On Thu, Aug 5, 2021 at 3:12 AM Gerd Hoffmann <kraxel@redhat.com
> <mailto:kraxel@redhat.com>> wrote:
> 
>     On Wed, Aug 04, 2021 at 05:19:02PM +0200, Philippe Mathieu-Daudé wrote:
>     > +Mark
>     >
>     > On 8/4/21 4:27 PM, Gerd Hoffmann wrote:
>     > > Some code shuffling needed beforehand due to floppy being part of
>     > > several platforms.  While being at it also make floppy optional
>     > > in pc machine type.
>     >
>     > >   floppy: move fdctrl_init_sysbus
>     > >   floppy: move sun4m_fdctrl_init
>     >
>     > https://www.mail-archive.com/qemu-block@nongnu.org/msg84008.html
>     <https://www.mail-archive.com/qemu-block@nongnu.org/msg84008.html>
>     >
>     > Mark suggested:
>     >
>     >   You may be able to simplify this further by removing the
>     >   global legacy init functions fdctrl_init_sysbus() and
>     >   sun4m_fdctrl_init(): from what I can see fdctrl_init_sysbus()
>     >   is only used in hw/mips/jazz.c and sun4m_fdctrl_init() is only
>     >   used in hw/sparc/sun4m.c so you might as well inline them or
>     >   move the functions to the relevant files.
>     >
>     > I did it and plan to send during 6.2. Sounds simpler than module.
>     > You could easily rebase your series on top (or I can include your
>     > patches while sending).
> 
>     Feel free to include them.  But I can also rebase when your patches
>     landed upstream.  Your choice ;)
> 
> What's the plan here, what are we trying to solve with this series
> *exactly*?
> If Phil sends his cleanups, do we still want/need the modularization here?

Both series are orthogonal, but if my cleanups get merged first, there
is less floppy code to modularize.

> For now I'm gonna shuffle these off of my review queue and I assume I'll
> see a respin/rebase from either you or phil during the 6.2 window, let
> me know if this is wrong.

This is OK. Probably easier for everybody if I can rebase/include Gerd's
patches along. I'm still not convinced FDC modularization is the right
way to go; but the PC machine is one of machines I know the less, and
has inherited a lot of odd things, so I need to carefully audit few more
things.

I'd rather have faithful chipsets modelled. Long term I don't think
FDC are going away from QEMU, as they are used by happy hobbyist running
old DOS programs from the 80's. But being able to build QEMU without
FDC would be nice indeed.


