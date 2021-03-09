Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA67332F27
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 20:39:31 +0100 (CET)
Received: from localhost ([::1]:39420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJiCY-0006mc-Mj
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 14:39:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJggk-0006v6-Nu
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 13:02:34 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:41827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJggf-0001Ic-QG
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 13:02:34 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 t5-20020a1c77050000b029010e62cea9deso7438121wmi.0
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 10:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=klCfTj3BzoCoPea+YkqxFV+crZB0bg3vz0tFgXrqhMY=;
 b=rbswJsc+HG6xqwKJu909TfIsj9v4hiHOTzAhvaLj1l1OCbECINYkvLHqoKzUdNPG5C
 45y+WUwPBk0icl3DjTpKjuaoqU7siSlb91NmV4gure1wI83W9tbSRrPVE8ZIoG2M4FX7
 8ddqPBCxfldkmHp3CtHSk0sRKlqZ7pV9WZCWilg2gHLCxHJ+IbgBiglU8eqmpObDHDyr
 jd4YT7hj/03Fm6RKbPf0sFi6Q2CX1SEU46ukLelE3PmeKznCaolGMomoMG8fmP4nqRMw
 R/4A3Z62c51hu+85dGMU2aDWzIDHvGRB7FkSNnqlcm3jPB5cos8iKcaEZKVCFmbiR1Ej
 +1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=klCfTj3BzoCoPea+YkqxFV+crZB0bg3vz0tFgXrqhMY=;
 b=Z68u7J2KFvr8jZB8fEzk3sqYxy8nGEThkGliMiilv5BB5dV1IHaVqYFByRO2uWFYTN
 ocDEOfawMqv6puOSiXohkJBpiEp0TTNtwf3aNiXt9iDAOKxqRhZjZxQeJzgNkKR2jhiX
 CLaQJIjocTaxd1J0RJlE4fH+7XSdzJcCEi+9qRD+bcsQUh6xf85kbpxRLg9ZIoa0fiNo
 Y0mbhDO3XMFqibya946LkbtVAnV712rS9risp0A7j7c/AJHcrekuZH1GN8MyJFORIPsF
 Mc9BpFPMKCWW2NKjPz6uu6dsoU0/bEGn7HGYKXXRlwMjchm+67wY5BNOOdMkDG9VtJWn
 zMvA==
X-Gm-Message-State: AOAM533Fr5JQxya3Gu/eAxIP2FgKgllJ9Iy3pYXF5XXkBu4MBa99UaOV
 hcN1IujblUvMnywcyoovmNcLC7HCxN16Yg==
X-Google-Smtp-Source: ABdhPJyZ90yOa9yU9JIQV3D++K35RU8BXyq6JhAcX1trgxYSaNSw8MApRsmbt1C2HJcf40sjhDyXIQ==
X-Received: by 2002:a1c:c903:: with SMTP id f3mr5396392wmb.69.1615312947013;
 Tue, 09 Mar 2021 10:02:27 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 91sm27590279wrl.20.2021.03.09.10.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 10:02:25 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 23B601FF7E;
 Tue,  9 Mar 2021 18:02:25 +0000 (GMT)
References: <20210308091959.986540-1-nsurbayrole@quarkslab.com>
 <c74adef9-fb5f-06ee-9dfc-083576a5a607@vivier.eu>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v2] linux-user: Fix executable page of /proc/self/maps
Date: Tue, 09 Mar 2021 17:58:53 +0000
In-reply-to: <c74adef9-fb5f-06ee-9dfc-083576a5a607@vivier.eu>
Message-ID: <87im608atq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Nicolas Surbayrole <nsurbayrole@quarkslab.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Laurent Vivier <laurent@vivier.eu> writes:

> Le 08/03/2021 =C3=A0 10:19, Nicolas Surbayrole a =C3=A9crit :
>> The guest binary and libraries are not always map with the
>> executable bit in the host process. The guest may read a
>> /proc/self/maps with no executable address range. The
>> perm fields should be based on the guest permission inside
>> Qemu.
>>=20
>> Signed-off-by: Nicolas Surbayrole <nsurbayrole@quarkslab.com>
>> ---
>>  linux-user/syscall.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>> index 389ec09764..0bbb2ff9c7 100644
>> --- a/linux-user/syscall.c
>> +++ b/linux-user/syscall.c
>> @@ -7888,9 +7888,9 @@ static int open_self_maps(void *cpu_env, int fd)
>>              count =3D dprintf(fd, TARGET_ABI_FMT_ptr "-" TARGET_ABI_FMT=
_ptr
>>                              " %c%c%c%c %08" PRIx64 " %s %"PRId64,
>>                              h2g(min), h2g(max - 1) + 1,
>> -                            e->is_read ? 'r' : '-',
>> -                            e->is_write ? 'w' : '-',
>> -                            e->is_exec ? 'x' : '-',
>> +                            (flags & PAGE_READ) ? 'r' : '-',
>> +                            (flags & PAGE_WRITE_ORG) ? 'w' : '-',
>> +                            (flags & PAGE_EXEC) ? 'x' : '-',
>>                              e->is_priv ? 'p' : '-',
>>                              (uint64_t) e->offset, e->dev, e->inode);
>>              if (path) {
>>=20
>
> It looks good.
>
> Alex, you wrote this code, any comment?

I just checked to see if we need a Fixes but it seems we've been
ignoring flags for anything other than page_check_range since the
original parsing code so I think we are good.

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> Should we move this directly in read_self_maps() to have the guest
> values in MapInfo?

Nope for the reasons Richard said. read_self_maps() is a QEMU internal
function which we use elsewhere and needs to know the "real" truth ;-)

>
> Thanks,
> Laurent


--=20
Alex Benn=C3=A9e

