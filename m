Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5A74480C4
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 15:04:20 +0100 (CET)
Received: from localhost ([::1]:59644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk5G0-0007Ne-2C
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 09:04:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1mk59u-0002hP-Qa; Mon, 08 Nov 2021 08:58:02 -0500
Received: from [2607:f8b0:4864:20::f29] (port=39588
 helo=mail-qv1-xf29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1mk59t-0002P9-2F; Mon, 08 Nov 2021 08:58:02 -0500
Received: by mail-qv1-xf29.google.com with SMTP id gu12so4503518qvb.6;
 Mon, 08 Nov 2021 05:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=vAd6Lf9zaMXGIzbtNsjmJaDBMI52yCgrAR+giB0O/BY=;
 b=fAYOMfKPwpMENCZJl3zx1P4JpwtTWSE4FfOtc8hTzlUSDHgclmhD5fIhe8BHajNZkn
 deuA7gyeLoMoOFEU43W1WMtjyt02eouUzFHsSjgWDt+nCcuXYjqxV8uggFiSdlOjli2d
 Ly6mUoFYFixtATeZhQFtRKcinMK5gODuBnmQtykg0OeVxkyyiiGDhctEfV7k8sET70tT
 mQM7eZfgKkbRpiZXijhnKC+X6oHcR85H3BKS2arRSxhIXK/XrsmUdAoRDOpGmbArhjr/
 bvDe+HDxTdE+NGUd5vBWpQlmsJYVoknCN6jkdWHMBihpDC4YBjlaxEb07BKYinTvyBJU
 8anA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=vAd6Lf9zaMXGIzbtNsjmJaDBMI52yCgrAR+giB0O/BY=;
 b=nZFfr1I/K8RLyO+37fzaJf1DS0KWrpmstm9JOnE4yI0HQoGYkNhhFO2wsCJW0RWrLp
 J1Gj1Huu3jRJxlw2N4ae9PMsmPtWUPOD1lrKpJJq045iY7ZCHkPrpt+N5z/b+7b47NWn
 6MiQjkm6uZVXOZYEQSDFoQZmHNHfSk9zEsXBkFTKhuP6ebSjCaM24z+5cOzH3BBSn2vY
 Bhd+667BEhWwE0OdraobPgBwFyfGbLS9CSm03bKMccTFOSSJS3br5LxddLL0ogmmL+H/
 4nrmPBNJKAlmSMYXP0JDU1UxCa+R4XvcVTgQE7qsUJ4HiZylSDoThvnYNfEBtgk9MZig
 LHcA==
X-Gm-Message-State: AOAM533KI0VdQ9N+bBZm92sS+s/cdrIVYTA1CzFSy1CkQjvQScJwwoQd
 U+JhxO9HU/080lYxQLQEmLKMrY1sPaI=
X-Google-Smtp-Source: ABdhPJzETiiXeXqKrMPccN10CLjSBAFyINTku/vuoJIP0Seb5XJGcJC9oGBab2QegnwhtTA5/uGk6w==
X-Received: by 2002:a05:6a00:1a50:b0:481:1589:78a4 with SMTP id
 h16-20020a056a001a5000b00481158978a4mr56077209pfv.66.1636379474955; 
 Mon, 08 Nov 2021 05:51:14 -0800 (PST)
Received: from localhost (60-241-46-56.tpgi.com.au. [60.241.46.56])
 by smtp.gmail.com with ESMTPSA id n16sm1496166pja.46.2021.11.08.05.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 05:51:14 -0800 (PST)
Date: Mon, 08 Nov 2021 23:51:09 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] spapr_numa.c: FORM2 table handle nodes with no distance
 info
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Daniel Henrique Barboza
 <danielhb413@gmail.com>, qemu-ppc@nongnu.org
References: <20211105135137.1584840-1-npiggin@gmail.com>
 <555804ca-e59e-6dfb-c133-0087b7c0ffd0@gmail.com>
 <87bl2v1dka.fsf@linux.ibm.com>
In-Reply-To: <87bl2v1dka.fsf@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1636379123.cipxekxl0q.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=npiggin@gmail.com; helo=mail-qv1-xf29.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Excerpts from Aneesh Kumar K.V's message of November 8, 2021 2:22 pm:
> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
>=20
>> On 11/5/21 10:51, Nicholas Piggin wrote:
>>> A configuration that specifies multiple nodes without distance info
>>> results in the non-local points in the FORM2 matrix having a distance o=
f
>>> 0. This causes Linux to complain "Invalid distance value range" because
>>> a node distance is smaller than the local distance.
>>>=20
>>> Fix this by building a simple local / remote fallback for points where
>>> distance information is missing.
>>
>> Thanks for looking this up. I checked the output of this same scenario w=
ith
>> a FORM1 guest and 4 distance-less NUMA nodes. This is what I got:
>>
>> [root@localhost ~]# numactl -H
>> available: 4 nodes (0-3)
>> (...)
>> node distances:
>> node   0   1   2   3
>>    0:  10  160  160  160
>>    1:  160  10  160  160
>>    2:  160  160  10  160
>>    3:  160  160  160  10
>> [root@localhost ~]#
>>
>>
>> With this patch we're getting '20' instead of '160' because you're using
>> NUMA_DISTANCE_DEFAULT, while FORM1 will default this case to the maximum
>> NUMA distance the kernel allows for that affinity (160).
>=20
> where is that enforced? Do we know why FORM1 picked 160?=20
>=20
>>
>> I do not have strong feelings about changing this behavior between FORM1=
 and
>> FORM2. I tested the same scenario with a x86_64 guest and they also uses=
 '20'
>> in this case as well, so far as QEMU goes using NUMA_DISTANCE_DEFAULT is
>> consistent.
>>
>=20
> for FORM2 I would suggest 20 is the right value and it is also
> consistent with other architectures.=20
>=20
>> Aneesh is already in CC, so I believe he'll let us know if there's somet=
hing
>> we're missing and we need to preserve the '160' distance in FORM2 for th=
is
>> case as well.
>>
>> For now:
>>
>>
>>>=20
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---
>>
>>
>> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>
>>
>>
>>>   hw/ppc/spapr_numa.c | 22 +++++++++++++++++-----
>>>   1 file changed, 17 insertions(+), 5 deletions(-)
>>>=20
>>> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
>>> index 5822938448..56ab2a5fb6 100644
>>> --- a/hw/ppc/spapr_numa.c
>>> +++ b/hw/ppc/spapr_numa.c
>>> @@ -546,12 +546,24 @@ static void spapr_numa_FORM2_write_rtas_tables(Sp=
aprMachineState *spapr,
>>>                * NUMA nodes, but QEMU adds the default NUMA node withou=
t
>>>                * adding the numa_info to retrieve distance info from.
>>>                */
>>> -            if (src =3D=3D dst) {
>>> -                distance_table[i++] =3D NUMA_DISTANCE_MIN;
>>> -                continue;
>=20
> We always initialized the local distance to be NUMA_DISTANCE_MIN
> irrespective of what is specified via Qemu command line before? If so
> then the above change will break that?=20

That's true. I think command line should take priority and if we have to=20
override it for some reason then we should print a warning.

>=20
>>> +            distance_table[i] =3D numa_info[src].distance[dst];
>>> +            if (distance_table[i] =3D=3D 0) {
>=20
> we know distance_table[i] is =3D=3D 0 here and ..
>=20
>>> +                /*
>>> +                 * In case QEMU adds a default NUMA single node when t=
he user
>>> +                 * did not add any, or where the user did not supply d=
istances,
>>> +                 * the value will be 0 here. Populate the table with a=
 fallback
>>> +                 * simple local / remote distance.
>>> +                 */
>>> +                if (src =3D=3D dst) {
>>> +                    distance_table[i] =3D NUMA_DISTANCE_MIN;
>>> +                } else {
>>> +                    distance_table[i] =3D numa_info[src].distance[dst]=
;
>>> +                    if (distance_table[i] < NUMA_DISTANCE_MIN) {
>=20
>=20
> considering we reached here after checking distance_table[i] =3D=3D 0 do =
we
> need to do the above two lines?

Oh that's true. I think the lines could just be removed.

Thanks,
Nick

>=20
>>> +                        distance_table[i] =3D NUMA_DISTANCE_DEFAULT;
>>> +                    }
>>> +                }
>>>               }
>>> -
>>> -            distance_table[i++] =3D numa_info[src].distance[dst];
>>> +            i++;
>>>           }
>>>       }
>=20
>=20
>=20

