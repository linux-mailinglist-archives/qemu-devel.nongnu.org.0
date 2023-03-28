Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 347B96CBD13
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 13:09:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph7B5-0003jd-HQ; Tue, 28 Mar 2023 07:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ph7B3-0003jU-D6
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 07:07:46 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ph7B1-0002Dp-8j
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 07:07:44 -0400
Received: by mail-wr1-x430.google.com with SMTP id l27so11758632wrb.2
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 04:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680001661;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=leUGDKI0lYjGG2Rdls/57nZXWiggFtl0OTd21SKQn7w=;
 b=e6EKtprrksbqGOOwvMEoeBQy/BoFMGQKw0BMRZyZ8sArOQ9eO07jpkUgF8qN3Xd1ME
 R31sqIIC/yaCKBKPnmi0fdZUiBIVl8xAfCRLfMSKFHxXZkJc6shVBDqESPKZmIHleeVZ
 Dcpr8R4UKCGtLwwBjsu1+pcfw6uhqMq89r+T5QAXhsxQxvUybcKU7Kq6Pb7qpIrSjLBC
 t4gSq183PhNL4wE8LQn+/r61ldZReusqGmmrnTXTgAhAbdxmtT7vAmAI1Lkek8PXTJC4
 v6i6FkzEuwjVig397C7noCmropvs4MgWmT8VXQXGb/mdccMDC3HcUWUcBlqbkwx0L5sn
 5JIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680001661;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=leUGDKI0lYjGG2Rdls/57nZXWiggFtl0OTd21SKQn7w=;
 b=JSxFfFyretznBnV3Hoe5J3fPRvPg0HN2XKJIabonhRorVgSe9jM0ZVQ7ZnZIM1X1hn
 yl//RGHBRqFVbXusiCGRdy8Hk1iVDJEfgPWo6Iod2QRNFJnNHEDJz3ONJREdOew7Gmm8
 EdeQP30PVmEYIHgtAdhns3IbtFXVdqZQCWccQ3wYKNC/H8jZqxaaOG7g22MC5STVy/Vk
 fXAXdcRQfjzdaVBV1SbaLZV00CSNdLLxuUmx7MLCN0CBKioSFhsAgciQKxcEeouztqB1
 M/FY9VRVZPikbpjAm3Hz+Jpbe+EcbB5hmc9bjjRkex+uU6flrtZQ4n28oA5LE5KQmxnB
 QtUw==
X-Gm-Message-State: AAQBX9diUcDQnNTSaKd0GdyRR7tkwcAUPrj0Twh4+TWW4s07IbQrY4TA
 FXozhAbJE93bLCYeEJBDHJzHDQ==
X-Google-Smtp-Source: AKy350ZnbeWqHEv7CL0KukkRWtWPuRNfvUMdblp573PEjWVueu0cDRw2IX67NHpQ17Kedp8QAUNVJw==
X-Received: by 2002:adf:fac5:0:b0:2cf:f2f9:df7a with SMTP id
 a5-20020adffac5000000b002cff2f9df7amr11410298wrs.38.1680001661094; 
 Tue, 28 Mar 2023 04:07:41 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 w2-20020a5d6802000000b002cfe687fc7asm27288054wru.67.2023.03.28.04.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 04:07:40 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 23DDE1FFB7;
 Tue, 28 Mar 2023 12:07:40 +0100 (BST)
References: <20230327131543.2857052-1-alex.bennee@linaro.org>
 <ad9e3b3a-2fad-35d1-4491-8700c8fceae8@ilande.co.uk>
 <87mt3yrx1w.fsf@linaro.org>
 <28e374e3-5aa4-b5e3-0d8f-f885ca1142ca@ilande.co.uk>
 <87edp9sv5p.fsf@linaro.org>
 <CAFEAcA8_Hhb5RfQ5C_-pT8TcdscTbHVGUkCsuUL89NZgj413KA@mail.gmail.com>
User-agent: mu4e 1.10.0; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [Socratic RFC PATCH] include: attempt to document
 device_class_set_props
