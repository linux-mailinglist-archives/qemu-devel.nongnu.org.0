Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D75B438526
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 22:06:35 +0200 (CEST)
Received: from localhost ([::1]:33446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meNHl-0002FQ-Vo
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 16:06:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1meNE5-0007xp-1I; Sat, 23 Oct 2021 16:02:45 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:26996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1meNE0-0005nU-GT; Sat, 23 Oct 2021 16:02:44 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id F17317475FA;
 Sat, 23 Oct 2021 22:02:36 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id CE4D4746333; Sat, 23 Oct 2021 22:02:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id CBF707462D3;
 Sat, 23 Oct 2021 22:02:36 +0200 (CEST)
Date: Sat, 23 Oct 2021 22:02:36 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 15/33] target/ppc: Implement Vector Insert from GPR using
 GPR index insns
In-Reply-To: <f316ea9c-0876-9f80-5c56-210f65234fd1@linaro.org>
Message-ID: <b8d4a9ad-fd68-b37c-e9de-785d11d827d@eik.bme.hu>
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-16-matheus.ferst@eldorado.org.br>
 <0581a10f-1411-a174-5869-4fe0999132f3@linaro.org>
 <e7c53321-91e8-54af-9c6a-8f894fdc49@eik.bme.hu>
 <f316ea9c-0876-9f80-5c56-210f65234fd1@linaro.org>
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

On Sat, 23 Oct 2021, Richard Henderson wrote:
> On 10/23/21 3:12 AM, BALATON Zoltan wrote:
>> You mentioning target_ulong reminded me a question I had. Currently we have 
>> qemu-system-ppc and qemu-system-ppc64 but the latter includes all machines 
>> of the former too so you could run for example sam460ex with 
>> qemu-system-ppc64 (except mac99 which behaves differently based on which 
>> executable it's part of but you could use mac99 -cpu G4 with 
>> qemu-system-ppc64 as well). But isn't target_ulong different in these 
>> executables and could that cause a problem with this? I've always used 
>> qemu-system-ppc for 32 bit machines but we could have one just executable 
>> for all machines if there's no need for both.
>
> Yes, we can, and probably should, have one executable for all PPC system 
> emulation.  RISCV is actively working toward that, and I think it would be 
> fairly easy for ARM and x86 to follow.
>
> It's something relatively easy to do that reduces the size of the test 
> matrix.

So may question was not if it's possible but if having target_ulong 
different from what we had in qemu-system-ppc could cause any problems? I 
have no experience running 32-bit guests with qemu-system-ppc64 but 
previously when this came up one difference pointed out was that 
target_ulong would change if I remember the discussion correctly, but 
nobody now if that could be a problem.

Regards,
BALATON Zoltan

