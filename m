Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BCC45EE49
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 13:50:24 +0100 (CET)
Received: from localhost ([::1]:52392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqagG-0006ur-Gr
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 07:50:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mqaZr-0001ob-CX; Fri, 26 Nov 2021 07:43:46 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:55890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mqaZn-0007rH-Lg; Fri, 26 Nov 2021 07:43:43 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AQBkKmZ007474; 
 Fri, 26 Nov 2021 12:43:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=oLlCqiROqTklqWhSBHvphY3dbI1lP8IoD9bAgczuE3k=;
 b=q6YirBnrdLFEWXUSL+BcUBfTaU/g1hjl5VtM/lMAS2/fgdc22JS38NPFAQN8fpCmtrWy
 dT1W9LlGiAVflbkMjtk5pWvx+K2+zQU+wilK1CLBbbhRlytCvZUAwJZ6278a2kHqE8A2
 zKMs7/A3whOwURXDgXvEDPZlFXa53jP4J2/oj1t4lOlm2+W8yilCNotCfyC2ZzZnTDXt
 Ym3hbZ3jQy1/irBtnuCgwKK8V+UYWWx8txs/EbQq+JnAu+yr4vyjcwEOJSwNab2IcNfK
 9s9mTyaH7zbjq9Kld2tn2FuIGLYy0FYp63M0ngngIxn5M0wjY/aJA+8xXCMpib+572OH 7g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cjy0j94d1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Nov 2021 12:43:20 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AQCgBcb013640;
 Fri, 26 Nov 2021 12:43:19 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cjy0j94cr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Nov 2021 12:43:19 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AQChAs0000914;
 Fri, 26 Nov 2021 12:43:18 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04wdc.us.ibm.com with ESMTP id 3cerncsmqb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Nov 2021 12:43:18 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AQChHkO59834676
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Nov 2021 12:43:17 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 957DBC6055;
 Fri, 26 Nov 2021 12:43:17 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4152C6059;
 Fri, 26 Nov 2021 12:43:16 +0000 (GMT)
Received: from localhost (unknown [9.211.89.149])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri, 26 Nov 2021 12:43:16 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [RFC PATCH 0/2] QEMU/openbios: PPC Software TLB support in the
 G4 family
In-Reply-To: <48c4262-ff7d-2897-9764-cadd98683e97@eik.bme.hu>
References: <20211119134431.406753-1-farosas@linux.ibm.com>
 <87pmqpqknn.fsf@linux.ibm.com>
 <48c4262-ff7d-2897-9764-cadd98683e97@eik.bme.hu>
Date: Fri, 26 Nov 2021 09:43:14 -0300
Message-ID: <87fsrjqe8t.fsf@linux.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 18zO-C6SoftrJm_G-Kcc77UrWMcaJf00
X-Proofpoint-ORIG-GUID: 3cVx56YP9kU9exJ-mWSzdR0zdPK_yPDg
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-26_03,2021-11-25_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111260074
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 clg@kaod.org, openbios@openbios.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

BALATON Zoltan <balaton@eik.bme.hu> writes:

> On Wed, 24 Nov 2021, Fabiano Rosas wrote:
>> Fabiano Rosas <farosas@linux.ibm.com> writes:
>>
>>> Hi all,
>>>
>>> We have this bug in QEMU which indicates that we haven't been able to
>>> run openbios on a 7450 cpu for quite a long time:
>>>
>>> https://gitlab.com/qemu-project/qemu/-/issues/86
>>>
>>> OK:
>>>   $ ./qemu-system-ppc -serial mon:stdio -nographic -cpu 7410
>>>
>>>  >> =============================================================
>>>  >> OpenBIOS 1.1 [Nov 1 2021 20:36]
>>>   ...
>>>
>>> NOK:
>>>   $ ./qemu-system-ppc -serial mon:stdio -nographic -cpu 7450 -d int
>
> This CPU appears in PowerMac G4 so maybe better use -machine mac99,via=pmu 
> with it as it's strange to put it in a g3beige but that may not matter for 
> reproducing the problem.
>
> As for guests, those running on the said PowerMac G4 should have support 
> for these CPUs so maybe you can try some Mac OS X versions (or maybe 
> MorphOS but that is not the best for debugging as there's no source 
> available nor any help from its owners but just to see if it boots it may 
> be sufficient, it should work on real PowerMac G4). According to 
> <https://en.wikipedia.org/wiki/PowerPC_G4#PowerPC_7450> this CPU was used 
> in <https://en.wikipedia.org/wiki/Power_Mac_G4#Digital_Audio/Quicksilver> 
> and it runs up to Mac OS 10.4.11. (Although OpenBIOS sets the device tree 
> according to a PowerMac3,1 so not sure it's entirely correct for the 
> PowerMac3,5 that has a 7450 CPU and if it matters for Mac OS X.)
>
> I asked about this before but got no reply back then:
> https://lists.nongnu.org/archive/html/qemu-ppc/2020-03/msg00292.html
>
> This was because pegasos2 should have 7447 but it did not work so 
> currently I've set it to 7400 which also works. The original board 
> firmware had some problem detecting it but I think that only results in 
> wrong CPU speed shown which is only a cosmetic problem, otherwise it seems 
> to work. Since pegasos2 does not use OpenBIOS but either VOF or the 
> board's original firmware it may be an alternative way to test at least 
> 7447 which the firmware and guests running on that board should work with. 
> At least Debian 8.11 powerpc version had support for pegasos2 and should 
> boot, I'm not sure newer versions still work. More info on pegasos2 can be 
> found at:
> http://zero.eik.bme.hu/~balaton/qemu/amiga/#morphos 
> and
> https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2
>
> I don't remember what problem I had with 7447 but if it does not work with 
> pegasos2 then maybe there's some other problem with it too. I think it was 
> maybe related to TLBs but I don't know and had no time to try again so I 
> could be entirely wrong about this.

So yesterday I tested these:

* all with my patched OpenBIOS
** all of them work fine with the 7400 CPU

- macos9 w/ -M mac99 and -cpu 7450

OS starts and then freezes. Upon further inspection I see that it has
the 0x1000, 0x1100 and 0x1200 vectors implemented, but not the 7450
ones. It implements the 6xx SW TLB handler, i.e. it accesses SPR 976
instead of 980.

- macosx10 w/ -M mac99 and -cpu 7450

Shows the apple logo and then spins. Looking at the asm I don't see
anything resembling the 7450 software TLB code. I'm calling it unsupported.

- debian 10 w/ -M mac99 and -cpu 7450

Boots linux and then spins. It has the vectors implemented, but it also
uses different SPRs. The data misses come via 976, which is different
from 7450, which uses only 980 (tlbmiss) for instruction and data.

- morphos w/ -M pegasos2 and -cpu 7447|7450

Hangs. It also has a different software TLB model implemented:
Trying to read invalid spr 978 (0x3d2) at 00001100
Trying to read invalid spr 977 (0x3d1) at 0000110c
Trying to read invalid spr 979 (0x3d3) at 0000115c
Trying to read invalid spr 976 (0x3d0) at 00001188

So my initial impression that no OS supports the 7450 software TLB seems
to match these findings and what people have said elsewhere in the
thread.

>
> Regards,
> BALATON Zoltan
>
>>>   Raise exception at fff08cc4 => 0000004e (00)
>>>   QEMU: Terminated
>>>
>>> The actual issue is straightforward. There is a non-architected
>>> feature that QEMU has enabled by default that openbios doesn't know
>>> about. From the user manual:
>>>
>>> "The MPC7540 has a set of implementation-specific registers,
>>> exceptions, and instructions that facilitate very efficient software
>>> searching of the page tables in memory for when software table
>>> searching is enabled (HID0[STEN] = 1). This section describes those
>>> resources and provides three example code sequences that can be used
>>> in a MPC7540 system for an efficient search of the translation tables
>>> in software. These three code sequences can be used as handlers for
>>> the three exceptions requiring access to the PTEs in the page tables
>>> in memory in this case-instruction TLB miss, data TLB miss on load,
>>> and data TLB miss on store exceptions."
>>>
>>> The current state:
>>>
>>> 1) QEMU does not check HID0[STEN] and makes the feature always enabled
>>> by setting these cpus with the POWERPC_MMU_SOFT_74xx MMU model,
>>> instead of the generic POWERPC_MMU_32B.
>>>
>>> 2) openbios does not recognize the PVRs for those cpus and also does
>>> not have any handlers for the software TLB exceptions (vectors 0x1000,
>>> 0x1100, 0x1200).
>>>
>>> Some assumptions (correct me if I'm wrong please):
>>>
>>> - openbios is the only firmware we use for the following cpus: 7441,
>>> 7445, 7450, 7451, 7455, 7457, 7447, 7447a, 7448.
>>> - without openbios, we cannot have a guest running on these cpus.
>>>
>>> So to bring 7450 back to life we would need to either:
>>>
>>> a) find another firmware/guest OS code that supports the feature;
>>>
>>> b) implement the switching of the feature in QEMU and have the guest
>>> code enable it only when supported. That would take some fiddling with
>>> the MMU code to: merge POWERPC_MMU_SOFT_74xx into POWERPC_MMU_32B,
>>> check the HID0[STEN] bit, figure out how to switch from HW TLB miss to
>>> SW TLB miss on demand, block access to the TLBMISS register (and
>>> others) when the feature is off, and so on;
>>>
>>> c) leave the feature enabled in QEMU and implement the software TLB
>>> miss handlers in openbios. The UM provides sample code, so this is
>>> easy;
>>>
>>> d) remove support for software TLB search for the 7450 family and
>>> switch the cpus to the POWERPC_MMU_32B model. This is by far the
>>> easiest solution, but could cause problems for any (which?) guest OS
>>> code that actually uses the feature. All of the existing code for the
>>> POWERPC_MMU_SOFT_74xx MMU model would probably be removed since it
>>> would be dead code then;
>>>
>>> Option (c) seemed to me like a good compromise so this is a patch
>>> series for openbios doing that and also adding the necessary PVRs so
>>> we can get a working guest with these cpus without too much effort.
>>>
>>> I have also a patch for QEMU adding basic sanity check tests for the
>>> 7400 and 7450 families. I'll send that separately to the QEMU ml.
>>>
>>> Fabiano Rosas (2):
>>>   ppc: Add support for MPC7450 software TLB miss interrupts
>>>   ppc: Add PVRs for the MPC7450 family
>>>
>>>  arch/ppc/qemu/init.c  |  52 ++++++++++
>>>  arch/ppc/qemu/start.S | 236 +++++++++++++++++++++++++++++++++++++++++-
>>>  2 files changed, 285 insertions(+), 3 deletions(-)
>>
>> (Adding Mark because his email got somehow dropped from the original
>> message)
>>
>> So with these patches in OpenBIOS we could get a bit further and call
>> into the Linux kernel using the same image as the one used for the
>> 7400. However there seems to be no support for the 7450 software TLB in
>> the kernel. There are only handlers for the 4xx, 8xx and 603 which are
>> different code altogether. There's no mention of the TLBMISS and
>> PTEHI/LO registers in the code as well.
>>
>> Do we know of any guest OS that implements the 7450 software TLB at
>> vectors 0x1000, 0x1100 and 0x1200? Otherwise replacing the
>> POWERPC_MMU_SOFT_74xx model with POWERPC_MMU_32B might be the only way
>> of getting an OS to run in the 7450 family.
>>
>>

