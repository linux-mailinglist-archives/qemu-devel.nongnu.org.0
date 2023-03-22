Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E5F6C495F
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 12:42:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pewpc-0000S7-PI; Wed, 22 Mar 2023 07:40:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pewpZ-0000RQ-Vh
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 07:40:38 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pewpX-0001oL-Gw
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 07:40:37 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 j3-20020a17090adc8300b0023d09aea4a6so23316221pjv.5
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 04:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112; t=1679485234;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ie5hqKdXDpUBu+Zai2wUk8PMp8pNJraTCidU92WCW+c=;
 b=oXF8RW0HPGo/81t1ddxL7vgOpZ2NSTYqKCfFJY5G2EAAYJS5gkiZQHChmSNi0FrNip
 GUp+g0lX1SVy4CSEVTC65j8wqyMIazME4qizP4aqLv5NVcVZF49g1SdwtS69cRxsxmme
 xakOaqt8ElYGb0Fggok1rEx0WvJwFuZQcqk76cCiYeOftBqCxINhG1tsbJBXAAfALm2X
 IduzTzl1egg1aacC7EU5lfoI7EtEge53SRg6PuzLaV41XoPEN19FIztP4J/ix/Du6dXy
 9cB+ELVJJerH8xQMuk+uIxWNFYKr5BPAWwrvcg//PyR5eVrNTFAB/EOvoVP+xeLhtxhU
 eO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679485234;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ie5hqKdXDpUBu+Zai2wUk8PMp8pNJraTCidU92WCW+c=;
 b=04rZZ7cF+srpuIhpI++mu7kViP2l0IjOPnIJX/X69RkAEIcWVex5MYwlTuBn3scX60
 ZoxRlogwOcXO/B7xTzTL03o+np45/y/XOCMBTe4HwYq3uJMctMvVUsGLjPBbeLtSBXJE
 sg1sJU4Ytq4r4U67kXNafxrgJ+wZmalz4Qm4tf8GrHqDZjfJsMdKgde9o3bSi0EXS85Z
 e2tiARZrc5p5yw6KX2UpGu02Zob6c3Pv6FXylYQN7T+OPcWEHSZ8GrHslMeML+LudUKj
 ew21kCQEWltWNrJ36JxXKPsTJkW+QKz3r5sUbFpka/Do6OB03sWM2JUM2cMVcUOvPjHy
 kSdg==
X-Gm-Message-State: AO0yUKUxvfYH3oMl7eeLB4Y1B5AbwTpVy3g4uM9Z5Iurf+/sbH5Wc+4M
 8GI126SZv7XXvhC3Ir6Tm8JRqw==
X-Google-Smtp-Source: AK7set9pvOIEE4fC5tdt+FTJK9ZaVoz1Z/mfRaE47rJ3aQqrSRcorRKnpODTVIkLwRVOJh36ApvMkg==
X-Received: by 2002:a05:6a20:c29c:b0:da:368e:7c73 with SMTP id
 bs28-20020a056a20c29c00b000da368e7c73mr4851287pzb.37.1679485233916; 
 Wed, 22 Mar 2023 04:40:33 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 i12-20020aa787cc000000b00580e3917af7sm2962162pfo.117.2023.03.22.04.40.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 04:40:33 -0700 (PDT)
Message-ID: <3bd3dd15-3b81-f198-f701-e679d6a99234@daynix.com>
Date: Wed, 22 Mar 2023 20:40:30 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH] tests/avocado: re-factor igb test to avoid timeouts
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20230321181741.3748845-1-alex.bennee@linaro.org>
 <a06b7763-04fb-60d3-be81-65585ba5c058@daynix.com> <87wn395bqf.fsf@linaro.org>
 <3571bd36-e1e3-ebea-77a6-8042856dcab2@daynix.com> <87jzz958pk.fsf@linaro.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <87jzz958pk.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1036;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On 2023/03/22 20:22, Alex Bennée wrote:
