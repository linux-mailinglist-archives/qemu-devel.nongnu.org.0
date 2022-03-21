Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 046534E304E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 19:57:24 +0100 (CET)
Received: from localhost ([::1]:52266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWNDW-0002S3-Kt
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 14:57:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nWNCD-0001Gl-QJ
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 14:56:01 -0400
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229]:37247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nWNCA-0008Nv-SN
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 14:56:01 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.159])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id DCC23240BB;
 Mon, 21 Mar 2022 18:55:55 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 21 Mar
 2022 19:55:55 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0056b5ba6bc-3543-4cec-bdc2-e1b27516a8aa,
 1B2610401919D9AAB2F83A5D9344AD9F0D4CD782) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <067ebb15-593b-4b9e-26d6-a4d98db4fd5c@kaod.org>
Date: Mon, 21 Mar 2022 19:55:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: Memory leak in via_isa_realize()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, Thomas Huth <thuth@redhat.com>, QEMU
 Developers <qemu-devel@nongnu.org>, Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <d60cb762-40a5-f918-02aa-463758205af5@redhat.com>
 <89a014e0-8850-e628-dea5-76999513a18e@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <89a014e0-8850-e628-dea5-76999513a18e@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: bde5c987-2e3e-4f54-b867-1e47484893ce
X-Ovh-Tracer-Id: 14572241022890773356
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudegfedguddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdqphhptgesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: "list@suse.de:PowerPC" <qemu-ppc@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Bernhard Beschow <shentey@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/21/22 14:04, Philippe Mathieu-Daudé wrote:
> Cc'ing Bernhard who did a similar cleanup recently.
> 
> On 21/3/22 11:31, Thomas Huth wrote:
>>
>>   Hi!
>>
>> FYI, I'm seeing a memory leak in via_isa_realize() when building
>> QEMU with sanitizers enabled or when running QEMU through valgrind:
>>
>> $ valgrind --leak-check=full --show-leak-kinds=definite ./qemu-system-mips64el --nographic -M fuloong2e
>> ==210405== Memcheck, a memory error detector
>> ==210405== Copyright (C) 2002-2017, and GNU GPL'd, by Julian Seward et al.
>> ==210405== Using Valgrind-3.17.0 and LibVEX; rerun with -h for copyright info
>> ==210405== Command: ./qemu-system-mips64el --nographic -M fuloong2e
>> ==210405==
>> ==210405== Warning: set address range perms: large range [0x15c9f000, 0x55c9f000) (defined)
>> ==210405== Warning: set address range perms: large range [0x59ea4000, 0x99ea4000) (defined)
>> ==210405== Warning: set address range perms: large range [0x99ea4000, 0xaa0a4000) (noaccess)
>> QEMU 6.2.90 monitor - type 'help' for more information
>> (qemu) q
>> ==210405==
>> ==210405== HEAP SUMMARY:
>> ==210405==     in use at exit: 8,409,442 bytes in 23,516 blocks
>> ==210405==   total heap usage: 37,073 allocs, 13,557 frees, 32,674,469 bytes allocated
>> ==210405==
>> ==210405== 8 bytes in 1 blocks are definitely lost in loss record 715 of 6,085
>> ==210405==    at 0x4C360A5: malloc (vg_replace_malloc.c:380)
>> ==210405==    by 0x7059475: g_malloc (in /usr/lib64/libglib-2.0.so.0.5600.4)
>> ==210405==    by 0x96C52C: qemu_extend_irqs (irq.c:57)
>> ==210405==    by 0x96C5B8: qemu_allocate_irqs (irq.c:66)
>> ==210405==    by 0x5FFA47: via_isa_realize (vt82c686.c:591)
>> ==210405==    by 0x5FFCDA: vt82c686b_realize (vt82c686.c:646)
>> ==210405==    by 0x681502: pci_qdev_realize (pci.c:2192)
>> ==210405==    by 0x969A5D: device_set_realized (qdev.c:531)
>> ==210405==    by 0x97354A: property_set_bool (object.c:2273)
>> ==210405==    by 0x9715A0: object_property_set (object.c:1408)
>> ==210405==    by 0x975938: object_property_set_qobject (qom-qobject.c:28)
>> ==210405==    by 0x971907: object_property_set_bool (object.c:1477)
>> ==210405==
>> ==210405== LEAK SUMMARY:
>> ==210405==    definitely lost: 8 bytes in 1 blocks
>> ==210405==    indirectly lost: 0 bytes in 0 blocks
>> ==210405==      possibly lost: 3,794 bytes in 45 blocks
>> ==210405==    still reachable: 8,405,640 bytes in 23,470 blocks
>> ==210405==                       of which reachable via heuristic:
>> ==210405==                         newarray           : 1,536 bytes in 16 blocks
>> ==210405==         suppressed: 0 bytes in 0 blocks
>> ==210405== Reachable blocks (those to which a pointer was found) are not shown.
>> ==210405== To see them, rerun with: --leak-check=full --show-leak-kinds=all
>> ==210405==
>> ==210405== For lists of detected and suppressed errors, rerun with: -s
>> ==210405== ERROR SUMMARY: 46 errors from 46 contexts (suppressed: 0 from 0)
>>
>> Same problem happens with qemu-system-ppc64 and the pegasos2 machine.
>>
>> No clue how to properly fix this... is it safe to free the pointer
>> at the end of the function?

I introduced quite a few of these calls,

   hw/ppc/pnv_lpc.c:    irqs = qemu_allocate_irqs(handler, lpc, ISA_NUM_IRQS);
   hw/ppc/pnv_psi.c:    psi->qirqs = qemu_allocate_irqs(ics_set_irq, ics, ics->nr_irqs);
   hw/ppc/pnv_psi.c:    psi->qirqs = qemu_allocate_irqs(xive_source_set_irq, xsrc, xsrc->nr_irqs);
   hw/ppc/ppc.c:    env->irq_inputs = (void **)qemu_allocate_irqs(&ppc6xx_set_irq, cpu,
   hw/ppc/ppc.c:    env->irq_inputs = (void **)qemu_allocate_irqs(&ppc970_set_irq, cpu,
   hw/ppc/ppc.c:    env->irq_inputs = (void **)qemu_allocate_irqs(&power7_set_irq, cpu,
   hw/ppc/ppc.c:    env->irq_inputs = (void **)qemu_allocate_irqs(&power9_set_irq, cpu,
   hw/ppc/ppc.c:    env->irq_inputs = (void **)qemu_allocate_irqs(&ppc40x_set_irq,
   hw/ppc/ppc.c:    env->irq_inputs = (void **)qemu_allocate_irqs(&ppce500_set_irq,
   hw/ppc/spapr_irq.c:    spapr->qirqs = qemu_allocate_irqs(spapr_set_irq, spapr,

and may be I can remove some. What's the best practice ?

Thanks,

C.

