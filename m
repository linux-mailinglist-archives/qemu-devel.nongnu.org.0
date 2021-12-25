Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1544E47F303
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Dec 2021 11:47:28 +0100 (CET)
Received: from localhost ([::1]:40618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n14aE-0004lX-MC
	for lists+qemu-devel@lfdr.de; Sat, 25 Dec 2021 05:47:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1n14Yr-0003po-O8; Sat, 25 Dec 2021 05:46:02 -0500
Received: from [2607:f8b0:4864:20::1031] (port=40795
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1n14Yq-0005aj-8i; Sat, 25 Dec 2021 05:46:01 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 o63-20020a17090a0a4500b001b1c2db8145so13646526pjo.5; 
 Sat, 25 Dec 2021 02:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=E2BMmpkk98hhMZDyGpQiICL5vjnkhREtcE/uL/tOLks=;
 b=Xe1jheGhH2sKXDy/o1tEpjgBCf5A/5tPxJK4kSB1BMFiJ2s93EEOqUe+BHb1kecM7b
 aRysbo5oGaByzezMNV8QibXFjT4E3MdhveVwllEudVGaG4l6rIqESA4IYMI4f9qx8fle
 1eCRby/KJJEHY+bP4hmUTLAuol701y+7Q+O0dghwAVS4VWY2t0vzEz4csU3b+OmPHjQf
 ViXMIXe+7OFvd6AOeXWtNwqAwrh2qGaAU7uklJj2PSZNB8VjGnqRD57UlC+zUUaarWr+
 1dHLDpePisagmldpKoirDa61riw6qNaei2qv7FSYyGOHjSZCd5r4IqXssqoCKCme3fjI
 YyVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=E2BMmpkk98hhMZDyGpQiICL5vjnkhREtcE/uL/tOLks=;
 b=Mn3mddsW1QtMsWIeRCniTTizmbUqqSIWQL4ArfbBCAnZ3wRbOVS0vKRZOLNE7HiLwd
 uZiYpjaf1meEx3AIPOnH6RZledw9mQAUkE/A3BvciwL9h3li8vGdDTnbk92DGKam+WFU
 8mkD0qr7Uec8XmwCSUmgx1wUPGs6FgJSAhdv1OmVt+dKrWONA0NIbyLe0o2x5A2UCa3z
 mB9WW98atdRc9wxsHNPhEYtJYsIyU7ITqBFKsKDyDyZY+zg8SG029f4ytuOemsTCNRVz
 pqlUdZ9vU8aUylzj5aVCI+9qnopstSMVbBTTdsSxU6M0+fLpH/axNZdE8qgCjue86/fP
 2/aA==
X-Gm-Message-State: AOAM5313ZnudL90yG2vJD9KVHgH6N83NY1Ux2jdcOVkfvOOqkT9NKtWB
 Qi3Q/vlDTd+Q0Wb37xFPRS4=
X-Google-Smtp-Source: ABdhPJyoPtLdMM7Vr6fiD8xJ+hUzrJ8tGJOBR7pu7ANBMY0yb+7zT6FJrYWLTgMavVjwX9cUSUwp/A==
X-Received: by 2002:a17:90b:17cd:: with SMTP id
 me13mr12121803pjb.79.1640429158029; 
 Sat, 25 Dec 2021 02:45:58 -0800 (PST)
Received: from localhost (121-44-67-22.tpgi.com.au. [121.44.67.22])
 by smtp.gmail.com with ESMTPSA id v16sm10185965pjh.57.2021.12.25.02.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Dec 2021 02:45:57 -0800 (PST)
Date: Sat, 25 Dec 2021 20:45:52 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC v2 02/12] target/ppc: powerpc_excp: Set vector earlier
To: =?iso-8859-1?q?C=E9dric?= Le Goater <clg@kaod.org>, Fabiano Rosas
 <farosas@linux.ibm.com>, qemu-devel@nongnu.org
References: <20211220181903.3456898-1-farosas@linux.ibm.com>
 <20211220181903.3456898-3-farosas@linux.ibm.com>
 <7ca73e67-6578-29ca-c2a2-6ac2e294b04c@kaod.org>
In-Reply-To: <7ca73e67-6578-29ca-c2a2-6ac2e294b04c@kaod.org>
MIME-Version: 1.0
Message-Id: <1640429104.syfmbpgu6q.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Excerpts from C=C3=A9dric Le Goater's message of December 22, 2021 4:48 pm:
> Adding Nicholas.

These look fine by me. The whole series looks like a really nice
cleanup actually.

Thanks,
Nick

>=20
> On 12/20/21 19:18, Fabiano Rosas wrote:
>> None of the interrupt setup code touches 'vector', so we can move it
>> earlier in the function. This will allow us to later move the System
>> Call Vectored setup that is on the top level into the
>> POWERPC_EXCP_SYSCALL_VECTORED code block.
>>=20
>> This patch also moves the verification for when 'excp' does not have
>> an address associated with it. We now bail a little earlier when that
>> is the case. This should not cause any visible effects.
>>=20
>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>=20
>=20
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
>=20
> Thanks,
>=20
> C.
>     =20
>> ---
>>   target/ppc/excp_helper.c | 16 ++++++++--------
>>   1 file changed, 8 insertions(+), 8 deletions(-)
>>=20
>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>> index 8b9c6bc5a8..14fd0213a0 100644
>> --- a/target/ppc/excp_helper.c
>> +++ b/target/ppc/excp_helper.c
>> @@ -352,6 +352,14 @@ static inline void powerpc_excp(PowerPCCPU *cpu, in=
t excp_model, int excp)
>>       }
>>   #endif
>>  =20
>> +    vector =3D env->excp_vectors[excp];
>> +    if (vector =3D=3D (target_ulong)-1ULL) {
>> +        cpu_abort(cs, "Raised an exception without defined vector %d\n"=
,
>> +                  excp);
>> +    }
>> +
>> +    vector |=3D env->excp_prefix;
>> +
>>       switch (excp) {
>>       case POWERPC_EXCP_NONE:
>>           /* Should never happen */
>> @@ -831,14 +839,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, in=
t excp_model, int excp)
>>       }
>>   #endif
>>  =20
>> -    vector =3D env->excp_vectors[excp];
>> -    if (vector =3D=3D (target_ulong)-1ULL) {
>> -        cpu_abort(cs, "Raised an exception without defined vector %d\n"=
,
>> -                  excp);
>> -    }
>> -
>> -    vector |=3D env->excp_prefix;
>> -
>>   #if defined(TARGET_PPC64)
>>       if (excp_model =3D=3D POWERPC_EXCP_BOOKE) {
>>           if (env->spr[SPR_BOOKE_EPCR] & EPCR_ICM) {
>>=20
>=20
>=20

