Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FD24FEE62
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 06:59:13 +0200 (CEST)
Received: from localhost ([::1]:39458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neV60-0007Ug-Dl
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 00:59:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1neV3S-0006n5-K5
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 00:56:34 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:36442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1neV3P-0001XO-P4
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 00:56:34 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 o5-20020a17090ad20500b001ca8a1dc47aso5163350pju.1
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 21:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=AKE2TEdGzh5cBWAlQUBRmSK4925/MPQC+HxcnytfM9U=;
 b=T2Bpk9G26lvaNvdIQpVcGN1Ene20qn4aNGw8K6Lpo32PHQpq1pXiFxzp/Oh+2wsT+5
 E/v+KYjUR9XFJRdxg1MVy+pbESaPOxF5xP5JDDmPIzzWQZzpnoYxUX6yKyg+8JbBxtAK
 TGaHPSCvFzJsFQxHC+fNlmmIblDt92N4bDPljBs2YrazqNN6HQhm6BiY1ynx6vLw37wc
 YVzYLO9lpvtFgADbNEkA1lWeppjpuFUd2vxDk1VLuv/BeJ8YvWdyR0BK1Jxd6c04M2OY
 ncLymKLJMU65bJeAj9hVQ5Ui6V/4GZD1tL6zfvehHKi4CCdiCtuOLa/0ilLxQWkdAEx0
 psAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AKE2TEdGzh5cBWAlQUBRmSK4925/MPQC+HxcnytfM9U=;
 b=zkhz2CeemO0tu0OFSkKZcqK7OW1cykngju8EQl2eAlT/1uVHXK9owPNaKYPAM2KE4s
 GjqEf7jYhtdEINHUZjHeUHLHBY34b6J+TwJqeFfvDadkKK6wWPLO4uB8/md6vTpVMgbe
 uu50u2lOsFCHBTRYAaiNQXJKOTWE6NJaJbCHc0CbxH2ZR/d493Cz7/zRXSkq1gA1sWvx
 R2J4hlBPGNGElXhqcl7hXc3OlaQHv7OHs5XkimXwucQX6uNx1+CTygVo9lHs/zbqeMyx
 45lZ7Y5F0nbQH6i8oSm6lsYBq4q6QsKPf1CEKk39aKB/KdCtJddGmLcltAXex5te46SH
 hIvQ==
X-Gm-Message-State: AOAM530OX98Rk26GccFuPhKf5We4IxaGZYJzai6y2SDjRyYkkKxpOzY2
 jXgvx0Cd1u4cOhomKKbjpF40xw==
X-Google-Smtp-Source: ABdhPJyF5tEAfsCeibJREe5Cb7qXqPaxvKjKw8qtjsBl7hGJ2i5vw4upkkiW0xf2FysvPnidmBxWIg==
X-Received: by 2002:a17:90b:1d08:b0:1c7:3b51:8b41 with SMTP id
 on8-20020a17090b1d0800b001c73b518b41mr8637576pjb.210.1649825788459; 
 Tue, 12 Apr 2022 21:56:28 -0700 (PDT)
Received: from [10.61.2.177] (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242]) by smtp.gmail.com with ESMTPSA id
 d16-20020a17090ad99000b001bcbc4247a0sm1159168pjv.57.2022.04.12.21.56.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 21:56:27 -0700 (PDT)
Message-ID: <edfa8ca4-8e8a-335a-2e7e-c69661ec73da@ozlabs.ru>
Date: Wed, 13 Apr 2022 14:56:22 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:99.0) Gecko/20100101
 Thunderbird/99.0
Subject: Re: XIVE VFIO kernel resample failure in INTx mode under heavy load
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Timothy Pearson <tpearson@raptorengineering.com>
References: <1891893257.448156.1647023745384.JavaMail.zimbra@raptorengineeringinc.com>
 <20220314160952.46d5313a.alex.williamson@redhat.com>
 <9638ec8f-2edf-97df-0c14-95ae2344dc70@kaod.org>
 <6f0a92ca-9f53-b8b8-e85d-43f4da36200d@kaod.org>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <6f0a92ca-9f53-b8b8-e85d-43f4da36200d@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=aik@ozlabs.ru; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>,
 "list@suse.de:PowerPC" <qemu-ppc@nongnu.org>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/17/22 06:16, Cédric Le Goater wrote:
