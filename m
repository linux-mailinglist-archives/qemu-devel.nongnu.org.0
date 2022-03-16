Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CC34DB398
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 15:46:59 +0100 (CET)
Received: from localhost ([::1]:51454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUUvS-0005gb-IM
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 10:46:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nUUtY-0003kF-EA
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 10:45:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nUUtV-0001Qq-Pt
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 10:44:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647441896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L8f8EsswhKa360FvBPHHo+lmRQ++c2k/VT3utAiK6do=;
 b=BTXdTZXObBSwnuYnAEcBs04+W6ejwoOR523Vl+RfbPJ9t+G+tIeV0yz3VBvKbkRdEg51fV
 svuyyaHMiwGBuXZT3pXEP7oYLDd2iuSs8CETsodYrvyHeCqSZcrT9qsTCxaxp/i+RjA06k
 BLqSs2BmHNypGNShUTsCH8fcWVsFieU=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-253-psP_ZW54OU-VldSUAjFefg-1; Wed, 16 Mar 2022 10:44:53 -0400
X-MC-Unique: psP_ZW54OU-VldSUAjFefg-1
Received: by mail-yb1-f199.google.com with SMTP id
 b11-20020a5b008b000000b00624ea481d55so2090015ybp.19
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 07:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=L8f8EsswhKa360FvBPHHo+lmRQ++c2k/VT3utAiK6do=;
 b=Q21ieNfAiT09LY7tiRtntunupNjbuUvorKxHayxNijZof+3SDBT/47hovbPebHaOER
 jE2EVZnfX69TsTU5bQuNeGJMQ1JkHZdT6Ix99yAAdZkE1F5bLEh3DfLT2wAczIslewD4
 LHmDIn/hRuK1Q9YOYM8Kjk4phSvae5xKeOHzJLdM6uXUSO1HWQz8sb2LjEyNBgCgVOZC
 pncEMwj4adZ4jNHr1m+fGYlchzeTBL+aCro0vzg5zN+Ct3tYmawKJtU5QE6NrQ+bXjMq
 xNjVLYDZ4IiEu5SN7GQjLj30m1uYGiRrkG9vbaODyDQc1Dbr+ny3C6U5ENhCAM1F/5yn
 CGyg==
X-Gm-Message-State: AOAM5314q2sItkhcF+kueasRMUl+UwrcMY6CpVlBwIyxcfoVs6ngs83j
 lG/MzXXfTxIz1mScyEwOY2mPXm14g8TqtXqSoh12oKrUriYQjyVn7SdJJYhqaxPyrbSEOAUD45w
 9bZooXCY+NgmqmH/5rh2o+k3ICJLGcnI=
X-Received: by 2002:a81:5dd5:0:b0:2dc:19cf:17ac with SMTP id
 r204-20020a815dd5000000b002dc19cf17acmr427067ywb.312.1647441892787; 
 Wed, 16 Mar 2022 07:44:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFWYn/wtSu246u8Y4CYfKSyUDvMgcKhxu5hgK+YIOdccvoRRaKZhf56K2IxHr0xWfHRxN69qDhHOSHm0DlaKI=
X-Received: by 2002:a81:5dd5:0:b0:2dc:19cf:17ac with SMTP id
 r204-20020a815dd5000000b002dc19cf17acmr427038ywb.312.1647441892569; Wed, 16
 Mar 2022 07:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220316095221.2613526-1-marcandre.lureau@redhat.com>
 <50cece3d-37ac-7fe4-db14-1116e9665594@redhat.com>
In-Reply-To: <50cece3d-37ac-7fe4-db14-1116e9665594@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 16 Mar 2022 18:44:41 +0400
Message-ID: <CAMxuvaxwSX4cnVaCFMFad6qFs4CqgKs7KiLntuSVApy4AoZiiw@mail.gmail.com>
Subject: Re: [PATCH 02/27] meson: remove bsd_oses
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Wed, Mar 16, 2022 at 6:40 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 3/16/22 10:52, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > It is unused.
>
> It's fine to remove it now, but I'll bring it back in 7.1. :)  You decide=
.

Whatever, but if noone ack it, let's leave it then.
thanks

>
> Paolo
>
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >   meson.build | 1 -
> >   1 file changed, 1 deletion(-)
> >
> > diff --git a/meson.build b/meson.build
> > index bae62efc9c33..784e91753630 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -44,7 +44,6 @@ config_host_data =3D configuration_data()
> >   genh =3D []
> >   qapi_trace_events =3D []
> >
> > -bsd_oses =3D ['gnu/kfreebsd', 'freebsd', 'netbsd', 'openbsd', 'dragonf=
ly', 'darwin']
> >   supported_oses =3D ['windows', 'freebsd', 'netbsd', 'openbsd', 'darwi=
n', 'sunos', 'linux']
> >   supported_cpus =3D ['ppc', 'ppc64', 's390x', 'riscv', 'x86', 'x86_64'=
,
> >     'arm', 'aarch64', 'loongarch64', 'mips', 'mips64', 'sparc', 'sparc6=
4']
>


