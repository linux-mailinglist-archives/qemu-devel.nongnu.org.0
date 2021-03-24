Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BBC347B0A
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 15:45:53 +0100 (CET)
Received: from localhost ([::1]:58110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP4lX-0006lo-Kv
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 10:45:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lP4aK-0000x4-C0
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:34:12 -0400
Received: from mx2.suse.de ([195.135.220.15]:44018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lP4aI-0000ec-8T
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:34:11 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4C538AE20;
 Wed, 24 Mar 2021 14:34:08 +0000 (UTC)
Subject: Re: [RFC v11 30/55] target/arm: wrap call to aarch64_sve_change_el in
 tcg_enabled()
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323154639.23477-23-cfontana@suse.de> <87eeg5iivn.fsf@linaro.org>
 <1ba15970-749a-27c5-ef72-6468b5501f46@suse.de> <87blb8ixmw.fsf@linaro.org>
 <878s6cixg2.fsf@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <0d3378f7-03a0-58bb-445f-bbb174de65f8@suse.de>
Date: Wed, 24 Mar 2021 15:34:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <878s6cixg2.fsf@linaro.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/21 12:48 PM, Alex Bennée wrote:
> 
> Alex Bennée <alex.bennee@linaro.org> writes:
> 
>> Claudio Fontana <cfontana@suse.de> writes:
>>
>>> On 3/23/21 11:50 PM, Alex Bennée wrote:
> <snip>
>> Moving up the build chain to the revert I now get:
>>
>>   ./qemu-system-aarch64 -M virt,gic=host -cpu host -accel kvm -m 2048
>> -net none -nographic -kernel
>> ~/lsrc/linux.git/builds/arm64.virt/arch/arm64/boot/Image -append
>> "panic=-1"
>>   --no-reboot
>>   qemu-system-aarch64: Property 'virt-6.0-machine.gic' not found


I think I am seeing this on master too, can you check?

 ./qemu-system-aarch64 -M virt,gic=host -cpu host -accel kvm -m 2048 -net none -nographic -drive if=pflash,format=raw,file=/home/cfontana/QEMU_EFI.img  -drive if=pflash,file=/home/cfontana/varstore.img -drive if=virtio,file=/home/cfontana/debian.img -drive if=virtio,format=raw,file=/home/cfontana/debian-10.8.0-arm64-netinst.iso

qemu-system-aarch64: Property 'virt-6.0-machine.gic' not found


> 
> PEBKAC:
> 
> The proper command line is "-M virt,gic-version=host"
> 


