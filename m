Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A82246F834B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 14:52:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puuus-0004L9-EK; Fri, 05 May 2023 08:52:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1puuuq-0004L1-2M
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:52:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1puuuo-0004dg-0I
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:52:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683291120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cv3/yvDoIV/KpK9gcUWZN1DBSDFO4ITfOL07EQFNEj4=;
 b=U040pj77qBlI0PPRO3uUPJDnrfnRhrnII3I0nu2Drd64PhmdruxzVLH44b0Ra1Ni1vAjcS
 /uimvhM/pg9/M9XFel2ASWN0ERvAZEv5ES21FY1agb4P6F9o4Yn9Saog3TKhznNIm/s8Qe
 Nzgi6KCLpSAR8mtVxNmHxWJ6Dl9w1YI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-OIKcmN4rM_2d2o-wyiWe2w-1; Fri, 05 May 2023 08:51:58 -0400
X-MC-Unique: OIKcmN4rM_2d2o-wyiWe2w-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-94a341efd9aso215750966b.0
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 05:51:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683291117; x=1685883117;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Cv3/yvDoIV/KpK9gcUWZN1DBSDFO4ITfOL07EQFNEj4=;
 b=RB6xIi2UOsA/3QbqA5mbLwwK/6SRTqBjiTOAkY2muCm5Z9NkFP5GN89ReiVaCf41Od
 6J4UQ7ejowc1D8dJXg48YOpB+tXy+w2+veNYMJ1cGqMp7nmnPhJ9Zm9xWcTxLpCrCf6H
 vyNDaAsNlZV3s6rPuQlHnbUyFK/16dj0gDs1ossRcnbfnsdArxSfjwNcoMlDt+fZp5c8
 CDHFTLz5SfPqjHPsiA0Kb5iWTMqlgjW2FwouZ7+rYnV8U1xrDJgI9nLPUwgOGvcL23Ff
 cUWP/qbLlfu9Qk2Azo8XjycKCdsrI1T07XJLcEcm9p3C4xqXABuC2DqfoPqEFZaW5V2c
 +96A==
X-Gm-Message-State: AC+VfDwx5HtvmW4PYxbZobAJAOJBAw+2BZOTd4Ktxk54DKK2wqZn7+Q1
 WS2F4fC8W3rQn9iM5CjQgXLb3Y9ve2bQqnETk6t08VqhicODFv+b/xczdx4SqDSQt+zfMIdtHR8
 G/9efqc4FydRqSWs=
X-Received: by 2002:a17:907:31c9:b0:94f:6627:22b5 with SMTP id
 xf9-20020a17090731c900b0094f662722b5mr1124027ejb.47.1683291117712; 
 Fri, 05 May 2023 05:51:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7CXELCSiwi89TG6JqaE4ZLNVNOSKb2Lp9Jy925oK2EzQ6dTS1nVAoSCWzI3dGiOxcqKo2R+A==
X-Received: by 2002:a17:907:31c9:b0:94f:6627:22b5 with SMTP id
 xf9-20020a17090731c900b0094f662722b5mr1124006ejb.47.1683291117393; 
 Fri, 05 May 2023 05:51:57 -0700 (PDT)
Received: from ?IPV6:2003:cf:d738:349d:9681:f818:3410:5693?
 (p200300cfd738349d9681f81834105693.dip0.t-ipconnect.de.
 [2003:cf:d738:349d:9681:f818:3410:5693])
 by smtp.gmail.com with ESMTPSA id
 eq20-20020a170907291400b00965d84d43ccsm898965ejc.87.2023.05.05.05.51.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 May 2023 05:51:56 -0700 (PDT)
Message-ID: <05e9946d-f2be-f594-fea2-d1d03686b644@redhat.com>
Date: Fri, 5 May 2023 14:51:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/4] vhost-user-fs: Internal migration
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org,
 virtio-fs@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 German Maglione <gmaglione@redhat.com>,
 Anton Kuchin <antonkuchin@yandex-team.ru>,
 Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
