Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3F13C8969
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 19:10:39 +0200 (CEST)
Received: from localhost ([::1]:52772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3iP8-0007aO-UO
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 13:10:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1m3iJa-0006bJ-IH; Wed, 14 Jul 2021 13:04:54 -0400
Received: from [201.28.113.2] (port=28905 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1m3iJY-0000Ea-Bj; Wed, 14 Jul 2021 13:04:54 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 14 Jul 2021 14:04:46 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 650A28013FC;
 Wed, 14 Jul 2021 14:04:46 -0300 (-03)
Subject: Re: [PATCH v3 2/4] target/ppc: divided mmu_helper.c in 2 files
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210708164957.28096-1-lucas.araujo@eldorado.org.br>
 <20210708164957.28096-3-lucas.araujo@eldorado.org.br>
 <0f225dcb-5d25-a672-9da3-dc39dca70d8c@linaro.org>
 <592e6dc1-5c06-6d0c-d524-51c9af81a8e8@eldorado.org.br>
Message-ID: <d50b10a0-ab7a-6553-2b6e-5731c39401ce@eldorado.org.br>
Date: Wed, 14 Jul 2021 14:04:45 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <592e6dc1-5c06-6d0c-d524-51c9af81a8e8@eldorado.org.br>
Content-Type: multipart/alternative;
 boundary="------------9CD33331ACF20E645D0C1CD0"
Content-Language: en-US
X-OriginalArrivalTime: 14 Jul 2021 17:04:46.0798 (UTC)
 FILETIME=[5955CEE0:01D778D2]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) BAYES_20=-0.001, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: luis.pires@eldorado.org.br, fernando.valle@eldorado.org.br,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------9CD33331ACF20E645D0C1CD0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 14/07/2021 08:23, Lucas Mateus Martins Araujo e Castro wrote:
> On 08/07/2021 15:09, Richard Henderson wrote:
>
>> On 7/8/21 9:49 AM, Lucas Mateus Castro (alqotel) wrote:
>>> +++ b/target/ppc/cpu.h
>>> @@ -1327,6 +1327,26 @@ void store_40x_dbcr0(CPUPPCState *env,
>>> uint32_t val);
>>>   void store_40x_sler(CPUPPCState *env, uint32_t val);
>>>   void store_booke_tcr(CPUPPCState *env, target_ulong val);
>>>   void store_booke_tsr(CPUPPCState *env, target_ulong val);
>>> +typedef struct mmu_ctx_t mmu_ctx_t;
>>> +bool ppc_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType 
>>> access_type,
>>> +                      hwaddr *raddrp, int *psizep, int *protp,
>>> +                      int mmu_idx, bool guest_visible);
>>> +int ppcmas_tlb_check(CPUPPCState *env, ppcmas_tlb_t *tlb,
>>> +                            hwaddr *raddrp, target_ulong address,
>>> +                            uint32_t pid);
>>> +int ppcemb_tlb_check(CPUPPCState *env, ppcemb_tlb_t *tlb,
>>> +                            hwaddr *raddrp,
>>> +                            target_ulong address, uint32_t pid, int
>>> ext,
>>> +                            int i);
>>> +int get_physical_address_wtlb(CPUPPCState *env, mmu_ctx_t *ctx,
>>> +                                     target_ulong eaddr,
>>> +                                     MMUAccessType access_type, int
>>> type,
>>> +                                     int mmu_idx);
>>> +hwaddr booke206_tlb_to_page_size(CPUPPCState *env,
>>> +                                        ppcmas_tlb_t *tlb);
>>> +/* Software driven TLB helpers */
>>> +int ppc6xx_tlb_getnum(CPUPPCState *env, target_ulong eaddr,
>>> +                                    int way, int is_code);
>>
>> Why are any of these going into cpu.h?
>> Surely they are not used outside of target/ppc/.
> At first I divided between internal.h and cpu.h based on what I thought
> really shouldn't be used outside target/ppc, but looking back my logic
> was flawed since all of this was inside mmu_helper.c, so it was only
> visible inside mmu_helper.c, therefore none of it should be used outside
> target/ppc. I'll fix this in the next version.

Actually I spoke too soon, while most of these functions should just be 
moved to internal.h some functions are in cpu.h because they need some 
structures declared in cpu.h, more specifically ppcmas_tlb_t and 
ppcemb_tlb_t.

These functions are: ppcmas_tlb_check, ppcemb_tlb_check and 
booke206_tlb_to_page_size, from what I gather these functions should be 
in mmu_helper.c, but as they're still called in some 
_get_physical_address functions they're in mmu_common.c for now.

