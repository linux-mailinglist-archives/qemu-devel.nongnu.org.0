Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B78360194
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 07:27:16 +0200 (CEST)
Received: from localhost ([::1]:46850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWuX4-0005Pj-OR
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 01:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lWuVl-0004Md-EE; Thu, 15 Apr 2021 01:25:53 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:41551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lWuVj-00057u-Ox; Thu, 15 Apr 2021 01:25:53 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 z22-20020a17090a0156b029014d4056663fso12049986pje.0; 
 Wed, 14 Apr 2021 22:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=9HzlCSEZPF0neIGi9d0fpeMh58pd8KRkWo/KMGKcxLw=;
 b=YXcalY9yxKNDpwNmU4GAw4BJ19s0UC6ZHoYkQCrLUhbhkFtH4WJn0VSi5uXXM/h69J
 6Csc0B2dPj4mMvhyfKQBzxgz5IED8kjfUzCyNuXHTbTboLX8eiZaITALp5A+vAVc7G2U
 wmzQqwZDoLrOpFlQmnsCkgzbisQNDB7VE5qT2oWXFmZk0XSTk4RvyHgxt1pbK0xz8DBg
 uF0sbqtNgARUpzL1c80N45dPIdj2QbWFCE/14K8fFzcvH8yvMRZYNPJSIq1W+rzNEtFM
 MRRE2JsVK2pkkUF+1/iCT+vo8kmKrwZC4r3L4pGGS09D5qPNV/2WjMOym0mWkhcZbSDv
 yNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=9HzlCSEZPF0neIGi9d0fpeMh58pd8KRkWo/KMGKcxLw=;
 b=OqQ/h6C3+YALMcxfIAJgIpJA8Nvfydej+18wHAUApu/Mwel4L5Ly7u00ge8VFXCwcV
 re/H++J9BZ1rEd65B7QuCWndyQQHhngoDColo62Ppqqtf0q3pI128apkyB7UYzyq6zMa
 OTJ8UflFlIxutDSYV/TIYMjQBEGQhCGIAVlkYKKoeSpHnOEVVHm6RifPuOPrM7X+Xk9s
 PfeRmUqVcpJSAJcMI0NxCdP66A/+5l8jDlKaNf0W86n6xBbYNOopOZnAuVIvAj9koSHN
 Rzctua+lO9OjSDsUjnFG3l5WuC3KjZh0FnWGyV8mpdKPCHJqRYJcPXRx2T18Fg2Wh6xf
 zZOQ==
X-Gm-Message-State: AOAM533wkHJtK2lozrCG1F/1qmC8qDOV9sk7w7DMRNJ7voob1PMQh2BW
 1IaBcsmE+lYN4U7dXsn6m8s=
X-Google-Smtp-Source: ABdhPJz+T7HykLspQhbtdBGT/KifryRZfs+W8Qf8fBBlmbrvB3g83oTIcQr1riaJtDEJliiebHRv7A==
X-Received: by 2002:a17:902:e812:b029:eb:59d9:e550 with SMTP id
 u18-20020a170902e812b02900eb59d9e550mr2021408plg.26.1618464349513; 
 Wed, 14 Apr 2021 22:25:49 -0700 (PDT)
Received: from localhost (193-116-90-211.tpgi.com.au. [193.116.90.211])
 by smtp.gmail.com with ESMTPSA id c21sm178613pfc.165.2021.04.14.22.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 22:25:49 -0700 (PDT)
Date: Thu, 15 Apr 2021 15:25:43 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [EXTERNAL] [RFC PATCH 1/2] target/ppc: rework AIL logic in
 interrupt delivery
To: =?iso-8859-1?q?C=E9dric?= Le Goater <clg@kaod.org>, qemu-ppc@nongnu.org
References: <20210414032343.1720010-1-npiggin@gmail.com>
 <20210414032343.1720010-2-npiggin@gmail.com>
 <eaada833-6df9-a056-b137-9b5fd6643992@kaod.org>
In-Reply-To: <eaada833-6df9-a056-b137-9b5fd6643992@kaod.org>
MIME-Version: 1.0
Message-Id: <1618464037.6efzvw5ldq.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>,
 =?iso-8859-1?q?C=E9dric?= Le Goater <clg@fr.ibm.com>, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Excerpts from C=C3=A9dric Le Goater's message of April 15, 2021 1:24 am:
> On 4/14/21 5:23 AM, Nicholas Piggin wrote:
>> The AIL logic is becoming unmanageable spread all over powerpc_excp(),
>> and it is slated to get even worse with POWER10 support.
>>=20
>> Move it all to a new helper function.
>=20
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Tested-by: C=C3=A9dric Le Goater <clg@kaod.org>
>=20
> Thanks for the effort and the documentation. One minor comment below,
>=20
> C.
>=20
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  hw/ppc/spapr_hcall.c            |   3 +-
>>  target/ppc/cpu.h                |   8 --
>>  target/ppc/excp_helper.c        | 161 ++++++++++++++++++++------------
>>  target/ppc/translate_init.c.inc |   2 +-
>>  4 files changed, 104 insertions(+), 70 deletions(-)
>>=20
>> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
>> index 7b5cd3553c..2fbe04a689 100644
>> --- a/hw/ppc/spapr_hcall.c
>> +++ b/hw/ppc/spapr_hcall.c
>> @@ -1395,7 +1395,8 @@ static target_ulong h_set_mode_resource_addr_trans=
_mode(PowerPCCPU *cpu,
>>          return H_P4;
>>      }
>>=20
>> -    if (mflags =3D=3D AIL_RESERVED) {
>> +    if (mflags =3D=3D 1) {
>> +        /* AIL=3D1 is reserved */
>>          return H_UNSUPPORTED_FLAG;
>>      }
>>=20
>> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
>> index e73416da68..5200a16d23 100644
>> --- a/target/ppc/cpu.h
>> +++ b/target/ppc/cpu.h
>> @@ -2375,14 +2375,6 @@ enum {
>>      HMER_XSCOM_STATUS_MASK      =3D PPC_BITMASK(21, 23),
>>  };
>>=20
>> -/* Alternate Interrupt Location (AIL) */
>> -enum {
>> -    AIL_NONE                =3D 0,
>> -    AIL_RESERVED            =3D 1,
>> -    AIL_0001_8000           =3D 2,
>> -    AIL_C000_0000_0000_4000 =3D 3,
>> -};
>=20
> I kind of like these. No big deal.

My thinking was they actually are just a POWER8 model of the AIL bits=20
(e.g., they don't represent scv properly or AIL=3D2 reserved in P10), and=20
they spread the meaning over multiple files. After this patch it's all
just in that single function.

>>=20
>> -    switch (ail) {
>> -    case AIL_NONE:
>> -        break;
>> -    case AIL_0001_8000:
>> -        offset =3D 0x18000;
>> -        break;
>> -    case AIL_C000_0000_0000_4000:
>> -        offset =3D 0xc000000000004000ull;
>> -        break;
>> -    default:
>> -        cpu_abort(cs, "Invalid AIL combination %d\n", ail);
>=20
> Could we keep this abort ?=20

Well the abort is no longer there because we explicitly handle all=20
cases, the reserved ones by just ignoring them. I don't know what
the hardware actually does if you tried to set it (it should ignore)
but I think this is nicer to not abort.

Thanks,
Nick

