Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF6F6C8378
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 18:40:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pflOu-0004SP-87; Fri, 24 Mar 2023 13:40:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pflOq-0004RR-00
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 13:40:24 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pflOm-00007O-Mx
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 13:40:23 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 v20-20020a05600c471400b003ed8826253aso3229215wmo.0
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 10:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679679617;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oci3TrJa1kNU89ubftNkjX4k7scbX24XS/erBInW69k=;
 b=qpN8LBbNUpP8b5I5QusuaTmx08Gkjex1p8LrHeUbPW3RxPBbH38kDP39SOUAukOWwy
 wsK7sNGk6Qr2hVW7HZO5Qzo/E7ZTkdIYz4/5YadtAGsjPd/9lzhKWYgGkA5+68D5lElY
 Odr0Az0UNShwBD25sY2s75f5c94nbUKEg9UET8qambkBv0DhZi1wn4a5/NUM0ldVf9uY
 lslxVBtRwhpUcsB9x6hvHlH8kVzsLcnJ5ZFT8bHhgveTIRhpv+nOY++XQW5jDvu0xCm+
 mtr2K9rDVmcLqbxVMCSWFk0woe6nw7ZmhVMdzkZY5DMWB78hotmo9mIgk2Jj4SKB3ZFf
 tQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679679617;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=oci3TrJa1kNU89ubftNkjX4k7scbX24XS/erBInW69k=;
 b=7QrfxGPCbM7ZkAh+h3JsT3UwRZHEIOkjGxZmk/vEoU5QvGwiMpk69vD7CxYThmLSVb
 bt5N/Tq2o3Xkqe4b6EJAevE45D3ulFEkod5oiDsvPbdkhI+CSzNla2Kv+okUQBKe0Xhb
 NDFLuueNXHKvORPAokC8wdcoDbfskdHSsck+BqQxMFa9ry6dvEcBQ8NjfhSulLwq35j1
 gjG/PU4pzhQlxqPgS/EeETxuAXhBXfd0D4xFM4H59oPkSWfP1tj8rJ0hrECnouK1ZzF7
 A3fgR/RUNjKcbgofHm6FZ5QxFSpRTHjyj8xEO7deGGfVe9m4jDZqot6nMp913CeEUxx3
 9ldg==
X-Gm-Message-State: AO0yUKVkSL5G3kowSXUC3zZPGTllrMiz6COv/6GGPhJJATmlOjbqcAs5
 yu1gKjiEQVIBquP/Y86WoMdNhw==
X-Google-Smtp-Source: AK7set+Hq0WWc71L/az4TuL1uGe2ocfM+gpUU2wWkYdZxlk0mAqVfLijGtCt2xDC53h+Up2c10FVlg==
X-Received: by 2002:a05:600c:214c:b0:3ed:358e:c1ec with SMTP id
 v12-20020a05600c214c00b003ed358ec1ecmr3063380wml.0.1679679617192; 
 Fri, 24 Mar 2023 10:40:17 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 j11-20020a05600c2b8b00b003ef5b0a533dsm1775830wmc.47.2023.03.24.10.40.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 10:40:16 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8EB291FFB7;
 Fri, 24 Mar 2023 17:40:16 +0000 (GMT)
References: <20230317170553.592707-1-berrange@redhat.com>
 <871qlfmi9q.fsf@secure.mitica>
 <8df76c27-89b5-baee-9738-9b7585ae01e0@redhat.com>
 <87ttyakqh4.fsf@secure.mitica>
User-agent: mu4e 1.9.22; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: quintela@redhat.com
Cc: Thomas Huth <thuth@redhat.com>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Markus Armbruster
 <armbru@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] qtests: avoid printing comments before g_test_init()
Date: Fri, 24 Mar 2023 17:39:18 +0000
In-reply-to: <87ttyakqh4.fsf@secure.mitica>
Message-ID: <874jqa3v5r.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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


Juan Quintela <quintela@redhat.com> writes:

> Thomas Huth <thuth@redhat.com> wrote:
>> On 23/03/2023 19.31, Juan Quintela wrote:
>>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
>>>> The TAP protocol version line must be the first thing printed on
>>>> stdout. The migration test failed that requirement in certain
>>>> scenarios:
>>>>
>>>>    # Skipping test: Userfault not available (builtdtime)
>>>>    TAP version 13
>>>>    # random seed: R02Sc120c807f11053eb90bfea845ba1e368
>>>>    1..32
>>>>    # Start of x86_64 tests
>>>>    # Start of migration tests
>>>>    ....
>>>>
>>>> The TAP version is printed by g_test_init(), so we need to make
>>>> sure that any methods which print are run after that.
>>>>
>>>> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>>>> ---
>>> Reviewed-by: Juan Quintela <quintela@redhat.com>
>>>=20
>>>> -    const bool has_kvm =3D qtest_has_accel("kvm");
>>>> -    const bool has_uffd =3D ufd_version_check();
>>>> -    const char *arch =3D qtest_get_arch();
>>>> +    bool has_kvm;
>>>> +    bool has_uffd;
>>>> +    const char *arch;
>>> Why don't you move also the declarations of the variables?
>>> I think that one of the biggest troubles of C is variables that are not
>>> initialized.
>>> All compilers that we support are C99 or later, so we can do that
>>> (and
>>> we already do in lot of places.)
>>
>> I think the coding style has been created before we switched to
>> -std=3Dgnu99 for compiling QEMU, so a lot of GCCs were still using C89
>> by default?
>
> Yes, that is the actitude.
>
> I got sick when I see new code that still does:
>
> char *foo =3D (char *)malloc(...);
>
> It is is C89, it has been enough to know that it is not needed.
>
> And yes, that particular one is not used in qemu anymore, but:
>
> void *opaque;
>
> ....
>
> Foo *foo =3D (Foo *)opaque;
>
> Is still introduced in new code, and it is not needed since C89.
>
>>> And yeap, I know that CodingStyle says otherwise, but I think that what
>>> is wrong is CodingStyle.
>>> https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg03836.html
>>
>> Please use proper prefixes in the subject when sending patches
>> ("docs/devel:" here), otherwise your patches might not get the right
>> attention (at least on my side, it was filtered away as a patch that
>> was relevant to me) - and also put some recent contributors on CC:
>
> I didn't knew the docs/devel preffix.
>
> About the CC'd, I expected that git-publish be good enough at doing
> that, but it appears not.

I've just sent:

  Subject: [RFC PATCH] MAINTAINERS: add a section for policy documents
  Date: Fri, 24 Mar 2023 17:38:36 +0000
  Message-Id: <20230324173836.1821275-1-alex.bennee@linaro.org>

to collect willing victims^H^H^H^H^H^H volunteers who want to track
project related discussions like this.=20

>
> Anyways, thanks.
>
> Later, Juan.


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

