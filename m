Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8096C5A02
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 00:06:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf77D-0007HG-Vo; Wed, 22 Mar 2023 18:39:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pf77B-0007H0-B5
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:39:29 -0400
Received: from mail-ed1-f45.google.com ([209.85.208.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pf75A-0007Ky-2a
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:39:25 -0400
Received: by mail-ed1-f45.google.com with SMTP id ek18so79147365edb.6
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 15:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679524299;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MhZ4SXezWAZzDZoZpiLfNSaHWoDX3eJbhiDQ35mHpgo=;
 b=jpEDvm1KvRC6ein9JJ9YYs0gPGn27Q3h6GYvURPONzIuBkKoa7ty3IUUKrJeQGkVNK
 9n+J2k/f7pF1OAR3tPCtIrpXmesPbv8pK2K+BlAtWd3WFldDyrS9EBcanGdzh44kX/ud
 Gdwj2s6f5NYebFBf/imzWk6GDT1iTYA77s5nlJMZ9BBRSfNseQeiQROn5gJG6s+d3exb
 rJ6qq++iKEID5c970OiSRFBysqmPtaxR4ddCndAgU4GjrpMxzV1+oGZpxvZ2pBJL0vPP
 /IN1qIzjJXL6WcN2R3ZQQgKxWKy8v2PmL6wDXsDn5NzH7W1ZGNHborx2YwN6tEfHK4/f
 HHPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679524299;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MhZ4SXezWAZzDZoZpiLfNSaHWoDX3eJbhiDQ35mHpgo=;
 b=AyRqgzYle2bxiHN04NIoT4N17EDHu4ZL4DretBZhTFwcDdQmglPNtkoGVQApMdlVnu
 I1QauzyR4B+TbEL5RvEj1axivimOpRYTN6ek3eD7B6b5R5CN+wML7caNAHYu3u+lUOfX
 StsgdMlASY6e4NfLWgqUimHStg7xkZsQ8UklqH7QDukWlVuTeIFaIpfV3a5Hx9sAbKOP
 XSCH4YfIqF3kvaXdlAJHEY64feA/kEYIhno1dkGvgravJVwFP3j1uwCyrLOxcDUX5TBn
 9K+ZJnfvmfvtQPLgDkkWUeAYx2+db/H6NcYMzx3KXP1w0YFuI7r+DuesJRCjkliTJnEC
 pOfw==
X-Gm-Message-State: AO0yUKXa23YcgxsjYTMDpOxGfaaOwdZ2d3h8zyWzW5qIju9X/ek3aCCl
 0UID/f1SIi/qSJ4116r9ED+EYP4k2twh/1DOcb/qzQ==
X-Google-Smtp-Source: AK7set/fPQyTQLBTUDL0jGj6OcJIHdVw734rzD3d7ONGkvnqpDhEPWOYSFtTjTBtM8VKF2kB5Zt4bw==
X-Received: by 2002:a7b:c4d1:0:b0:3ed:4b9b:f0a1 with SMTP id
 g17-20020a7bc4d1000000b003ed4b9bf0a1mr727674wmk.27.1679522465147; 
 Wed, 22 Mar 2023 15:01:05 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.141.240])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a1c7211000000b003edf2dc7ca3sm19031wmc.34.2023.03.22.15.01.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 15:01:04 -0700 (PDT)
Message-ID: <03c0de33-d270-fdff-c62e-abadd6c32d89@linaro.org>
Date: Wed, 22 Mar 2023 23:01:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH 4/4] hw/pci: Ensure pci_add_capability() is called before
 device is realized
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jason Wang <jasowang@redhat.com>
References: <20230314111435.89796-1-philmd@linaro.org>
 <20230314111435.89796-5-philmd@linaro.org>
 <20230321221821-mutt-send-email-mst@kernel.org>
 <ba9d90c1-9fd0-e80f-a094-d7f47c932a1f@linaro.org>
In-Reply-To: <ba9d90c1-9fd0-e80f-a094-d7f47c932a1f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.208.45; envelope-from=philmd@linaro.org;
 helo=mail-ed1-f45.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On 22/3/23 09:52, Philippe Mathieu-Daudé wrote:
