Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 696BA52E100
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 02:10:25 +0200 (CEST)
Received: from localhost ([::1]:51042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrqDo-0006AJ-2R
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 20:10:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nrq7u-0004Fr-AO; Thu, 19 May 2022 20:04:22 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:39511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nrq7s-0003rI-AW; Thu, 19 May 2022 20:04:17 -0400
Received: by mail-pg1-x529.google.com with SMTP id a19so6368659pgw.6;
 Thu, 19 May 2022 17:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=ofSJm7/RTl5ayLudeGZ4EitIR0SoejW9KYF8QkDFdrg=;
 b=PpFTPHGZBMtCsbdbS2S85CRYCvyWteVNxAhuiaGwfS6MaBlNJVVRcz0ffhvgnpsKz8
 r6Un6woxBWYZuWNnPh3mw8UNL384Hx9G2lkSZdteefC8ZAp4RkUrtO2AbfxtN6Md5RoV
 G2AooNeWe4SGG0ctphJFXPKh1SyeAwJrinVinqwWAXORAlwDXkjS9CO1nCgixy3ZGmnF
 oSCaGMtbFqpQXRuq1KgBGQ+cBno+HL/NMaszaDmpb62i/AqOkvWPBfmMZUazpldtE79l
 5HprfCRt03Hodw9fwefTYuQqk+/y5OF+3iom0FiIR8xtFngc1URxXbAc+OcS/xxY6A+l
 6ybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=ofSJm7/RTl5ayLudeGZ4EitIR0SoejW9KYF8QkDFdrg=;
 b=hmyLM5vj9EnMPxgGkfhMj5Ud38E3oBlRcNcPZMK1gPjFIuuwJYUtJaLisMhID7axOO
 fIWuaf1FsJQs/xvGkZ5Thcz4rfMa3IdDp9VRkRfPj7JGiFWVspiRKA4AS/D83pUPN/j4
 Cb9ZnSCAcrpwHf3dTkooPoeKhIDJbprUKICxY+fLVBdrZksnsLD33nE94yMck1gSIL7S
 gV/4GbDNmEYYCkzGDn1ZlKcDl/FrlnrJAe7fxbCQMxnf6qESGahOHOKKsCUi94MTAYcH
 ytQDsN0HapKn4oVzQwII+DBSaTYpUNOxJUAk50S0C66ksLTeNVeBeGtk29pavwIX9Esd
 x5KQ==
X-Gm-Message-State: AOAM5309fCndPIP79ldRLn3lHwpU1bj//gmAd8eUc6vq0bf7DgvVe2U/
 MJ0VkhMNBtF6mQjluHsfsX5ssyDhYBo=
X-Google-Smtp-Source: ABdhPJw64yidW16u1ogy8oRE8RO2fDTpIoVQ8YpjkC6pPK89TB3zglQMWOTt7bfbt/yOd8IORvhDWg==
X-Received: by 2002:a63:f204:0:b0:3c6:a549:567c with SMTP id
 v4-20020a63f204000000b003c6a549567cmr5959150pgh.618.1653005051075; 
 Thu, 19 May 2022 17:04:11 -0700 (PDT)
Received: from localhost ([118.208.131.68]) by smtp.gmail.com with ESMTPSA id
 r19-20020a63ce53000000b003c6a80e54cfsm4139491pgi.75.2022.05.19.17.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 17:04:10 -0700 (PDT)
Date: Fri, 20 May 2022 10:04:04 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] util: optimise flush_idcache_range when the ppc host has
 coherent icache
To: qemu-ppc@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20220519141131.29839-1-npiggin@gmail.com>
 <e9d693db-f195-4bb1-c883-0805d910fe61@linaro.org>
