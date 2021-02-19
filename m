Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9F831F977
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 13:37:04 +0100 (CET)
Received: from localhost ([::1]:49670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD51r-0000Ni-EF
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 07:37:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lD4zh-0006ze-Fu; Fri, 19 Feb 2021 07:34:49 -0500
Received: from mx2.suse.de ([195.135.220.15]:48710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lD4zf-00069x-NZ; Fri, 19 Feb 2021 07:34:49 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 15495ACBF;
 Fri, 19 Feb 2021 12:34:45 +0000 (UTC)
Subject: Re: [PATCH 0/7] hw/kvm: Exit gracefully when KVM is not supported
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210219114428.1936109-1-philmd@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <89bb6db0-0411-e219-3df8-8300664b54f3@suse.de>
Date: Fri, 19 Feb 2021 13:34:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210219114428.1936109-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Leif Lindholm <leif@nuviainc.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 12:44 PM, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> This series aims to improve user experience by providing
> a better error message when the user tries to enable KVM
> on machines not supporting it.
> 
> Regards,
> 
> Phil.

Hi Philippe, not sure if it fits in this series,

but also the experience of a user running on a machine with cortex-a72,
choosing that very same cpu with -cpu and then getting:

qemu-system-aarch64: kvm_init_vcpu: kvm_arch_init_vcpu failed (0): Invalid argument

is not super-friendly. Maybe some suggestion to use -cpu host with KVM could be good?

Thanks,

Claudio

> 
> Philippe Mathieu-Daudé (7):
>   accel/kvm: Check MachineClass kvm_type() return value
>   hw/boards: Introduce 'kvm_supported' field to MachineClass
>   hw/arm: Set kvm_supported for KVM-compatible machines
>   hw/mips: Set kvm_supported for KVM-compatible machines
>   hw/ppc: Set kvm_supported for KVM-compatible machines
>   hw/s390x: Set kvm_supported to s390-ccw-virtio machines
>   accel/kvm: Exit gracefully when KVM is not supported
> 
>  include/hw/boards.h        |  6 +++++-
>  accel/kvm/kvm-all.c        | 12 ++++++++++++
>  hw/arm/sbsa-ref.c          |  1 +
>  hw/arm/virt.c              |  1 +
>  hw/arm/xlnx-versal-virt.c  |  1 +
>  hw/mips/loongson3_virt.c   |  1 +
>  hw/mips/malta.c            |  1 +
>  hw/ppc/e500plat.c          |  1 +
>  hw/ppc/mac_newworld.c      |  1 +
>  hw/ppc/mac_oldworld.c      |  1 +
>  hw/ppc/mpc8544ds.c         |  1 +
>  hw/ppc/ppc440_bamboo.c     |  1 +
>  hw/ppc/prep.c              |  1 +
>  hw/ppc/sam460ex.c          |  1 +
>  hw/ppc/spapr.c             |  1 +
>  hw/s390x/s390-virtio-ccw.c |  1 +
>  16 files changed, 31 insertions(+), 1 deletion(-)
> 


