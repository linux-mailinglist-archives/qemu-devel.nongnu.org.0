Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 320DB6CABE1
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 19:32:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgqhZ-0005Dq-N2; Mon, 27 Mar 2023 13:32:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <casantos@redhat.com>)
 id 1pgqhW-000582-Oq
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 13:32:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <casantos@redhat.com>)
 id 1pgqhU-0004aQ-P8
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 13:32:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679938319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=odScmr8GzNu0Jrge1LpGp0cPl5+DakJGsXFak4UrU9g=;
 b=an/WVRZA496LzDvW4gQYG08UGqUJD3y9ZeuYvnd//w6oLFBYhdfR/TVylRrwi5qWQxB0ew
 P3TLMzfEgYbz098ZNh/aegwHh7+wyWb3uaLp4IGTTA32LhQQyyrovBMvc44hEzmAVifOYi
 F4Qx0BPxZzIMXsBfvRyjs5DWPXtayyQ=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-9ZXgzWdKP7CJSq9zj1bK2g-1; Mon, 27 Mar 2023 13:31:58 -0400
X-MC-Unique: 9ZXgzWdKP7CJSq9zj1bK2g-1
Received: by mail-ot1-f70.google.com with SMTP id
 t21-20020a05683022f500b0069f9643a23bso3846259otc.14
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 10:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679938317;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=odScmr8GzNu0Jrge1LpGp0cPl5+DakJGsXFak4UrU9g=;
 b=VGVun3o9kfBxf1qdZCC9Z9VCdjGYcb84Gfv8ZWAoOK4ijIIeMkl4XrTz9TaZd1FRpZ
 Lh/MQTJ1fo6W8Dc8fbY4/eJmsNPckJp8yvQHlfIiz6E6+BA39LdHzo04TV+SNSEWOz7+
 4/PrVnvT5DFgM8Ds8hltLofLbs+WnNJUhgpT62sru5+FvF8RppAtI+ynbqXRoPa7Zie7
 yz0xJ33saYYr/w0qw87LhvJ8Fco+JcDr2iAqIfx3zPO5v1mQWwYiiw/PboIvrVjcBoY+
 NXbSLAfqToBZLfhzj+k+gw1r+gbyviCcEYmcHnjTD2BJdT5qbUWDATDX0NzEzRO5Essx
 asww==
X-Gm-Message-State: AAQBX9eDexaw0Nkh+jdJhrvG874BrWmHDSQN4Aj0pXSEAc0P66XQ/GYY
 vljMoJAQbJdEi3weiIRqnECdUFObLLiFnoJFQn4pDX2oKqd2bim3PZMA8LrlhjMBZqQQkCjo0Nd
 s72i5ne34MV2fIlinSxQn0IKyo1rW+oQ=
X-Received: by 2002:aca:210c:0:b0:389:4e54:79f0 with SMTP id
 12-20020aca210c000000b003894e5479f0mr236434oiz.3.1679938317200; 
 Mon, 27 Mar 2023 10:31:57 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZRoCfZQmRt4M/eiHyk+sXroHngoizjZjYbysUMMkkXDapl40QoR7GXb2o9da6EEHuqbAw4e6xv5SkjQsyUbwM=
X-Received: by 2002:aca:210c:0:b0:389:4e54:79f0 with SMTP id
 12-20020aca210c000000b003894e5479f0mr236427oiz.3.1679938316976; Mon, 27 Mar
 2023 10:31:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230326210446.66170-1-casantos@redhat.com>
 <ZCFgnySXy4TdPyQD@redhat.com>
 <CAC1VKkNMHbwCZLmPwLWR0XmWnbzt4tcUtagg18_n96fTRUnyZw@mail.gmail.com>
 <ZCGrTwzE+UldLkbL@redhat.com>
 <CAC1VKkN7tC0N6Gk7Xko2xUQBmKz2QuBvfCvz_NFsgZ_Q7Jj+cQ@mail.gmail.com>
In-Reply-To: <CAC1VKkN7tC0N6Gk7Xko2xUQBmKz2QuBvfCvz_NFsgZ_Q7Jj+cQ@mail.gmail.com>
From: Carlos Santos <casantos@redhat.com>
Date: Mon, 27 Mar 2023 14:31:46 -0300
Message-ID: <CAC1VKkOnqgcseUDahui1ZdjRz=33nfQL2ePzzWA8LVs6iQe+Ag@mail.gmail.com>
Subject: Re: [PATCH] tracing: install trace events file only if necessary
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=casantos@redhat.com;
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

On Mon, Mar 27, 2023 at 11:44=E2=80=AFAM Carlos Santos <casantos@redhat.com=
> wrote:
>
> On Mon, Mar 27, 2023 at 11:42=E2=80=AFAM Daniel P. Berrang=C3=A9 <berrang=
e@redhat.com> wrote:
> >
> > On Mon, Mar 27, 2023 at 11:28:05AM -0300, Carlos Santos wrote:
> > > On Mon, Mar 27, 2023 at 6:23=E2=80=AFAM Daniel P. Berrang=C3=A9 <berr=
ange@redhat.com> wrote:
> > > >
> > > > On Sun, Mar 26, 2023 at 06:04:46PM -0300, casantos@redhat.com wrote=
:
> > > > > From: Carlos Santos <casantos@redhat.com>
> > > > >
> > > > > It is required only if linux-user, bsd-user or system emulator is=
 built.
> > > > >
> > > > > Signed-off-by: Carlos Santos <casantos@redhat.com>
> > > > > ---
> > > > >  trace/meson.build | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/trace/meson.build b/trace/meson.build
> > > > > index 8e80be895c..3fb41c97a4 100644
> > > > > --- a/trace/meson.build
> > > > > +++ b/trace/meson.build
> > > > > @@ -64,7 +64,7 @@ trace_events_all =3D custom_target('trace-event=
s-all',
> > > > >                                   input: trace_events_files,
> > > > >                                   command: [ 'cat', '@INPUT@' ],
> > > > >                                   capture: true,
> > > > > -                                 install: true,
> > > > > +                                 install: have_linux_user or hav=
e_bsd_user or have_system,
> > > >
> > > > Trace events are used by our command line tools too qemu-img, qemu-=
io,
> > > > qemu-nbd, qemu-pr-helper, qemu-storage-daemon.
> > > >
> > > > What build scenario are you seeing that does NOT want the trace eve=
nts
> > > > to be present ?   If there is any, then I might even call that situ=
ation
> > > > a bug, as we want trace events to be available as a debugging mecha=
nism
> > > > for everything we build.
> > >
> > > I'm aiming for an embedded system or a VM image that only needs
> > > qemu-ga, in which qemu is built with --enable-trace-backends=3Dnop.
> >
> > How about
> >
> >   install:   get_option('trace_backends') !=3D 'nop'
> >
> > ?
>
> That would be perfect :-)
>
> --
> Carlos Santos
> Senior Software Maintenance Engineer
> Red Hat
> casantos@redhat.com    T: +55-11-3534-6186

I submitted an updated patch. Thanks.

--=20
Carlos Santos
Senior Software Maintenance Engineer
Red Hat
casantos@redhat.com    T: +55-11-3534-6186


