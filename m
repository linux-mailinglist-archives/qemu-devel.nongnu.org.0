Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F53F39B2B3
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 08:34:47 +0200 (CEST)
Received: from localhost ([::1]:56818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp3Pq-0001A7-Et
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 02:34:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lp3NS-0006gL-E2
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 02:32:18 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:47248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lp3NP-0002yA-Q7
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 02:32:18 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5F2E91FD37;
 Fri,  4 Jun 2021 06:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622788332; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9cmyR/nn10wjKTgtt3WcWVhP4Fe1IWj1V0kEbaDvUgY=;
 b=MBBHgfUuK19D+T5C7G7iVBmpV5Jbxw/abyk3GjuJXB666gJ07iZzFyhi2IkNyTPLUZb53a
 WGRyhlnJRDflqoT6AmTR/Q1Dii3G2xcKPQNysgV+Zh/piGO5nQpWgvspHouZIjv1geNw8G
 pExKuIEyBZGNy1X0iricYdnzPWdfPxU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622788332;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9cmyR/nn10wjKTgtt3WcWVhP4Fe1IWj1V0kEbaDvUgY=;
 b=d/0YZvzhsWxVCFkpU+0cdXQ24Rft3g/FGyNfQx97fdCthpVuF02ewNHtu4KaTKK0DATK/B
 gZF/UDfJ/+HWLPAA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id B4AC6118DD;
 Fri,  4 Jun 2021 06:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622788332; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9cmyR/nn10wjKTgtt3WcWVhP4Fe1IWj1V0kEbaDvUgY=;
 b=MBBHgfUuK19D+T5C7G7iVBmpV5Jbxw/abyk3GjuJXB666gJ07iZzFyhi2IkNyTPLUZb53a
 WGRyhlnJRDflqoT6AmTR/Q1Dii3G2xcKPQNysgV+Zh/piGO5nQpWgvspHouZIjv1geNw8G
 pExKuIEyBZGNy1X0iricYdnzPWdfPxU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622788332;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9cmyR/nn10wjKTgtt3WcWVhP4Fe1IWj1V0kEbaDvUgY=;
 b=d/0YZvzhsWxVCFkpU+0cdXQ24Rft3g/FGyNfQx97fdCthpVuF02ewNHtu4KaTKK0DATK/B
 gZF/UDfJ/+HWLPAA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id QWB/KOvIuWDUJgAALh3uQQ
 (envelope-from <cfontana@suse.de>); Fri, 04 Jun 2021 06:32:11 +0000
Subject: Re: [PATCH v2 0/2] Fixes for "Windows fails to boot"
To: Cleber Rosa Junior <crosa@redhat.com>
References: <20210603123001.17843-1-cfontana@suse.de>
 <1da75e95-1255-652e-1ca3-d23a8f6bf392@suse.de>
 <CA+bd_6K1BOSeswTszBGJrq4Z9F_KpPsSuOL-cLbYWGAfvjPEMA@mail.gmail.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <2e5edcf2-6958-82db-511c-724165a8ddfb@suse.de>
Date: Fri, 4 Jun 2021 08:32:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CA+bd_6K1BOSeswTszBGJrq4Z9F_KpPsSuOL-cLbYWGAfvjPEMA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.603,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 kvm@vger.kernel.org, Siddharth Chandrasekaran <sidcha@amazon.de>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/3/21 5:10 PM, Cleber Rosa Junior wrote:
> On Thu, Jun 3, 2021 at 10:29 AM Claudio Fontana <cfontana@suse.de> wrote:
> 
>> On 6/3/21 2:29 PM, Claudio Fontana wrote:
>>> v1 -> v2:
>>>  * moved hyperv realizefn call before cpu expansion (Vitaly)
>>>  * added more comments (Eduardo)
>>>  * fixed references to commit ids (Eduardo)
>>>
>>> The combination of Commits:
>>> f5cc5a5c ("i386: split cpu accelerators from cpu.c"...)
>>
>>> 30565f10 ("cpu: call AccelCPUClass::cpu_realizefn in"...)
>>>
>>> introduced two bugs that break cpu max and host in the refactoring,
>>> by running initializations in the wrong order.
>>>
>>> This small series of two patches is an attempt to correct the situation.
>>>
>>> Please provide your test results and feedback, thanks!
>>>
>>> Claudio
>>>
>>> Claudio Fontana (2):
>>>   i386: reorder call to cpu_exec_realizefn in x86_cpu_realizefn
>>>   i386: run accel_cpu_instance_init as instance_post_init
>>>
>>>  target/i386/cpu.c         | 89 +++++++++++++++++++++++++--------------
>>>  target/i386/kvm/kvm-cpu.c | 12 +++++-
>>>  2 files changed, 68 insertions(+), 33 deletions(-)
>>>
>>
>> Btw, CI/CD is all green, but as mentioned, it does not seem to catch these
>> kind of issues.
>>
>>
> Hi Claudio,
> 
> Not familiar with the specifics of this bug, but can it be caught by
> attempting to boot an image other than Windows?  If so, we can consider
> adding a test along the lines of tests/acceptance/boot_linux_console.py.
> 
> Thanks,
> - Cleber.

Hello Cleber,

yes, all that seems to be required is the "host" cpu, q35 machine, and the firmware ./OVMF_CODE.secboot.fd and ./OVMF_VARS.secboot.fd :

./build/x86_64-softmmu/qemu-system-x86_64 \
        -cpu host \
        -enable-kvm \
        -m 4G \
        -machine q35,smm=on \
        -drive if=pflash,format=raw,readonly=on,unit=0,file="./OVMF_CODE.secboot.fd" \
        -drive if=pflash,format=raw,unit=1,file="./OVMF_VARS.secboot.fd"

With the bugged code, the firmware does not boot, and the cpu does not get into 64-bit long mode.
Applying the patches the firmware boots normally and we get the TianoCore Logo and text output.

Adding something like -display none -serial stdio would also generate text in the OK case that could be "expected" by a test:

BdsDxe: failed to load Boot0001 "UEFI QEMU DVD-ROM QM00005 " from PciRoot(0x0)/Pci(0x1F,0x2)/Sata(0x2,0xFFFF,0x0): Not Found

>>Start PXE over IPv4.

even without using any guest to boot at all, just the firmware.
I used this Fedora package for the test, containing the firmware: edk2-ovmf-20200801stable-1.fc33.noarch.rpm

I looked briefly at tests/acceptance/boot_linux_console.py, but did not see where such a test of firmware could be inserted,
could you advise?

Thanks,

Claudio

> 
> 
>> https://gitlab.com/hw-claudio/qemu/-/pipelines/314286751
>>
>> C.
>>
>>
>>
> 