So for this patch is it better to leave this functions declaration in 
cpu.h or do something else?

>>
>>
>> r~
>
-- 
Lucas Mateus M. Araujo e Castro
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Estagiario
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------9CD33331ACF20E645D0C1CD0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 14/07/2021 08:23, Lucas Mateus
      Martins Araujo e Castro wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:592e6dc1-5c06-6d0c-d524-51c9af81a8e8@eldorado.org.br">On
      08/07/2021 15:09, Richard Henderson wrote:
      <br>
      <br>
      <blockquote type="cite">On 7/8/21 9:49 AM, Lucas Mateus Castro
        (alqotel) wrote:
        <br>
        <blockquote type="cite">+++ b/target/ppc/cpu.h
          <br>
          @@ -1327,6 +1327,26 @@ void store_40x_dbcr0(CPUPPCState *env,
          <br>
          uint32_t val);
          <br>
            void store_40x_sler(CPUPPCState *env, uint32_t val);
          <br>
            void store_booke_tcr(CPUPPCState *env, target_ulong val);
          <br>
            void store_booke_tsr(CPUPPCState *env, target_ulong val);
          <br>
          +typedef struct mmu_ctx_t mmu_ctx_t;
          <br>
          +bool ppc_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType
          access_type,
          <br>
          +                      hwaddr *raddrp, int *psizep, int
          *protp,
          <br>
          +                      int mmu_idx, bool guest_visible);
          <br>
          +int ppcmas_tlb_check(CPUPPCState *env, ppcmas_tlb_t *tlb,
          <br>
          +                            hwaddr *raddrp, target_ulong
          address,
          <br>
          +                            uint32_t pid);
          <br>
          +int ppcemb_tlb_check(CPUPPCState *env, ppcemb_tlb_t *tlb,
          <br>
          +                            hwaddr *raddrp,
          <br>
          +                            target_ulong address, uint32_t
          pid, int
          <br>
          ext,
          <br>
          +                            int i);
          <br>
          +int get_physical_address_wtlb(CPUPPCState *env, mmu_ctx_t
          *ctx,
          <br>
          +                                     target_ulong eaddr,
          <br>
          +                                     MMUAccessType
          access_type, int
          <br>
          type,
          <br>
          +                                     int mmu_idx);
          <br>
          +hwaddr booke206_tlb_to_page_size(CPUPPCState *env,
          <br>
          +                                        ppcmas_tlb_t *tlb);
          <br>
          +/* Software driven TLB helpers */
          <br>
          +int ppc6xx_tlb_getnum(CPUPPCState *env, target_ulong eaddr,
          <br>
          +                                    int way, int is_code);
          <br>
        </blockquote>
        <br>
        Why are any of these going into cpu.h?
        <br>
        Surely they are not used outside of target/ppc/.
        <br>
      </blockquote>
      At first I divided between internal.h and cpu.h based on what I
      thought
      <br>
      really shouldn't be used outside target/ppc, but looking back my
      logic
      <br>
      was flawed since all of this was inside mmu_helper.c, so it was
      only
      <br>
      visible inside mmu_helper.c, therefore none of it should be used
      outside
      <br>
      target/ppc. I'll fix this in the next version.
      <br>
    </blockquote>
    <p>Actually I spoke too soon, while most of these functions should
      just be moved to internal.h some functions are in cpu.h because
      they need some structures declared in cpu.h, more specifically
      ppcmas_tlb_t and ppcemb_tlb_t. <br>
    </p>
    <p>These functions are: ppcmas_tlb_check, ppcemb_tlb_check and
      booke206_tlb_to_page_size, from what I gather these functions
      should be in mmu_helper.c, but as they're still called in some
      _get_physical_address functions they're in mmu_common.c for now.</p>
    <p>So for this patch is it better to leave this functions
      declaration in cpu.h or do something else?<br>
    </p>
    <blockquote type="cite"
      cite="mid:592e6dc1-5c06-6d0c-d524-51c9af81a8e8@eldorado.org.br">
      <blockquote type="cite">
        <br>
        <br>
        r~
        <br>
      </blockquote>
      <br>
    </blockquote>
    <div class="moz-signature">-- <br>
      Lucas Mateus M. Araujo e Castro<br>
      <a
href="https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&amp;utm_medium=email&amp;utm_source=RD+Station">Instituto
        de Pesquisas ELDORADO</a><br>
      Departamento Computação Embarcada<br>
      Estagiario<br>
      <a href="https://www.eldorado.org.br/disclaimer.html">Aviso Legal
        - Disclaimer</a></div>
  </body>
</html>

--------------9CD33331ACF20E645D0C1CD0--

