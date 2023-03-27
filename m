Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3706CB174
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 00:11:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgv2f-00052r-4K; Mon, 27 Mar 2023 18:10:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pgv2c-00052d-Rb
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 18:10:15 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pgv2a-0006QT-V0
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 18:10:14 -0400
Received: by mail-wr1-x431.google.com with SMTP id r29so10236331wra.13
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 15:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679955011;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EOWdtPcsuGjoHAP0MSlVGDbQoksW0b8wnzOonkz/Q5o=;
 b=GEwymR4TKSLa5wOTruTYug2j/PvW9TwpVoFCgA/tOJScfhI+hcp9u4+Tc5wJ+JKUJ7
 IEJX8fEth97GzFJOP22pAL7kuy5pxIrwhj67PXIlazsXZTRJ4lpZR4YiNORyuENE0A90
 i2qrbBMJrPrSZ2nsfL/tEwU/AjoXEztnrkq5tNgzUfe/jknlZkFOajM00Cka+dOrhSIT
 DgIjJxky5KIW1PhIGSMSfe5jktCNWNZp30qjs6HoWiMv4K94MvlAcCPqDInZkERTxOxC
 Nx9OMka3l0xafeNYNvuPV8rLt6Ee3L8Ak/qrPMMiG2/jazM9jyeEHpgXdODJ1X0YsJh6
 JYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679955011;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=EOWdtPcsuGjoHAP0MSlVGDbQoksW0b8wnzOonkz/Q5o=;
 b=NxsSBQ95rdvYIB7zWLC4MBKSRINyVdPz7Tq1VUucI01wGq7bKasXPVDE9GgTkaNkoN
 AmvMgNwrjESQGTw5VJ2N8QU99t08c45wLRBv+HlBiWap3sKNUeUR9P1FC/skfEbdkjGj
 DM1EMDztrjTckVdTNy+eZnqZnNv/cDDX2Vkag33Pg5P+o+M5xKvprpuzXifpEuHxgsIS
 PoniarQue0zFmqxrXLwZj5T1t9hWEFhJScx7B6NaOLJU07D4SFEi79wuKqYqAJbmXLK1
 IIh1rnwPfhP4de9uhCEeF0M8Up72Gii5jW+dthTD8JYGj7Ka5hAz8KCR4L4z5nhrHwiw
 CVnw==
X-Gm-Message-State: AAQBX9eNofy0C4fB9z8rTwBCgqsZ39WM574NIov2EKHDTa7BQTaTZi+w
 QRh8YnhUfv2zX7mhCA9o+OBO6A==
X-Google-Smtp-Source: AKy350YZIw1/XCrp4v31lazAjeElQ85EbAswhfMGWy/wKo1iCEOSobj24jXxKsxIG3HRWbcUbIvd+g==
X-Received: by 2002:a5d:6283:0:b0:2cf:e18e:9331 with SMTP id
 k3-20020a5d6283000000b002cfe18e9331mr10893875wru.65.1679955011062; 
 Mon, 27 Mar 2023 15:10:11 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 a3-20020adffb83000000b002c561805a4csm25946955wrr.45.2023.03.27.15.10.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 15:10:10 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 650B41FFB7;
 Mon, 27 Mar 2023 23:10:10 +0100 (BST)
References: <20230327131543.2857052-1-alex.bennee@linaro.org>
 <ad9e3b3a-2fad-35d1-4491-8700c8fceae8@ilande.co.uk>
 <87mt3yrx1w.fsf@linaro.org>
 <28e374e3-5aa4-b5e3-0d8f-f885ca1142ca@ilande.co.uk>
User-agent: mu4e 1.10.0; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Eduardo
 Habkost <eduardo@habkost.net>
Subject: Re: [Socratic RFC PATCH] include: attempt to document
 device_class_set_props
Date: Mon, 27 Mar 2023 23:09:36 +0100
In-reply-to: <28e374e3-5aa4-b5e3-0d8f-f885ca1142ca@ilande.co.uk>
Message-ID: <87edp9sv5p.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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


Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> writes:

