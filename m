Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B7F6FEE15
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:55:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px23u-0001ah-Jv; Thu, 11 May 2023 04:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1px23p-0001aL-Pl
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:54:06 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1px23m-0002pw-9K
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:54:05 -0400
Received: from loongson.cn (unknown [10.20.42.57])
 by gateway (Coremail) with SMTP id _____8BxqOkirVxkHrEHAA--.13133S3;
 Thu, 11 May 2023 16:53:55 +0800 (CST)
Received: from [10.20.42.57] (unknown [10.20.42.57])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxKL0grVxkxoNVAA--.21201S3; 
 Thu, 11 May 2023 16:53:53 +0800 (CST)
Subject: Re: [PATCH v10 1/8] memory: prevent dma-reentracy issues
To: Thomas Huth <thuth@redhat.com>
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
 <1b3f4f59-4773-014c-1c8e-e300d14b1d2e@redhat.com>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <d883eaaa-96e7-3cd9-9226-76a1fee874d8@loongson.cn>
Date: Thu, 11 May 2023 16:53:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1b3f4f59-4773-014c-1c8e-e300d14b1d2e@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8BxKL0grVxkxoNVAA--.21201S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxXF45KF1kAw47JrW3KFyDKFg_yoWrXrykp3
 yYyF1Ykrs3JF10yryvkwnFgrya9FyDGa45X3W5Jr48CFZ0yFW2gr4xtr18uasFqw4rW3WI
 v3y0va9Ig3Z8taUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bI8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
 x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
 e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
 IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4U
 McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487Mx
 AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
 Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwI
 xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8
 JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
 C2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUzsqWUUUUU
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.251,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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



在 2023/5/10 下午8:21, Thomas Huth 写道:
> On 10/05/2023 11.02, Song Gao wrote:
>> Hi, Thomas
>>
>> 在 2023/5/8 下午9:12, Thomas Huth 写道:
>>>
>>>>> Oh, another spot that needs special handling ... I see Alexander 
>>>>> already sent a patch (thanks!), but anyway, this is a good 
>>>>> indication that we're missing some test coverage in the CI.
>>>>>
>>>>> Are there any loongarch kernel images available for public 
>>>>> download somewhere? If so, we really should add an avocado 
>>>>> regression test for this - since as far as I can see, we don't 
>>>>> have any  tests for loongarch in tests/avocado yet?
>>>>>
>>>> we can get  some binarys  at:
>>>> https://github.com/yangxiaojuan-loongson/qemu-binary
>>> >
>>>> I'm not sure that avacodo testing can be done using just the kernel.
>>>>
>>>> Is a full loongarch system required?
>>>
>>> No, you don't need a full distro installation, just a kernel with 
>>> ramdisk (which is also available there) is good enough for a basic 
>>> test, e.g. just check whether the kernel boots to a certain point is 
>>> good enough to provide a basic sanity test. If you then can also get 
>>> even into a shell (of the ramdisk), you can check some additional 
>>> stuff in the sysfs or "dmesg" output, see for example 
>>> tests/avocado/machine_s390_ccw_virtio.py which does such checks with 
>>> a kernel and initrd on s390x.
>>>
>>>
>> I have a few questions.
>>
>> I run ' make check-avocado 
>> AVOCADO_TESTS=./tests/avocado/machine_s390_ccw_virtio.py V=1'
>>
>> root@loongson-KVM:~/work/qemu#make check-avocado 
>> AVOCADO_TESTS=./tests/avocado/machine_s390_ccw_virtio.py V=1
>> changing dir to build for make "check-avocado"...
>> make[1]: Entering directory '/root/work/qemu/build'
>> (GIT="git" "/root/work/qemu/scripts/git-submodule.sh" update 
>> ui/keycodemapdb meson tests/fp/berkeley-testfloat-3 
>> tests/fp/berkeley-softfloat-3 dtc)
>> /root/work/qemu/build/tests/venv/bin/python3 -m avocado vmimage get 
>> --distro=fedora --distro-version=31 --arch=s390x
>> The image was downloaded:
>> Provider Version Architecture File
>> fedora   31      s390x 
>> /root/avocado/data/cache/by_location/8ee06cba5485a58b2203c2c000d6d2ff6da0f040/Fedora-Cloud-Base-31-1.9.s390x.qcow2
>> /root/work/qemu/build/tests/venv/bin/python3 -m avocado --show=app 
>> run --job-results-dir=/root/work/qemu/build/tests/results 
>> --filter-by-tags-include-empty --filter-by-tags-include-empty-key 
>> --max-parallel-tasks 1 -t arch:loongarch64 -t arch:s390x --failfast 
>> ./tests/avocado/machine_s390_ccw_virtio.py
>> ...
>>
>> This test downloaded   'Fedora-Cloud-Base-31-1.9.s390x.qcow2' image.
>> but we don't have a  'Fedora-Cloud-Base-31-1.9.loongarch.qcow2' image.
>>
>> Am I missing something?
>
> Hmm, that image is not required for those tests... not sure why they 
> get downloaded here... I think something in 
> tests/avocado/avocado_qemu/__init__.py or in tests/Makefile.include 
> tries to download the cloudinit stuff in advance for other tests, but 
> it is certainly unrelated to the machine_s390_ccw_virtio.py test that 
> only uses a kernel and initrd.
>
> I think you can ignore that (unless there is an error since it's 
> trying to download the loongarch Cloud-Base image - then that's a bug).
>
Yes,   we can ignore,  no error.
>> One more question,    How to get the 'kernel_hash' and 'initrd_hash'?
>
> I think it's a SHA1 hash by default, so you can for example get it 
> with the "sha1sum" tool on the command line.
>
> But seems like it is also possible to specify different algorithms 
> with the "algorithm=..." parameter of fetch_asset().
>
Thanks for you help.

And
Should we need add  '  @skipIf(os.getenv('GITLAB_CI'), 'Running on 
GitLab')' ?

I see some tests add this.

Thanks.
Song Gao


