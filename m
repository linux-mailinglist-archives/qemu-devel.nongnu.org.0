Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C096CBB49
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 11:42:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph5pq-00047n-Ie; Tue, 28 Mar 2023 05:41:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ph5pn-00047F-R5
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 05:41:43 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ph5pm-0001qr-4W
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 05:41:43 -0400
Received: by mail-ed1-x52f.google.com with SMTP id w9so47051760edc.3
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 02:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679996500;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nyYyzaqhQeJqqJHaAmAxeDmlDQ16uw1hEKn5m3xKPnE=;
 b=VsglBPacnJ8WQKMT+SUFdzydjQHkIjG/00FchVPPu/L2Tp15y/lQjkJxnx3WIqN+pr
 HHoOoAu55UZlbaLuRZYh6jbRVViB4uYtQZd8sv54wWpHsQOm1/UKpkjJZwMMstoN7LA5
 9hcdv0Oe7eDpJwIS9mccQ8EOVS3/yW2Vk8TkAIIpF2SUiwcH6znw0zDQkpp5F35VbOrV
 l8ZmWdHjrIIgg61HnGeW1UqIAH9/UC7AiCUarb8PNKjInEdzct7Tk8zDuGVA519th17H
 ww5zLuE7WQKzlXxAmxwCVOk+NRgnm961ngS5IP0dDnnzg9asKivip95mZ9LYbFaQS+Ui
 t+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679996500;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nyYyzaqhQeJqqJHaAmAxeDmlDQ16uw1hEKn5m3xKPnE=;
 b=vSpGCDYYzojloAsd2qrtg+ZEIkTPCjdEX+Vft0E2n+QmWtjJbJ8RqbO+NSGMEDV+3e
 jp3VzHN6jButeLFIBCtqHJLYiuOvuN4vGKHK6dnNaKTqGRuDnOay+ASUvlLT+ngKsB2L
 xjzF+Jj1o4j6hdZ21zOEcK3ChGl4Nuwc+FwZJ4KD46bD/lwK6azrSJ/NwQ9j+40zIaTz
 YDOzyjCgyy57FrzJ+ovTe+LtCb+iIWk9SV129UXSX2NTqxBCqSsvNhDPVCUQu4ucZFhr
 c59Ns4Mlsq90Ab/nZW5DsZ23RjuHktPNTUPFZGqgjcfCvN+LpHG8Ad685cpX5tLAF8cQ
 MJUg==
X-Gm-Message-State: AAQBX9cstu70AvCt523FAj3hLglFZVwfUdluPSTL8CmDolGjnyLy7FZk
 42USN0Atazt9o8QusTMxTMkDuCTtSfsa7tYnrAx5qQ==
X-Google-Smtp-Source: AKy350aU0LRByUYO3xMDCgFBmIAaHV3eAyFxa8yaRfG56WFyjnWtkoMFtl/xAi3QTjXdgkVK4iiYPsxW8bMIugUpSh4=
X-Received: by 2002:a17:906:3746:b0:8b1:cd2e:177a with SMTP id
 e6-20020a170906374600b008b1cd2e177amr7401330ejc.6.1679996499972; Tue, 28 Mar
 2023 02:41:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230327131543.2857052-1-alex.bennee@linaro.org>
 <ad9e3b3a-2fad-35d1-4491-8700c8fceae8@ilande.co.uk>
 <87mt3yrx1w.fsf@linaro.org>
 <28e374e3-5aa4-b5e3-0d8f-f885ca1142ca@ilande.co.uk>
 <87edp9sv5p.fsf@linaro.org>
