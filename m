Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 135EB49ADE7
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 09:21:10 +0100 (CET)
Received: from localhost ([::1]:44918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCH4e-0003lx-OP
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 03:21:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nCGBA-0004lL-OC
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 02:24:14 -0500
Received: from 6.mo548.mail-out.ovh.net ([188.165.58.48]:45555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nCGB3-00028P-CS
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 02:23:48 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.177])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 9EA18209F9;
 Tue, 25 Jan 2022 07:23:38 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 25 Jan
 2022 08:23:37 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G00603781d82-ebe5-4c17-8df0-ee865e650621,
 81DEFC5675B4A2B0B4575F732D37872089199EF9) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <276179d2-8516-cda5-3c1a-879df5e769d9@kaod.org>
Date: Tue, 25 Jan 2022 08:23:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 11/14] target/ppc: 405: Data Storage exception cleanup
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>, Fabiano Rosas
 <farosas@linux.ibm.com>
References: <20220118184448.852996-1-farosas@linux.ibm.com>
 <20220118184448.852996-12-farosas@linux.ibm.com> <YeesC7891UZQS3v+@yekko>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <YeesC7891UZQS3v+@yekko>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 3de96d8f-1ad1-44f2-ba95-d2e64887766c
X-Ovh-Tracer-Id: 11923842966138489638
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrvdekgddutdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsggrlhgrthhonhesvghikhdrsghmvgdrhhhu
Received-SPF: pass client-ip=188.165.58.48; envelope-from=clg@kaod.org;
 helo=6.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On 1/19/22 07:13, David Gibson wrote:
> On Tue, Jan 18, 2022 at 03:44:45PM -0300, Fabiano Rosas wrote:
>> The 405 has no DSISR or DAR, so convert the trace entry to
>> trace_ppc_excp_print.
> 
> I think it would be preferable to show ESR and DEAR here, which are
> very loosely equivalent to DSISR and DAR on 40x.  Might want to create
> a new trace point explicitly for this so the terminology is clear as well.

I changed registers to ESR and DEAR and updated commit log.

Trace point changes can come later. Some have become a bit redundant
with CPU_LOG_INT.

Thanks,

C.


> 
>>
>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>> ---
>>   target/ppc/excp_helper.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>> index 84ec7e094a..e4e513322c 100644
>> --- a/target/ppc/excp_helper.c
>> +++ b/target/ppc/excp_helper.c
>> @@ -465,7 +465,7 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
>>           srr1 = SPR_40x_SRR3;
>>           break;
>>       case POWERPC_EXCP_DSI:       /* Data storage exception                   */
>> -        trace_ppc_excp_dsi(env->spr[SPR_DSISR], env->spr[SPR_DAR]);
>> +        trace_ppc_excp_print("DSI");
>>           break;
>>       case POWERPC_EXCP_ISI:       /* Instruction storage exception            */
>>           trace_ppc_excp_isi(msr, env->nip);
> 


