Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6076E27BE
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 17:56:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnLlr-0007FG-KC; Fri, 14 Apr 2023 11:55:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pnLlp-0007Em-JG
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 11:55:29 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pnLlj-00059O-4C
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 11:55:29 -0400
Received: by mail-wr1-x430.google.com with SMTP id j12so1744660wrd.2
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 08:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681487721; x=1684079721;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=39QDpX8UeZlxpWg7RJyM8xokiuOvA/LkRng58zRIfZw=;
 b=wS4iyMWQUOn41sAj2QgEp6/UDj4zK7cMnpoUNXgELCYh30G3vIf2hYWSlUzlAefaMt
 yb/Bh6zxMAmNcTz5pEnN1qJzMwpCwsfBtbi/8GDjydhCGIAKsjfVabyUdSAmz3/dmKfs
 arzlQSIg7hSeuUIVVY8W9FaevTCH6ctwdBTieRNMuaQ2eJVLNQZFxYoxew0cNMfxfHKG
 7aUAwEnWqBK2BhrSFpszNwq8xZUWwjeAoFINmWJX9g/VIRj4/pz+MS0gIVZ7/r0/hp/R
 pIsMsKEOJ/Swo/4ukXsgtsuBagl28CunoRNf+VjaaArdtdUVor9gT4p4fLU/6CQgmnbq
 ecJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681487721; x=1684079721;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=39QDpX8UeZlxpWg7RJyM8xokiuOvA/LkRng58zRIfZw=;
 b=ftCm9pYTa7e2yWrx/kChZ5ZGEkQlH8Y7p2K8qkpofPB259CytIjtndDvabhzMfiBA6
 DY4FFWryAHMetDsTo6NnqKpDtFJ4j0ABuqyvWkcu39R/XmDplTu4/VwbNjnXMyJzp0qn
 2ybE+Oak9pNNqrWx1sTSWsrsv2l+Re3mbvrB1LE21gKXLsi9dvyNSmaSzLNpwNgsQo2/
 E14a/YBRt9Sre7U2qotiGmdace21neGzdb3TZhP6vNZxoh3ECFCEBx+xS8KOml2X0ijd
 2DCHFqxmiiQw7QH2fcVcQSNhojtLjf6n3yfMG5RY+qV3m0X0nIU8nD41ix+589kBhGCB
 G9fA==
X-Gm-Message-State: AAQBX9eIvZFqYDhqhEgUH5/BtbI+t+4uFoR5fqmph1ccBVvuXY0W60zD
 v7IMGOIQ7Sno5okUvt5/eG91fg==
X-Google-Smtp-Source: AKy350afvxhXgk50QnaqfcjAfdc22Xrx31vtOoTQ99Ro9SNEh8IO8GH0U90CN9deFN4nA9clCu6Bow==
X-Received: by 2002:adf:e407:0:b0:2f4:cf53:c961 with SMTP id
 g7-20020adfe407000000b002f4cf53c961mr4413543wrm.54.1681487721384; 
 Fri, 14 Apr 2023 08:55:21 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a5d6b09000000b002d97529b3bbsm3808977wrw.96.2023.04.14.08.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 08:55:20 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 72DE41FFB7;
 Fri, 14 Apr 2023 16:55:20 +0100 (BST)
References: <20230327131543.2857052-1-alex.bennee@linaro.org>
 <ad9e3b3a-2fad-35d1-4491-8700c8fceae8@ilande.co.uk>
 <87mt3yrx1w.fsf@linaro.org>
 <28e374e3-5aa4-b5e3-0d8f-f885ca1142ca@ilande.co.uk>
 <87edp9sv5p.fsf@linaro.org>
 <CAFEAcA8_Hhb5RfQ5C_-pT8TcdscTbHVGUkCsuUL89NZgj413KA@mail.gmail.com>
 <875yalrv5v.fsf@linaro.org>
User-agent: mu4e 1.10.0; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org, Paolo Bonzini
 <pbonzini@redhat.com>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [Socratic RFC PATCH] include: attempt to document
 device_class_set_props
