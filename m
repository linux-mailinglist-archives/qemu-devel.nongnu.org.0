Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A49A652ED3
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 10:47:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7vgl-0000eZ-3b; Wed, 21 Dec 2022 04:47:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1p7vgf-0000eC-H4; Wed, 21 Dec 2022 04:46:57 -0500
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1p7vgd-0001nc-KP; Wed, 21 Dec 2022 04:46:57 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.118])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 9D29A227D8;
 Wed, 21 Dec 2022 09:46:49 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Wed, 21 Dec
 2022 10:46:48 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005d4855720-8b16-4427-901a-c42b53fb0d65,
 78B451B26E434E63100236457A08FF51A4610C03) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <5f70da81-2854-766f-1804-59a037a605b8@kaod.org>
Date: Wed, 21 Dec 2022 10:46:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH-for-8.0 4/4] hw/ppc/spapr_ovec: Avoid target_ulong
 spapr_ovec_parse_vector()
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 <qemu-devel@nongnu.org>
CC: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 <qemu-ppc@nongnu.org>, David Gibson <david@gibson.dropbear.id.au>,
 <kvm@vger.kernel.org>, Alexey Kardashevskiy <aik@ozlabs.ru>, Greg Kurz
 <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster
 <armbru@redhat.com>
References: <20221213123550.39302-1-philmd@linaro.org>
 <20221213123550.39302-5-philmd@linaro.org>
 <c871b044-4241-2f02-ebd6-6b797663a140@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <c871b044-4241-2f02-ebd6-6b797663a140@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: a29dbd1d-b91e-4753-9a1d-58263a462809
X-Ovh-Tracer-Id: 15422858400342510581
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrgeekgddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhmpdhphhhilhhmugeslhhinhgrrhhordhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdgrlhgvgidrsggvnhhnvggvsehlihhnrghrohdrohhrghdpqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrghdpuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruhdpkhhvmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprghikhesohiilhgrsghsrdhruhdpphgsohhniihinhhisehrvgguhhgrth
 drtghomhdprghrmhgsrhhusehrvgguhhgrthdrtghomhdpghhrohhugheskhgrohgurdhorhhgpdfovfetjfhoshhtpehmohehgeekpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.161,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/16/22 17:47, Daniel Henrique Barboza wrote:
> 
> 
> On 12/13/22 09:35, Philippe Mathieu-Daudé wrote:
>> spapr_ovec.c is a device, but it uses target_ulong which is
>> target specific. The hwaddr type (declared in "exec/hwaddr.h")
>> better fits hardware addresses.
> 
> As said by Harsh, spapr_ovec is in fact a data structure that stores platform
> options that are supported by the guest.
> 
> That doesn't mean that I oppose the change made here. Aside from semantics - which
> I also don't have a strong opinion about it - I don't believe it matters that
> much - spapr is 64 bit only, so hwaddr will always be == target_ulong.
> 
> Cedric/David/Greg, let me know if you have any restriction/thoughts about this.
> I'm inclined to accept it as is.

Well, I am not sure.

The vector table variable is the result of a ppc64_phys_to_real() conversion
of the CAS hcall parameter, which is a target_ulong, but ppc64_phys_to_real()
returns a uint64_t.

The code is not consistent in another places :

   hw/ppc/spapr_tpm_proxy.c uses a uint64_t
   hw/ppc/spapr_hcall.c, a target_ulong
   hw/ppc/spapr_rtas.c, a hwaddr
   hw/ppc/spapr_drc.c, a hwaddr indirectly

Should we change ppc64_phys_to_real() to return an hwaddr (also) ?

C.


> 
> 
> Daniel
> 
>>
>> Change spapr_ovec_parse_vector() to take a hwaddr argument,
>> allowing the removal of "cpu.h" in a device header.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/ppc/spapr_ovec.c         | 3 ++-
>>   include/hw/ppc/spapr_ovec.h | 4 ++--
>>   2 files changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/ppc/spapr_ovec.c b/hw/ppc/spapr_ovec.c
>> index b2567caa5c..a18a751b57 100644
>> --- a/hw/ppc/spapr_ovec.c
>> +++ b/hw/ppc/spapr_ovec.c
>> @@ -19,6 +19,7 @@
>>   #include "qemu/error-report.h"
>>   #include "trace.h"
>>   #include <libfdt.h>
>> +#include "cpu.h"
>>   #define OV_MAXBYTES 256 /* not including length byte */
>>   #define OV_MAXBITS (OV_MAXBYTES * BITS_PER_BYTE)
>> @@ -176,7 +177,7 @@ static target_ulong vector_addr(target_ulong table_addr, int vector)
>>       return table_addr;
>>   }
>> -SpaprOptionVector *spapr_ovec_parse_vector(target_ulong table_addr, int vector)
>> +SpaprOptionVector *spapr_ovec_parse_vector(hwaddr table_addr, int vector)
>>   {
>>       SpaprOptionVector *ov;
>>       target_ulong addr;
>> diff --git a/include/hw/ppc/spapr_ovec.h b/include/hw/ppc/spapr_ovec.h
>> index c3e8b98e7e..d756b916e4 100644
>> --- a/include/hw/ppc/spapr_ovec.h
>> +++ b/include/hw/ppc/spapr_ovec.h
>> @@ -37,7 +37,7 @@
>>   #ifndef SPAPR_OVEC_H
>>   #define SPAPR_OVEC_H
>> -#include "cpu.h"
>> +#include "exec/hwaddr.h"
>>   typedef struct SpaprOptionVector SpaprOptionVector;
>> @@ -73,7 +73,7 @@ void spapr_ovec_set(SpaprOptionVector *ov, long bitnr);
>>   void spapr_ovec_clear(SpaprOptionVector *ov, long bitnr);
>>   bool spapr_ovec_test(SpaprOptionVector *ov, long bitnr);
>>   bool spapr_ovec_empty(SpaprOptionVector *ov);
>> -SpaprOptionVector *spapr_ovec_parse_vector(target_ulong table_addr, int vector);
>> +SpaprOptionVector *spapr_ovec_parse_vector(hwaddr table_addr, int vector);
>>   int spapr_dt_ovec(void *fdt, int fdt_offset,
>>                     SpaprOptionVector *ov, const char *name);