> On 22/3/23 03:18, Michael S. Tsirkin wrote:
>> On Tue, Mar 14, 2023 at 12:14:35PM +0100, Philippe Mathieu-Daudé wrote:
>>> PCI capabilities can't appear magically at runtime.
>>> Guests aren't expecting that. Assert all capabilities
>>> are added _before_ a device instance is realized.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   hw/pci/pci.c | 4 +++-
>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
>>> index ac41fcbf6a..ed60b352e4 100644
>>> --- a/hw/pci/pci.c
>>> +++ b/hw/pci/pci.c
>>> @@ -2397,7 +2397,7 @@ static void pci_del_option_rom(PCIDevice *pdev)
>>>    * On success, pci_add_capability() returns a positive value
>>>    * that the offset of the pci capability.
>>>    * On failure, it sets an error and returns a negative error
>>> - * code.
>>> + * code. @pdev must be unrealized.
>>>    */
>>>   int pci_add_capability(PCIDevice *pdev, uint8_t cap_id,
>>>                          uint8_t offset, uint8_t size,
>>> @@ -2406,6 +2406,8 @@ int pci_add_capability(PCIDevice *pdev, uint8_t 
>>> cap_id,
>>>       uint8_t *config;
>>>       int i, overlapping_cap;
>>> +    assert(!DEVICE(pdev)->realized);
>>> +
>>>       if (!offset) {
>>>           offset = pci_find_space(pdev, size);
>>>           /* out of PCI config space is programming error */
>>
>> Fails in CI:
>>
>> https://gitlab.com/mstredhat/qemu/-/jobs/3976974199
>>
>> qemu-system-i386: ../hw/pci/pci.c:2409: pci_add_capability: Assertion 
>> `!DEVICE(pdev)->realized' failed.
>> Broken pipe
>> ../tests/qtest/libqtest.c:193: kill_qemu() detected QEMU death from 
>> signal 6 (Aborted) (core dumped)
>> TAP parsing error: Too few tests run (expected 49, got 40)
>> (test program exited with status code -6)
> 
> Thanks for testing!
> 
> Likely the AMD-Vi device, see on the cover this series is
> Based-on: <20230313153031.86107-1-philmd@linaro.org>
>            "hw/i386/amd_iommu: Orphanize & QDev cleanups"
> https://lore.kernel.org/qemu-devel/20230313153031.86107-1-philmd@linaro.org/

I confirm this is the AMD-Vi device, so you are missing the
previous (based-on) series:

     #1 0x102d4e5b0 in pci_add_capability pci.c:2354
     #2 0x102d2ff28 in msi_init msi.c:227
     #3 0x10371a340 in amdvi_sysbus_realize amd_iommu.c:1553
     #4 0x1037194e8 in x86_iommu_realize x86-iommu.c:124
     #5 0x10409db88 in device_set_realized+0x788 
(qemu-system-i386:arm64+0x101d91b88)
     #6 0x1040cb248 in property_set_bool+0x2a0 
(qemu-system-i386:arm64+0x101dbf248)
     #7 0x1040c31f4 in object_property_set+0x4bc 
(qemu-system-i386:arm64+0x101db71f4)
     #8 0x1040d9990 in object_property_set_qobject+0x38 
(qemu-system-i386:arm64+0x101dcd990)
     #9 0x1040c40f8 in object_property_set_bool+0xfc 
(qemu-system-i386:arm64+0x101db80f8)
     #10 0x10409639c in qdev_realize+0x3bc 
(qemu-system-i386:arm64+0x101d8a39c)
     #11 0x10334f8e8 in qdev_device_add_from_qdict qdev-monitor.c:714
     #12 0x103352114 in qdev_device_add qdev-monitor.c:733
     #13 0x10337906c in device_init_func vl.c:1140
     #14 0x104a84200 in qemu_opts_foreach qemu-option.c:1135
     #15 0x103364fcc in qemu_create_cli_devices vl.c:2541
     #16 0x103364ab8 in qmp_x_exit_preconfig vl.c:2609
     #17 0x10336c0dc in qemu_init vl.c:3611
     #18 0x1040812e4 in main main.c:47
     #19 0x1a025be4c  (<unknown module>)

Due to the required base series, this is 8.1 material.