References: <20230411150515.14020-1-hreitz@redhat.com>
 <e8cc4521-50a1-2e38-1fb3-8cfa7b0c967e@redhat.com>
 <CAJSP0QUFFYWwD5+8+1q41sNErJVNbkfnQ3VtB4z-HZUV8S0=zw@mail.gmail.com>
 <dfec96a1-84c3-3639-6f09-204c2d12244a@redhat.com>
 <CAJaqyWdhBq=0f-Qhbdg3AduS8zkPV5p6-uEEn24p1hRKcA3pOQ@mail.gmail.com>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <CAJaqyWdhBq=0f-Qhbdg3AduS8zkPV5p6-uEEn24p1hRKcA3pOQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.28, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 05.05.23 11:53, Eugenio Perez Martin wrote:
> On Fri, May 5, 2023 at 11:03 AM Hanna Czenczek <hreitz@redhat.com> wrote:
>> On 04.05.23 23:14, Stefan Hajnoczi wrote:
>>> On Thu, 4 May 2023 at 13:39, Hanna Czenczek <hreitz@redhat.com> wrote:

[...]

>>> All state is lost and the Device Initialization process
>>> must be followed to make the device operational again.
>>>
>>> Existing vhost-user backends don't implement SET_STATUS 0 (it's new).
>>>
>>> It's messy and not your fault. I think QEMU should solve this by
>>> treating stateful devices differently from non-stateful devices. That
>>> way existing vhost-user backends continue to work and new stateful
>>> devices can also be supported.
>> It’s my understanding that SET_STATUS 0/RESET_DEVICE is problematic for
>> stateful devices.  In a previous email, you wrote that these should
>> implement SUSPEND+RESUME so qemu can use those instead.  But those are
>> separate things, so I assume we just use SET_STATUS 0 when stopping the
>> VM because this happens to also stop processing vrings as a side effect?
>>
>> I.e. I understand “treating stateful devices differently” to mean that
>> qemu should use SUSPEND+RESUME instead of SET_STATUS 0 when the back-end
>> supports it, and stateful back-ends should support it.
>>
> Honestly I cannot think of any use case where the vhost-user backend
> did not ignore set_status(0) and had to retrieve vq states. So maybe
> we can totally remove that call from qemu?

I don’t know so I can’t really say; but I don’t quite understand why 
qemu would reset a device at any point but perhaps VM reset (and even 
then I’d expect the post-reset guest to just reset the device on boot by 
itself, too).

[...]

>>>> Naturally, what I want to know most of all is whether you believe I can
>>>> get away without SUSPEND/RESUME for now.  To me, it seems like honestly
>>>> not really, only when turning two blind eyes, because otherwise we can’t
>>>> ensure that virtiofsd isn’t still processing pending virt queue requests
>>>> when the state transfer is begun, even when the guest CPUs are already
>>>> stopped.  Of course, virtiofsd could stop queue processing right there
>>>> and then, but…  That feels like a hack that in the grand scheme of
>>>> things just isn’t necessary when we could “just” introduce
>>>> SUSPEND/RESUME into vhost-user for exactly this.
>>>>
>>>> Beyond the SUSPEND/RESUME question, I understand everything can stay
>>>> as-is for now, as the design doesn’t seem to conflict too badly with
>>>> possible future extensions for other migration phases or more finely
>>>> grained migration phase control between front-end and back-end.
>>>>
>>>> Did I at least roughly get the gist?
>>> One part we haven't discussed much: I'm not sure how much trouble
>>> you'll face due to the fact that QEMU assumes vhost devices can be
>>> reset across vhost_dev_stop() -> vhost_dev_start(). I don't think we
>>> should keep a copy of the state in-memory just so it can be restored
>>> in vhost_dev_start().
>> All I can report is that virtiofsd continues to work fine after a
>> cancelled/failed migration.
>>
> Isn't the device reset after a failed migration? At least net devices
> are reset before sending VMState. If it cannot be applied at the
> destination, the device is already reset...

It doesn’t look like the Rust crate virtiofsd uses for vhost-user 
supports either F_STATUS or F_RESET_DEVICE, so I think this just doesn’t 
affect virtiofsd.

Hanna


