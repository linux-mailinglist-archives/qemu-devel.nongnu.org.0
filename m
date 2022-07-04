Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55245565073
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 11:09:54 +0200 (CEST)
Received: from localhost ([::1]:57264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8I5Z-0006Bt-DR
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 05:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o8I3G-0004qP-TF
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:07:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o8I3F-0001Au-94
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:07:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656925648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bycl5SIzX5HcQeP5v8z9kef4YGkB/vT84rYMKSJ6Xms=;
 b=ArCva2q9OkHFHNQ/7fLe1xt587EQnsHT3ETkCwWerJ4CEtgfAyWf4ZeITDu4GpkdGXIP5U
 9O1W3tYaKY1mZJtqAhXpIGYplevjaIJEuSBV2edB4/tCoXdSoBr5aVvMljq238G5Cc4OTn
 1lMtZj0HN8ypeGZmDaqN+vuBgMwvWkU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-XXaCtjmEPI27Tb0FA0MGAg-1; Mon, 04 Jul 2022 05:07:27 -0400
X-MC-Unique: XXaCtjmEPI27Tb0FA0MGAg-1
Received: by mail-ed1-f69.google.com with SMTP id
 v16-20020a056402349000b00435a1c942a9so6851369edc.15
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 02:07:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bycl5SIzX5HcQeP5v8z9kef4YGkB/vT84rYMKSJ6Xms=;
 b=knGfeGLg9GGbmjQWn0t6zhadFK/Mx2vljDga6DXPIh0+9xV7PA6aPtPlxosxhzIaeT
 4igrgD7HCTVFK/u4kvXf9h/59eWLXHHKgFPaCFI8un4OhONFRdWQXc7gv3aZC9kFncfj
 xUnP2DLev0ubrNHOT0SjyR3HiQMeexcECMIYOIDE7hTy+STHdG/suwNW+001afh20KSO
 RR4kQKPuKF+GXqjWL4s9+3KtHeTZlhEpzQebeIliw/xfEaN2VXRwu7rsNACp2btmww0B
 z4ndStY47j+wJUe5XHBmmR4CbdCqC953Dpd2TVtVdNQ13xBdav+tI5qT3Llmn2b0739V
 Q4YA==
X-Gm-Message-State: AJIora8uDQ7fIqQj616FIz2BNoIGlOwUSAlhSWOIeiTNBEg5X4QrNiCo
 SHrGBfJzGVr1OxtKB2nLn32MFQy0TWmUzjggy46r/K3hEhRsFs4ZGSZBFK+qogHq15hPtEvUbKC
 /3KvX2KA7d3ej5hc=
X-Received: by 2002:a05:6402:2708:b0:435:da6f:3272 with SMTP id
 y8-20020a056402270800b00435da6f3272mr36346669edd.160.1656925645844; 
 Mon, 04 Jul 2022 02:07:25 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vCz5bjUM9sPYQw1Zld7brg9ETH0Rfvc/CCseXyR7AUbKa16ump0XuvGVjCrbdzjh56KpadOA==
X-Received: by 2002:a05:6402:2708:b0:435:da6f:3272 with SMTP id
 y8-20020a056402270800b00435da6f3272mr36346638edd.160.1656925645583; 
 Mon, 04 Jul 2022 02:07:25 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 kg27-20020a17090776fb00b00721d8e5beeesm13773473ejc.60.2022.07.04.02.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 02:07:24 -0700 (PDT)
Date: Mon, 4 Jul 2022 11:07:23 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Brice Goglin
 <Brice.Goglin@inria.fr>, QEMU Developers <qemu-devel@nongnu.org>, Liu
 Jingqi <jingqi.liu@intel.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?UTF-8?B?TWF0?=
 =?UTF-8?B?aGlldS1EYXVkw6k=?= <f4bug@amsat.org>, Yanan Wang
 <wangyanan55@huawei.com>, <hesham.almatary@huawei.com>
Subject: Re: [PATCH v4 0/4] hmat acpi: Don't require initiator value in -numa
Message-ID: <20220704110723.07125536@redhat.com>
In-Reply-To: <20220701170848.000043b7@huawei.com>
References: <ed23accb-2c8b-90f4-a7a3-f81cc57bf678@inria.fr>
 <20220630142347.22485226@redhat.com>
 <17551978-4608-f9e4-8aab-d5d7512dc5a7@inria.fr>
 <20220630092934-mutt-send-email-mst@kernel.org>
 <20220701170848.000043b7@huawei.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Fri, 1 Jul 2022 17:08:48 +0100
Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:

> On Thu, 30 Jun 2022 09:30:58 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
>=20
> > On Thu, Jun 30, 2022 at 02:40:13PM +0200, Brice Goglin wrote: =20
> > >=20
> > > Le 30/06/2022 =C3=A0 14:23, Igor Mammedov a =C3=A9crit=C2=A0:   =20
> > > > On Thu, 30 Jun 2022 09:36:47 +0200
> > > > Brice Goglin <Brice.Goglin@inria.fr> wrote:
> > > >    =20
> > > > > Allow -numa without initiator value when hmat=3Don so that we may
> > > > > build more complex topologies, e.g. NUMA nodes whose best initiat=
ors
> > > > > are not just another single node.
> > > > >    =20
> > > > patches looks fine code-wise,
> > > > however something wrong with them, i.e. 'git am' doesn't like them
> > > > nor ./scripts/checkpatch (which one should use before sending patch=
es).
> > > >=20
> > > > I've checked it's not my mail server/client issue(or whatever)
> > > > that corrupts them (ones downloaded from patchew are broken as well=
)   =20
> > >=20
> > >=20
> > > I don't know what's going on. These 4 patches are in
> > > https://github.com/bgoglin/qemu/commits/hmat-noinitiator (rebased on =
master
> > > 10mn ago).   =20
> >=20
> > It's the commit log that's corrupted.
> >  =20
> > > Do whatever you want with them. I am not allowed to spend more time o=
n this.
> > >=20
> > > Brice   =20
> >=20
> > Maybe someone will fix up the log and repost. One can hope ..
> >  =20
>=20
> We are planning to send out arm/virt support shortly including a similar =
test
> that uses this series.  So if no one else gets to it before hand we'll in=
clude
> fixed up version of Brice's series with that.

Looking at headers, it looks like patches where sent with Thunderbird
which may corrupted patches (unless special care was taken).
If one would've used 'git send-email', it is likely patches would be fine.


>=20
> Jonathan
>=20