> 
> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> 
>> On 2023/03/22 19:04, Alex Bennée wrote:
>>> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
>>>
>>>> On 2023/03/22 3:17, Alex Bennée wrote:
>>>>> The core of the test was utilising "ethtool -t eth1 offline" to run
>>>>> through a test sequence. For reasons unknown the test hangs under some
>>>>> configurations of the build on centos8-stream. Fundamentally running
>>>>> the old fedora-31 cloud-init is just too much for something that is
>>>>> directed at testing one device. So we:
>>>>>      - replace fedora with a custom kernel + buildroot rootfs
>>>>>      - rename the test from IGB to NetDevEthtool
>>>>>      - re-factor the common code, add (currently skipped) tests for other
>>>>>         devices which support ethtool
>>>>>      - remove the KVM limitation as its fast enough to run in KVM or TCG
>>>>
>>>> I tried this but it seems the rootfs is corrupted:
>>>> 2023-03-22 13:53:06,728 __init__         L0153 DEBUG| EXT4-fs (sda):
>>>> INFO: recovery required on readonly filesystem
>>>> 2023-03-22 13:53:06,728 __init__         L0153 DEBUG| EXT4-fs (sda):
>>>> write access will be enabled during recovery
>>>> (snip)
>>>> 2023-03-22 13:54:24,534 __init__         L0153 DEBUG| EXT4-fs (sda):
>>>> I/O error while writing superblock
>>>> 2023-03-22 13:54:24,535 __init__         L0153 DEBUG| EXT4-fs (sda):
>>>> error loading journal
>>>> 2023-03-22 13:54:24,542 __init__         L0153 DEBUG| VFS: Cannot open
>>>> root device "sda" or unknown-block(8,0): error -5
>>> That's weird. I'm not seeing it when running here. However I can
>>> regenerate the whole thing and re-upload. Are there any other network
>>> tools worth adding?
>>
>> Only ethtool is needed for testing Intel NICs.
>>
>>>
>>>> I have a few more comments:
>>>>
>>>> - It may be possible to use microvm to trim it down further.
>>> Does microvm have PCI now? Most of the saving comes down to having a
>>> much lighter rootfs than the full cloud init of fedora. I think there is
>>> only really a syslogd and a klogd running at the start.
>>
>> microvm supports PCIe. You can enable it by specifying e.g., -M
>> microvm,pcie=on
>>
>>>
>>>> - I'm worried that having a rootfs for a single test is too costly to
>>>>     maintain. If you just want to avoid cloud-init, you can just
>>>>    specify:
>>>> init=/bin/sh
>>> Not really too bad. Buildroot makes it pretty easy. The config can
>>> be
>>> found here:
>>>     https://fileserver.linaro.org/s/Lk8z7kN3s3ds7kd
>>
>> Buildroot indeed automates everything to build rootfs, but it still
>> takes lots of time to build because it needs to build everything. It
>> also fetches sources from the origins of the packages if I understand
>> it correctly, and I'm worried that may harm the reproducibility of the
>> builds.
>>
>> These problems are not present with Fedora: you can add or replace a
>> particular component with a package (in this case ethtool is added),
>> and Fedora mirrors everything to build the binary.
> 
> It's certainly preferable to lean on the distros and their
> infrastructure although:
> 
>    - Fedora is a poor choice given the support lifetime

I don't think the lifetime matters that much as we do not care about the 
security of the VMs created during the tests.

>    - The various "full-fat" distros we run avocado tests for seem to be
>      very bloated (esp compared to my local Debian setup which boots very
>      quickly) >    - It's hard to argue with the time saving and stability improvements,
>      especially as we are limited on CI time these days
> 

You don't have to perform the normal userspace initialization the 
distribution comes with for this workload. We can just add something 
like the following to the kernel command line:
init=/bin/sh -- -c "rpm -i /path/to/ethtool.rpm && ethtool -t eth1 offline"

This is very similar to what Docker containers do. In Docker, you do not 
run daemons like systemd but directly run the application or use very 
small init.

The reason why I didn't write the tests in this way is because the 
current testing infrastructure does not have a means to provide a file 
to the guest. I think adding such functionality is much simpler than 
introducing Buildroot.

Regards,
Akihiko Odaki

