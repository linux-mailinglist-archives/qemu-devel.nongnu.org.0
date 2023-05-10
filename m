Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B1D6FDDA8
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 14:23:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwipV-0002N8-41; Wed, 10 May 2023 08:22:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pwipK-0002A3-M0
 for qemu-devel@nongnu.org; Wed, 10 May 2023 08:21:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pwipG-0007eM-M4
 for qemu-devel@nongnu.org; Wed, 10 May 2023 08:21:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683721305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/ZP1ir0K2/3h2pDYUILt03s5EyLCLTaoKWvVgaAUIwg=;
 b=HaJNEX9RQ2UEihy3WyqUpc1TB6M7BYTdaEOX1H1Tjo4wI1UsRCXwvzC76LhaWFoIZ4Vt4l
 F1xISjY4mTIAtegEpQqv8plKo3TAKH1foxYWl8ZLVor/79hjRDLRp0v/hv6aml6HhH3jxV
 bB60C9N01PT/mknEJUn7xiuY52XYi4U=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-aaF-G6GANYeUdagYoSkHdg-1; Wed, 10 May 2023 08:21:44 -0400
X-MC-Unique: aaF-G6GANYeUdagYoSkHdg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f42b226871so8368615e9.0
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 05:21:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683721303; x=1686313303;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/ZP1ir0K2/3h2pDYUILt03s5EyLCLTaoKWvVgaAUIwg=;
 b=km3tcHQBmLX0L9maVBKG5kh3W4gqZggWu5m1vR3X9HSCdIQttCJRekzmgO7MIqTyhs
 I4RanuDcNKACxdRolKPYtCjEKNBd89O8PEU6TM9NUQkoI50aP5Iit3ofOzyKaWs59OJ9
 WAqSYyhvHpkFBENWVuxY3AffG0kZtvzlXbgYOdQ2r80vQj0TZa51G7cnZlaclCLV71nW
 KPMPwgwNLpfKnOLS3AMP3i3T2RlxpORoTr3LqGs8q+RwfFuQGyTU1P+e+npeYIdNTbEL
 O6UoYDo1WxVkXCVMv+3IwuoisyDlV2oZU/WLvk6eu7PZds1pJo1+53Lv6vDuCN38c7QJ
 Jxmw==
X-Gm-Message-State: AC+VfDwa0j6nBhEZUUiEdL52JE6YTArp5SFAk2axLq/mW8Mc1EpokFIU
 I1eCIe65yLAlmuRkWIwoMgZGo3Gt54cv9WdLo25a7/sLvnT9FmnNcxcH0W2mA7c8BgYDFOG/Iu8
 cV2TDwfpcI2rEHsRTOJyhGTM=
X-Received: by 2002:a1c:f209:0:b0:3f1:92aa:4eb8 with SMTP id
 s9-20020a1cf209000000b003f192aa4eb8mr11734164wmc.16.1683721303243; 
 Wed, 10 May 2023 05:21:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5OE3PXdAzvNpI+JCkNMU1j4LSnN3QkIoH0XlLF0uMzl5/cKCNsnaH8rCxcs8R2M2In2l97Qg==
X-Received: by 2002:a1c:f209:0:b0:3f1:92aa:4eb8 with SMTP id
 s9-20020a1cf209000000b003f192aa4eb8mr11734150wmc.16.1683721302968; 
 Wed, 10 May 2023 05:21:42 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-53.web.vodafone.de.
 [109.43.179.53]) by smtp.gmail.com with ESMTPSA id
 f12-20020a7bc8cc000000b003f4e4b5713esm32298wml.37.2023.05.10.05.21.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 05:21:42 -0700 (PDT)
Message-ID: <1b3f4f59-4773-014c-1c8e-e300d14b1d2e@redhat.com>
Date: Wed, 10 May 2023 14:21:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>
Cc: qemu-devel@nongnu.org, maobibo@loongson.cn
References: <20230427211013.2994127-1-alxndr@bu.edu>
 <20230427211013.2994127-2-alxndr@bu.edu> <ZEt/3RwtL/jePTTv@redhat.com>
 <828514c6-44f0-32f0-1eb1-a49f21617585@redhat.com>
 <20230428091159.haydefdtq4m6z2tz@mozz.bu.edu>
 <b151ecf7-0544-86ac-a182-1112a4dd7dca@redhat.com>
 <c01a2b87-27be-e92a-3a5b-d561eadbc516@loongson.cn>
 <981cdcd7-7326-08f0-9882-e66840175205@redhat.com>
 <c4919eb6-74f1-7699-f924-6917cdf435bb@loongson.cn>
 <faa1c6e0-abc2-f108-cc25-2b2cf71bd3d0@redhat.com>
 <a5a05af5-bf26-ad10-f866-230e4525881f@loongson.cn>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v10 1/8] memory: prevent dma-reentracy issues
