Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0EB3BD95F
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 17:05:56 +0200 (CEST)
Received: from localhost ([::1]:37154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0me3-0007cV-PR
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 11:05:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0mVX-0003AO-NQ
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 10:57:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0mVV-00018v-Nv
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 10:57:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625583425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xH1hgCWglWfDdObzlq2eaxilTLMnevWnSnF+PIi6Igo=;
 b=OH+2wuZseq+iXyg+Vk1EoDqn8ourQ7OjogRSDcQVLDRL1ErYqdpVbXCn0JKULGBf6VrsyN
 4buFqG2QagTmHA9LJJfWJ8edW9Zh+nhL2maGQiL4AAjXm926NZC2MbF3TTrJki9YIe/YVY
 QYTY+cWaqrFaQA/i+y9jAChIadD9DoA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-s_MO_rDPMiGUGYYRxSijlQ-1; Tue, 06 Jul 2021 10:57:03 -0400
X-MC-Unique: s_MO_rDPMiGUGYYRxSijlQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 i17-20020a5d43910000b02901258b767ad5so7258961wrq.2
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 07:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xH1hgCWglWfDdObzlq2eaxilTLMnevWnSnF+PIi6Igo=;
 b=Ga/USbV47Pu0KAYgvei0brbsVXgpMND1yUuKIHZI2eLIhgaOr9jYmpVljSmaSN/5jr
 fOZSh8sb2kz26VUB2UvWonlSzSyynoVB7DyBgMzupcQeSbeMZ3PC9fOBCdo2+i+VyVEd
 Q6UTDVA1ijclAnzt3qQL2gHBRW+FQskGjqQL53350t4iCm/Rk2BWoEeX3/HCGdrXfiO7
 5H6T5Ygayz1FGHDZG8/WB8Shv/coOX9tzDkID+19NBhpDB2btOV12nxlrluLvJYpHFtW
 6KHquobfWBgSnlQoXz/7+VJjQD5YeimfmJEAc8cNXwZqvMM16Y4pV3LBcD23QSGBB+Kx
 PTGA==
X-Gm-Message-State: AOAM533c7BFv3hgmeY9KGO4590dVVI/if+begZCi8A84hn4HUs+L0rGR
 3OyAZcVTNW8MB6rhsuBgpkAxPUs81GL7F03uQiPtQRA/xOxwK8DOQKfcL3h5qx5FLuLk9Xl+/vj
 WQAe3kosTeXb3wDE=
X-Received: by 2002:a1c:730d:: with SMTP id d13mr1259995wmb.129.1625583422408; 
 Tue, 06 Jul 2021 07:57:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBoEI3HLqXd6CBQ9KNbyJyGIcR70pSeVjk8DKm0EnlMTxdX/jWERDh1eZdMcr8eS5OMdUTXQ==
X-Received: by 2002:a1c:730d:: with SMTP id d13mr1259977wmb.129.1625583422220; 
 Tue, 06 Jul 2021 07:57:02 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id k5sm17395991wmk.11.2021.07.06.07.57.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 07:57:01 -0700 (PDT)
Subject: Re: [PATCH v5 3/4] avocado_qemu: Add SMMUv3 tests
To: Willian Rampazzo <wrampazz@redhat.com>
References: <20210706131729.30749-1-eric.auger@redhat.com>
 <20210706131729.30749-4-eric.auger@redhat.com>
 <cc5d8c32-4014-96aa-73cd-da0c4d41a59a@redhat.com>
 <43273a56-8deb-3db5-2a90-96f508b3a2d4@redhat.com>
 <c15f5c68-0580-84c4-3ed6-eaa29aa6d036@redhat.com>
 <CAKJDGDYQMXU6xOD6OOoHCyV1z_hUoWQZzsVQ5XefkcwUsG2eZw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4fd308aa-60e5-7052-2cd0-85145490b09d@redhat.com>
Date: Tue, 6 Jul 2021 16:55:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAKJDGDYQMXU6xOD6OOoHCyV1z_hUoWQZzsVQ5XefkcwUsG2eZw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, Wainer Moschetta <wainersm@redhat.com>,
 Cleber Rosa Junior <crosa@redhat.com>, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/6/21 4:39 PM, Willian Rampazzo wrote:
> On Tue, Jul 6, 2021 at 11:25 AM Philippe Mathieu-Daudé
> <philmd@redhat.com> wrote:
>>
>> On 7/6/21 3:57 PM, Eric Auger wrote:
>>> Hi Philippe,
>>>
>>> On 7/6/21 3:34 PM, Philippe Mathieu-Daudé wrote:
>>>> On 7/6/21 3:17 PM, Eric Auger wrote:
>>>>> Add new tests checking the good behavior of the SMMUv3 protecting
>>>>> 2 virtio pci devices (block and net). We check the guest boots and
>>>>> we are able to install a package. Different guest configs are tested:
>>>>> standard, passthrough an strict=0. This is tested with both fedora 31 and
>>>>> 33. The former uses a 5.3 kernel without range invalidation whereas the
>>>>> latter uses a 5.8 kernel that features range invalidation.
>>>>>
>>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
>>>>> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
>>>>> Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
>>>>>
>>>>> ---
>>>>>
>>>>> v4 -> v5:
>>>>> - Added the skipIf statement (William) and William's R-b
>>>>> - added Wainer's R-b and T-b
>>>>> ---
>>>>>  tests/acceptance/smmu.py | 133 +++++++++++++++++++++++++++++++++++++++
>>>>>  1 file changed, 133 insertions(+)
>>>>>  create mode 100644 tests/acceptance/smmu.py
>>>>> +    def run_and_check(self):
>>>>> +        if self.kernel_path:
>>>>> +            self.vm.add_args('-kernel', self.kernel_path,
>>>>> +                             '-append', self.kernel_params,
>>>>> +                             '-initrd', self.initrd_path)
>>>>> +        self.launch_and_wait()
>>>> IIUC above is the 'run' part and below is the 'check' part?
>>>>
>>>> So the check succeed if the VM booted, right?
>>>>
>>>>> +        self.ssh_command('cat /proc/cmdline')
>>>>> +        self.ssh_command('dnf -y install numactl-devel')
>>>
>>> For the test to succeed, the guests needs to boot, the ssh connection
>>> needs to be established and  the dnf command needs to complete.
>>> See launch_and_wait() in __init__.py
>>
>> OK. I see the Test class provide a .fail() method:
>>
>>   fail(msg=None)
>>
>>     Signals a test failure unconditionally, with msg or None
>>     for the error message.
>>
>> but no .succeed() one...
>>
>> Willian: Should we add a comment here mentioning the test
>> succeeded by that point? Would it be more explicit to add
>> .succeed() in avocado.Test or avocado_qemu.Test?
>>
> 
> If the test does not fail, it will succeed anyway.
> 
> I miss some assert statements in this test, telling what is really
> tested, but as it won't run on CI, I don't see a problem adding it now
> and extending it later.

Sure, but a one-line comment can be easily added by the maintainer
taking this series ;)


