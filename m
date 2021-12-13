Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 520584735B6
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 21:19:01 +0100 (CET)
Received: from localhost ([::1]:56670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwrml-00061r-T3
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 15:18:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mwrkY-0004L7-FN; Mon, 13 Dec 2021 15:16:42 -0500
Received: from [201.28.113.2] (port=62557 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mwrkW-000685-G7; Mon, 13 Dec 2021 15:16:42 -0500
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 13 Dec 2021 17:15:35 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 0BF28800A5A;
 Mon, 13 Dec 2021 17:15:35 -0300 (-03)
Subject: Re: [RFC PATCH] target/ppc: do not silence snan in xscvspdpn
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20211213121320.947362-1-matheus.ferst@eldorado.org.br>
 <ecdb8bb3-30b1-ef61-ada6-6389ce2c4318@linaro.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <14eec056-bfc8-7031-f373-65c4f7d7ce48@eldorado.org.br>
Date: Mon, 13 Dec 2021 17:15:34 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <ecdb8bb3-30b1-ef61-ada6-6389ce2c4318@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 13 Dec 2021 20:15:35.0294 (UTC)
 FILETIME=[2FF5A9E0:01D7F05E]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.093,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, danielhb413@gmail.com, groug@kaod.org,
 clg@kaod.org, alex.bennee@linaro.org, aurelien@aurel32.net,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/12/2021 12:46, Richard Henderson wrote:
> On 12/13/21 4:13 AM, matheus.ferst@eldorado.org.br wrote:
>> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>
>> The non-signalling versions of VSX scalar convert to shorter/longer
>> precision insns doesn't silence SNaNs in the hardware. We are currently
>> honoring this behavior in xscvdpspn, since helper_xscvdpspn handles the
>> conversion with extracts/deposits/etc. OTOH, xscvspdpn uses
>> float32_to_float64 that calls parts_float_to_float, which uses
>> parts_return_nan that finally calls parts_silence_nan if the input is an
>> SNaN.
>>
>> To address this problem, this patch adds a new float_status flag
>> (return_snan) to avoid the call to parts_silence_nan in the
>> float_class_snan case of parts_return_nan.
>>
>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> I think you shouldn't be using softfloat at all for this, but use the 
> existing
> helper_todouble function.
> 

Oh, that's better, I'll send a v2.

Thanks,
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

