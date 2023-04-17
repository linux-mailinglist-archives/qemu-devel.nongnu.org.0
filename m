Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C22B6E468A
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 13:34:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poN6u-0005Vh-89; Mon, 17 Apr 2023 07:33:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poN6m-0005RW-2v
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 07:33:20 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poN6k-0008I7-6p
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 07:33:19 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-2fa0ce30ac2so694988f8f.3
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 04:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681731196; x=1684323196;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DrlnDqm9t4GCDwRLA0BVqcv3xQUQ/GO+I8SKwBgxv/k=;
 b=wsFHvT1BdB7SQ7ryjJaBSDh/R7j4vLZvk5sgWkFUKST+J+UsMCe4colhyWt7Rvwf9+
 XJwLpk36ZWu2SYwIv8zdexJqQQH+yb2ayAOUcBj6bS0opwAftgtSz106y73xe6N5uOFO
 KZwvkRLtUPOfa0W0aib1+BVJMcB2evUp76zlXkTw0/KIje3rZokK1bSSeu3cryTmHqJq
 4aK4Lq/+dMkM8RuFAYAqvZ2+mobgT/oE4MDZgdZuU+UG4WzP2XjlfQOgIWtVzXPR8E9t
 U1WiqOH6X+tylcaApiT9/x35Xa5Y1JdSshEQbNe5el3N2NFoorleOh+1GtrcBJ2lyJzs
 jyNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681731196; x=1684323196;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=DrlnDqm9t4GCDwRLA0BVqcv3xQUQ/GO+I8SKwBgxv/k=;
 b=OfGYKq1jluu+71dmxb7KCdxlOJEMyhYfbP0gfbafk9ypSTXOXSbCHyWsiui/YQdw95
 tFSIIPF5u73LsjFmDS4m41LADJgkdZBdbO0Lsm8FEobU+fvX2qTX83QCOfUgXWk8Adpr
 6Mia3nlxu1jUwM2LOB78NMt/eJUptKiC0vDvXNGLll2590dPKPALpuOBiFNoFVh8NrAd
 HCDcC+IEJrgNmQAVK0JyK0DobXzZquNOiUPEMuAfmd2cJVGa7ftatqXfK8ocgK4gMupm
 OOeQe5wXI+jv2csusf4qbeOY2Tm2pxRRnVkA20dzthLq9ayVrp/Sb8gi5fdf1ZFX0Bgl
 Grzw==
X-Gm-Message-State: AAQBX9eANOQQKNaAHHcIAFVJEVa/v9aTarWRS+F/jrIP1mjw4hnxOiIF
 2OjGANLNH/Ws2C/LipglyxrvFg==
X-Google-Smtp-Source: AKy350a6U/DB+VjgM6s3tI6GkDD+81mhya6crbIc1u61Y1q/T0QlutLr0ZrogWxwPxWT5qG0o5z2pA==
X-Received: by 2002:a5d:4f01:0:b0:2f6:ca0d:ec1c with SMTP id
 c1-20020a5d4f01000000b002f6ca0dec1cmr5969952wru.10.1681731195933; 
 Mon, 17 Apr 2023 04:33:15 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a5d4ec9000000b002cde25fba30sm10417512wrv.1.2023.04.17.04.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 04:33:15 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 08F2E1FFB7;
 Mon, 17 Apr 2023 12:33:15 +0100 (BST)
References: <20230414160433.2096866-1-alex.bennee@linaro.org>
 <20230414160433.2096866-9-alex.bennee@linaro.org>
 <87bkjmddxi.fsf@pond.sub.org>
User-agent: mu4e 1.11.2; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, "Gonglei (Arei)" <arei.gonglei@huawei.com>, Paolo
 Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 virtio-fs@redhat.com, Erik Schilling <erik.schilling@linaro.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, Eduardo
 Habkost
 <eduardo@habkost.net>, Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake
 <eblake@redhat.com>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Jason
 Wang <jasowang@redhat.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 Mathieu  Poirier <mathieu.poirier@linaro.org>, Gerd Hoffmann
 <kraxel@redhat.com>
Subject: Re: [PATCH 08/12] qom: allow for properties to become "fixed"
Date: Mon, 17 Apr 2023 12:26:31 +0100
In-reply-to: <87bkjmddxi.fsf@pond.sub.org>
Message-ID: <878req9211.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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


Markus Armbruster <armbru@redhat.com> writes:

> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>
>> When specialising general purpose objects it is sometimes useful to
>> "fix" some of the properties that were configurable by the base
>> classes. We will use this facility when specialising
>> vhost-user-device.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  qapi/qom.json           |  2 ++
>>  include/qom/object.h    | 16 +++++++++++++++-
>>  qom/object.c            | 14 ++++++++++++++
>>  qom/object_interfaces.c |  9 ++++++---
>>  qom/qom-qmp-cmds.c      |  1 +
>>  softmmu/qdev-monitor.c  |  1 +
>>  6 files changed, 39 insertions(+), 4 deletions(-)
>>
>> diff --git a/qapi/qom.json b/qapi/qom.json
>> index a877b879b9..4cda191f00 100644
>> --- a/qapi/qom.json
>> +++ b/qapi/qom.json
>> @@ -33,12 +33,14 @@
>>  # @description: if specified, the description of the property.
>>  #
>>  # @default-value: the default value, if any (since 5.0)
>> +# @fixed: if specified if value has been fixed (since 8.1)
>
> Wat?
>
>>  #
>>  # Since: 1.2
>>  ##
>>  { 'struct': 'ObjectPropertyInfo',
>>    'data': { 'name': 'str',
>>              'type': 'str',
>> +            'fixed': 'bool',
>>              '*description': 'str',
>>              '*default-value': 'any' } }
>>=20=20
>
> qom-list and qom-list-properties return a list of this.  Use cases for
> the new member?

The use-case is this whole series. Basically I want to have a generic
device (vhost-user-device) which has a bunch of control knobs the user
can fiddle with (e.g. virtio id, num_vqs and the like). However for the
specialised versions of this device (e.g. vhost-user-gpio) some of these
values (e.g. virtio id) need to be fixed.

Mark suggested maybe just duplicating the properties in a similar way to
DEFINE_AUDIO_PROPERTIES but that doesn't really address the problem
wanting to "fix" some of the values for the subclasses and preventing
the user from changing things.

I appreciate this is possibly a horrible hack so I'm open to the QOM
experts showing me the correct way to model this sort of behaviour.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

