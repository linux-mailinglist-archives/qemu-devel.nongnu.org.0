Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACF469616F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 11:50:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRsrh-00029A-Vt; Tue, 14 Feb 2023 05:48:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1pRsrf-00028l-M5
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 05:48:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1pRsrd-0007La-JW
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 05:48:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676371723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/5JPdvHBqP6xOWOzZDCFyd8xJ4dZOOyFoU9Bn2OAWnw=;
 b=e10Fie39j8v6eUXJdCubPbfjujb9glDZ94vX0CH0Mp5ginVDtH2mwNg1vyaf7m7XvpBD4O
 Q4DpMt0JLdUy8muRWSE+0pbq756k5sManvTc7UaIGZp/tLN35K/7ZQLD9kIWh981i5/+C9
 v2964jlO9LJIjGbzRS3T3RgcLW5MCJY=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-622-RMIri1w3MvOP2rFFmH6D0A-1; Tue, 14 Feb 2023 05:48:40 -0500
X-MC-Unique: RMIri1w3MvOP2rFFmH6D0A-1
Received: by mail-vs1-f69.google.com with SMTP id
 o2-20020a67f482000000b004040a3d3102so3570938vsn.3
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 02:48:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/5JPdvHBqP6xOWOzZDCFyd8xJ4dZOOyFoU9Bn2OAWnw=;
 b=iqdnGDRuZsjOygZRxw+MRiAM2biP6DmNFQM8rDpIJTcyVz4tLoQ1/vzyN5QKqN1ZBd
 2W9oXdKLiw9g+e6NC+7VndfcB984YIeOHUK9+tDqs8eRg6RfzGXwHL4ibCpklMwSL7KO
 Hc0ah89BUYgvOUTbcpi6ZoEl5P70Ahes9a7ZW/iDFQbdbxdSIi+OpHepRZUJHBaJqxTf
 UIQmvrdOoJtLnaD0qGXVz0UHY8qjjWs07UcKz56Y1W1lvkVHmMiCi/39Wejh2wnjl+aY
 SZfHycAeYg/8Tf8XXpl/uCcFFvYBSExxLe5s3JW6HnwyRs+cz4ePnrO7Evc6QD76kOCT
 EG2Q==
X-Gm-Message-State: AO0yUKXqluDex71LQubp1SuHFq/VfoTt96QlZzNnCpvlGyQJobgLs7dm
 hiZyluT6OCgJynguUG+XrvYjS+7gpeGJdq673SDB+CcialfNJLspg5S6kObUWn86xc3FiJSBH6M
 PsULLuDPi/u/WZn1Z/6X38qL+qRTBSno=
X-Received: by 2002:a1f:12d4:0:b0:401:284:ef17 with SMTP id
 203-20020a1f12d4000000b004010284ef17mr312893vks.28.1676371719571; 
 Tue, 14 Feb 2023 02:48:39 -0800 (PST)
X-Google-Smtp-Source: AK7set/6Ah98PmJ+6+0UmpOLjXZ04lr87Mr6if8FHmmGYB4GHB5dkb1SJv3Y0UAkBPpGgPr/cQLUlFevlviCJ7K5EOU=
X-Received: by 2002:a1f:12d4:0:b0:401:284:ef17 with SMTP id
 203-20020a1f12d4000000b004010284ef17mr312890vks.28.1676371719303; Tue, 14 Feb
 2023 02:48:39 -0800 (PST)
MIME-Version: 1.0
References: <20230213174113.591632-1-mcascell@redhat.com>
 <b04ebfac-c434-8045-1b6f-6201686130b9@linaro.org>
In-Reply-To: <b04ebfac-c434-8045-1b6f-6201686130b9@linaro.org>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Tue, 14 Feb 2023 11:48:28 +0100
Message-ID: <CAA8xKjUx5Ze5b+-JZdpfagUMEbBderndUvenLHhyCL92LyebPQ@mail.gmail.com>
Subject: Re: [PATCH] usb/dev-wacom: fix OOB write in usb_mouse_poll()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, kraxel@redhat.com, 
 "ningqiang (A)" <ningqiang1@huawei.com>, soul chen <soulchen8650@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mcascell@redhat.com;
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

Hi Philippe,

On Mon, Feb 13, 2023 at 7:26 PM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Hi Mauro,
>
> On 13/2/23 18:41, Mauro Matteo Cascella wrote:
> > The guest can control the size of buf; an OOB write occurs when buf is =
1 or 2
> > bytes long. Only fill in the buffer as long as there is enough space, t=
hrow
> > away any data which doesn't fit.
>
> Any reproducer?