Date: Tue, 28 Mar 2023 12:05:28 +0100
In-reply-to: <CAFEAcA8_Hhb5RfQ5C_-pT8TcdscTbHVGUkCsuUL89NZgj413KA@mail.gmail.com>
Message-ID: <875yalrv5v.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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


Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 27 Mar 2023 at 23:10, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>>
>> Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> writes:
>>
>> > On 27/03/2023 17:12, Alex Benn=C3=A9e wrote:
>> >
>> >> Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> writes:
>> >>
>> >>> On 27/03/2023 14:15, Alex Benn=C3=A9e wrote:
>> >>>
>> >>>> I'm still not sure how I achieve by use case of the parent class
>> >>>> defining the following properties:
>> >>>>     static Property vud_properties[] =3D {
>> >>>>         DEFINE_PROP_CHR("chardev", VHostUserDevice, chardev),
>> >>>>         DEFINE_PROP_UINT16("id", VHostUserDevice, id, 0),
>> >>>>         DEFINE_PROP_UINT32("num_vqs", VHostUserDevice, num_vqs, 1),
>> >>>>         DEFINE_PROP_END_OF_LIST(),
>> >>>>     };
>> >>>> But for the specialisation of the class I want the id to default to
>> >>>> the actual device id, e.g.:
>> >>>>     static Property vu_rng_properties[] =3D {
>> >>>>         DEFINE_PROP_UINT16("id", VHostUserDevice, id, VIRTIO_ID_RNG=
),
>> >>>>         DEFINE_PROP_UINT32("num_vqs", VHostUserDevice, num_vqs, 1),
>> >>>>         DEFINE_PROP_END_OF_LIST(),
>> >>>>     };
>> >>>> And so far the API for doing that isn't super clear.
>> >>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> >>>> ---
>> >>>>    include/hw/qdev-core.h | 9 +++++++++
>> >>>>    1 file changed, 9 insertions(+)
>> >>>> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
>> >>>> index bd50ad5ee1..d4bbc30c92 100644
>> >>>> --- a/include/hw/qdev-core.h
>> >>>> +++ b/include/hw/qdev-core.h
>> >>>> @@ -776,6 +776,15 @@ BusState *sysbus_get_default(void);
>> >>>>    char *qdev_get_fw_dev_path(DeviceState *dev);
>> >>>>    char *qdev_get_own_fw_dev_path_from_handler(BusState *bus, Devic=
eState *dev);
>> >>>>    +/**
>> >>>> + * device_class_set_props(): add a set of properties to an device
>> >>>> + * @dc: the parent DeviceClass all devices inherit
>> >>>> + * @props: an array of properties, terminate by DEFINE_PROP_END_OF=
_LIST()
>> >>>> + *
>> >>>> + * This will add a set of properties to the object. It will fault =
if
>> >>>> + * you attempt to add an existing property defined by a parent cla=
ss.
>> >>>> + * To modify an inherited property you need to use????
>> >>>> + */
>> >>>>    void device_class_set_props(DeviceClass *dc, Property *props);
>> >>>>      /**
>> >>>
>> >>> Hmmm that's an interesting one. Looking at the source in
>> >>> hw/core/qdev-properties.c you could possibly get away with something
>> >>> like this in vu_rng_class_init():
>> >>>
>> >>>      ObjectProperty *op =3D object_class_property_find(klass, "id");
>> >>>      object_property_set_default_uint(op, VIRTIO_ID_RNG);
>> >>>
>> >>> Of course this is all completely untested :)
>> >> Sadly we assert on the existing prop->defval:
>> >>    static void object_property_set_default(ObjectProperty *prop,
>> >> QObject *defval)
>> >>    {
>> >>        assert(!prop->defval);
>> >>        assert(!prop->init);
>> >>        prop->defval =3D defval;
>> >>        prop->init =3D object_property_init_defval;
>> >>    }
>> >> Maybe the assert is too aggressive or we need a different helper,
>> >> maybe
>> >> a:
>> >>    void object_property_update_default_uint(ObjectProperty *prop,
>> >> uint64_t value)
>> >> ?
>> >
>> > It seems in that case once the default has been set, it is impossible
>> > to change. The only other immediate option I can think of is to define
>> > a specific DEFINE_VHOST_PROPERTIES macro in a similar way to
>> > DEFINE_AUDIO_PROPERTIES which you can use to set the common properties
>> > for all VHostUserDevice devices, including providing the default ID.
>>
>> I tried this: allow the default to change
>>
>> modified   qom/object.c
>> @@ -1557,11 +1557,16 @@ static void object_property_init_defval(Object *=
obj, ObjectProperty *prop)
>>
>>  static void object_property_set_default(ObjectProperty *prop, QObject *=
defval)
>>  {
>> -    assert(!prop->defval);
>> -    assert(!prop->init);
>> +    if (prop->init =3D=3D object_property_init_defval) {
>> +        fprintf(stderr, "%s: updating existing defval\n", __func__);
>> +        prop->defval =3D defval;
>> +    } else {
>> +        assert(!prop->defval);
>> +        assert(!prop->init);
>>
>> -    prop->defval =3D defval;
>> -    prop->init =3D object_property_init_defval;
>> +        prop->defval =3D defval;
>> +        prop->init =3D object_property_init_defval;
>> +    }
>>  }
>
> I think this leaves the door open to bugs where you create
> the property, somebody looks at it, and then you update
> the default value afterwards...

Really the pattern I have is:

  vhost-user-device has the property and is configurable
  vhost-user-rng-device specialises vhost-user-device and fixes the value

I'm not sure how best to represent that. This should all be happening at
class_init time.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

