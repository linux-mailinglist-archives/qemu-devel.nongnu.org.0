Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D196AB4E9
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 04:05:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ18H-0004Wf-Pc; Sun, 05 Mar 2023 22:03:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZ18C-0004WO-Gz
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 22:03:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZ18A-0004fD-R0
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 22:03:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678071797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uA6g2nAS0wmmT1tEfHMDdfkavXyPHtBShc6ZLJV6Uu0=;
 b=LeD6FgadPjnmDWlaCnrW1SsjwdHYAqgXWADxokBFvAng6dWoHnvGehigidl6qXU/9/t2a+
 LsifJWxvXYYSsadPSH/8s92UCy2nxaidgW0yb9vukIYgfK9z5YX+Ju5mXgvpAqXXsvfWaq
 g3sDDbnTl0ySCjwuZB+v5GwGAIl8UHM=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-215-RKHaBCfCObyld4Lo-xptAw-1; Sun, 05 Mar 2023 22:03:16 -0500
X-MC-Unique: RKHaBCfCObyld4Lo-xptAw-1
Received: by mail-oo1-f69.google.com with SMTP id
 w5-20020a4a9785000000b0052521223553so2409909ooi.2
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 19:03:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678071795;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uA6g2nAS0wmmT1tEfHMDdfkavXyPHtBShc6ZLJV6Uu0=;
 b=zt3nilNb69MD61BrtyPy5Fkcu9PZnw76yy9oo1LIx00vmb0n395whlzpg1VarwWBiZ
 ixXBWokukcZV9HxEFPKg++i/ze4+/8JttHv6IZ4cmgbl3vkntIpC0kfrB4ZCiidhKCo4
 WJEUbxG0D3Wd5BgCaVX7uha/yvBiwpyTGKapQHG9LebCl1ZF35lzdVQ/0Aj7Tfxe0kR5
 /A5Ivkon9lhLxzfLiZdVZNQtcLjunciNOa51myNLPVHfkvO1YwX+jG6f0Hwr4A0HVxS8
 VfKSp6cqgw8Zgmu4MCpWG/HvE9e9wVyw9aXrWVKx+tbUO7gcUSzX7vJ2KK0y4k6s8Zqp
 JRrQ==
X-Gm-Message-State: AO0yUKVoRtBYZCQYZkroz4s4lkpXhK26OCtedhNRM2qK5iOaD1oMSm1U
 ZTtcTr7XnnWzQ8ND1pXxX+UjzMpG9jLf3ZLWvkoDYMavTYQAfQu9D8dmJs1wdtCXDK4ZAzVFEn9
 NGUahPkw0NGrP+HPQYVCEED7Br4FbnjM=
X-Received: by 2002:a05:6870:a2c2:b0:176:4a71:6fdc with SMTP id
 w2-20020a056870a2c200b001764a716fdcmr3321340oak.9.1678071795412; 
 Sun, 05 Mar 2023 19:03:15 -0800 (PST)
X-Google-Smtp-Source: AK7set/ohjmeJD0+ry67BMMaAPQKt7hr0lowjry3pErT63kVMolIAfDSAu0fvVX9DrGsMymTLKvDM8rqvql+5wA1uZc=
X-Received: by 2002:a05:6870:a2c2:b0:176:4a71:6fdc with SMTP id
 w2-20020a056870a2c200b001764a716fdcmr3321328oak.9.1678071795175; Sun, 05 Mar
 2023 19:03:15 -0800 (PST)
MIME-Version: 1.0
References: <20230213184338.46712-1-philmd@linaro.org>
 <20230213184338.46712-10-philmd@linaro.org>
 <f7d73036-5b85-6945-68a7-19539b5c53e4@linaro.org>