> Timothy,
> 
> On 3/16/22 17:29, Cédric Le Goater wrote:
>> Hello,
>>
>>
>>> I've been struggling for some time with what is looking like a
>>> potential bug in QEMU/KVM on the POWER9 platform.  It appears that
>>> in XIVE mode, when the in-kernel IRQ chip is enabled, an external
>>> device that rapidly asserts IRQs via the legacy INTx level mechanism
>>> will only receive one interrupt in the KVM guest.
>>
>> Indeed. I could reproduce with a pass-through PCI adapter using
>> 'pci=nomsi'. The virtio devices operate correctly but the network
>> adapter only receives one event (*):
>>
>>
>> $ cat /proc/interrupts
>>             CPU0       CPU1       CPU2       CPU3       CPU4       
>> CPU5       CPU6       CPU7
>>   16:       2198       1378       1519       1216          0          
>> 0          0          0  XIVE-IPI   0 Edge      IPI-0
>>   17:          0          0          0          0       2003       
>> 1936       1335       1507  XIVE-IPI   1 Edge      IPI-1
>>   18:          0       6401          0          0          0          
>> 0          0          0  XIVE-IRQ 4609 Level     virtio3, virtio0, 
>> virtio2
>>   19:          0          0          0          0          0        
>> 204          0          0  XIVE-IRQ 4610 Level     virtio1
>>   20:          0          0          0          0          0          
>> 0          0          0  XIVE-IRQ 4608 Level     xhci-hcd:usb1
>>   21:          0          1          0          0          0          
>> 0          0          0  XIVE-IRQ 4612 Level     eth1 (*)
>>   23:          0          0          0          0          0          
>> 0          0          0  XIVE-IRQ 4096 Edge      RAS_EPOW
>>   24:          0          0          0          0          0          
>> 0          0          0  XIVE-IRQ 4592 Edge      hvc_console
>>   26:          0          0          0          0          0          
>> 0          0          0  XIVE-IRQ 4097 Edge      RAS_HOTPLUG
>>
>>> Changing any one of those items appears to avoid the glitch, e.g. XICS
>>
>> XICS is very different from XIVE. The driver implements the previous
>> interrupt controller architecture (P5-P8) and the hypervisor mediates
>> the delivery to the guest. With XIVE, vCPUs are directly signaled by
>> the IC. When under KVM, we use different KVM devices for each mode :
>>
>> * KVM XIVE is a XICS-on-XIVE implementation (P9/P10 hosts) for guests
>>    not using the XIVE native interface. RHEL7 for instance.
>> * KVM XIVE native is a XIVE implementation (P9/P10 hosts) for guests
>>    using the XIVE native interface. Linux > 4.14.
>> * KVM XICS is for P8 hosts (no XIVE HW)
>>
>> VFIO adds some complexity with the source events. I think the problem
>> comes from the assertion state. I will talk about it later.
>>
>>> mode with the in-kernel IRQ chip works (all interrupts are passed
>>> through),
>>
>> All interrupts are passed through using XIVE also. Run 'info pic' in
>> the monitor. On the host, check the IRQ mapping in the debugfs file :
>>
>>    /sys/kernel/debug/powerpc/kvm-xive-*
>>
>>> and XIVE mode with the in-kernel IRQ chip disabled also works. 
>>
>> In that case, no KVM device backs the QEMU device and all state
>> is in one place.
>>
>>> We
>>> are also not seeing any problems in XIVE mode with the in-kernel
>>> chip from MSI/MSI-X devices.
>>
>> Yes. pass-through devices are expected to operate correctly :)
>>
>>> The device in question is a real time card that needs to raise an
>>> interrupt every 1ms.  It works perfectly on the host, but fails in
>>> the guest -- with the in-kernel IRQ chip and XIVE enabled, it
>>> receives exactly one interrupt, at which point the host continues to
>>> see INTx+ but the guest sees INTX-, and the IRQ handler in the guest
>>> kernel is never reentered.
>>
>> ok. Same symptom as the scenario above.
>>
>>> We have also seen some very rare glitches where, over a long period
>>> of time, we can enter a similar deadlock in XICS mode.
>>
>> with the in-kernel XICS IRQ chip ?
>>
>>> Disabling
>>> the in-kernel IRQ chip in XIVE mode will also lead to the lockup
>>> with this device, since the userspace IRQ emulation cannot keep up
>>> with the rapid interrupt firing (measurements show around 100ms
>>> required for processing each interrupt in the user mode).
>>
>> MSI emulation in QEMU is slower indeed (35%). LSI is very slow because
>> it is handled as a special case in the device/driver. To maintain the
>> assertion state, all LSI handling is done with a special HCALL :
>> H_INT_ESB which is implemented in QEMU. This generates a lot of back
>> and forth in the KVM stack.
>>
>>> My understanding is the resample mechanism does some clever tricks
>>> with level IRQs, but that QEMU needs to check if the IRQ is still
>>> asserted by the device on guest EOI.
>>
>> Yes. the problem is in that area.
>>
>>> Since a failure here would
>>> explain these symptoms I'm wondering if there is a bug in either
>>> QEMU or KVM for POWER / pSeries (SPAPr) where the IRQ is not
>>> resampled and therefore not re-fired in the guest?
>>
>> KVM I would say. The assertion state is maintained in KVM for the KVM
>> XICS-on-XIVE implementation and in QEMU for the KVM XIVE native
>> device. These are good candidates. I will take a look.
> 
> All works fine with KVM_CAP_IRQFD_RESAMPLE=false in QEMU. Can you please
> try this workaround for now ? I could reach 934 Mbits/sec on the passthru
> device.
> 
> I clearly overlooked that part and it has been 3 years.


