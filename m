Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B143949B2EF
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 12:31:14 +0100 (CET)
Received: from localhost ([::1]:58908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCK2b-0003V0-C1
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 06:31:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nCJzL-0000ca-6s
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 06:27:52 -0500
Received: from 10.mo552.mail-out.ovh.net ([87.98.187.244]:54821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nCJzI-0001oD-Qu
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 06:27:50 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.33])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 9A950216FB;
 Tue, 25 Jan 2022 11:27:43 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 25 Jan
 2022 12:27:42 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002909bcf92-430b-4d05-9bcb-6aa17c564d31,
 B12793B896D1C92594B08C8AD2B724DCB3CD44CA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <5ae843bb-eb36-5ce8-4ba1-7cc7580c49a3@kaod.org>
Date: Tue, 25 Jan 2022 12:27:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 08/14] target/ppc: 405: System call exception cleanup
Content-Language: en-US
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Fabiano Rosas
 <farosas@linux.ibm.com>
References: <20220118184448.852996-1-farosas@linux.ibm.com>
 <20220118184448.852996-9-farosas@linux.ibm.com> <YeerEWyGu5j+Akeb@yekko>
 <7e2e4d56-4cdf-4f9f-65e4-359453ba20fb@kaod.org>
In-Reply-To: <7e2e4d56-4cdf-4f9f-65e4-359453ba20fb@kaod.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 05e2c173-a4e0-40f9-9777-cad8c662b1f1
X-Ovh-Tracer-Id: 16046043998229924646
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrvdelgddvjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuhffvfhgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeihfefffffgedtkeegtdekffevudeggfegffethfffhefhhfevhfdtudejhfdvieenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsggrlhgrthhonhesvghikhdrsghmvgdrhhhu
Received-SPF: pass client-ip=87.98.187.244; envelope-from=clg@kaod.org;
 helo=10.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/25/22 09:18, Cédric Le Goater wrote:
> On 1/19/22 07:09, David Gibson wrote:
>> On Tue, Jan 18, 2022 at 03:44:42PM -0300, Fabiano Rosas wrote:
>>> There's no sc 1.
>>
>> No... but what exactly should and will happen if you attempt to
>> execute an "sc 1" on 40x.  Will it be treated as an "sc 0", or will it
>> cause a 0x700?  If it's a 0x700, better double check that that is
>> generated at translation time, if you're removing the check on level
>> here.
> 
> A Program Interrupt with the illegal instruction error code should be
> generated at translation time but it is not the case today. It never
> was correctly implemented AFAICT :
> 
>    /* Top bit of opc2 corresponds with low bit of LEV, so use two handlers */
>    GEN_HANDLER(sc, 0x11, 0x11, 0xFF, 0x03FFF01D, PPC_FLOW),
>    GEN_HANDLER(sc, 0x11, 0x01, 0xFF, 0x03FFF01D, PPC_FLOW),
> 
> We would need a simple 'sc' instruction for the PPC405 and other
> processors. Let's add that to the TODO list.

The ref405ep machine now boots a mainline Linux with a buildroot user space.
Let's get this series merged first.

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