In-Reply-To: <e9d693db-f195-4bb1-c883-0805d910fe61@linaro.org>
MIME-Version: 1.0
Message-Id: <1653004360.c5nktxvrgu.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=npiggin@gmail.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Excerpts from Richard Henderson's message of May 20, 2022 4:31 am:
> On 5/19/22 07:11, Nicholas Piggin wrote:
>> dcache writeback and icache invalidate is not required when icache is
>> coherent, a shorter fixed-length sequence can be used which just has to
>> flush and re-fetch instructions that were in-flight.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>=20
>> I haven't been able to measure a significant performance difference
>> with this, qemu isn't flushing large ranges frequently so the old sequen=
ce
>> is not that slow.
>=20
> Yeah, we should be flushing smallish regions (< 1-4k), as we generate Tra=
nslationBlocks.=20
> And hopefully the translation cache is large enough that we spend more ti=
me executing=20
> blocks than re-compiling them.  ;-)
>=20
>=20
>> +++ b/include/qemu/cacheflush.h
>> @@ -28,6 +28,10 @@ static inline void flush_idcache_range(uintptr_t rx, =
uintptr_t rw, size_t len)
>>  =20
>>   #else
>>  =20
>> +#if defined(__powerpc__)
>> +extern bool have_coherent_icache;
>> +#endif
>=20
> Ug.  I'm undecided where to put this.  I'm tempted to say...
>=20
>> --- a/util/cacheflush.c
>> +++ b/util/cacheflush.c
>> @@ -108,7 +108,16 @@ void flush_idcache_range(uintptr_t rx, uintptr_t rw=
, size_t len)
>=20
> ... here in cacheflush.c, with a comment that the variable is defined and=
 initialized in=20
> cacheinfo.c.
>=20
> I'm even more tempted to merge the two files to put all of the machine-sp=
ecific cache data=20
> in the same place, then this variable can be static.  There's even an exi=
sting TODO=20
> comment in cacheflush.c for aarch64.

That might be nice. Do you want me to look at doing that first?

>>       b =3D rw & ~(dsize - 1);
>> +
>> +    if (have_coherent_icache) {
>> +        asm volatile ("sync" : : : "memory");
>> +        asm volatile ("icbi 0,%0" : : "r"(b) : "memory");
>> +        asm volatile ("isync" : : : "memory");
>> +        return;
>> +    }
>=20
> Where can I find definitive rules on this?

In processor manuals (I don't know if there are any notes about this in=20
the ISA, I would be tempted to say there should be since many processors
implement it).

POWER9 UM, 4.6.2.2 Instruction Cache Block Invalidate (icbi)=20

https://ibm.ent.box.com/s/tmklq90ze7aj8f4n32er1mu3sy9u8k3k

> Note that rx may not equal rw, and that we've got two virtual mappings fo=
r the same=20
> memory, one for "data" that is read-write and one for "execute" that is r=
ead-execute.=20
> (This split is enabled only for --enable-debug-tcg builds on linux, to ma=
ke sure we don't=20
> regress apple m1, which requires the split all of the time.)
>=20
> In particular, you're flushing one icache line with the dcache address, a=
nd that you're=20
> not flushing any of the other lines.  Is the coherent icache thing really=
 that we may=20
> simply skip the dcache flush step, but must still flush all of the icache=
 lines?

Yeah it's just a funny sequence the processor implements. It treats icbi=20
almost as a no-op except that it sets a flag such that the next isync=20
will flush and refetch the pipeline. It doesn't do any cache flushing.

> Without docs, "icache snoop" to me would imply that we only need the two =
barriers and no=20
> flushes at all, just to make sure all memory writes complete before any n=
ew instructions=20
> are executed.  This would be like the two AArch64 bits, IDC and DIC, whic=
h indicate that=20
> the two caches are coherent to Point of Unification, which leaves us with=
 just the=20
> Instruction Sequence Barrier at the end of the function.
>=20
>=20
>> +bool have_coherent_icache =3D false;
>=20
> scripts/checkpatch.pl should complain this is initialized to 0.
>=20
>=20
>>   static void arch_cache_info(int *isize, int *dsize)
>>   {
>> +#  ifdef PPC_FEATURE_ICACHE_SNOOP
>> +    unsigned long hwcap =3D qemu_getauxval(AT_HWCAP);
>> +#  endif
>> +
>>       if (*isize =3D=3D 0) {
>>           *isize =3D qemu_getauxval(AT_ICACHEBSIZE);
>>       }
>>       if (*dsize =3D=3D 0) {
>>           *dsize =3D qemu_getauxval(AT_DCACHEBSIZE);
>>       }
>> +
>> +#  ifdef PPC_FEATURE_ICACHE_SNOOP
>> +    have_coherent_icache =3D (hwcap & PPC_FEATURE_ICACHE_SNOOP) !=3D 0;
>> +#  endif
>=20
> Better with only one ifdef, moving this second hunk up.

Will clean those bits up, thanks.

> It would be nice if there were some kernel documentation for this...

arm64 has kernel docs for hwcaps... powerpc probably should as well.
Good point, I might do a patch for that.

Thanks,
Nick

