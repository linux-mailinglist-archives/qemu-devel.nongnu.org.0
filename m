Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCB46064C5
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 17:38:34 +0200 (CEST)
Received: from localhost ([::1]:50316 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXcu-0005bc-AH
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:38:32 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXTo-0003eZ-Ax
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:29:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1olVmM-0002h0-SV; Thu, 20 Oct 2022 09:40:11 -0400
Received: from [200.168.210.66] (port=37264 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1olVmI-0007sL-VV; Thu, 20 Oct 2022 09:40:09 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 20 Oct 2022 10:40:02 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id F41568000CB;
 Thu, 20 Oct 2022 10:40:01 -0300 (-03)
Message-ID: <d47b8750-02d8-ed94-78d6-4fcbd7b92c56@eldorado.org.br>
Date: Thu, 20 Oct 2022 10:40:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 00/29] PowerPC interrupt rework
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 fbarrat@linux.ibm.com, alex.bennee@linaro.org, farosas@linux.ibm.com
References: <20221011204829.1641124-1-matheus.ferst@eldorado.org.br>
 <56d9bc9d-65ac-05a5-d35b-4d64766687a4@gmail.com>
 <3cf56329-4513-d983-88da-4265a1d5f677@gmail.com>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
In-Reply-To: <3cf56329-4513-d983-88da-4265a1d5f677@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 20 Oct 2022 13:40:02.0430 (UTC)
 FILETIME=[748A41E0:01D8E489]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/10/2022 08:18, Daniel Henrique Barboza wrote:
> On 10/19/22 18:55, Daniel Henrique Barboza wrote:
>> Matheus,
>>
>> This series fails 'make check-avocado' in an e500 test. This is the 
>> error output:
> 
> Scrap that.
> 
> This avocado test is also failing on master 10% of the time, give or take.
> It might be case that patch 27 makes the failure more consistent, but I 
> can't
> say it's the culprit.
> 
> 
> I'll take a closer look and see if I can diagnose one particular commit 
> that
> is making the patch fail 1 out of 10 times. It can be case where I might 
> need
> to skip the test altogether.
> 

Nice catch. I guess we need a gen_icount_io_start before calling 
helper_ppc_maybe_interrupt, so maybe it's better to make a 
gen_ppc_maybe_interrupt that calls icount and the helper. I'll give it a 
bit more testing and re-spin the series.

Thanks,
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>