No qtest reproducer, we do have a PoC module to compile & load from
within the guest. This is ASAN output:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=3D=3D28803=3D=3DERROR: AddressSanitizer: heap-buffer-overflow on address 0
WRITE of size 1 at 0x602000fccdd1 thread T2
    #0 0x560f4ebba899 in usb_mouse_poll ../hw/usb/dev-wacom.c:256
    #1 0x560f4ebbcaf9 in usb_wacom_handle_data ../hw/usb/dev-wacom6
    #2 0x560f4eaef297 in usb_device_handle_data ../hw/usb/bus.c:180
    #3 0x560f4eb00bbb in usb_process_one ../hw/usb/core.c:406
    #4 0x560f4eb01883 in usb_handle_packet ../hw/usb/core.c:438
    #5 0x560f4eb94e0c in xhci_submit ../hw/usb/hcd-xhci.c:1801
    #6 0x560f4eb9505f in xhci_fire_transfer ../hw/usb/hcd-xhci.c:10
    #7 0x560f4eb9773c in xhci_kick_epctx ../hw/usb/hcd-xhci.c:1969
    #8 0x560f4eb953f2 in xhci_kick_ep ../hw/usb/hcd-xhci.c:1835
    #9 0x560f4eba416d in xhci_doorbell_write ../hw/usb/hcd-xhci.c:7
    #10 0x560f4f5343a8 in memory_region_write_accessor ../softmmu/2
    #11 0x560f4f53483f in access_with_adjusted_size ../softmmu/mem4
    #12 0x560f4f541e69 in memory_region_dispatch_write ../softmmu/4
    #13 0x560f4f57afec in flatview_write_continue ../softmmu/physm5
    #14 0x560f4f57b40f in flatview_write ../softmmu/physmem.c:2867
    #15 0x560f4f579617 in subpage_write ../softmmu/physmem.c:2501
    #16 0x560f4f5346dc in memory_region_write_with_attrs_accessor 3
    #17 0x560f4f53483f in access_with_adjusted_size ../softmmu/mem4
    #18 0x560f4f542075 in memory_region_dispatch_write ../softmmu/1
    #19 0x560f4f727735 in io_writex ../accel/tcg/cputlb.c:1429
    #20 0x560f4f72c19d in store_helper ../accel/tcg/cputlb.c:2379
    #21 0x560f4f72c5ec in full_le_stl_mmu ../accel/tcg/cputlb.c:247
    #22 0x560f4f72c62a in helper_le_stl_mmu ../accel/tcg/cputlb.c:3
    #23 0x7fcf063941a3  (/memfd:tcg-jit (deleted)+0x27541a3)
    <cut>

Also forgot to give credits:

Reported-by: ningqiang1 <ningqiang1@huawei.com>
Reported-by: SorryMybad of Kunlun Lab <soulchen8650@gmail.com>

> > Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> > ---
> >   hw/usb/dev-wacom.c | 20 +++++++++++++-------
> >   1 file changed, 13 insertions(+), 7 deletions(-)
> >
> > diff --git a/hw/usb/dev-wacom.c b/hw/usb/dev-wacom.c
> > index 7177c17f03..ca9e6aa82f 100644
> > --- a/hw/usb/dev-wacom.c
> > +++ b/hw/usb/dev-wacom.c
> > @@ -252,14 +252,20 @@ static int usb_mouse_poll(USBWacomState *s, uint8=
_t *buf, int len)
> >       if (s->buttons_state & MOUSE_EVENT_MBUTTON)
> >           b |=3D 0x04;
> >
> > -    buf[0] =3D b;
> > -    buf[1] =3D dx;
> > -    buf[2] =3D dy;
> > -    l =3D 3;
> > -    if (len >=3D 4) {
> > -        buf[3] =3D dz;
> > -        l =3D 4;
> > +    l =3D 0;
> > +    if (len > l) {
> > +        buf[l++] =3D b;
> >       }
> > +    if (len > l) {
> > +        buf[l++] =3D dx;
> > +    }
>
>         else { // the packet is now corrupted... }
>
> > +    if (len > l) {
> > +        buf[l++] =3D dy;
> > +    }
> > +    if (len > l) {
> > +        buf[l++] =3D dz;
> > +    }
> > +
> >       return l;
> >   }
>
> Better is to wait for enough data to process:
>
> -- >8 --
> diff --git a/hw/usb/dev-wacom.c b/hw/usb/dev-wacom.c
> index 7177c17f03..2fe2a9220e 100644
> --- a/hw/usb/dev-wacom.c
> +++ b/hw/usb/dev-wacom.c
> @@ -244,6 +244,9 @@ static int usb_mouse_poll(USBWacomState *s, uint8_t
> *buf, int len)
>       s->dy -=3D dy;
>       s->dz -=3D dz;
>
> +    if (len < 3)
> +        return 0;
> +
>       b =3D 0;
>       if (s->buttons_state & MOUSE_EVENT_LBUTTON)
>           b |=3D 0x01;
> @@ -274,6 +277,9 @@ static int usb_wacom_poll(USBWacomState *s, uint8_t
> *buf, int len)
>           s->mouse_grabbed =3D 1;
>       }
>
> +    if (len < 7)
> +        return 0;
> +
>       b =3D 0;
>       if (s->buttons_state & MOUSE_EVENT_LBUTTON)
>           b |=3D 0x01;
> @@ -282,9 +288,6 @@ static int usb_wacom_poll(USBWacomState *s, uint8_t
> *buf, int len)
>       if (s->buttons_state & MOUSE_EVENT_MBUTTON)
>           b |=3D 0x20; /* eraser */
>
> -    if (len < 7)
> -        return 0;
> -
>       buf[0] =3D s->mode;
>       buf[5] =3D 0x00 | (b & 0xf0);
>       buf[1] =3D s->x & 0xff;
> ---
>

I took inspiration from hid_pointer_poll() in hw/input/hid.c which
fills in the buffer as much as possible in a similar way, but your
suggestion makes sense to me. Gerd, wdyt?

Thanks,
--
Mauro Matteo Cascella
Red Hat Product Security
PGP-Key ID: BB3410B0


