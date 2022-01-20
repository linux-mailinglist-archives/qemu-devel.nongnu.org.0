Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9B949560F
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 22:44:08 +0100 (CET)
Received: from localhost ([::1]:48610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAfDz-0003Oq-97
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 16:44:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nAaEC-0005oz-MX
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 11:24:00 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:54647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nAaE9-0006Ht-1g
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 11:24:00 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.243])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id E3436D900807;
 Thu, 20 Jan 2022 17:23:43 +0100 (CET)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 20 Jan
 2022 17:23:43 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003f763d311-29b0-4f27-9441-f3d828c0b985,
 55E834D54A8FC5F4505B49AAC2A2F9003410B5FE) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <f0269159-323d-96c7-dfd3-ee64770e4f4d@kaod.org>
Date: Thu, 20 Jan 2022 17:23:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 13/14] target/ppc: 405: Program exception cleanup
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, David Gibson
 <david@gibson.dropbear.id.au>
References: <20220118184448.852996-1-farosas@linux.ibm.com>
 <20220118184448.852996-14-farosas@linux.ibm.com> <YeesfOoE9OYXBgUx@yekko>
 <87fspjx4vi.fsf@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <87fspjx4vi.fsf@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 966d1b45-3aa0-4085-bd7b-4f30a22a701f
X-Ovh-Tracer-Id: 10128314090253617958
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudekgdekhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhhfelgeeukedtteffvdffueeiuefgkeekleehleetfedtgfetffefheeugeelheenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/19/22 13:54, Fabiano Rosas wrote:
> David Gibson <david@gibson.dropbear.id.au> writes:
> 
>> On Tue, Jan 18, 2022 at 03:44:47PM -0300, Fabiano Rosas wrote:
>>> The 405 Program Interrupt does not set SRR1 with any diagnostic bits,
>>> just a clean copy of the MSR.
>>>
>>> We're using the BookE Exception Syndrome Register which is different
>>> from the 405.
>>
>> Hrm.  We really do want to set the 40x ESR bits here, though.
> 
> Well I wrote the code and nothing changed so I dropped it. Not sure if
> we are even raising these properly in the translation code. I'll take
> another look.
> 

For instance, this ESR bit allows Linux to handle traps correctly in
some cases, like when CONFIG_DEBUG_VM=y :

@@ -488,7 +488,9 @@ static void powerpc_excp_40x(PowerPCCPU
              trace_ppc_excp_inval(env->nip);
              break;
          case POWERPC_EXCP_PRIV:
+            break;
          case POWERPC_EXCP_TRAP:
+            env->spr[SPR_40x_ESR] = ESR_PTR;
              break;
          default:
              cpu_abort(cs, "Invalid program exception %d. Aborting\n",


These could be reported to Linux :

/* On 4xx, the reason for the machine check or program exception
    is in the ESR. */
#define get_reason(regs)	((regs)->esr)
#define REASON_FP		ESR_FP
#define REASON_ILLEGAL		(ESR_PIL | ESR_PUO)
#define REASON_PRIVILEGED	ESR_PPR
#define REASON_TRAP		ESR_PTR
#define REASON_PREFIXED		0
#define REASON_BOUNDARY		0


Thanks,

C.


