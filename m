Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C70B588575
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 03:36:01 +0200 (CEST)
Received: from localhost ([::1]:35184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJ3Il-0003a3-Nq
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 21:35:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oJ3HA-00027X-RX
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 21:34:20 -0400
Received: from mga17.intel.com ([192.55.52.151]:63818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oJ3H8-0006OE-1F
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 21:34:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659490458; x=1691026458;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=LY+BQ5RS3FYLJAF7UCk7h13Q8stwZrHCOw0J7Sh7mes=;
 b=PvRQ/O88Ygu4gH/zHuPB8lvCmFlrd6bD7fJpVDj4tadB4cAAkfyowYb/
 O1nDtpHVsXK1ywfebqyt5cmm5fmDK+w6FoJaDkemkIQ6yv5tbr88hJLCh
 wbQ9TnP65f+1RyWZU9aMW76oLpEsNFZ1CRhcNw4AHQzZr53tJTWsUvq5l
 NafdJESRheRTdC3AwfHMEDV0R82bmsD5RXEHAo6HieZnshpHX/wuuCVE/
 2XOzoiadeEA63PHE2bKPjb4gzCHfMxDssrw6R0eup2OwL2DTdrVMMi/QA
 wuKKDNslhRLQSzmhT76676+WxB5JwsRo4d3wdkALHH0s+7iPQVNtb2Qfk g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="269937782"
X-IronPort-AV: E=Sophos;i="5.93,212,1654585200"; d="scan'208";a="269937782"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 18:34:14 -0700
X-IronPort-AV: E=Sophos;i="5.93,212,1654585200"; d="scan'208";a="578445203"
Received: from jiehuanc-mobl1.ccr.corp.intel.com (HELO [10.255.31.193])
 ([10.255.31.193])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 18:34:11 -0700
Message-ID: <b01b62aa-dbeb-75e6-0798-565060b34908@intel.com>
Date: Wed, 3 Aug 2022 09:34:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PULL 9/9] hw/i386: pass RNG seed via setup_data entry
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=83=c2=a9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, "Michael S . Tsirkin" <mst@redhat.com>
References: <20220721163621.761513-1-pbonzini@redhat.com>
 <20220721163621.761513-10-pbonzini@redhat.com>
 <dae86884-6cfa-a428-374c-60c42900aade@intel.com> <Yukk0YOFgkPwcTzG@zx2c4.com>
 <a3ddd211-a569-4348-c3bb-2ff509fd6ccf@intel.com> <Yuk9a0v+CNnzAX37@zx2c4.com>
 <CAHmME9qDNmX7TYio3TxgP_xFL1LGUoKrT6w=OG_1c688ZSdvKg@mail.gmail.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <CAHmME9qDNmX7TYio3TxgP_xFL1LGUoKrT6w=OG_1c688ZSdvKg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=xiaoyao.li@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/2/2022 11:13 PM, Jason A. Donenfeld wrote:
> Hi Xiaoyao,
> 
> On Tue, Aug 2, 2022 at 5:06 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>>
>> Hi Xiaoyao,
>>
>> On Tue, Aug 02, 2022 at 10:53:07PM +0800, Xiaoyao Li wrote:
>>> yes, with >= 7.1, pcmc->legacy_no_rng_seed = false by default, and RNG
>>> seed is used.
>>
>> This is intended behavior. Being on by default is basically the whole
>> point of it. Otherwise it's useless.
>>
>>>
>>>> Either way, this shouldn't cause boot failures.
>>>
>>> It does fail booting OVMF with #PF. Below diff can fix the #PF for me.
>>
>> Huh, interesting. Sounds like maybe there's a bug I need to fix. Can you
>> send me some repro instructions, and I'll look into it right away.
> 
> I just tried booting Fedora using OVMF and didn't have any problems. I
> used this command line:
> 
> qemu-system-x86_64 -machine q35 -enable-kvm -cpu host,-rdrand,-rdseed
> -smp cores=8 -drive file=disk.qcow2,if=virtio -net nic,model=virtio
> -net user,hostfwd=tcp::19230-:22 -m 8G -vga qxl -device
> virtio-serial-pci -device
> virtserialport,chardev=spicechannel0,name=com.redhat.spice.
> 0 -chardev spicevmc,id=spicechannel0,name=vdagent -spice
> unix,addr=/tmp/vm_spice_fedora.socket,disable-ticketing,playback-compression=off,agen
> t-mouse=on,seamless-migration,gl=on -device
> virtserialport,chardev=spicechannel1,name=org.spice-space.webdav.0
> -chardev spiceport,id=spicechan
> nel1,name=org.spice-space.webdav.0 -global
> driver=cfi.pflash01,property=secure,value=on -drive
> if=pflash,format=raw,unit=0,file=OVMF_CODE.secb
> oot.fd,readonly=on -drive if=pflash,format=raw,file=OVMF_VARS.secboot.fd
> 
> Can you tell me what you're using and give me some links with various
> images and such? Doing the straight forward thing doesn't reproduce it
> for me.

I guess the key to reproduce the issue is using "-kernel" option to load 
guest kernel with QEMU

> Thanks,
> Jason