In-Reply-To: <87edp9sv5p.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Mar 2023 10:41:29 +0100
Message-ID: <CAFEAcA8_Hhb5RfQ5C_-pT8TcdscTbHVGUkCsuUL89NZgj413KA@mail.gmail.com>
Subject: Re: [Socratic RFC PATCH] include: attempt to document
 device_class_set_props
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Mon, 27 Mar 2023 at 23:10, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> writes:
>
> > On 27/03/2023 17:12, Alex Benn=C3=A9e wrote:
> >
> >> Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> writes:
> >>
> >>> On 27/03/2023 14:15, Alex Benn=C3=A9e wrote:
> >>>
> >>>> I'm still not sure how I achieve by use case of the parent class
> >>>> defining the following properties:
> >>>>     static Property vud_properties[] =3D {
> >>>>         DEFINE_PROP_CHR("chardev", VHostUserDevice, chardev),
> >>>>         DEFINE_PROP_UINT16("id", VHostUserDevice, id, 0),
> >>>>         DEFINE_PROP_UINT32("num_vqs", VHostUserDevice, num_vqs, 1),
> >>>>         DEFINE_PROP_END_OF_LIST(),
> >>>>     };
> >>>> But for the specialisation of the class I want the id to default to
> >>>> the actual device id, e.g.:
> >>>>     static Property vu_rng_properties[] =3D {
> >>>>         DEFINE_PROP_UINT16("id", VHostUserDevice, id, VIRTIO_ID_RNG)=
,
> >>>>         DEFINE_PROP_UINT32("num_vqs", VHostUserDevice, num_vqs, 1),
> >>>>         DEFINE_PROP_END_OF_LIST(),
> >>>>     };
> >>>> And so far the API for doing that isn't super clear.
> >>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >>>> ---
> >>>>    include/hw/qdev-core.h | 9 +++++++++
> >>>>    1 file changed, 9 insertions(+)
> >>>> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> >>>> index bd50ad5ee1..d4bbc30c92 100644
> >>>> --- a/include/hw/qdev-core.h
> >>>> +++ b/include/hw/qdev-core.h
> >>>> @@ -776,6 +776,15 @@ BusState *sysbus_get_default(void);
> >>>>    char *qdev_get_fw_dev_path(DeviceState *dev);
> >>>>    char *qdev_get_own_fw_dev_path_from_handler(BusState *bus, Device=
State *dev);
> >>>>    +/**
> >>>> + * device_class_set_props(): add a set of properties to an device
> >>>> + * @dc: the parent DeviceClass all devices inherit
> >>>> + * @props: an array of properties, terminate by DEFINE_PROP_END_OF_=
LIST()
> >>>> + *
> >>>> + * This will add a set of properties to the object. It will fault i=
f
> >>>> + * you attempt to add an existing property defined by a parent clas=
s.
> >>>> + * To modify an inherited property you need to use????
> >>>> + */
> >>>>    void device_class_set_props(DeviceClass *dc, Property *props);
> >>>>      /**
> >>>
> >>> Hmmm that's an interesting one. Looking at the source in
> >>> hw/core/qdev-properties.c you could possibly get away with something
> >>> like this in vu_rng_class_init():
> >>>
> >>>      ObjectProperty *op =3D object_class_property_find(klass, "id");
> >>>      object_property_set_default_uint(op, VIRTIO_ID_RNG);
> >>>
> >>> Of course this is all completely untested :)
> >> Sadly we assert on the existing prop->defval:
> >>    static void object_property_set_default(ObjectProperty *prop,
> >> QObject *defval)
> >>    {
> >>        assert(!prop->defval);
> >>        assert(!prop->init);
> >>        prop->defval =3D defval;
> >>        prop->init =3D object_property_init_defval;
> >>    }
> >> Maybe the assert is too aggressive or we need a different helper,
> >> maybe
> >> a:
> >>    void object_property_update_default_uint(ObjectProperty *prop,
> >> uint64_t value)
> >> ?
> >
> > It seems in that case once the default has been set, it is impossible
> > to change. The only other immediate option I can think of is to define
> > a specific DEFINE_VHOST_PROPERTIES macro in a similar way to
> > DEFINE_AUDIO_PROPERTIES which you can use to set the common properties
> > for all VHostUserDevice devices, including providing the default ID.
>
> I tried this: allow the default to change
>
> modified   qom/object.c
> @@ -1557,11 +1557,16 @@ static void object_property_init_defval(Object *o=
bj, ObjectProperty *prop)
>
>  static void object_property_set_default(ObjectProperty *prop, QObject *d=
efval)
>  {
> -    assert(!prop->defval);
> -    assert(!prop->init);
> +    if (prop->init =3D=3D object_property_init_defval) {
> +        fprintf(stderr, "%s: updating existing defval\n", __func__);
> +        prop->defval =3D defval;
> +    } else {
> +        assert(!prop->defval);
> +        assert(!prop->init);
>
> -    prop->defval =3D defval;
> -    prop->init =3D object_property_init_defval;
> +        prop->defval =3D defval;
> +        prop->init =3D object_property_init_defval;
> +    }
>  }

I think this leaves the door open to bugs where you create
the property, somebody looks at it, and then you update
the default value afterwards...

-- PMM