> On 27/03/2023 17:12, Alex Benn=C3=A9e wrote:
>
>> Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> writes:
>>=20
>>> On 27/03/2023 14:15, Alex Benn=C3=A9e wrote:
>>>
>>>> I'm still not sure how I achieve by use case of the parent class
>>>> defining the following properties:
>>>>     static Property vud_properties[] =3D {
>>>>         DEFINE_PROP_CHR("chardev", VHostUserDevice, chardev),
>>>>         DEFINE_PROP_UINT16("id", VHostUserDevice, id, 0),
>>>>         DEFINE_PROP_UINT32("num_vqs", VHostUserDevice, num_vqs, 1),
>>>>         DEFINE_PROP_END_OF_LIST(),
>>>>     };
>>>> But for the specialisation of the class I want the id to default to
>>>> the actual device id, e.g.:
>>>>     static Property vu_rng_properties[] =3D {
>>>>         DEFINE_PROP_UINT16("id", VHostUserDevice, id, VIRTIO_ID_RNG),
>>>>         DEFINE_PROP_UINT32("num_vqs", VHostUserDevice, num_vqs, 1),
>>>>         DEFINE_PROP_END_OF_LIST(),
>>>>     };
>>>> And so far the API for doing that isn't super clear.
>>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>> ---
>>>>    include/hw/qdev-core.h | 9 +++++++++
>>>>    1 file changed, 9 insertions(+)
>>>> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
>>>> index bd50ad5ee1..d4bbc30c92 100644
>>>> --- a/include/hw/qdev-core.h
>>>> +++ b/include/hw/qdev-core.h
>>>> @@ -776,6 +776,15 @@ BusState *sysbus_get_default(void);
>>>>    char *qdev_get_fw_dev_path(DeviceState *dev);
>>>>    char *qdev_get_own_fw_dev_path_from_handler(BusState *bus, DeviceSt=
ate *dev);
>>>>    +/**
>>>> + * device_class_set_props(): add a set of properties to an device
>>>> + * @dc: the parent DeviceClass all devices inherit
>>>> + * @props: an array of properties, terminate by DEFINE_PROP_END_OF_LI=
ST()
>>>> + *
>>>> + * This will add a set of properties to the object. It will fault if
>>>> + * you attempt to add an existing property defined by a parent class.
>>>> + * To modify an inherited property you need to use????
>>>> + */
>>>>    void device_class_set_props(DeviceClass *dc, Property *props);
>>>>      /**
>>>
>>> Hmmm that's an interesting one. Looking at the source in
>>> hw/core/qdev-properties.c you could possibly get away with something
>>> like this in vu_rng_class_init():
>>>
>>>      ObjectProperty *op =3D object_class_property_find(klass, "id");
>>>      object_property_set_default_uint(op, VIRTIO_ID_RNG);
>>>
>>> Of course this is all completely untested :)
>> Sadly we assert on the existing prop->defval:
>>    static void object_property_set_default(ObjectProperty *prop,
>> QObject *defval)
>>    {
>>        assert(!prop->defval);
>>        assert(!prop->init);
>>        prop->defval =3D defval;
>>        prop->init =3D object_property_init_defval;
>>    }
>> Maybe the assert is too aggressive or we need a different helper,
>> maybe
>> a:
>>    void object_property_update_default_uint(ObjectProperty *prop,
>> uint64_t value)
>> ?
>
> It seems in that case once the default has been set, it is impossible
> to change. The only other immediate option I can think of is to define
> a specific DEFINE_VHOST_PROPERTIES macro in a similar way to
> DEFINE_AUDIO_PROPERTIES which you can use to set the common properties
> for all VHostUserDevice devices, including providing the default ID.

I tried this: allow the default to change

modified   qom/object.c
@@ -1557,11 +1557,16 @@ static void object_property_init_defval(Object *obj=
, ObjectProperty *prop)
=20
 static void object_property_set_default(ObjectProperty *prop, QObject *def=
val)
 {
-    assert(!prop->defval);
-    assert(!prop->init);
+    if (prop->init =3D=3D object_property_init_defval) {
+        fprintf(stderr, "%s: updating existing defval\n", __func__);
+        prop->defval =3D defval;
+    } else {
+        assert(!prop->defval);
+        assert(!prop->init);
=20
-    prop->defval =3D defval;
-    prop->init =3D object_property_init_defval;
+        prop->defval =3D defval;
+        prop->init =3D object_property_init_defval;
+    }
 }
=20


>
>
> ATB,
>
> Mark.


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

