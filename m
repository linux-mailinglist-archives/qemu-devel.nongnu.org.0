Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5EA6A688B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 09:05:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXHRa-0007qH-Tq; Wed, 01 Mar 2023 03:04:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1pXHRX-0007ph-V4
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 03:04:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1pXHRU-00010v-FN
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 03:04:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677657838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1TsB+RFtGFMQiS5+9ybWDmWY0+JqKjd0F/U1F2E3cbo=;
 b=W/QM36Tc2MBrlQ//2cNgnCtlQ452vNhJHRGcnqxx3YqiRS1Mw0j8LW0uPoQ9eKDbgvgXSn
 RWER2fTx60bfqbO7+fzVpac1ZKxcm3SsABxlyqZ7+wF1+asKON25G2OvQkNSlUDDZxLmG8
 tKLmibQ/pDqk4ZkvIbNaEIAscK/dEPY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-297-Cv-zdlW0NBa7fWCOjroUZw-1; Wed, 01 Mar 2023 03:03:55 -0500
X-MC-Unique: Cv-zdlW0NBa7fWCOjroUZw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 016B91C068C8;
 Wed,  1 Mar 2023 08:03:55 +0000 (UTC)
Received: from [10.39.192.97] (unknown [10.39.192.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C36AD40C6EC4;
 Wed,  1 Mar 2023 08:03:52 +0000 (UTC)
Message-ID: <2cf7e982-470f-87eb-7f3e-807499d7c89f@redhat.com>
Date: Wed, 1 Mar 2023 09:03:51 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] acpi: cpuhp: fix guest-visible maximum access size to the
 legacy reg block
To: Christian Ehrhardt <christian.ehrhardt@canonical.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 qemu devel list <qemu-devel@nongnu.org>, Ani Sinha <ani@anisinha.ca>,
 Ard Biesheuvel <ardb@kernel.org>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-stable@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Oliver Steffen <osteffen@redhat.com>,
 Pawel Polawski <ppolawsk@redhat.com>
References: <20230104090138.214862-1-lersek@redhat.com>
 <20230104072457-mutt-send-email-mst@kernel.org>
 <7122894b-ccbf-9d30-ee54-c23c25c0f82b@redhat.com>
 <CAATJJ0K8Qt3-gNFT4nmweRFk-1bSHGicuLPim_V7EjgaXmLtGw@mail.gmail.com>
Content-Language: en-US
From: Laszlo Ersek <lersek@redhat.com>
In-Reply-To: <CAATJJ0K8Qt3-gNFT4nmweRFk-1bSHGicuLPim_V7EjgaXmLtGw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hello Christian,

On 3/1/23 08:17, Christian Ehrhardt wrote:
> On Thu, Jan 5, 2023 at 8:14 AM Laszlo Ersek <lersek@redhat.com> wrote:
>>
>> On 1/4/23 13:35, Michael S. Tsirkin wrote:
>>> On Wed, Jan 04, 2023 at 10:01:38AM +0100, Laszlo Ersek wrote:
>>>> The modern ACPI CPU hotplug interface was introduced in the following
>>>> series (aa1dd39ca307..679dd1a957df), released in v2.7.0:
>>>>
>>>>   1  abd49bc2ed2f docs: update ACPI CPU hotplug spec with new protocol
>>>>   2  16bcab97eb9f pc: piix4/ich9: add 'cpu-hotplug-legacy' property
>>>>   3  5e1b5d93887b acpi: cpuhp: add CPU devices AML with _STA method
>>>>   4  ac35f13ba8f8 pc: acpi: introduce AcpiDeviceIfClass.madt_cpu hook
>>>>   5  d2238cb6781d acpi: cpuhp: implement hot-add parts of CPU hotplug
>>>>                   interface
>>>>   6  8872c25a26cc acpi: cpuhp: implement hot-remove parts of CPU hotplug
>>>>                   interface
>>>>   7  76623d00ae57 acpi: cpuhp: add cpu._OST handling
>>>>   8  679dd1a957df pc: use new CPU hotplug interface since 2.7 machine type
>>>>
> ...
>>
>> The solution to the riddle
> 
> Hi,
> just to add to this nicely convoluted case an FYI to everyone involved
> back then,
> the fix seems to have caused a regression [1] in - as far as I've
> found - an edge case.
> 
> [1]: https://gitlab.com/qemu-project/qemu/-/issues/1520

After reading the gitlab case, here's my theory on it:

- Without the patch applied, the CPU hotplug register block in QEMU is
broken. Effectively, it has *always* been broken; to put it differently,
you have most likely *never* seen a QEMU in which the CPU hotplug
register block was not broken. The reason is that the only QEMU release
without the breakage (as far as a guest could see it!) was v5.0.0, but
it got exposed to the guest as early as v5.1.0 (IOW, in the 5.* series,
the first stable release already exposed the issue), and the symptom has
existed since (up to and including 7.2).

- With the register block broken, OVMF's multiprocessing is broken, and
the random chaos just happens to play out in a way that makes OVMF think
it's running on a uniprocessor system.

- With the register block *fixed* (commit dab30fbe applied), OVMF
actually boots up your VCPUs. With MT-TCG, this translates to as many
host-side VCPU threads running in your QEMU process as you have VCPUs.

- Furthermore, if your OVMF build includes the SMM driver stack, then
each UEFI variable update will require all VCPUs to enter SMM. All VCPUs
entering SMM is a "thundering herd" event, so it seriously spins up all
your host-side threads. (I assume the SMM-enabled binaries are what you
refer to as "signed OVMF cases" in the gitlab ticket.)

- If you overcommit the VCPUs (#vcpus > #pcpus), then your host-side
threads will be competing for PCPUs. On s390x, there is apparently some
bottleneck in QEMU's locking or in the host kernel or wherever else that
penalizes (#threads > #pcpus) heavily, while on other host arches, the
penalty is (apparently) not as severe.

So, the QEMU fix actually "only exposes" the high penalty of the MT-TCG
VCPU thread overcommit that appears characteristic of s390x hosts.
You've not seen this symptom before because, regardless of how many
VCPUs you've specified in the past, OVMF has never actually attempted to
bring those up, due to the hotplug regblock breakage "masking" the
actual VCPU counts (the present-at-boot VCPU count and the possible max
VCPU count).

Here's a test you could try: go back to QEMU v5.0.0 *precisely*, and try
to reproduce the symptom. I expect that it should reproduce.

Here's another test you can try: with latest QEMU, boot an x86 Linux
guest, but using SeaBIOS, not OVMF, on your s390x host. Then, in the
Linux guest, run as many busy loops (e.g. in the shell) as there are
VCPUs. Compare the behavior between #vcpus = #pcpus vs. #vcpus > #pcpus.
The idea here is of course to show that the impact of overcommitting x86
VCPUs on s390x is not specific to OVMF. Note that I don't *fully* expect
this test to confirm the expectation, because the guest workload will be
very different: in the Linux guest case, your VCPUs will not be
attempting to enter SMM *or* to access pflash, so the paths exercised in
QEMU will be very different. But, the test may still be worth a try.

Yet another test (or more like, information gathering): re-run the
problematic case, while printing the OVMF debug log (the x86 debug
console) to stdout, and visually determine at what part(s) the slowdown
hits. (I guess you can also feed the debug console log through some
timestamping utility like "logger".) I suspect it's going to be those
log sections that relate to SMM entry -- initial SMBASE relocation, and
then whenever UEFI variables are modified.

Preliminary advice: don't overcommit VCPUs in the setup at hand, or else
please increase the timeout. :)

In edk2, a way to mitigate said "thundering herd" problem *supposedly*
exists (using unicast SMIs rather than broadcast ones), but that
configuration of the core SMM components in edk2 had always been
extremely unstable when built into OVMF *and* running on QEMU/KVM. So we
opted for broadcast SMIs (supporting which actually required some QEMU
patches). Broadcast SMIs generate larger spikes in host load, but
regarding guest functionally, they are much more stable/robust.

Laszlo