In-Reply-To: <a5a05af5-bf26-ad10-f866-230e4525881f@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.251, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/05/2023 11.02, Song Gao wrote:
> Hi, Thomas
> 
> 在 2023/5/8 下午9:12, Thomas Huth 写道:
>>
>>>> Oh, another spot that needs special handling ... I see Alexander already 
>>>> sent a patch (thanks!), but anyway, this is a good indication that we're 
>>>> missing some test coverage in the CI.
>>>>
>>>> Are there any loongarch kernel images available for public download 
>>>> somewhere? If so, we really should add an avocado regression test for 
>>>> this - since as far as I can see, we don't have any  tests for loongarch 
>>>> in tests/avocado yet?
>>>>
>>> we can get  some binarys  at:
>>> https://github.com/yangxiaojuan-loongson/qemu-binary
>> >
>>> I'm not sure that avacodo testing can be done using just the kernel.
>>>
>>> Is a full loongarch system required?
>>
>> No, you don't need a full distro installation, just a kernel with ramdisk 
>> (which is also available there) is good enough for a basic test, e.g. just 
>> check whether the kernel boots to a certain point is good enough to 
>> provide a basic sanity test. If you then can also get even into a shell 
>> (of the ramdisk), you can check some additional stuff in the sysfs or 
>> "dmesg" output, see for example tests/avocado/machine_s390_ccw_virtio.py 
>> which does such checks with a kernel and initrd on s390x.
>>
>>
> I have a few questions.
> 
> I run ' make check-avocado 
> AVOCADO_TESTS=./tests/avocado/machine_s390_ccw_virtio.py V=1'
> 
> root@loongson-KVM:~/work/qemu#make check-avocado 
> AVOCADO_TESTS=./tests/avocado/machine_s390_ccw_virtio.py V=1
> changing dir to build for make "check-avocado"...
> make[1]: Entering directory '/root/work/qemu/build'
> (GIT="git" "/root/work/qemu/scripts/git-submodule.sh" update ui/keycodemapdb 
> meson tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 dtc)
> /root/work/qemu/build/tests/venv/bin/python3 -m avocado vmimage get 
> --distro=fedora --distro-version=31 --arch=s390x
> The image was downloaded:
> Provider Version Architecture File
> fedora   31      s390x 
> /root/avocado/data/cache/by_location/8ee06cba5485a58b2203c2c000d6d2ff6da0f040/Fedora-Cloud-Base-31-1.9.s390x.qcow2
> /root/work/qemu/build/tests/venv/bin/python3 -m avocado --show=app run 
> --job-results-dir=/root/work/qemu/build/tests/results 
> --filter-by-tags-include-empty --filter-by-tags-include-empty-key 
> --max-parallel-tasks 1 -t arch:loongarch64 -t arch:s390x --failfast 
> ./tests/avocado/machine_s390_ccw_virtio.py
> ...
> 
> This test downloaded   'Fedora-Cloud-Base-31-1.9.s390x.qcow2' image.
> but we don't have a  'Fedora-Cloud-Base-31-1.9.loongarch.qcow2' image.
> 
> Am I missing something?

Hmm, that image is not required for those tests... not sure why they get 
downloaded here... I think something in 
tests/avocado/avocado_qemu/__init__.py or in tests/Makefile.include tries to 
download the cloudinit stuff in advance for other tests, but it is certainly 
unrelated to the machine_s390_ccw_virtio.py test that only uses a kernel and 
initrd.

I think you can ignore that (unless there is an error since it's trying to 
download the loongarch Cloud-Base image - then that's a bug).

> One more question,    How to get the 'kernel_hash' and 'initrd_hash'?

I think it's a SHA1 hash by default, so you can for example get it with the 
"sha1sum" tool on the command line.

But seems like it is also possible to specify different algorithms with the 
"algorithm=..." parameter of fetch_asset().

  HTH,
   Thomas


