Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBBF4CF418
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 09:55:03 +0100 (CET)
Received: from localhost ([::1]:57202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR98v-00005G-OK
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 03:55:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nR97M-0007i2-Rf; Mon, 07 Mar 2022 03:53:24 -0500
Received: from [2001:41c9:1:41f::167] (port=60640
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nR97L-0000co-6J; Mon, 07 Mar 2022 03:53:24 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nR96a-0009ca-1Q; Mon, 07 Mar 2022 08:52:40 +0000
Message-ID: <656cfa88-c687-9f41-dced-d6a6dcc97404@ilande.co.uk>
Date: Mon, 7 Mar 2022 08:53:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220304175156.2012315-1-matheus.ferst@eldorado.org.br>
 <20220304175156.2012315-2-matheus.ferst@eldorado.org.br>
 <699c638f-9735-086b-b5a2-3dcedd393b64@kaod.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <699c638f-9735-086b-b5a2-3dcedd393b64@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 1/7] target/ppc: Fix vmul[eo]* instructions marked 2.07
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>, danielhb413@gmail.com,
 richard.henderson@linaro.org, groug@kaod.org,
 "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>,
 Howard Spoelstra <hsp.cat7@gmail.com>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/03/2022 06:36, Cédric Le Goater wrote:

> On 3/4/22 18:51, matheus.ferst@eldorado.org.br wrote:
>> From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
>>
>> Some ISA v2.03 Vector Multiply instructions marked to be ISA v2.07 only.
>> This patch fixes it.
> 
> and MacOSX 10 is also fixed.
> 
> There are of lot invalid writes when openbios is loaded :
> 
>    ...
>    Invalid write at addr 0xB70A8, size 4, region 'ppc_core99.bios', reason: rejected
>    Invalid write at addr 0xB70AC, size 4, region 'ppc_core99.bios', reason: rejected
>    Invalid write at addr 0xB70B0, size 4, region 'ppc_core99.bios', reason: rejected
>    Invalid write at addr 0xB70B4, size 4, region 'ppc_core99.bios', reason: rejected
>    ...
> 
> Mark,
> 
> shouldn't we model the FW region with RAM instead ?
> 
> @@ -162,7 +162,7 @@ static void ppc_core99_init(MachineState
>       memory_region_add_subregion(get_system_memory(), 0, machine->ram);
> 
>       /* allocate and load firmware ROM */
> -    memory_region_init_rom(bios, NULL, "ppc_core99.bios", PROM_SIZE,
> +    memory_region_init_ram(bios, NULL, "ppc_core99.bios", PROM_SIZE,
>                              &error_fatal);
>       memory_region_add_subregion(get_system_memory(), PROM_BASE, bios);
> 
> 
> Thanks,
> 
> C.

I don't believe so. The original aim of OpenBIOS was to run as a free replacement 
firmware on real hardware, so what should happen is that OpenBIOS should copy at 
least the bss section into RAM early in the startup process. There could well be 
errors in those calculations as I have tried to adjust them over time though.


ATB,

Mark.

