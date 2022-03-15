Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 400544D9FE1
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 17:21:43 +0100 (CET)
Received: from localhost ([::1]:46976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU9va-0005TK-Bq
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 12:21:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nU9ra-0003cp-OO
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 12:17:37 -0400
Received: from [2a00:1450:4864:20::536] (port=45990
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nU9rY-0008QL-Tz
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 12:17:34 -0400
Received: by mail-ed1-x536.google.com with SMTP id m12so24821359edc.12
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 09:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=wXepQw3GedEOnaEjjgwFEek2uNakl81Uh1kkTxXNANY=;
 b=F3aar3/x2xxvS9vcYKe1Mvtt1EqSsoBASuRUnpfeFf/9QOsQ9EirTU+5UXDPWgmmQ8
 5aWvQ4a3Y7i7pCgV7ZVmsL5EF/adYmtKzIJ1VD+N7zzHTEfgamSkXC88A13R9+XsM+6j
 XdcergIRGV2qgbcn3PqCtfRAhEgxMt67cMDmLaMAwSD7Fl7pSesd8mjtrJziHfqos0pY
 s47rwsq519gPX+/mzmV77GPfGgrLuVYkpyNn/zQcK7+OdEoRjVMtv8d0wWIbjC2XY1VD
 DNGxi9oX8hgtbjXgoEM6RD5NdFDbYHGbi4Eqpu8VsTHOFLEwbPSYq0l80owiW4tZ/TN7
 HE1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=wXepQw3GedEOnaEjjgwFEek2uNakl81Uh1kkTxXNANY=;
 b=dj+3BPgDjaTtbp7rlJNmYDSlao2SsydscK27NysVwISP5JRHl/eeCAIA9ia0C20Si8
 VysgQFsJVGYZhL1YFj9m18SWFx/glEo6OYc70zbAh2yiK93i6Bs/fKQkZu/6tlJOWV8E
 nB0+CnPK5OveSReILbE4IZ+FTtIQRwPkxiXxHXF/lHeUhG4DHjqYmZ/kwWZarRK3if/P
 6xY1CjBnfXE0Iebp9ymIeRrmW4EwmUi7gMpOXn7VnrMYAG24FlYYqaV7tOMqKwakGmLM
 Jt1hSVnEOm+L/GWt2M8JD0cAO2Yx5BFXAov0yY+tKS193QSXPo0I9u7mCKxO2Ba8fR4J
 kajQ==
X-Gm-Message-State: AOAM5314JlHcGZwSRNixRIJuJZRqlsKoMI/EyMST6JizFFAi69bj6FDe
 4S2NBm3vBKDrjgC2wYOUAm41Fg==
X-Google-Smtp-Source: ABdhPJzU1QhvRlda48ErEhrpsRbj6BfjaKE2lwF+Chi9fW6LBiwHjRi2bbN5qpfgAEHV/EV9wPxPow==
X-Received: by 2002:a05:6402:14b:b0:418:d06e:5d38 with SMTP id
 s11-20020a056402014b00b00418d06e5d38mr2452698edu.90.1647361051297; 
 Tue, 15 Mar 2022 09:17:31 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a17090630c200b006d58f94acecsm8336787ejb.210.2022.03.15.09.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 09:17:29 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DA6F31FFB7;
 Tue, 15 Mar 2022 16:17:28 +0000 (GMT)
References: <20220314160108.1440470-1-armbru@redhat.com>
 <20220314160108.1440470-4-armbru@redhat.com> <87y21c401e.fsf@linaro.org>
 <875yofl3k3.fsf@pond.sub.org>
 <02307072-4bff-dbbb-67fb-ca9800c34b3c@gmail.com>
 <875yofjmxu.fsf@pond.sub.org>
User-agent: mu4e 1.7.10; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 3/3] Use g_new() & friends where that makes obvious sense
Date: Tue, 15 Mar 2022 16:16:54 +0000
In-reply-to: <875yofjmxu.fsf@pond.sub.org>
Message-ID: <875yof42cn.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Reinoud Zandijk <reinoud@netbsd.org>,
 Eric Blake <eblake@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Juan Quintela <quintela@redhat.com>, Paul Durrant <paul@xen.org>,
 Magnus Damm <magnus.damm@gmail.com>, Kamil Rytarowski <kamil@netbsd.org>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 =?utf-8?Q?Herv=C3=A9?= Poussineau <hpoussin@reactos.org>,
 Michael Roth <michael.roth@amd.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Amit Shah <amit@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, haxm-team@intel.com,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Fabien Chouteau <chouteau@adacore.com>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Keith Busch <kbusch@kernel.org>,
 qemu-ppc@nongnu.org, David Hildenbrand <david@redhat.com>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Corey Minyard <cminyard@mvista.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-s390x@nongnu.org, Patrick Venture <venture@google.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 Wenchao Wang <wenchao.wang@intel.com>, Igor Mammedov <imammedo@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Markus Armbruster <armbru@redhat.com> writes:

> Philippe Mathieu-Daud=C3=A9 <philippe.mathieu.daude@gmail.com> writes:
>
>> On 15/3/22 14:59, Markus Armbruster wrote:
>>> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>>>=20
>>>> Markus Armbruster <armbru@redhat.com> writes:
>>>>
>>>>> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
>>>>> for two reasons.  One, it catches multiplication overflowing size_t.
>>>>> Two, it returns T * rather than void *, which lets the compiler catch
>>>>> more type errors.
>>>>>
>>>> <snip>
>>>>> diff --git a/semihosting/config.c b/semihosting/config.c
>>>>> index 137171b717..6d48ec9566 100644
>>>>> --- a/semihosting/config.c
>>>>> +++ b/semihosting/config.c
>>>>> @@ -98,7 +98,7 @@ static int add_semihosting_arg(void *opaque,
>>>>>       if (strcmp(name, "arg") =3D=3D 0) {
>>>>>           s->argc++;
>>>>>           /* one extra element as g_strjoinv() expects NULL-terminate=
d array */
>>>>> -        s->argv =3D g_realloc(s->argv, (s->argc + 1) * sizeof(void *=
));
>>>>> +        s->argv =3D g_renew(void *, s->argv, s->argc + 1);
>>>>
>>>> This did indeed break CI because s->argv is an array of *char:
>>>>
>>>> ../semihosting/config.c:101:17: error: assignment to =E2=80=98const ch=
ar **=E2=80=99 from incompatible pointer type =E2=80=98void **=E2=80=99 [-W=
error=3Dincompatible-pointer-types]
>>>>    101 |         s->argv =3D g_renew(void *, s->argv, s->argc + 1);
>>>>        |                 ^
>>>> cc1: all warnings being treated as errors
>>>>
>>>> So it did the job of type checking but failed to build ;-)
>>>
>>> You found a hole in my compile testing, thanks!
>>>
>>> I got confused about the configuration of my build trees.  Catching such
>>> mistakes is what CI is for :)
>>
>> FYI Alex fixed this here:
>> https://lore.kernel.org/qemu-devel/20220315121251.2280317-8-alex.bennee@=
linaro.org/
>>
>> So your series could go on top (modulo the Coverity change).
>
> I dropped this hunk in v2.
>
> Whether my v2 or Alex's series goes in first doesn't matter.

That's great. Thanks for finding the ugliness in the first place ;-)

--=20
Alex Benn=C3=A9e