In-Reply-To: <f7d73036-5b85-6945-68a7-19539b5c53e4@linaro.org>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 6 Mar 2023 11:03:04 +0800
Message-ID: <CACGkMEvKDrN1Vz33Jk5TGYOKRE+1ZLdLx9J9WJ7ZJ2y02=omLA@mail.gmail.com>
Subject: Re: [PATCH v3 09/14] hw/net/tulip: Finish QOM conversion
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 qemu-block@nongnu.org, 
 Hu Tao <hutao@cn.fujitsu.com>, Gonglei Arei <arei.gonglei@huawei.com>, 
 Richard Henderson <richard.henderson@linaro.org>, Li Qiang <liq3ea@163.com>, 
 Thomas Huth <thuth@redhat.com>, Cao jin <caoj.fnst@cn.fujitsu.com>, 
 xiaoqiang zhao <zxq_yx_007@163.com>, Sven Schnelle <svens@stackframe.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Tue, Feb 28, 2023 at 9:39=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Hi Jason, do you Ack this patch?

Yes.

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

>
> On 13/2/23 19:43, Philippe Mathieu-Daud=C3=A9 wrote:
> > Use the TULIP() and DEVICE() QOM type-checking macros.
> > Remove uses of DO_UPCAST().
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > ---
> >   hw/net/tulip.c | 20 +++++++++++---------
> >   1 file changed, 11 insertions(+), 9 deletions(-)
> >
> > diff --git a/hw/net/tulip.c b/hw/net/tulip.c
> > index 915e5fb595..990507859d 100644
> > --- a/hw/net/tulip.c
> > +++ b/hw/net/tulip.c
> > @@ -19,7 +19,10 @@
> >   #include "net/eth.h"
> >
> >   struct TULIPState {
> > +    /*< private >*/
> >       PCIDevice dev;
> > +    /*< public >*/
> > +
> >       MemoryRegion io;
> >       MemoryRegion memory;
> >       NICConf c;
> > @@ -959,7 +962,7 @@ static void tulip_fill_eeprom(TULIPState *s)
> >
> >   static void pci_tulip_realize(PCIDevice *pci_dev, Error **errp)
> >   {
> > -    TULIPState *s =3D DO_UPCAST(TULIPState, dev, pci_dev);
> > +    TULIPState *s =3D TULIP(pci_dev);
> >       uint8_t *pci_conf;
> >
> >       pci_conf =3D s->dev.config;
> > @@ -967,7 +970,7 @@ static void pci_tulip_realize(PCIDevice *pci_dev, E=
rror **errp)
> >
> >       qemu_macaddr_default_if_unset(&s->c.macaddr);
> >
> > -    s->eeprom =3D eeprom93xx_new(&pci_dev->qdev, 64);
> > +    s->eeprom =3D eeprom93xx_new(DEVICE(pci_dev), 64);
> >       tulip_fill_eeprom(s);
> >
> >       memory_region_init_io(&s->io, OBJECT(&s->dev), &tulip_ops, s,
> > @@ -983,27 +986,26 @@ static void pci_tulip_realize(PCIDevice *pci_dev,=
 Error **errp)
> >
> >       s->nic =3D qemu_new_nic(&net_tulip_info, &s->c,
> >                             object_get_typename(OBJECT(pci_dev)),
> > -                          pci_dev->qdev.id, s);
> > +                          DEVICE(pci_dev)->id, s);
> >       qemu_format_nic_info_str(qemu_get_queue(s->nic), s->c.macaddr.a);
> >   }
> >
> >   static void pci_tulip_exit(PCIDevice *pci_dev)
> >   {
> > -    TULIPState *s =3D DO_UPCAST(TULIPState, dev, pci_dev);
> > +    TULIPState *s =3D TULIP(pci_dev);
> >
> >       qemu_del_nic(s->nic);
> >       qemu_free_irq(s->irq);
> > -    eeprom93xx_free(&pci_dev->qdev, s->eeprom);
> > +    eeprom93xx_free(DEVICE(s), s->eeprom);
> >   }
> >
> >   static void tulip_instance_init(Object *obj)
> >   {
> > -    PCIDevice *pci_dev =3D PCI_DEVICE(obj);
> > -    TULIPState *d =3D DO_UPCAST(TULIPState, dev, pci_dev);
> > +    TULIPState *s =3D TULIP(obj);
> >
> > -    device_add_bootindex_property(obj, &d->c.bootindex,
> > +    device_add_bootindex_property(obj, &s->c.bootindex,
> >                                     "bootindex", "/ethernet-phy@0",
> > -                                  &pci_dev->qdev);
> > +                                  DEVICE(obj));
> >   }
> >
> >   static Property tulip_properties[] =3D {
>


