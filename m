Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DBE495F4B
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 13:53:12 +0100 (CET)
Received: from localhost ([::1]:35920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAtPj-0002uD-9l
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 07:53:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nAsqx-0005aX-So
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 07:17:16 -0500
Received: from 3.mo548.mail-out.ovh.net ([188.165.32.156]:47963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nAsqn-0000Kj-Nd
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 07:17:08 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.128])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id C57FF21124;
 Fri, 21 Jan 2022 12:17:02 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 21 Jan
 2022 13:17:01 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002526d7bb0-542f-41ca-9619-357314d77049,
 0868046A3D5FFD4A19DAA1F3199B5438DDC438D4) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <a05a8a93-3d82-2703-f509-c0e047e6b00d@kaod.org>
Date: Fri, 21 Jan 2022 13:17:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Help with ppc e500 tlb usage
Content-Language: en-US
To: Jesse Millwood <jmillwood@masten.aero>
References: <PH1P110MB12849EB7B10C757A6B9FEA4FB0589@PH1P110MB1284.NAMP110.PROD.OUTLOOK.COM>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <PH1P110MB12849EB7B10C757A6B9FEA4FB0589@PH1P110MB1284.NAMP110.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 3eb9dff0-fe14-48db-9f22-3eaf0769f124
X-Ovh-Tracer-Id: 11834896872441285539
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrvddtgdefkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeekfeehfedvfeehgfejleevkeehieelheduveekfedvhfelteeivdfftddukeenucffohhmrghinhepghhithhlrggsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegughhisghsohhnsehrvgguhhgrthdrtghomh
Received-SPF: pass client-ip=188.165.32.156; envelope-from=clg@kaod.org;
 helo=3.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: David Gibson <dgibson@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Jesse,

( For some reason, your email never reached my mailbox. In the future,
   could please also Cc: qemu-devel@nongnu.org. )

On 1/18/22 20:40, Jesse Millwood wrote:
> Hello,
> 
> I'm trying to get the e500 to set the initial tlb entry to mirror what the platform expects. I have made some changes that seem to follow the e500 Core Reference Manual better, but they do not seem to work at runtime. I am wondering if someone can point me to where the tlb is actually used to reserve memory.
> 
> Currently, the page size is set relative to the device tree size from the boot info[0]. However, different platforms that use the e500 have different default settings.
> 
> I have added a new field to the PPCE500MachineClass and the CPUPPCState, allowing the platform author to set the initial_tlb_size_kib from the platform's machine class init function. The value then can be accessed in the booke206_initial_map_tsize function that sets returns the page size for the TSIZE field of the MAS1 register. I have kept the original functionality in case the platform doesn't set the field. My new method for computing the TSIZE field from a requested page size takes advantage of the page size being defined as 4^TSIZE KiB and being equal to 2^(2*TSIZE) KiB. So with the page size requested, you can find the bit index that is set with clz64 and then divide by 2. This will give the bit field as defined in the e500 core reference manual.

A new MMU V2 was architected when e5500 was introduced and the TSIZE field
was extended (addition of bit 56) for v2 :

(MMU V1)
52–55 TSIZE Translation size. Defines the page size of the TLB
       	    entry. For TLB arrays that contain fixed-sized TLB
       	    entries, TSIZE is ignored. For variable page-size TLB
       	    arrays, the page size is 4 TSIZE Kbytes.  TSIZE must be
       	    between TLBnCFG[MINSIZE] and TLBnCFG[MAXSIZE]. Valid TSIZE
       	    values for TLB page sizes are described in Section
       	    7.5.3.2, “TLB Entry Page Size.”

(MMU V2)
52–56 TSIZE Translation size. Defines the page size of the TLB
       	    entry. (or the LRAT entry <E.HV.LRAT>) For TLB arrays that
       	    contain fixed-sized TLB entries, TSIZE is ignored. For
       	    variable page-size TLB arrays, the page size is 2 TSIZE
       	    Kbytes. Bit 63 - TSIZE of TLBnPS (or LRATPS <E.HV.LRAT>)
       	    is set if the page size is allowed for the given TLB array
       	    n (or the LRAT <E.HV.LRAT>). Valid TSIZE values for TLB
       	    (or LRAT <E.HV.LRAT>) page sizes are described in Section
       	    7.5.3.2, “TLB Entry Page Size.”
	
The e500 only supports the following page sizes:

	    0b0001 4KB
	    0b0010 16KB
	    0b0011 64KB
	    0b0100 256KB
	    0b1011 4GB
	    0b0101 1MB
	    0b0110 4MB
	    0b0111 16MB
	    0b1000 64MB
	    0b1001 256MB
	    0b1010 1GB

and MMU v2 as found on some e5500 and e6500, these :

	    0b00010 4KB
	    0b00011 8KB
	    0b00100 16KB
	    0b00101 32KB
	    0b00110 64KB
	    0b00111 128KB
	    0b01000 256KB
	    0b01001 512KB
	    0b01010 1MB
	    0b01011 2MB
	    0b01100 4MB
	    0b01101 8MB
	    0b01110 16MB
	    0b01111 32MB
	    0b10000 64MB
	    0b10001 128MB
	    0b10010 256MB
	    0b10011 512MB
	    0b10100 1GB
	    0b10101 2GB

but the values are compatible for both TSIZE field definitions.

Thanks,

C.


> Using my method of setting the TSIZE bits in booke206_initial_map_tsize, mmubooke_create_initial_mapping shifts the returned value and uses it to set the initial MAS1 register.
> 
> I found one other issue that doesn't match up with the e500 Core Reference Manual [1]:
> 
> The shift for the TSIZE is off by 1 [2]. The TSIZE field is bits 52-55 with a reserved field taking up 56-63. The reserved space should be 8 bits not 7.
> 
> My issue comes at runtime. If I compile qemu with my changes and tell it to have a 4GiB initial tlb map size, the monitor command "info tlb" only reports a 2MiB entry. This also makes it so my binary can't run because the window isn't big enough.
>
> I can see that the tlb mas regsiters get set in the mmubooke_create_initial_mapping[3] but I am having trouble finding where that tlb struct is used afterwards. If anyone has any pointers, I'd appreciate it.
>
> I have attached my patches in case anyone is interested in what I've done.
>
> 
> Thanks,
> Jesse
> 
> 0: https://gitlab.com/qemu-project/qemu/-/blob/master/hw/ppc/e500.c#L662
> 1: E500 CORE REFERENCE MANUAL: 2.12.5.2 MAS Register 1 (MAS1) (also attached)
> 2: https://gitlab.com/qemu-project/qemu/-/blob/master/target/ppc/cpu.h#L847
> 3: https://gitlab.com/qemu-project/qemu/-/blob/master/hw/ppc/e500.c#L687
> 
>  From 899aa05a05d4b0598c2637e08c31167e61c8db32 Mon Sep 17 00:00:00 2001
> From: Jesse Millwood <jmillwood@masten.aero>
> Date: Tue, 18 Jan 2022 11:44:20 -0500
> Subject: [PATCH 1/4] e500: Fix TSIZE shift constant
> 
> ---
>   target/ppc/cpu.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index f20d4ffa6d..ecf0279d08 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -844,7 +844,7 @@ enum {
>   #define MAS0_ATSEL_TLB     0
>   #define MAS0_ATSEL_LRAT    MAS0_ATSEL
>   
> -#define MAS1_TSIZE_SHIFT   7
> +#define MAS1_TSIZE_SHIFT   8
>   #define MAS1_TSIZE_MASK    (0x1f << MAS1_TSIZE_SHIFT)
>   
>   #define MAS1_TS_SHIFT      12
> 

