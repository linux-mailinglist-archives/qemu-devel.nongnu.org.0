Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2D243832C
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 12:14:46 +0200 (CEST)
Received: from localhost ([::1]:41138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meE33-0002Mx-39
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 06:14:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1meE14-0000rU-DP; Sat, 23 Oct 2021 06:12:42 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:56959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1meE10-0000n3-U5; Sat, 23 Oct 2021 06:12:41 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 5B5E77475FA;
 Sat, 23 Oct 2021 12:12:34 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 1E9F1746333; Sat, 23 Oct 2021 12:12:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 19BD77462D3;
 Sat, 23 Oct 2021 12:12:34 +0200 (CEST)
Date: Sat, 23 Oct 2021 12:12:34 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 15/33] target/ppc: Implement Vector Insert from GPR using
 GPR index insns
In-Reply-To: <0581a10f-1411-a174-5869-4fe0999132f3@linaro.org>
Message-ID: <e7c53321-91e8-54af-9c6a-8f894fdc49@eik.bme.hu>
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-16-matheus.ferst@eldorado.org.br>
 <0581a10f-1411-a174-5869-4fe0999132f3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lucas.castro@eldorado.org.br, qemu-devel@nongnu.org, groug@kaod.org,
 luis.pires@eldorado.org.br, qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 22 Oct 2021, Richard Henderson wrote:
> On 10/21/21 12:45 PM, matheus.ferst@eldorado.org.br wrote:
>> +#if defined(TARGET_PPC64)
>> +    return do_vinsx(ctx, a->vrt, size, right, cpu_gpr[a->vra], 
>> cpu_gpr[a->vrb],
>> +                    gen_helper);
>> +#else
>> +    bool ok;
>> +    TCGv_i64 val;
>> +
>> +    val = tcg_temp_new_i64();
>> +    tcg_gen_extu_tl_i64(val, cpu_gpr[a->vrb]);
>> +
>> +    ok = do_vinsx(ctx, a->vrt, size, right, cpu_gpr[a->vra], val, 
>> gen_helper);
>> +
>> +    tcg_temp_free_i64(val);
>> +    return ok;
>> +#endif
>
> Oh, and what's all this?
>
> Either this isn't defined for !PPC64 at all, or you should just use 
> target_ulong and not do any ifdeffing at all.

You mentioning target_ulong reminded me a question I had. Currently we 
have qemu-system-ppc and qemu-system-ppc64 but the latter includes all 
machines of the former too so you could run for example sam460ex with 
qemu-system-ppc64 (except mac99 which behaves differently based on which 
executable it's part of but you could use mac99 -cpu G4 with 
qemu-system-ppc64 as well). But isn't target_ulong different in these 
executables and could that cause a problem with this? I've always used 
qemu-system-ppc for 32 bit machines but we could have one just executable 
for all machines if there's no need for both.

Regards,
BALATON Zoltan

