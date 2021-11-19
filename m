Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC2B456C55
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 10:28:20 +0100 (CET)
Received: from localhost ([::1]:52712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo0Bv-0003b1-TB
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 04:28:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mo08d-0000lj-IL
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:24:55 -0500
Received: from 6.mo548.mail-out.ovh.net ([188.165.58.48]:54969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mo08b-0006nL-N5
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:24:55 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.12])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 5AFEA20BD7;
 Fri, 19 Nov 2021 09:24:49 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 19 Nov
 2021 10:24:48 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R00161baa7df-8ed0-4b33-8b9d-d0a411705ef3,
 2F4386EB293C90CC9D88C9369DD2F5B0E238D1DC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <2e1e6486-87e9-fade-e443-2e822377f927@kaod.org>
Date: Fri, 19 Nov 2021 10:24:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/3] target/ppc: Fixed call to deferred exception
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, "Lucas Mateus Castro
 (alqotel)" <lucas.araujo@eldorado.org.br>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
References: <20211118132502.984059-1-lucas.araujo@eldorado.org.br>
 <20211118132502.984059-2-lucas.araujo@eldorado.org.br>
 <5e723955-68fc-a77c-b131-ca9e29f23423@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <5e723955-68fc-a77c-b131-ca9e29f23423@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 61571ec5-55f0-4ebc-8eb4-9b6e4a6f0f44
X-Ovh-Tracer-Id: 7881580825488427823
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrfeekgddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepmhgrthhhvghushdrfhgvrhhsthesvghlughorhgrughordhorhhgrdgsrh
Received-SPF: pass client-ip=188.165.58.48; envelope-from=clg@kaod.org;
 helo=6.mo548.mail-out.ovh.net
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.727,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: matheus.ferst@eldorado.org.br, danielhb413@gmail.com,
 mark.cave-ayland@ilande.co.uk, pc@us.ibm.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/21 10:18, Richard Henderson wrote:
> On 11/18/21 2:25 PM, Lucas Mateus Castro (alqotel) wrote:
>> +    if ((fpscr & FP_VXSOFT) && (fpscr_ve != 0)) {
>> +        error = POWERPC_EXCP_FP_VXSOFT;
>> +    } else if ((fpscr & FP_OX) && (fpscr & FP_OE)) {
>> +        error = POWERPC_EXCP_FP_OX;
>> +    } else if ((fpscr & FP_UX) && (fpscr & FP_UE)) {
>> +        error = POWERPC_EXCP_FP_UX;
>> +    } else if ((fpscr & FP_XX) && (fpscr & FP_XE)) {
>> +        error = POWERPC_EXCP_FP_XX;
>> +    } else if ((fpscr & FP_ZX) && (fpscr & FP_ZE)) {
>> +        error = POWERPC_EXCP_FP_ZX;
>> +    } else if ((fpscr & FP_VXSNAN) && (fpscr_ve != 0)) {
>> +        error = POWERPC_EXCP_FP_VXSNAN;
>> +    } else if ((fpscr & FP_VXISI) && (fpscr_ve != 0)) {
>> +        error = POWERPC_EXCP_FP_VXISI;
>> +    } else if ((fpscr & FP_VXIDI) && (fpscr_ve != 0)) {
>> +        error = POWERPC_EXCP_FP_VXIDI;
>> +    } else if ((fpscr & FP_VXZDZ) && (fpscr_ve != 0)) {
>> +        error = POWERPC_EXCP_FP_VXZDZ;
>> +    } else if ((fpscr & FP_VXIMZ) && (fpscr_ve != 0)) {
>> +        error = POWERPC_EXCP_FP_VXIMZ;
>> +    } else if ((fpscr & FP_VXVC) && (fpscr_ve != 0)) {
>> +        error = POWERPC_EXCP_FP_VXVC;
>> +    }
> 
> Is there a defined order for these in the manual?  I couldn't find it quickly if so.  If there is no defined order, I think you should test VE only once.
> 
> Drop the use of fpscr_ve and use fpscr & FP_VE instead. (I think these hidden uses of *env are evil and should be banished, but that's a bit of a job.)

you mean all the msr_* macros ? I agree. It's huge and I wonder how we could automate parts of it.

Thanks,

C.
  
> 
> You could say
> 
>      } else {
>          return;
>      }
> 
>> +
>> +    if (error) {
> 
> and then remove this test.
> 
> The rest of it looks good.
> 
> 
> r~


