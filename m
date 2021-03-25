Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FE63491B7
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 13:16:20 +0100 (CET)
Received: from localhost ([::1]:56624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPOuR-0006ri-D5
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 08:16:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1lPOoD-000340-3X
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 08:09:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1lPOo5-0004dY-GP
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 08:09:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616674182;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cqLx203VfcjNtQ0JZrhInNAexqBvbVgf55j3MRzyZOs=;
 b=f+agRYzcAqvIMaPsoAQYfig8+odL2+s+45MoLp2hr4BKNQpkoV9+cDU6LvsYdSQ0nnZ2X8
 3x//L0dEE1Sgomp9Y2pcftpJd/xaiGncJvIV8z1vT5YOTNyV21n41K6r7FjRPEZz2WuW2X
 iXHmXeUAcO/ymSvcNsf7hf2jrwgHC2E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-PcPq27-0OEiuNIjc__OM3w-1; Thu, 25 Mar 2021 08:09:41 -0400
X-MC-Unique: PcPq27-0OEiuNIjc__OM3w-1
Received: by mail-wm1-f72.google.com with SMTP id z26so1607862wml.4
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 05:09:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xCHvQxphl6pLZQSPRcPR2DHk32vnNe2DuEa05ayqfR8=;
 b=f3aFb/+CS73Q7/tVj6D75Wgc9xuSZEkR/uESEPDvK4clNyUm2R1IRklHlHmxsXGt3I
 XEw2b0W9riwSp4CNoXeNUOV9uqykQ1oSz8rVjg8EC/QHRAoxc2WzL0IV8C2MKGo1gQRw
 i9TZLy8rtJnJvBAyQKPrJMeSaSY15eAvCx2Sagdwj0Zry5TmpE2nnFaaHAjm2oF2R8GK
 vVv62RZ0bLjQfzED94qER9xtkjhbiFO22FSe+/iecVRvQoUThJUGEgyjH6+UEZ9bbXoA
 HyhwAZjcbb7PCZvwRT576XQvn3brJXWtT2eT4F9UcTrT8TcNle4dpHowaYnlzSZf6nc3
 9eQg==
X-Gm-Message-State: AOAM532TywIDIzct0J6ouiWD0xUSLbzy/k2dkgRNcn+qBa55GRSz0ipa
 7tG5VjHS0iNMuWHTTsBBRKgqEfjIbnyTcaun76cCyVoj6DhT3SaElB7IVCzHgK4yvb7XPHybOdJ
 sKFRP42vQsn3X9Fo=
X-Received: by 2002:a05:600c:614:: with SMTP id
 o20mr7432931wmm.66.1616674179730; 
 Thu, 25 Mar 2021 05:09:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHTsWQW149SWibS9GSxY4oeJO0hT83fDouuY4vu3zA6XOtldGz1b9xh8/UrSA5ZQLoieVLSQ==
X-Received: by 2002:a05:600c:614:: with SMTP id
 o20mr7432695wmm.66.1616674176916; 
 Thu, 25 Mar 2021 05:09:36 -0700 (PDT)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id q207sm6213072wme.36.2021.03.25.05.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 05:09:36 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH] migration: Move populate_vfio_info() into a separate file
In-Reply-To: <YFCUgJZXe0HxHbDn@work-vm> (David Alan Gilbert's message of "Tue, 
 16 Mar 2021 11:20:32 +0000")
References: <20210315190756.317710-1-thuth@redhat.com>
 <f26d3ce6-b51a-7c44-2ec1-21a6bd2d4a46@redhat.com>
 <2e455379-15de-835c-014f-8ae2c26639a6@redhat.com>
 <YFCUgJZXe0HxHbDn@work-vm>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Date: Thu, 25 Mar 2021 13:09:35 +0100
Message-ID: <87y2ebo2o0.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: quintela@redhat.com
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Kirti Wankhede <kwankhede@nvidia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> * Thomas Huth (thuth@redhat.com) wrote:
>> On 15/03/2021 22.05, Philippe Mathieu-Daud=C3=A9 wrote:
>> > Hi Thomas,
>> >=20
>> > +Alex
>> >=20
>> > On 3/15/21 8:07 PM, Thomas Huth wrote:
>> > > The CONFIG_VFIO switch only works in target specific code. Since
>> > > migration/migration.c is common code, the #ifdef does not have
>> > > the intended behavior here. Move the related code to a separate
>> > > file now which gets compiled via specific_ss instead.
>> > >=20
>> > > Fixes: 3710586caa ("qapi: Add VFIO devices migration stats in
>> > > Migration stats")
>> > > Signed-off-by: Thomas Huth <thuth@redhat.com>
>> > > ---
>> > >   migration/meson.build |  3 ++-
>> > >   migration/migration.c | 15 ---------------
>> > >   migration/migration.h |  2 ++
>> > >   migration/special.c   | 25 +++++++++++++++++++++++++
>> > >   4 files changed, 29 insertions(+), 16 deletions(-)
>> > >   create mode 100644 migration/special.c
>> > >=20
>> > > diff --git a/migration/meson.build b/migration/meson.build
>> > > index 9645f44005..e1f72f6ba0 100644
>> > > --- a/migration/meson.build
>> > > +++ b/migration/meson.build
>> > > @@ -30,4 +30,5 @@ softmmu_ss.add(when: ['CONFIG_RDMA', rdma],
>> > > if_true: files('rdma.c'))
>> > >   softmmu_ss.add(when: 'CONFIG_LIVE_BLOCK_MIGRATION', if_true:
>> > > files('block.c'))
>> > >   softmmu_ss.add(when: zstd, if_true: files('multifd-zstd.c'))
>> > > -specific_ss.add(when: 'CONFIG_SOFTMMU', if_true:
>> > > files('dirtyrate.c', 'ram.c'))
>> > > +specific_ss.add(when: 'CONFIG_SOFTMMU',
>> > > +                if_true: files('dirtyrate.c', 'ram.c', 'special.c')=
)
>> >=20
>> > Why not simply name this migration/vfio.c? That way we do not start
>> > mixed bag of everything target specific.
>>=20
>> I don't mind ... well, if we have other small functions there in the fut=
ure
>> that depend on CONFIG switches, a mixed bag file might not be such a bad
>> idea instead of having lots and lots of small other files ... OTOH, if t=
here
>> is more vfio migration code in the works that might fit here, a name lik=
e
>> vfio.c would be better, of course. What do the maintainers think?
>
> Could this be done with stubs instead of an ifdef; i.e. a stub of
> 'vfio_mig_active' and 'vfio_mig_bytes_transferred'?

My understanding is that they can't (at least easily).
Because they are really target specific :-(

> As for naming 'special' is too generic.
> 'vfio' is too specific (especially since most vfio code ends up under
> hw/vfio)
>
> how about migration/target.c  as something which is explicit about why
> it's done that way.

I agree with the target name.

But I can't think of a really much easier way that what is in this
patch.

To make stubs you need to ifdef half of hw/vfio/vfio-common.h, or just
put the #ifdef in migration/target.c

Even althought I hate #ifdefs, I am not sure that the stubs options is
much clearly here.

Later, Juan.


