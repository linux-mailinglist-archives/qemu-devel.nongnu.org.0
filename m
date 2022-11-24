Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D67656373CE
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 09:22:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oy7TR-0005hY-Sl; Thu, 24 Nov 2022 03:20:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oy7TQ-0005hI-Ji
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 03:20:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oy7TO-0003hO-G9
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 03:20:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669278041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KklJVaqD0RCrAlGnGAVkHyB4UIiN7PDvnpgmRj+Fz3A=;
 b=ftNFU9XS1dMDUyJcOPeyOLu/+xoKPcnj307DykQChUEGhjnB3Wkhszy8gPmLQ9MKz+46wu
 tatRIzNpMXpjNljXPYaMxDzIr4lmnw1Yipgp6slkewP//4FP3ER4PYUufdk0rvLc+Y+Anp
 XEpDUugRydFfPzXWOoi9NQ8lnNQPsvg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-580-qThkzEp9MMa6K_hbYj8SUA-1; Thu, 24 Nov 2022 03:20:39 -0500
X-MC-Unique: qThkzEp9MMa6K_hbYj8SUA-1
Received: by mail-wr1-f71.google.com with SMTP id
 k7-20020adfc707000000b002416f2e9ad5so184217wrg.6
 for <qemu-devel@nongnu.org>; Thu, 24 Nov 2022 00:20:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KklJVaqD0RCrAlGnGAVkHyB4UIiN7PDvnpgmRj+Fz3A=;
 b=vYpw6LfxsqZVkEBu2Uwqqp5Mdksuv1fPlFoJ7Rock4cpeuszBEjupMq2NgV9pdTkyP
 07CG9rRbDCJDdDdHBsIFqk0zFAenqTW3uZlhVjA1VLvzN+AVHIRkv4gQgezrkYY6IpsV
 zjmuNCVbip9/YzNyH+mrY93HAkcUwcxfEwFvPK9ddtfcClrZqL6NHw6C1c4djkm8f5hX
 7AqDxioaiGTcUQho17skq+yxPk2yFDgUcVfoKjR08jgJnFov0UUl++4mxyLdpCcGljRd
 v9btDEJYehTffo+Lc79Cg6KtGze7y7Qb30+DntPUQC1HMA46ChzwIyXIqRs1dgzORTUw
 mNWw==
X-Gm-Message-State: ANoB5pmhAFf8hiHLrhTDliPyooIX97Yn639Z3VhBpTzWXKFltgvH55XM
 RRRZ/P1S1o21Z0qE4Q19V1gGdXyDdqLHOMjdBoI3qODsDIbBcC4eVnhpOYvinaframRmhHrwuan
 FFY8FW7TKa/Xur7A=
X-Received: by 2002:a05:600c:3d18:b0:3cf:b7bf:352d with SMTP id
 bh24-20020a05600c3d1800b003cfb7bf352dmr14813213wmb.106.1669278038780; 
 Thu, 24 Nov 2022 00:20:38 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7CYEm0nSlPechZSPc+JFPFcS/59CwvTC5aFNpBI4hgjzqYZeb+qrcEFJOMs0QVlqaJnDQNmA==
X-Received: by 2002:a05:600c:3d18:b0:3cf:b7bf:352d with SMTP id
 bh24-20020a05600c3d1800b003cfb7bf352dmr14813200wmb.106.1669278038528; 
 Thu, 24 Nov 2022 00:20:38 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-177-190.web.vodafone.de.
 [109.43.177.190]) by smtp.gmail.com with ESMTPSA id
 10-20020a05600c228a00b003c6b70a4d69sm807100wmf.42.2022.11.24.00.20.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Nov 2022 00:20:37 -0800 (PST)
Message-ID: <be6d895d-1693-32ab-580f-e630fab82e97@redhat.com>
Date: Thu, 24 Nov 2022 09:20:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Cleber Rosa
 <crosa@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20221118113309.1057790-1-alex.bennee@linaro.org>
 <8c4b6387-450d-88af-c1d4-3171a9c3067b@linaro.org>
 <8f6f531f-3ed9-6a14-9ad6-8c0ff6b32c22@redhat.com> <87fse9bvmf.fsf@linaro.org>
 <504f6645-5315-74c5-623d-d8bf231aec09@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH] tests/avocado: use new rootfs for orangepi test
