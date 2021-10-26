Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE7843B46E
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 16:38:55 +0200 (CEST)
Received: from localhost ([::1]:46522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfNbK-0005AN-7j
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 10:38:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mfNX1-0000l3-ML; Tue, 26 Oct 2021 10:34:27 -0400
Received: from [201.28.113.2] (port=6421 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mfNWz-00038m-DJ; Tue, 26 Oct 2021 10:34:27 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 26 Oct 2021 11:33:16 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 435BE80012A;
 Tue, 26 Oct 2021 11:33:16 -0300 (-03)
Subject: Re: [PATCH 16/33] target/ppc: Implement Vector Insert Word from GPR
 using Immediate insns
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-17-matheus.ferst@eldorado.org.br>
 <4a9f95b2-3f9e-f835-0315-7632a5e6996a@linaro.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <2f6cca6e-6a3e-7341-7d92-4b1b4708ee1e@eldorado.org.br>
Date: Tue, 26 Oct 2021 11:33:16 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <4a9f95b2-3f9e-f835-0315-7632a5e6996a@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 26 Oct 2021 14:33:16.0703 (UTC)
 FILETIME=[6A2D62F0:01D7CA76]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_20=-0.001, NICE_REPLY_A=-0.215,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: lucas.castro@eldorado.org.br, luis.pires@eldorado.org.br, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/10/2021 01:42, Richard Henderson wrote:
> [E-MAIL EXTERNO] Não clique em links ou abra anexos, a menos que você 
> possa confirmar o remetente e saber que o conteúdo é seguro. Em caso de 
> e-mail suspeito entre imediatamente em contato com o DTI.
> 
> On 10/21/21 12:45 PM, matheus.ferst@eldorado.org.br wrote:
>> +static bool do_vins_VX_uim4(DisasContext *ctx, arg_VX_uim4 *a, int size,
>> +                        void (*gen_helper)(TCGv_ptr, TCGv_ptr, 
>> TCGv_i64, TCGv))
>> +{
>> +    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
>> +    REQUIRE_VECTOR(ctx);
>> +
>> +    if (a->uim > (16 - size)) {
>> +        qemu_log_mask(LOG_GUEST_ERROR, "Invalid index for VINS* at"
>> +            " 0x" TARGET_FMT_lx ", UIM = %d > %d\n", ctx->cia, a->uim,
>> +            16 - size);
>> +        return true;
>> +    }
> 
> Does this really do nothing on real hw?

We don't have access to the real hardware yet, so our reference is the 
POWER10 Functional Simulator (Mambo). Maybe someone from IBM can run a 
test for us, but Mambo usually does the right thing, especially in 
"simple mode."

> I know the manual says undefined, but I would have expected SIGILL.

It says that "if UIM is greater than N, the result is undefined." My 
first read was also that the outcome is "boundedly undefined," but I 
guess it can be understood as "the resulting value in VRT will be 
undefined" (like when the pseudo-code uses "VRT <- 0xUUUU_..._UUUU"), in 
which case this patch and Mambo are correct.

-- 
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