Disabling KVM_CAP_IRQFD_RESAMPLE on XIVE-capable machines seems to be 
the right fix actually.

XIVE == baremetal/vm POWER9 and newer.
XICS == baremetal/vm POWER8 and older, or VMs on any POWER (backward 
compat.).

Tested on POWER9 with a passed through XHCI host and "-append pci=nomsi" 
and "-machine pseries,ic-mode=xics,kernel_irqchip=on" (and s/xics/xive/).

When it is XIVE-on-XIVE (host and guest are XIVE), INTx is emulated in 
the QEMU's H_INT_ESB handler and IRQFD_RESAMPLE is just useless in such 
case (as it is designed to eliminate going to the userspace for the 
EOI->INTx unmasking) and there is no pathway to call the eventfd's 
irqfd_resampler_ack() from QEMU. So the VM's XHCI device receives 
exactly 1 interrupt and that is it. "kernel_irqchip=off" fixes it 
(obviously).

When it is XICS-on-XIVE (host is XIVE and guest is XICS), then the VM 
receives 100000 interrupts and then it gets frozen (__report_bad_irq() 
is called). Which happens because (unlike XICS-on-XICS), the host XIVE's 
xive_(rm|vm)_h_eoi() does not call irqfd_resampler_ack(). This fixes it:

=============
diff --git a/arch/powerpc/kvm/book3s_xive_template.c 
b/arch/powerpc/kvm/book3s_xive_template.c
index b0015e05d99a..9f0d8e5c7f4b 100644 

--- a/arch/powerpc/kvm/book3s_xive_template.c 

+++ b/arch/powerpc/kvm/book3s_xive_template.c 

@@ -595,6 +595,8 @@ X_STATIC int GLUE(X_PFX,h_eoi)(struct kvm_vcpu 
*vcpu, unsigned long xirr)
         xc->hw_cppr = xc->cppr; 

         __x_writeb(xc->cppr, __x_tima + TM_QW1_OS + TM_CPPR); 

 

+       kvm_notify_acked_irq(vcpu->kvm, 0, irq); 

+ 

         return rc; 

  } 

=============

The host's XICS does call kvm_notify_acked_irq() (I did not test that 
but the code seems to be doing so).

After re-reading what I just wrote, I am leaning towards disabling use 
of KVM_CAP_IRQFD_RESAMPLE as it seems last worked on POWER8 and never 
since :)

Did I miss something in the picture (hey Cedric)?


--
Alexey