In-Reply-To: <504f6645-5315-74c5-623d-d8bf231aec09@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 23/11/2022 19.13, Philippe Mathieu-Daudé wrote:
> On 23/11/22 15:12, Alex Bennée wrote:
>> Thomas Huth <thuth@redhat.com> writes:
>>> On 23/11/2022 12.15, Philippe Mathieu-Daudé wrote:
>>>> On 18/11/22 12:33, Alex Bennée wrote:
>>>>> The old URL wasn't stable. I suspect the current URL will only be
>>>>> stable for a few months so maybe we need another strategy for hosting
>>>>> rootfs snapshots?
>>>>>
>>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>>> ---
>>>>>    tests/avocado/boot_linux_console.py | 4 ++--
>>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/tests/avocado/boot_linux_console.py
>>>>> b/tests/avocado/boot_linux_console.py
>>>>> index 4c9d551f47..5a2923c423 100644
>>>>> --- a/tests/avocado/boot_linux_console.py
>>>>> +++ b/tests/avocado/boot_linux_console.py
>>>>> @@ -793,8 +793,8 @@ def test_arm_orangepi_sd(self):
>>>>>            dtb_path =
>>>>> '/usr/lib/linux-image-current-sunxi/sun8i-h3-orangepi-pc.dtb'
>>>>>            dtb_path = self.extract_from_deb(deb_path, dtb_path)
>>>>>            rootfs_url =
>>>>> ('http://storage.kernelci.org/images/rootfs/buildroot/'
>>>>> -                      'kci-2019.02/armel/base/rootfs.ext2.xz')
>>>>> -        rootfs_hash = '692510cb625efda31640d1de0a8d60e26040f061'
>>>>> +                      
>>>>> 'buildroot-baseline/20221116.0/armel/rootfs.ext2.xz')
>>>>> +        rootfs_hash = 'fae32f337c7b87547b10f42599acf109da8b6d9a'
>>>> If Avocado doesn't find an artifact in its local cache, it will fetch it
>>>> from the URL.
>>>> The cache might be populated with artifacts previously downloaded, but
>>>> their URL is not valid anymore (my case for many tests).
>>>> We can also add artifacts manually, see [1].
>>>> I'd rather keep pre-existing tests if possible, to test older
>>>> (kernel / user-space) images. We don't need to run all the tests all
>>>> the time:
>>>> tests can be filtered by tags (see [2]).
>>>> My preference here is to refactor this test, adding the
>>>> "kci-2019.02"
>>>> and "baseline-20221116.0" releases. I can prepare the patch if you /
>>>> Thomas don't object.
>>>
>>> IMHO we shouldn't keep tests in the upstream git repository where the
>>> binaries are not available in public anymore. They won't get run by
>>> new contributors anymore, and also could vanish from the disks of the
>>> people who previously downloaded it, once they wipe their cache or
>>> upgrade to a new installation, so the test code will sooner or later
>>> be bitrotting. But if you want to keep the tests around on your hard
>>> disk, you could also stick the test in a local branch on your hard
>>> disk instead.
>>
>> CI/Workstation splits aside I tend to agree with Thomas here that having
>> tests no one else can run will lead to an accretion of broken tests.
> 
> Following this idea, should we remove all boards for which no open
> source & GPL software is available?

That's certainly a different topic... but I see where you're heading to.

My point here is rather: There is an alternative, newer version of the 
kernel available which can be used to test the same thing. The older version 
disappeared from the net, so why should we bother trying to keep that test 
with that version supported if there is a newer version available?

And for things like firmware images and ISOs, some people still have the 
hardware and CD-ROMs around, or you could buy them second hand, so there is 
indeed a point in having tests for such systems. But for this old kernel 
here? How is somebody supposed to run the test if they didn't download it 
before it disappeared?

If you feel that there is really a benefit for keeping it around, then fine, 
please submit a patch that restores the test with the old kernel. But then 
please also add a comment how to get the kernel if necessary. ... well, 
maybe we just need an owner for the test ... thinking about it twice, I 
think that's what bothered me most about this: It's a test in 
boot_linux_console.py so there is no clear maintainer who could be asked 
about it if it bitrots when the binary is not available. Thus please put it 
into a different file with an entry in MAINTAINERS if you restore it.

So maybe the rule should be: Tests with files that are not publicly 
available in the internet are OK if they have a clear maintainer who could 
be asked about the state if necessary. Tests without available files and 
without maintainer are just too prone to bitrot in the future.

  Thomas


