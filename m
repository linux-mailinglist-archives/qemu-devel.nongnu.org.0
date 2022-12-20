Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5207E652374
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 16:09:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7eEs-0005VH-L3; Tue, 20 Dec 2022 10:09:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7eEp-0005TX-TS
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 10:09:04 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7eEo-0006wP-66
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 10:09:03 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 r204-20020a1c44d5000000b003d6b8e8e07fso94868wma.0
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 07:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H7KD90PYZchpne9Aw7lHfr9NCaU8ETa8IpvSSgBMwEE=;
 b=T923MM1+u5AO1dGnpi5T80qEhstbZ2BbGgBQ36U5WR5ZbYnq/luyo5/9T6TfYrc+37
 NvZxmrOrjQGqO3yJS/Tt/CcISY9X45NlurOi9P6XtZzMz0djt4v+iz9DafRLayF7n06h
 TIlH8lorDwsO2YY4h4fuToBMmh2eKhzmNVY3D2tKHLYaLowPmTYEaK4SdVGjCl+rFVa6
 wEqcI7vJwB0hkI4iWQnqJzZsPnsiiZ/A10OMEylbG1rLBi7nu1JIU6lRYfuOmRIdVm4b
 RmO7/RBXIXaAuV4TbRCagh8QVdIjXh2AAGN2b/U6ouFXYjc4rsRqK4AclQDx/Pfeqfd9
 ci8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H7KD90PYZchpne9Aw7lHfr9NCaU8ETa8IpvSSgBMwEE=;
 b=bMs77jdqFWjQKPwIsVZru7A0/GyGuXEPpfzrXCWx8nfM/1Wrm5rmElHodTBdio+041
 QK1FKJa1O9FsCKGFAV94dRETv3TMMItyMEo6mTA167wLymDmpiX3cUA08+IPoQCoqDSU
 PbhPxwb1zF3umuBjC7S1TMVPuRW2kUtLb3WeHCWTVjc7G3NzEPtWsjRYK+5b09XlPQjR
 1pNWnSPfbaqb6AHzH+GXJNU1+V368PcmW5hvWUlEg1wxUdyEjPiKvB4MTh11R1QgrNKS
 HLQHXMdLmV3xDkIilIAU+YEv5XAnOkMpR+gXqRRBtKecDfblUK6P1/SVlZelAOKabFou
 MziA==
X-Gm-Message-State: ANoB5pmGUcQ/7fx8mK8ITZKAfVB+bNUSZvzjg1Kl37NbbgjtPqjs7AQw
 du+uw4wH0N5dDhKYn9ik/B4QFA==
X-Google-Smtp-Source: AA0mqf646e7PLq9p+CoJA7CfDO+1Hcwy+NJucO5IoT+mUFiDXs+j95xx2rTjGUKw6vE5FamwoMLl7Q==
X-Received: by 2002:a7b:c005:0:b0:3c6:e63d:fcfc with SMTP id
 c5-20020a7bc005000000b003c6e63dfcfcmr37931693wmb.35.1671548939991; 
 Tue, 20 Dec 2022 07:08:59 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n35-20020a05600c502300b003cffd3c3d6csm16204862wmr.12.2022.12.20.07.08.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 07:08:59 -0800 (PST)
Message-ID: <d5e1af45-9ff9-6b01-9650-bf5b960abee7@linaro.org>
Date: Tue, 20 Dec 2022 16:08:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH 00/32] Consolidate PIIX south bridges
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Eduardo Habkost <eduardo@habkost.net>,
 Ani Sinha <ani@anisinha.ca>, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20221204190553.3274-1-shentey@gmail.com>
 <20221220094738-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221220094738-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.161,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 20/12/22 15:48, Michael S. Tsirkin wrote:
> On Sun, Dec 04, 2022 at 08:05:21PM +0100, Bernhard Beschow wrote:
>> This series consolidates the implementations of the PIIX3 and PIIX4 south
>> bridges and is an extended version of [1]. The motivation is to share as much
>> code as possible and to bring both device models to feature parity such that
>> perhaps PIIX4 can become a drop-in-replacement for PIIX3 in the pc machine. This
>> could resolve the "Frankenstein" PIIX4-PM problem in PIIX3 discussed on this
>> list before.
>>
>> The series is structured as follows: First, PIIX3 is changed to instantiate
>> internal devices itself, like PIIX4 does already. Second, PIIX3 gets prepared
>> for the merge with PIIX4 which includes some fixes, cleanups, and renamings.
>> Third, the same is done for PIIX4. In step four the implementations are merged.
>> Since some consolidations could be done easier with merged implementations, the
>> consolidation continues in step five which concludes the series.
>>
>> One particular challenge in this series was that the PIC of PIIX3 used to be
>> instantiated outside of the south bridge while some sub functions require a PIC
>> with populated qemu_irqs. This has been solved by introducing a proxy PIC which
>> furthermore allows PIIX3 to be agnostic towards the virtualization technology
>> used (KVM, TCG, Xen). Due to consolidation PIIX4 gained the proxy PIC as well.
>>
>> Another challenge was dealing with optional devices where Peter already gave
>> advice in [1] which this series implements.
>>
>> A challenge still remains with consolidating PCI interrupt handling. There are
>> still board-specific piix3_pci_slot_get_pirq() and piix4_pci_slot_get_pirq()
>> which are implemented in isa/piix.c. Any advice how to resolve these would be
>> highly appreaciated. See [2] for details.
>>
>> Last but not least there might be some opportunity to consolidate VM state
>> handling, probably by reusing the one from PIIX3. Since I'm not very familiar
>> with the requirements I didn't touch it so far.
>>
>> Testing done:
>> * make check
>> * make check-avocado
>> * Boot live CD:
>>    * `qemu-system-x86_64 -M pc -m 2G -accel kvm -cpu host -cdrom manjaro-kde-21.3.2-220704-linux515.iso`
>>    * `qemu-system-x86_64 -M q35 -m 2G -accel kvm -cpu host -cdrom manjaro-kde-21.3.2-220704-linux515.iso`
>> * 'qemu-system-mips64el -M malta -kernel vmlinux-3.2.0-4-5kc-malta -hda debian_wheezy_mipsel_standard.qcow2 -append "root=/dev/sda1 console=ttyS0"`
>>
>> v3:
>> - Introduce one TYPE_ICH9_USB_UHCI(fn) rather than several TYPE_ICH9_USB_UHCIx (Philippe)
>> - Make proxy PIC generic (Philippe)
>> - Track Malta's PIIX dependencies through KConfig
>> - Rebase onto Philippe's 'hw/isa/piix4: Remove MIPS Malta specific bits' series [3]
>> - Also rebase onto latest master to resolve merge conflicts. This required copying
>>    Philippe's series as first three patches - please ignore.
> 
> So IIUC, you are waiting for Philippe to respin his series then
> you can include it all in v4, right?
Correct. And mine is waiting for few more R-b tags. If you can Ack
this series, no need for v4 and I can pick it via mips-next once the
rest is ready (before Xmas I hope).

Regards.

Phil.

