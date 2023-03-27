Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D531C6CAA36
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 18:16:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgpUZ-0005MR-2S; Mon, 27 Mar 2023 12:14:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pgpUW-0005M6-BP
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 12:14:40 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pgpUU-0006w6-Qp
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 12:14:40 -0400
Received: by mail-wm1-x32b.google.com with SMTP id s13so5357587wmr.4
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 09:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679933676;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Se3C6RmS8gstrkcitn4DwCII7Q03GhChDJIvJr4cVY=;
 b=yW0OO/aPEon+2YX1hDDmxz+Gzbd45F/V+aJsFmXXGNN9Qrb5XWB8H7rv2xVZC3L6j1
 jXSGhrGtdrDVSoEwnZtiVaV9embMydtywInWm/dNfhQSIWD0wh8p2htHzyCOjGw0uyjT
 kR3xfdUZ9EGJGPi6ytTgTys2i1Fhp2R/Wsrw9ZghnWGFTsSnoGE169TCzTEJqfxp6aqD
 +xAjIc10kceQIanvw+uGp6OHa3LxEEaJ6DHGpG/rHfcVtcIeK4S1h9OTMwkg1jmJsNZs
 WHoGqUazIWU8IJVoXWS5Eb8emfrhkjbD2ajHuqKTYHZ4EBAmgQS1+oQWFfMwGgHzybfx
 TDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679933676;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7Se3C6RmS8gstrkcitn4DwCII7Q03GhChDJIvJr4cVY=;
 b=PLAhAcDdGAJpzADxo3PKSB0B7Ms9loatgstzRa5zbKLz5nqpRIEuc6lnIH8QKqoq15
 OwTXngbQ4hRdh6FKDLjV4LtKkiEq33FoPcrzNJk+e63kK6nMMzVZd4nzAcd3kqdy5jUn
 1LkQ9KbaHgE9w7fhiq564J9pMh7nZN/FfjDbGgNNhRxf4Lry6jAuBW9GITPzzPnrPCca
 n6p5RxOJVNsFNRYY7MErdw6LMfdxDDRJbhv2kzra+W+zsDyZydEfaWIFgaZVLnGzXsSC
 rt3DbhtK78QwnS/KboW4lg6byRU1SF2YHdt860DyW988niVTyGFOi/lwYdrwPlL12gCS
 lbgQ==
X-Gm-Message-State: AAQBX9c5fiBh8DeIz4vMw9rdXdAXOTGDwtb8bRwsoxIsRH7hO1N8bqqy
 IqzmNhurUaYmegZpPnuClbezGw==
X-Google-Smtp-Source: AKy350bbKErG7gDZMoGoIOtTq13vz8zO1shn1g2zkkPO77qjOmPo4DrCNbl65ZwtAxdqCqVLNbg+yA==
X-Received: by 2002:a7b:c852:0:b0:3ef:64b4:b081 with SMTP id
 c18-20020a7bc852000000b003ef64b4b081mr5862258wml.39.1679933675688; 
 Mon, 27 Mar 2023 09:14:35 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a05600c354600b003ede6540190sm9535343wmq.0.2023.03.27.09.14.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 09:14:35 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1BC1A1FFB7;
 Mon, 27 Mar 2023 17:14:35 +0100 (BST)
References: <20230327131543.2857052-1-alex.bennee@linaro.org>
 <ad9e3b3a-2fad-35d1-4491-8700c8fceae8@ilande.co.uk>
User-agent: mu4e 1.10.0; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Eduardo
 Habkost <eduardo@habkost.net>
Subject: Re: [Socratic RFC PATCH] include: attempt to document
 device_class_set_props
Date: Mon, 27 Mar 2023 17:12:28 +0100
In-reply-to: <ad9e3b3a-2fad-35d1-4491-8700c8fceae8@ilande.co.uk>
Message-ID: <87mt3yrx1w.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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

> On 27/03/2023 14:15, Alex Benn=C3=A9e wrote:
>
>> I'm still not sure how I achieve by use case of the parent class
>> defining the following properties:
>>    static Property vud_properties[] =3D {
>>        DEFINE_PROP_CHR("chardev", VHostUserDevice, chardev),
>>        DEFINE_PROP_UINT16("id", VHostUserDevice, id, 0),
>>        DEFINE_PROP_UINT32("num_vqs", VHostUserDevice, num_vqs, 1),
>>        DEFINE_PROP_END_OF_LIST(),
>>    };
>> But for the specialisation of the class I want the id to default to
>> the actual device id, e.g.:
>>    static Property vu_rng_properties[] =3D {
>>        DEFINE_PROP_UINT16("id", VHostUserDevice, id, VIRTIO_ID_RNG),
>>        DEFINE_PROP_UINT32("num_vqs", VHostUserDevice, num_vqs, 1),
>>        DEFINE_PROP_END_OF_LIST(),
>>    };
>> And so far the API for doing that isn't super clear.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   include/hw/qdev-core.h | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
>> index bd50ad5ee1..d4bbc30c92 100644
>> --- a/include/hw/qdev-core.h
>> +++ b/include/hw/qdev-core.h
>> @@ -776,6 +776,15 @@ BusState *sysbus_get_default(void);
>>   char *qdev_get_fw_dev_path(DeviceState *dev);
>>   char *qdev_get_own_fw_dev_path_from_handler(BusState *bus, DeviceState=
 *dev);
>>   +/**
>> + * device_class_set_props(): add a set of properties to an device
>> + * @dc: the parent DeviceClass all devices inherit
>> + * @props: an array of properties, terminate by DEFINE_PROP_END_OF_LIST=
()
>> + *
>> + * This will add a set of properties to the object. It will fault if
>> + * you attempt to add an existing property defined by a parent class.
>> + * To modify an inherited property you need to use????
>> + */
>>   void device_class_set_props(DeviceClass *dc, Property *props);
>>     /**
>
> Hmmm that's an interesting one. Looking at the source in
> hw/core/qdev-properties.c you could possibly get away with something
> like this in vu_rng_class_init():
>
>     ObjectProperty *op =3D object_class_property_find(klass, "id");
>     object_property_set_default_uint(op, VIRTIO_ID_RNG);
>
> Of course this is all completely untested :)

Sadly we assert on the existing prop->defval:

  static void object_property_set_default(ObjectProperty *prop, QObject *de=
fval)
  {
      assert(!prop->defval);
      assert(!prop->init);

      prop->defval =3D defval;
      prop->init =3D object_property_init_defval;
  }

Maybe the assert is too aggressive or we need a different helper, maybe
a:

  void object_property_update_default_uint(ObjectProperty *prop, uint64_t v=
alue)

?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

