Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C584E37041E
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 01:33:52 +0200 (CEST)
Received: from localhost ([::1]:43088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lccdr-0006ra-6L
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 19:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lccZn-00064C-M4; Fri, 30 Apr 2021 19:29:39 -0400
Received: from [201.28.113.2] (port=38737 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lccZl-00022a-Tp; Fri, 30 Apr 2021 19:29:39 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 30 Apr 2021 20:29:33 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 6C0878013C2;
 Fri, 30 Apr 2021 20:29:33 -0300 (-03)
Subject: Re: [PATCH v3 25/30] target/ppc: Move ADDI, ADDIS to decodetree,
 implement PADDI
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
 <20210430011543.1017113-26-richard.henderson@linaro.org>
 <0ed61faa-327c-68a9-d449-541a6a9f3224@eldorado.org.br>
 <b1c975ec-d698-e055-3166-68f8bdf4fbee@linaro.org>
 <34531538-03a7-1fd7-c80b-439a2822e0be@eldorado.org.br>
 <84b07c09-4245-58d6-0761-8c0928ff51b8@linaro.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <7b81c95b-e661-68be-dd55-224882182038@eldorado.org.br>
Date: Fri, 30 Apr 2021 20:29:33 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <84b07c09-4245-58d6-0761-8c0928ff51b8@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 30 Apr 2021 23:29:33.0881 (UTC)
 FILETIME=[AD53DA90:01D73E18]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: f4bug@amsat.org, luis.pires@eldorado.org.br, qemu-ppc@nongnu.org,
 lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/04/2021 15:43, Richard Henderson wrote:
> On 4/30/21 11:02 AM, Matheus K. Ferst wrote:
>>> But in this case ADDI probably doesn't use PLS_D.  You could use
>>> 
>>> static bool trans_PADDI(DisasContext *ctx, arg_PLS_D *a) { arg_D 
>>> d; if (!resolve_PLS_D(ctx, &d, a)) { return false; } return 
>>> trans_ADDI(ctx, &d); }
>>> 
>>> making sure to use int64_t in the offset for arg_D.
>>> 
>> 
>> We'd keep trans_ADDI with the same signature to avoid creating an 
>> arg_D on the stack. Patch 4 added type specification, maybe we can 
>> define an arg_D within arg_PLD_D? I'll play a bit to see if it 
>> works.
> 
> That starts to creep, with e.g. ADDIS now requiring arg_PLD_D. You'll
> want to audit the other D-form insns to see what other special cases
> there are.
> 
> r~

Well, anything that shares implementation with a prefixed instruction
would use the prefixed arg.

I got arg_D within arg_PLD_D using !function and calling
decode_insn32_extract_D. A bit on the ugly side, and probably not
worth the effort. Maybe changing decodetree would help, but that's 
another patch, for another series.

Anyway, my compiler (GCC 9.3) is inlining trans_ADDI calls with -O3, so 
I'd say that your trans_PADDI from the previous message, with trans_ADDI 
and trans_ADDIS using arg_D, would be the cleaner solution.

Thanks,
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software Júnior
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