Date: Fri, 14 Apr 2023 16:50:56 +0100
In-reply-to: <875yalrv5v.fsf@linaro.org>
Message-ID: <87r0smbgrb.fsf@linaro.org>
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> On Mon, 27 Mar 2023 at 23:10, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>>>
>>>
>>> Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> writes:
>>>
>>> > On 27/03/2023 17:12, Alex Benn=C3=A9e wrote:
>>> >
>>> >> Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> writes:
>>> >>
>>> >>> On 27/03/2023 14:15, Alex Benn=C3=A9e wrote:
>>> >>>
>>> >>>> I'm still not sure how I achieve by use case of the parent class
>>> >>>> defining the following properties:
>>> >>>>     static Property vud_properties[] =3D {
>>> >>>>         DEFINE_PROP_CHR("chardev", VHostUserDevice, chardev),
>>> >>>>         DEFINE_PROP_UINT16("id", VHostUserDevice, id, 0),
>>> >>>>         DEFINE_PROP_UINT32("num_vqs", VHostUserDevice, num_vqs, 1),
>>> >>>>         DEFINE_PROP_END_OF_LIST(),
>>> >>>>     };
>>> >>>> But for the specialisation of the class I want the id to default to
>>> >>>> the actual device id, e.g.:
>>> >>>>     static Property vu_rng_properties[] =3D {
>>> >>>>         DEFINE_PROP_UINT16("id", VHostUserDevice, id, VIRTIO_ID_RN=
G),
>>> >>>>         DEFINE_PROP_UINT32("num_vqs", VHostUserDevice, num_vqs, 1),
>>> >>>>         DEFINE_PROP_END_OF_LIST(),
>>> >>>>     };
>>> >>>> And so far the API for doing that isn't super clear.
>>> >>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>> >>>> ---
>>> >>>>    include/hw/qdev-core.h | 9 +++++++++
>>> >>>>    1 file changed, 9 insertions(+)
>>> >>>> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
>>> >>>> index bd50ad5ee1..d4bbc30c92 100644
>>> >>>> --- a/include/hw/qdev-core.h
>>> >>>> +++ b/include/hw/qdev-core.h
>>> >>>> @@ -776,6 +776,15 @@ BusState *sysbus_get_default(void);
>>> >>>>    char *qdev_get_fw_dev_path(DeviceState *dev);
>>> >>>>    char *qdev_get_own_fw_dev_path_from_handler(BusState *bus, Devi=
ceState *dev);
>>> >>>>    +/**
>>> >>>> + * device_class_set_props(): add a set of properties to an device
>>> >>>> + * @dc: the parent DeviceClass all devices inherit
>>> >>>> + * @props: an array of properties, terminate by DEFINE_PROP_END_O=
F_LIST()
>>> >>>> + *
>>> >>>> + * This will add a set of properties to the object. It will fault=
 if
>>> >>>> + * you attempt to add an existing property defined by a parent cl=
ass.
>>> >>>> + * To modify an inherited property you need to use????
>>> >>>> + */
>>> >>>>    void device_class_set_props(DeviceClass *dc, Property *props);
>>> >>>>      /**
>>> >>>
>>> >>> Hmmm that's an interesting one. Looking at the source in
>>> >>> hw/core/qdev-properties.c you could possibly get away with something
>>> >>> like this in vu_rng_class_init():
>>> >>>
>>> >>>      ObjectProperty *op =3D object_class_property_find(klass, "id");
>>> >>>      object_property_set_default_uint(op, VIRTIO_ID_RNG);
>>> >>>
>>> >>> Of course this is all completely untested :)
>>> >> Sadly we assert on the existing prop->defval:
>>> >>    static void object_property_set_default(ObjectProperty *prop,
>>> >> QObject *defval)
>>> >>    {
>>> >>        assert(!prop->defval);
>>> >>        assert(!prop->init);
>>> >>        prop->defval =3D defval;
>>> >>        prop->init =3D object_property_init_defval;
>>> >>    }
>>> >> Maybe the assert is too aggressive or we need a different helper,
>>> >> maybe
>>> >> a:
>>> >>    void object_property_update_default_uint(ObjectProperty *prop,
>>> >> uint64_t value)
>>> >> ?
>>> >
>>> > It seems in that case once the default has been set, it is impossible
>>> > to change. The only other immediate option I can think of is to define
>>> > a specific DEFINE_VHOST_PROPERTIES macro in a similar way to
>>> > DEFINE_AUDIO_PROPERTIES which you can use to set the common properties
>>> > for all VHostUserDevice devices, including providing the default ID.
>>>
>>> I tried this: allow the default to change
>>>
>>> modified   qom/object.c
>>> @@ -1557,11 +1557,16 @@ static void object_property_init_defval(Object =
*obj, ObjectProperty *prop)
>>>
>>>  static void object_property_set_default(ObjectProperty *prop, QObject =
*defval)
>>>  {
>>> -    assert(!prop->defval);
>>> -    assert(!prop->init);
>>> +    if (prop->init =3D=3D object_property_init_defval) {
>>> +        fprintf(stderr, "%s: updating existing defval\n", __func__);
>>> +        prop->defval =3D defval;
>>> +    } else {
>>> +        assert(!prop->defval);
>>> +        assert(!prop->init);
>>>
>>> -    prop->defval =3D defval;
>>> -    prop->init =3D object_property_init_defval;
>>> +        prop->defval =3D defval;
>>> +        prop->init =3D object_property_init_defval;
>>> +    }
>>>  }
>>
>> I think this leaves the door open to bugs where you create
>> the property, somebody looks at it, and then you update
>> the default value afterwards...
>
> Really the pattern I have is:
>
>   vhost-user-device has the property and is configurable
>   vhost-user-rng-device specialises vhost-user-device and fixes the value
>
> I'm not sure how best to represent that. This should all be happening at
> class_init time.

Of course enabling my second derived class I ran into:

  ERROR:../../qom/object.c:1590:object_property_fix_default: assertion fail=
ed: (!prop->fixed)
  Bail out! ERROR:../../qom/object.c:1590:object_property_fix_default: asse=
rtion failed: (!prop->fixed)
  [New Thread 2088694.2088695]
  Thread 1 received signal SIGABRT, Aborted.
  __GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/unix/sysv/linux/raise.c:50
  50      ../sysdeps/unix/sysv/linux/raise.c: No such file or directory.
  (rr) bt
  #0  __GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/unix/sysv/linux/raise.=
c:50
  #1  0x00007f50194bd537 in __GI_abort () at abort.c:79
  #2  0x00007f501b03fdcc in g_assertion_message (domain=3D<optimized out>, =
file=3D0x557b85d1ef1b "../../qom/object.c", line=3D<optimized out>, func=3D=
<optimized out>, message=3D<optimized out>) at ../../../glib/gtestutils.c:2=
937
  #3  0x00007f501b09d2fb in g_assertion_message_expr (domain=3D0x0, file=3D=
0x557b85d1ef1b "../../qom/object.c", line=3D1590, func=3D0x557b85d1f8b0 <__=
func__.10> "object_property_fix_default", expr=3D<optimized out>) at ../../=
../glib/gtestutils.c:2963
  #4  0x0000557b8589260e in object_property_fix_default (prop=3D0x557b88402=
f30, defval=3D0x557b885bda80) at ../../qom/object.c:1590
  #5  0x0000557b8589266e in object_property_fix_default_uint (prop=3D0x557b=
88402f30, value=3D41) at ../../qom/object.c:1598
  #6  0x0000557b857ccc28 in vu_gpio_class_init (klass=3D0x557b885bd360, dat=
a=3D0x0) at ../../hw/virtio/vhost-user-gpio.c:32
  #7  0x0000557b8588fad5 in type_initialize (ti=3D0x557b883aec50) at ../../=
qom/object.c:366
  #8  0x0000557b85891038 in object_class_foreach_tramp (key=3D0x557b883aedd=
0, value=3D0x557b883aec50, opaque=3D0x7ffe065f4290) at ../../qom/object.c:1=
081
  #9  0x00007f501b062fa0 in g_hash_table_foreach (hash_table=3D0x557b882a72=
40 =3D {...}, func=3D0x557b85891008 <object_class_foreach_tramp>, user_data=
=3D0x7ffe065f4290) at ../../../glib/ghash.c:2067
  #10 0x0000557b85891117 in object_class_foreach (fn=3D0x557b85891274 <obje=
ct_class_get_list_tramp>, implements_type=3D0x557b85c579f5 "machine", inclu=
de_abstract=3Dfalse, opaque=3D0x7ffe065f42e0) at ../../qom/object.c:1103
  #11 0x0000557b858912ef in object_class_get_list (implements_type=3D0x557b=
85c579f5 "machine", include_abstract=3Dfalse) at ../../qom/object.c:1160
  #12 0x0000557b85395077 in select_machine (qdict=3D0x557b883c0e80, errp=3D=
0x557b86657e40 <error_fatal>) at ../../softmmu/vl.c:1580
  #13 0x0000557b85396068 in qemu_create_machine (qdict=3D0x557b883c0e80) at=
 ../../softmmu/vl.c:2013
  #14 0x0000557b85399c5d in qemu_init (argc=3D33, argv=3D0x7ffe065f4628) at=
 ../../softmmu/vl.c:3544
  #15 0x0000557b84fdda9f in main (argc=3D33, argv=3D0x7ffe065f4628) at ../.=
./softmmu/main.c:47
  (rr) f 4
  #4  0x0000557b8589260e in object_property_fix_default (prop=3D0x557b88402=
f30, defval=3D0x557b885bda80) at ../../qom/object.c:1590
  1590        g_assert(!prop->fixed);
  (rr) p &prop->fixed
  $1 =3D (_Bool *) 0x557b88402f80
  (rr) watch *(_Bool *) 0x557b88402f80
  Hardware watchpoint 1: *(_Bool *) 0x557b88402f80
  (rr) rc
  Continuing.

  Thread 1 hit Hardware watchpoint 1: *(_Bool *) 0x557b88402f80

  Old value =3D true
  New value =3D false
  0x0000557b8589261e in object_property_fix_default (prop=3D0x557b88402f30,=
 defval=3D0x557b88403780) at ../../qom/object.c:1593
  1593        prop->fixed =3D true;
  (rr) bt
  #0  0x0000557b8589261e in object_property_fix_default (prop=3D0x557b88402=
f30, defval=3D0x557b88403780) at ../../qom/object.c:1593
  #1  0x0000557b8589266e in object_property_fix_default_uint (prop=3D0x557b=
88402f30, value=3D4) at ../../qom/object.c:1598
  #2  0x0000557b857ccad5 in vu_rng_class_init (klass=3D0x557b884015c0, data=
=3D0x0) at ../../hw/virtio/vhost-user-rng.c:33
  #3  0x0000557b8588fad5 in type_initialize (ti=3D0x557b883aea90) at ../../=
qom/object.c:366
  #4  0x0000557b85891038 in object_class_foreach_tramp (key=3D0x557b883aec1=
0, value=3D0x557b883aea90, opaque=3D0x7ffe065f4290) at ../../qom/object.c:1=
081
  #5  0x00007f501b062fa0 in g_hash_table_foreach (hash_table=3D0x557b882a72=
40 =3D {...}, func=3D0x557b85891008 <object_class_foreach_tramp>, user_data=
=3D0x7ffe065f4290) at ../../../glib/ghash.c:2067
  #6  0x0000557b85891117 in object_class_foreach (fn=3D0x557b85891274 <obje=
ct_class_get_list_tramp>, implements_type=3D0x557b85c579f5 "machine", inclu=
de_abstract=3Dfalse, opaque=3D0x7ffe065f42e0) at ../../qom/object.c:1103
  #7  0x0000557b858912ef in object_class_get_list (implements_type=3D0x557b=
85c579f5 "machine", include_abstract=3Dfalse) at ../../qom/object.c:1160
  #8  0x0000557b85395077 in select_machine (qdict=3D0x557b883c0e80, errp=3D=
0x557b86657e40 <error_fatal>) at ../../softmmu/vl.c:1580
  #9  0x0000557b85396068 in qemu_create_machine (qdict=3D0x557b883c0e80) at=
 ../../softmmu/vl.c:2013
  #10 0x0000557b85399c5d in qemu_init (argc=3D33, argv=3D0x7ffe065f4628) at=
 ../../softmmu/vl.c:3544
  #11 0x0000557b84fdda9f in main (argc=3D33, argv=3D0x7ffe065f4628) at ../.=
./softmmu/main.c:47

So I guess duplicating the options as per Mark is going to be the next
approach to try although it doesn't quite achieve what I want.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

