Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 353BD3ED8A9
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 16:06:32 +0200 (CEST)
Received: from localhost ([::1]:34096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFdG3-0006VT-8m
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 10:06:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1mFdB1-0007EG-9M
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 10:01:20 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:33916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1mFdAv-0006vK-S2
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 10:01:18 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A767421DD3;
 Mon, 16 Aug 2021 14:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1629122469; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zmqfa2UunehoeozKut2ZQc6fJWOON8YgBnQ/2Wb5cCc=;
 b=MV+hkeQDkdENq+vQrGYU7lGmGYgdVRb78qom8odxESJPDsQCvY2XtFmZ26CywrGjpqsuCi
 EVIj7M5kozbcLC+5/4NLJ8VPeDliAvdO0ji8fziEKYlPZRgX3o04RK9iK9ImT/JBdUuFXB
 S38pVXwSrf6KXyWjqgBoM9VwomNgaTU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1629122469;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zmqfa2UunehoeozKut2ZQc6fJWOON8YgBnQ/2Wb5cCc=;
 b=DDFLZSXRqHSv2Rv0+TOLME0tbNzatLvnN0KGa2Mv9ur8hkDXKQRhNzKLPQLuAAHkSsTsPu
 VAtWXzD2XxRtA3BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4076E13BF2;
 Mon, 16 Aug 2021 14:01:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id tcY+DqVvGmGvFQAAMHmgww
 (envelope-from <cfontana@suse.de>); Mon, 16 Aug 2021 14:01:09 +0000
Subject: Re: [RFC PATCH 00/13] Add support for Mirror VM.
To: Ashish Kalra <Ashish.Kalra@amd.com>, qemu-devel@nongnu.org
References: <cover.1629118207.git.ashish.kalra@amd.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <4ffdca0d-a495-07aa-316d-4dcee5fe8007@suse.de>
Date: Mon, 16 Aug 2021 16:01:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <cover.1629118207.git.ashish.kalra@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -80
X-Spam_score: -8.1
X-Spam_bar: --------
X-Spam_report: (-8.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.71,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: thomas.lendacky@amd.com, brijesh.singh@amd.com, ehabkost@redhat.com,
 kvm@vger.kernel.org, mst@redhat.com, tobin@ibm.com, jejb@linux.ibm.com,
 richard.henderson@linaro.org, frankeh@us.ibm.com, dgilbert@redhat.com,
 dovmurik@linux.vnet.ibm.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 8/16/21 3:25 PM, Ashish Kalra wrote:
> From: Ashish Kalra <ashish.kalra@amd.com>
> 
> This is an RFC series for Mirror VM support that are 
> essentially secondary VMs sharing the encryption context 
> (ASID) with a primary VM. The patch-set creates a new 
> VM and shares the primary VM's encryption context
> with it using the KVM_CAP_VM_COPY_ENC_CONTEXT_FROM capability.
> The mirror VM uses a separate pair of VM + vCPU file 
> descriptors and also uses a simplified KVM run loop, 
> for example, it does not support any interrupt vmexit's. etc.
> Currently the mirror VM shares the address space of the
> primary VM. 

Hi,

I'd expect some entry in docs/ ?

Thanks,

Claudio

> 
> The mirror VM can be used for running an in-guest migration 
> helper (MH). It also might have future uses for other in-guest
> operations.
> 
> The mirror VM support is enabled by adding a mirrorvcpus=N
> suboption to -smp, which also designates a few vcpus (normally 1)
> to the mirror VM.
> 
> Example usage for starting a 4-vcpu guest, of which 1 vcpu is marked as
> mirror vcpu.
> 
>     qemu-system-x86_64 -smp 4,mirrorvcpus=1 ...
> 
> Ashish Kalra (7):
>   kvm: Add Mirror VM ioctl and enable cap interfaces.
>   kvm: Add Mirror VM support.
>   kvm: create Mirror VM and share primary VM's encryption context.
>   softmmu/cpu: Skip mirror vcpu's for pause, resume and synchronization.
>   kvm/apic: Disable in-kernel APIC support for mirror vcpu's.
>   hw/acpi: disable modern CPU hotplug interface for mirror vcpu's
>   hw/i386/pc: reduce fw_cfg boot cpu count taking into account mirror
>     vcpu's.
> 
> Dov Murik (5):
>   machine: Add mirrorvcpus=N suboption to -smp
>   hw/boards: Add mirror_vcpu flag to CPUArchId
>   hw/i386: Mark mirror vcpus in possible_cpus
>   cpu: Add boolean mirror_vcpu field to CPUState
>   hw/i386: Set CPUState.mirror_vcpu=true for mirror vcpus
> 
> Tobin Feldman-Fitzthum (1):
>   hw/acpi: Don't include mirror vcpus in ACPI tables
> 
>  accel/kvm/kvm-accel-ops.c |  45 ++++++-
>  accel/kvm/kvm-all.c       | 244 +++++++++++++++++++++++++++++++++++++-
>  accel/kvm/kvm-cpus.h      |   2 +
>  hw/acpi/cpu.c             |  21 +++-
>  hw/core/cpu-common.c      |   1 +
>  hw/core/machine.c         |   7 ++
>  hw/i386/acpi-build.c      |   5 +
>  hw/i386/acpi-common.c     |   5 +
>  hw/i386/kvm/apic.c        |  15 +++
>  hw/i386/pc.c              |  10 ++
>  hw/i386/x86.c             |  11 +-
>  include/hw/acpi/cpu.h     |   1 +
>  include/hw/boards.h       |   3 +
>  include/hw/core/cpu.h     |   3 +
>  include/hw/i386/x86.h     |   3 +-
>  include/sysemu/kvm.h      |  15 +++
>  qapi/machine.json         |   5 +-
>  softmmu/cpus.c            |  27 +++++
>  softmmu/vl.c              |   3 +
>  target/i386/kvm/kvm.c     |  42 +++++++
>  20 files changed, 459 insertions(+), 9 deletions(-)
> 


