Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B78EA54E547
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 16:47:22 +0200 (CEST)
Received: from localhost ([::1]:39084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1qmH-0003mK-R9
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 10:47:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o1qiW-0001wJ-4v
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 10:43:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o1qiU-0004Yu-CF
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 10:43:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655390604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7dLVOwu6SHp6K05ziIxuafgkS7VPOoTSkV7e3J3ZgSw=;
 b=dnpJrK5mOSIKsdkqkHGuehR4SWIBFIQyoxTI6brXIDCHhrW0Fll0qmbnGbnpAMrWbi2F79
 ZOtOzMngWPJvo9K7UCa+82KtNRZgW2rCgsCqPpVXxcXjsu3NJAokgzcC24ZMKNAhYdWNm+
 mHuxOqqjBFmWInyBr78uSVpZAMJM6Bk=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-HcuQ1v0JPNCW0vFl_NQ2fw-1; Thu, 16 Jun 2022 10:43:23 -0400
X-MC-Unique: HcuQ1v0JPNCW0vFl_NQ2fw-1
Received: by mail-vk1-f200.google.com with SMTP id
 a189-20020a1f4dc6000000b0036860a8fe7aso148318vkb.8
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 07:43:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7dLVOwu6SHp6K05ziIxuafgkS7VPOoTSkV7e3J3ZgSw=;
 b=ND3PJv95h5LNv/SHpbiqW1ksj9mi9A7RMEvyArEs1dnHd8hY/jwPYiCDC6U3qnhwz8
 DVcyOg7ba9gm5VLYn+DrxyXOPBf4llbkRsoEcF2xdUJ5HjKRwygpaYbbNS5eYSzhrOZM
 7h3A59XVt3q5vB9soIKo3SNqG+JrreLRWF5m2py72AE4+GgFDHd1bA/Xn2z6VcJW6lNW
 JkiUNloNT1Rc1ZxOpqyCitNlbu9x//a+OxX2bA9QKMvzrjh+ytpDkGNmXHPphClXijUW
 tuQBcx56ys230ZdUYDyLZ83yK6gL3LpE7IyI05RbjC9ujlYzsBpaxsIY3OFSH8GRHcvw
 xnlw==
X-Gm-Message-State: AJIora/EvqKxUimyB6AoImwTWhhqlOLZ+egKfWJTuy5RJ1eTwN25hQeY
 Ick5pCfsU1+I/WIxWVMSBg82jm1sVPdneOkPqrHEzHshBAO57p7s+HxHnNjMyBZXl37zNbOGIvm
 WwnZD81f0nR6sUvAjfXTzdk/b3m9TeJ4=
X-Received: by 2002:a67:f592:0:b0:34b:ba28:f7b4 with SMTP id
 i18-20020a67f592000000b0034bba28f7b4mr2269526vso.61.1655390602968; 
 Thu, 16 Jun 2022 07:43:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vwb0/IJJUgqfF56zKjzFr3/tMRC6crv2IpYg/wqzr9TYRriGQjSYb7aiB2AOUhzpZCn7oivwNXDihwGHdazLo=
X-Received: by 2002:a67:f592:0:b0:34b:ba28:f7b4 with SMTP id
 i18-20020a67f592000000b0034bba28f7b4mr2269506vso.61.1655390602690; Thu, 16
 Jun 2022 07:43:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220616142659.3184115-1-jsnow@redhat.com>
 <20220616142659.3184115-4-jsnow@redhat.com>
 <CAJ+F1C+iHv-RvnbvUikD431tNN8PJ+Z=EO0Hgi8Dht-sX1OKBQ@mail.gmail.com>
In-Reply-To: <CAJ+F1C+iHv-RvnbvUikD431tNN8PJ+Z=EO0Hgi8Dht-sX1OKBQ@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 16 Jun 2022 10:43:11 -0400
Message-ID: <CAFn=p-ayV9vrF7JE=rwkfC_E8kmxAZE-_kwse0RsQdDS7PXtEw@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] qga: treat get-guest-fsinfo as "best effort"
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: QEMU <qemu-devel@nongnu.org>, Beraldo Leal <bleal@redhat.com>, 
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Kevin Wolf <kwolf@redhat.com>, Daniel Berrange <berrange@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 16, 2022 at 10:36 AM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Thu, Jun 16, 2022 at 6:27 PM John Snow <jsnow@redhat.com> wrote:
>>
>> In some container environments, there may be references to block devices
>> witnessable from a container through /proc/self/mountinfo that reference
>> devices we simply don't have access to in the container, and could not
>> provide information about.
>>
>> Instead of failing the entire fsinfo command, return stub information
>> for these failed lookups.
>>
>> This allows test-qga to pass under docker tests, which are in turn used
>> by the CentOS VM tests.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>  qga/commands-posix.c | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
>> index 0469dc409d4..5989d4dca9d 100644
>> --- a/qga/commands-posix.c
>> +++ b/qga/commands-posix.c
>> @@ -1207,7 +1207,13 @@ static void build_guest_fsinfo_for_device(char co=
nst *devpath,
>>
>>      syspath =3D realpath(devpath, NULL);
>>      if (!syspath) {
>> -        error_setg_errno(errp, errno, "realpath(\"%s\")", devpath);
>> +        if (errno =3D=3D ENOENT) {
>> +            /* This devpath may not exist because of container config, =
etc. */
>> +            fprintf(stderr, "realpath(%s) returned NULL/ENOENT\n", devp=
ath);
>
>
> qga uses g_critical() (except for some win32 code paths atm)

Whoops, this is a debugging thing that I left in by accident. I was
just so excited that after testing overnight, everything worked. :)

>
>>
>> +            fs->name =3D g_strdup("??\?-ENOENT");
>
>
> Hmm, maybe we should make the field optional instead.

Does that harm compatibility in a meaningful way? I'm happy to do
whatever QGA maintainers want me to do. I just did something quick and
dirty to get it working at all as a conversation starter. O:-)

>
>>
>> +        } else {
>> +            error_setg_errno(errp, errno, "realpath(\"%s\")", devpath);
>> +        }
>>          return;
>>      }
>>
>> --
>> 2.34.3
>>
>>
>
>
> --
> Marc-Andr=C3=A9 Lureau


