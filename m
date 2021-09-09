Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98304404813
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 11:53:57 +0200 (CEST)
Received: from localhost ([::1]:40270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOGkm-0000CZ-K4
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 05:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mOGiT-0005SA-8l
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 05:51:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mOGiP-0008OX-SK
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 05:51:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631181088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YbkLxkL5d5g7qacX2+APx5e0VkCjAmBQh+W6NEXF1kM=;
 b=Ei27ZlD/tgTsxwcrVpspKAaguOp2cJNcTwJx6PkuCfAwxcEb2rcf5kWS/bbCw+YyNlgT5i
 UdBs7Jzojq3BEscua72Tq6X6EE9NKKg+f/VBoCn8SaX8gOMG/eYJgzLLoS7WH/e42nv1dT
 rfeh5hg48v5mGK9Z3hb6OVUcasUOBR4=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-i3Gpc7lyOu-hibTHZ8JOEg-1; Thu, 09 Sep 2021 05:51:27 -0400
X-MC-Unique: i3Gpc7lyOu-hibTHZ8JOEg-1
Received: by mail-lj1-f200.google.com with SMTP id
 j9-20020a2ea909000000b001dc7f4ec0ffso523185ljq.1
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 02:51:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YbkLxkL5d5g7qacX2+APx5e0VkCjAmBQh+W6NEXF1kM=;
 b=E0TMGPSe2UKcC6LdeY/3kfcxrMV2l7h8mL5cint3tTvrraLqNns855TeV7JahLMq+a
 PDIp+oKiMYiyKUixrRsB7fj7PTC3GW/XHAdv9xh/OW97HltZReXAs+I1ISdKSi207z+u
 GJMLfLK+uMPFmwxguoSKcStPwRv0yLQ+4/RvICwV2DsuSYcLmRaqP+bRyB6mBOfNdaSv
 8OkyBCkqolBl0Ei2kUNaLqGuo6wF4YJb7T7wBuh2l97WNwNNuKBh+KsXWkzMKT956+G7
 YEoA98vA6AigXJUIG1TTcOMHQf3xdsOVQ2tieNOOWQd9RU+6JCV9KmFo0/lJ5udQ/ial
 xjXg==
X-Gm-Message-State: AOAM530GwZPyZD7Nggtfi3+q6P5s8A6AZUd5HKzpuKFyaeZWlJ6RwMoD
 dZjNwK3UlB0/PVNibV0McLbwDMSVqABWoupzQNveLw/khiMiqntdGnReGcDgo8sP+kN3pi50py4
 8zHKL/O9JkLuufZxJfLvUVNE0xXZD2YM=
X-Received: by 2002:a05:651c:b09:: with SMTP id
 b9mr1519793ljr.307.1631181086072; 
 Thu, 09 Sep 2021 02:51:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCFEGP4NkeYuE+n90svatw1jkH5R06JRYghOoM7lxC04uJKVYP+Vj9BNbqLh/EiHpJ0Q1ew+WzqCjmLeWHRFQ=
X-Received: by 2002:a05:651c:b09:: with SMTP id
 b9mr1519781ljr.307.1631181085848; 
 Thu, 09 Sep 2021 02:51:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210907104512.129103-1-pbonzini@redhat.com>
 <8b500aeb-b4e2-dcee-24f8-825ae6327acf@redhat.com>
 <e6790a9c-f2a3-75f8-623f-51726f4b656d@redhat.com>
 <CACGkMEuSNRmKX2ukdDkmhS91-o4Z0mi_TdASCm6aKNkFHum0gQ@mail.gmail.com>
 <CAFEAcA940jNBwBV1BwxmC9h-YMSQijNTtsfGYAsuHdAY0ruADw@mail.gmail.com>
In-Reply-To: <CAFEAcA940jNBwBV1BwxmC9h-YMSQijNTtsfGYAsuHdAY0ruADw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 9 Sep 2021 17:51:14 +0800
Message-ID: <CACGkMEte8fQWje0HFu4t9P6FxQNGtFHKoJQ1xU=3s5reNNLvEQ@mail.gmail.com>
Subject: Re: [PATCH] ebpf: only include in system emulators
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Andrew Melnychenko <andrew@daynix.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Yuri Benditovich <yuri.benditovich@daynix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 9, 2021 at 5:50 PM Peter Maydell <peter.maydell@linaro.org> wro=
te:
>
> On Thu, 9 Sept 2021 at 04:14, Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Wed, Sep 8, 2021 at 1:46 PM Paolo Bonzini <pbonzini@redhat.com> wrot=
e:
> > >
> > > On 08/09/21 05:08, Jason Wang wrote:
> > > >
> > > > =E5=9C=A8 2021/9/7 =E4=B8=8B=E5=8D=886:45, Paolo Bonzini =E5=86=99=
=E9=81=93:
> > > >> eBPF files are being included in system emulators, which is useles=
s
> > > >
> > > >
> > > > I think it should work since it's an independent feature. The curre=
nt
> > > > use case is to offload the RSS from Qemu to kernel TAP.
> > >
> > > Sorry, I meant "user emulators".  That should make more sense, they
> > > don't have TAP at all.
>
> > I see so I've queued this.
>
> Did you fix the mistake in the commit message ?

Yes.

Thanks

>
> thanks
> -- PMM
>


