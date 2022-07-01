Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A889562B7E
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 08:24:16 +0200 (CEST)
Received: from localhost ([::1]:42382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7A4c-0002Bk-HB
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 02:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o79zc-0000Ue-5O
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 02:19:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o79zV-0004l4-Ll
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 02:19:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656656336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H+3EWAxBA/8KAJ5bfdWegRn/7VEPtFebvDWmzRITW4Q=;
 b=ZvOrc+HwmmJQZzRFtynACl85vmggrepjndlO1KmpnEx8dmdCddnZ6EYc0UsUGKmuh85jIA
 rIHw89s39Coevp2R/fEBDwPAKRt/SXJqBarwOpIvCxZIO//k0EM/jA6RzoIrs4nig0Rcyh
 E4UXDxHf4rIdIVz3ll7Hi0RVF95FY0E=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-172-yli982pGPFGqfq_YC-q-uw-1; Fri, 01 Jul 2022 02:18:52 -0400
X-MC-Unique: yli982pGPFGqfq_YC-q-uw-1
Received: by mail-qv1-f71.google.com with SMTP id
 s11-20020a0562140cab00b0046e7d2b24b3so1832504qvs.16
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 23:18:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:content-transfer-encoding:user-agent:mime-version;
 bh=H+3EWAxBA/8KAJ5bfdWegRn/7VEPtFebvDWmzRITW4Q=;
 b=KgFGNa+7npwrHqcr4lqCg9Y0VoDj94vyv6JfTr2tW/0S+xRuVEh28sVpv/lkidU2Dt
 kliharqJCmN0UJ+l6M/DM/gFJl2XkT89dvaL3Z7St4RaDL2ynxiaYSNn7QW4rxU4tE3q
 aIJ9GuDY9bhUYntR4lHsLEVeaoJj08ADbgKwckNSsKwprbXveq7dlUtStFgnM9gsH4no
 Z1TLftt+XFqvmfjkUlzWvSbTOqfk28wC5T/aNiqoMV0QjdJiqPkRGUA+tb9bDFS2Exck
 sIzwaj+JpWYE41Wml5K0nAsIkZl7t1DbOQUP8iHpIjEcbmuy20cUieK0W/vS8SUkQtHy
 uIbA==
X-Gm-Message-State: AJIora9+oCU3Gg9VaL9hpVXis+2QWwE16dQIhf/frLGInZu50DYtAI0W
 pVfwuDFGKcBh4ZYQKgGFqnwgejM5qSs5XrrVWroBdncngz9Y5rcKuqpAAZit1pcYUDQnrl2/4CD
 kBM11IMFqmI+vKhM=
X-Received: by 2002:a05:622a:1b9f:b0:317:6815:a902 with SMTP id
 bp31-20020a05622a1b9f00b003176815a902mr10961340qtb.35.1656656331402; 
 Thu, 30 Jun 2022 23:18:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sRF/CT/6Rj8DhoWpoMLdaleN3kfjO8G5AKQ4+vrtDivON5mos9UfebVgcsLZ+lfuISiixySA==
X-Received: by 2002:a05:622a:1b9f:b0:317:6815:a902 with SMTP id
 bp31-20020a05622a1b9f00b003176815a902mr10961326qtb.35.1656656331142; 
 Thu, 30 Jun 2022 23:18:51 -0700 (PDT)
Received: from ?IPv6:2804:431:c7f1:da6a:610c:873d:4fe2:e6ce?
 ([2804:431:c7f1:da6a:610c:873d:4fe2:e6ce])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a05620a268400b006aee03a95dfsm16835373qkp.124.2022.06.30.23.18.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 23:18:50 -0700 (PDT)
Message-ID: <66da1d2d1617c61012a515fc3104866ee5d49f69.camel@redhat.com>
Subject: Re: [PATCH v1 2/2] migration/multifd: Warn user when zerocopy not
 working
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: "Daniel P." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, Juan
 Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>, qemu-devel
 <qemu-devel@nongnu.org>
Date: Fri, 01 Jul 2022 03:18:47 -0300
In-Reply-To: <Yrsy2MzluKDvc5xK@work-vm>
References: <20220628010908.390564-1-leobras@redhat.com>
 <20220628010908.390564-3-leobras@redhat.com> <YrqzhFAePnnEl8A8@redhat.com>
 <CAJ6HWG5UGpgBqK-7OTA6Gxu0LKMfGq5gVvYffOaSMWO1bfyjVw@mail.gmail.com>
 <Yrr77NfKtKcXTVCr@redhat.com> <YrsHgWbhifokl6yL@work-vm>
 <CAJ6HWG7hXNzuJ8rKc0NzLC_GguEOtVxGGUz8gDqizyZUy=Yieg@mail.gmail.com>
 <Yrsy2MzluKDvc5xK@work-vm>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 
MIME-Version: 1.0
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
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

On Tue, 2022-06-28 at 17:56 +0100, Dr. David Alan Gilbert wrote:
> * Leonardo Bras Soares Passos (leobras@redhat.com) wrote:
> > On Tue, Jun 28, 2022 at 10:52 AM Dr. David Alan Gilbert
> > <dgilbert@redhat.com> wrote:
> > >=20
> > > * Daniel P. Berrang=C3=A9 (berrange@redhat.com) wrote:
> > > > On Tue, Jun 28, 2022 at 09:32:04AM -0300, Leonardo Bras Soares Pass=
os
> > > > wrote:
> > > > > On Tue, Jun 28, 2022 at 4:53 AM Daniel P. Berrang=C3=A9
> > > > > <berrange@redhat.com> wrote:
> > > > > >=20
> > > > > > On Mon, Jun 27, 2022 at 10:09:09PM -0300, Leonardo Bras wrote:
> > > > > > > Some errors, like the lack of Scatter-Gather support by the
> > > > > > > network
> > > > > > > interface(NETIF_F_SG) may cause sendmsg(...,MSG_ZEROCOPY) to =
fail
> > > > > > > on using
> > > > > > > zero-copy, which causes it to fall back to the default copyin=
g
> > > > > > > mechanism.
> > > > > >=20
> > > > > > How common is this lack of SG support ? What NICs did you have =
that
> > > > > > were affected ?
> > > > >=20
> > > > > I am not aware of any NIC without SG available for testing, nor h=
ave
> > > > > any idea on how common they are.
> > > > > But since we can detect sendmsg() falling back to copying we shou=
ld
> > > > > warn the user if this ever happens.
> > > > >=20
> > > > > There is also a case in IPv6 related to fragmentation that may ca=
use
> > > > > MSG_ZEROCOPY to fall back to the copying mechanism, so it's also
> > > > > covered.
> > > > >=20
> > > > > >=20
> > > > > > > After each full dirty-bitmap scan there should be a zero-copy
> > > > > > > flush
> > > > > > > happening, which checks for errors each of the previous calls=
 to
> > > > > > > sendmsg(...,MSG_ZEROCOPY). If all of them failed to use zero-=
copy,
> > > > > > > then
> > > > > > > warn the user about it.
> > > > > > >=20
> > > > > > > Since it happens once each full dirty-bitmap scan, even in wo=
rst
> > > > > > > case
> > > > > > > scenario it should not print a lot of warnings, and will allo=
w
> > > > > > > tracking
> > > > > > > how many dirty-bitmap iterations were not able to use zero-co=
py
> > > > > > > send.
> > > > > >=20
> > > > > > For long running migrations which are not converging, or conver=
ging
> > > > > > very slowly there could be 100's of passes.
> > > > > >=20
> > > > >=20
> > > > > I could change it so it only warns once, if that is too much outp=
ut.
> > > >=20
> > > > Well I'm mostly wondering what we're expecting the user todo with t=
his
> > > > information.
> >=20
> >=20
> > My rationale on that:
> > - zero-copy-send is a feature that is supposed to improve send
> > throughput by reducing cpu usage.
> > - there is a chance the sendmsg(MSG_ZEROCOPY) fails to use zero-copy
> > - if this happens, there will be a potential throughput decrease on
> > sendmsg()
> > - the user (or management app) need to know when zero-copy-send is
> > degrading throughput, so it can be disabled
> > - this is also important for performance testing, given it can be
> > confusing having zero-copy-send improving throughput in some cases,
> > and degrading in others, without any apparent reason why.
> >=20
> > > > Generally a log file containing warnings ends up turning
> > > > into a bug report. If we think it is important for users and/or mgm=
t
> > > > apps to be aware of this info, then it might be better to actually
> > > > put a field in the query-migrate stats to report if zero-copy is
> > > > being honoured or not,
> > >=20
> > > Yeh just a counter would work there I think.
> >=20
> > The warning idea was totally due to my inexperience on this mgmt app
> > interface, since I had no other idea on how to deal with that.
>=20
> Yeh it's not too silly an idea!
> The way some of these warning or stats get to us can be a bit random,
> but sometimes can confuse things.
>=20
> > I think having it in query-migrate is a much better idea than a
> > warning, since it should be much easier to parse and disable
> > zero-copy-send if desired.
> > Even in my current qemu test script, it's much better having it in
> > query-migrate.
> >=20
> > >=20
> > > > and just have a trace point in this location
> > > > instead.
> > >=20
> > > Yeh.
> > >=20
> >=20
> > Yeap, the counter idea seems great!
> > Will it be always printed there, or only when zero-copy-send is enabled=
?
>=20
> You could make it either if it's enabled or if it's none zero.
> (I guess you want it to reset to 0 at the start of a new migration).
>=20
> Dave

Thanks for this feedback!

I have everything already working, but I am struggling with a good property
name.=C2=A0

I am currently using zero_copy_copied (or zero-copy-copied in json), but it=
 does
not look like a good Migration stat name.=20

Do you have any suggestion?

Best regards,
Leo


>=20
> >=20
> > Best regards,
> > Leo
> >=20
> > > Dave
> > >=20
> > > > With regards,
> > > > Daniel
> > > > --
> > > > > : https://berrange.com=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -o-=C2=A0=C2=
=A0=C2=A0
> > > > > https://www.flickr.com/photos/dberrange=C2=A0:|
> > > > > : https://libvirt.org=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -o-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0
> > > > > https://fstop138.berrange.com=C2=A0:|
> > > > > : https://entangle-photo.org=C2=A0=C2=A0=C2=A0 -o-=C2=A0=C2=A0=C2=
=A0
> > > > > https://www.instagram.com/dberrange=C2=A0:|
> > > >=20
> > > --
> > > Dr. David Alan Gilbert / dgilbert@redhat.com=C2=A0/ Manchester, UK
> > >=20
> >=20


