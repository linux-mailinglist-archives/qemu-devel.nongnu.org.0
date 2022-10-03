Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 593B65F32F0
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 17:54:58 +0200 (CEST)
Received: from localhost ([::1]:37698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofNmS-0004Rh-4a
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 11:54:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1ofNdm-0007TD-D5; Mon, 03 Oct 2022 11:45:59 -0400
Received: from [200.168.210.66] (port=42785 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1ofNdk-0003RP-Iu; Mon, 03 Oct 2022 11:45:58 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 3 Oct 2022 12:45:54 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 355A18002C5;
 Mon,  3 Oct 2022 12:45:54 -0300 (-03)
Message-ID: <80a4c7b1-107b-58c8-77a6-49582ddf28e1@eldorado.org.br>
Date: Mon, 3 Oct 2022 12:45:54 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Subject: Re: [RFC PATCH v2 13/29] target/ppc: remove unused interrupts from
 p8_pending_interrupt
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org
References: <20220927201544.4088567-1-matheus.ferst@eldorado.org.br>
 <20220927201544.4088567-14-matheus.ferst@eldorado.org.br>
 <87a66kv51q.fsf@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <87a66kv51q.fsf@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 03 Oct 2022 15:45:54.0591 (UTC)
 FILETIME=[38F4D2F0:01D8D73F]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.467,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/09/2022 19:14, Fabiano Rosas wrote:
> Matheus Ferst <matheus.ferst@eldorado.org.br> writes:
> 
>> Remove the following unused interrupts from the POWER8 interrupt masking
>> method:
>> - PPC_INTERRUPT_RESET: only raised for 6xx, 7xx, 970, and POWER5p;
>> - Debug Interrupt: removed in Power ISA v2.07;
>> - Hypervisor Virtualization: introduced in Power ISA v3.0;
>> - Critical Input, Watchdog Timer, and Fixed Interval Timer: only defined
>>    for embedded CPUs;
>> - Hypervisor Doorbell, Doorbell, and Critical Doorbell: processor does
> 
> We still need the first two.
> 0xe80 - Directed hypervisor doorbell
> 0xa00 - Directed privileged doorbell
> 

It seems that on PowerISA v2.07, the category for msgsnd and msgclr 
became "Embedded Processor Control" or "Book S." That's certainly not 
what we are doing in code, both instructions are behind the PPC2_PRCNTL 
flag, so they are not available for -cpu POWER8. Also, we're not 
checking for ISA 3.00 on msgsync... I'll keep these interrupts in v3 and 
send a separate patch fixing the instruction flags.

Thanks,
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

