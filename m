Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5375066DF
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 10:24:24 +0200 (CEST)
Received: from localhost ([::1]:38298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngj9r-0000ZM-4o
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 04:24:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ngiOy-0004bB-B2
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 03:35:58 -0400
Received: from 8.mo552.mail-out.ovh.net ([46.105.37.156]:34657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ngiOu-00029F-Ol
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 03:35:54 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.128])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id A81992335D;
 Tue, 19 Apr 2022 07:35:47 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 19 Apr
 2022 09:35:46 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S001b6ee23c3-f60d-4105-b65e-be4a597a7897,
 8178BE1DD4A2FCC93E6442F7737FB2433BB7237A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <e8ebdbcf-8f86-a5e7-6f2c-ae351e0db80c@kaod.org>
Date: Tue, 19 Apr 2022 09:35:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: XIVE VFIO kernel resample failure in INTx mode under heavy load
Content-Language: en-US
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Alex Williamson
 <alex.williamson@redhat.com>, Timothy Pearson
 <tpearson@raptorengineering.com>
References: <1891893257.448156.1647023745384.JavaMail.zimbra@raptorengineeringinc.com>
 <20220314160952.46d5313a.alex.williamson@redhat.com>
 <9638ec8f-2edf-97df-0c14-95ae2344dc70@kaod.org>
 <6f0a92ca-9f53-b8b8-e85d-43f4da36200d@kaod.org>
 <edfa8ca4-8e8a-335a-2e7e-c69661ec73da@ozlabs.ru>
 <d13d5858-e220-0f86-7d96-76e63def1ba3@kaod.org>
 <3559c1f2-4390-3e00-5bb6-a98725070551@ozlabs.ru>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <3559c1f2-4390-3e00-5bb6-a98725070551@ozlabs.ru>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: a2c9bd67-4eb8-43d2-980d-523315baa033
X-Ovh-Tracer-Id: 7373237018555419500
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrvddtvddguddvgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhgefgtdejfedvueetfeehjeekjeeutddvgfeuudffieegfffhjeduueeitdfhveenucffohhmrghinheprhgvrgguthhhvgguohgtshdrihhonecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=46.105.37.156; envelope-from=clg@kaod.org;
 helo=8.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>,
 "list@suse.de:PowerPC" <qemu-ppc@nongnu.org>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>>> Tested on POWER9 with a passed through XHCI host and "-append pci=nomsi" and "-machine pseries,ic-mode=xics,kernel_irqchip=on" (and s/xics/xive/).
>>
>> ok. This is deactivating the default XIVE (P9+) mode at the platform level,
>> hence forcing the XICS (P8) mode in a POWER9 guest running on a POWER9 host.
>> It is also deactivating MSI, forcing INTx usage in the kernel and forcing
>> the use of the KVM irqchip device to make sure we are not emulating in QEMU.
>>
>> We are far from the default scenario but this is it !
> 
> 
> well, "-machine pseries,ic-mode=xive,kernel_irqchip=on" is the default. 

The default is a 'dual' ic-mode, so XICS+XIVE are announced by CAS.
kernel_irqchip is not strictly enforced, so QEMU could fallback to
an emulated irqchip if needed.

> "pci=nomsi" is not but since that actual device is only capable on INTx,
> the default settings expose the problem.
> 
> 
> 
>>> When it is XIVE-on-XIVE (host and guest are XIVE), 
>>
>> We call this mode : XIVE native, or exploitation, mode. Anyhow, it is always
>> XIVE under the hood on a POWER9/POWER10 box.
>>
>>> INTx is emulated in the QEMU's H_INT_ESB handler 
>>
>> LSI are indeed all handled at the QEMU level with the H_INT_ESB hcall.
>> If I remember well, this is because we wanted a simple way to synthesize
>> the interrupt trigger upon EOI when the level is still asserted. Doing
>> this way is compatible for both kernel_irqchip=off/on modes because the
>> level is maintained in QEMU.
>>
>> This is different for the other two XICS KVM devices which maintain the
>> assertion level in KVM.
>>
>>> and IRQFD_RESAMPLE is just useless in such case (as it is designed to eliminate going to the userspace for the EOI->INTx unmasking) and there is no pathway to call the eventfd's irqfd_resampler_ack() from QEMU. So the VM's XHCI device receives exactly 1 interrupt and that is it. "kernel_irqchip=off" fixes it (obviously).
>>
>> yes.
>>
>>> When it is XICS-on-XIVE (host is XIVE and guest is XICS), 
>>
>> yes (FYI, we have similar glue in skiboot ...)
>>
>>> then the VM receives 100000 interrupts and then it gets frozen (__report_bad_irq() is called). Which happens because (unlike XICS-on-XICS), the host XIVE's xive_(rm|vm)_h_eoi() does not call irqfd_resampler_ack(). This fixes it:
>>>
>>> =============
>>> diff --git a/arch/powerpc/kvm/book3s_xive_template.c b/arch/powerpc/kvm/book3s_xive_template.c
>>> index b0015e05d99a..9f0d8e5c7f4b 100644
>>> --- a/arch/powerpc/kvm/book3s_xive_template.c
>>> +++ b/arch/powerpc/kvm/book3s_xive_template.c
>>> @@ -595,6 +595,8 @@ X_STATIC int GLUE(X_PFX,h_eoi)(struct kvm_vcpu *vcpu, unsigned long xirr)
>>>          xc->hw_cppr = xc->cppr;
>>>          __x_writeb(xc->cppr, __x_tima + TM_QW1_OS + TM_CPPR);
>>>
>>>
>>> +       kvm_notify_acked_irq(vcpu->kvm, 0, irq);
>>> +
>>>          return rc;
>>>   }
>>> =============
>>
>> OK. XICS-on-XIVE is also broken then :/ what about XIVE-on-XIVE ?
> 
> 
> Not sure I am following (or you are) :) INTx is broken on P9 in either mode. MSI works in both.

Sorry my question was not clear. the above fixed XICS-on-XIVE but
not XIVE-on-XIVE and I was asking about that. disabling resample
seems to be the solution for all.

>>
>>>
>>> The host's XICS does call kvm_notify_acked_irq() (I did not test that but the code seems to be doing so).
>>>
>>> After re-reading what I just wrote, I am leaning towards disabling use of KVM_CAP_IRQFD_RESAMPLE as it seems last worked on POWER8 and never since :)
>>
>> and it would fix XIVE-on-XIVE.
>>
>> Are you saying that passthru on POWER8 is broken ? fully or only INTx ?
> 
> 
> No, the opposite - P8 works fine, kvm_notify_acked_irq() is there.
> 
> 
>>> Did I miss something in the picture (hey Cedric)?
>>
>> You seem to have all combination in mind: host OS, KVM, QEMU, guest OS
>>
>> For the record, here is a documentation we did:
>>
>>    https://qemu.readthedocs.io/en/latest/specs/ppc-spapr-xive.html
>>
>> It might need some updates.
> 
> When I read this, a quite from the Simpsons pops up in my mind: “Dear Mr. President there are too many states nowadays. Please eliminate three. I am NOT a crackpot.” :)

Yes. It blew my mind for sometime ... :)

Thanks,

C.

