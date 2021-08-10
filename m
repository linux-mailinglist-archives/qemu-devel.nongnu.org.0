Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F37B3E5287
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 07:03:00 +0200 (CEST)
Received: from localhost ([::1]:36318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDJul-0003Lo-MU
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 01:02:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mDJtg-0002Vk-Qq
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 01:01:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mDJte-00064Q-TZ
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 01:01:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628571709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IpwIuKkgtAvx6Kv0ldk9wAnOijNvvUBdkPhps96Oo2w=;
 b=TegkLzjdr+omXuRIBV5YmxKRry0Jxh36F85vUHmFq0Bv7/jYna7cTxY7pytNYMoX0NTv+x
 SwEcSpXBXVg2yJfmbuGgEvIEOQTf/wVYHa2ECTST2oLWeI4DXGh6ZVTznFwXXuhLw5Eu3H
 XlLjqQjLPqykV3cKMsyiB5hRCKa8RIk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-PvlnNcgQOxKLm9cfa1U1XQ-1; Tue, 10 Aug 2021 01:01:47 -0400
X-MC-Unique: PvlnNcgQOxKLm9cfa1U1XQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 85-20020a1c01580000b02902511869b403so571194wmb.8
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 22:01:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IpwIuKkgtAvx6Kv0ldk9wAnOijNvvUBdkPhps96Oo2w=;
 b=JDoDoynaRyJB1X7s++DQLItW/AIbkedSGD1FwzMXoT9q0MFTZN1DIKC+tDSRPg72Mr
 2zcnd4V3QZIxN6j6h9xDpqCi8xjz2bll42bP+9ZFaFtpPih4PcZtmwPAblZtf8x3LVut
 dIEopfFQ/VbW0vd8pwixhUEW1xo7bTSE7tYGTm/bnK1Ai44djroZvGPQaQOhT63X0v9F
 TPONHG77jpC/aLDA1QfYfbUU1XlAL631j/+6C7U3PnVAxglcXlNMAHGnpcsPpO2epV5b
 yJY0cpCptaIqVuHVPoUlbrYK3TlkvkA8k94HaHVt7t/NgyU+VZEOb0vmXEASmDZZriAV
 ixkg==
X-Gm-Message-State: AOAM533PL1yEIuwrMwUEOy5vMXNmP/ACEIGQxhdh+BFptJCVz6UGtrci
 LUrfooNiZi5QpfSOigeQPxq+2oy7AvFTvJZwcIEO5a66h1aiACYZSGwEof8dWe+QF28Ftt5rDbm
 qe+Ssq7Q6O3pvuTQ=
X-Received: by 2002:adf:d4ce:: with SMTP id w14mr1336494wrk.118.1628571706833; 
 Mon, 09 Aug 2021 22:01:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzR/bYOArw4GfRSdVQyzS5w60Ae5xkuxxAmH2VBspOUNzOB3/atTjOLgBAmOfzXzXCk7fJokQ==
X-Received: by 2002:adf:d4ce:: with SMTP id w14mr1336481wrk.118.1628571706673; 
 Mon, 09 Aug 2021 22:01:46 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id c15sm21725983wrx.70.2021.08.09.22.01.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 22:01:46 -0700 (PDT)
Subject: Re: [PATCH] fuzz: avoid building twice, when running on gitlab
To: Peter Maydell <peter.maydell@linaro.org>, Alexander Bulekov <alxndr@bu.edu>
References: <20210809111621.54454-1-alxndr@bu.edu>
 <CAFEAcA8F07vzmOGdTEcQeemGCszDU3nCWH7ehvkBWWQMxm8QgQ@mail.gmail.com>
 <20210809190559.rqo7253wbcrq7r36@mozz.bu.edu>
 <20210809193004.qwdqjbew4oe6jbqy@mozz.bu.edu>
 <CAFEAcA8OdAb65ub9i8tYjtUWUTshBvnaUZ9bqs4UOm4K_0t0Dw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <04f05309-4137-b13d-392e-0d5db2992bcb@redhat.com>
Date: Tue, 10 Aug 2021 07:01:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8OdAb65ub9i8tYjtUWUTshBvnaUZ9bqs4UOm4K_0t0Dw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Coiby Xu <coiby.xu@gmail.com>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Coiby Xu & qemu-block@

On 8/9/21 9:36 PM, Peter Maydell wrote:
> On Mon, 9 Aug 2021 at 20:30, Alexander Bulekov <alxndr@bu.edu> wrote:
>>
>> On 210809 1506, Alexander Bulekov wrote:
>>> On 210809 1925, Peter Maydell wrote:
>>>> On Mon, 9 Aug 2021 at 12:18, Alexander Bulekov <alxndr@bu.edu> wrote:
>>>>>
>>>>> On oss-fuzz, we build twice, to put together a build that is portable to
>>>>> the runner containers. On gitlab ci, this is wasteful and contributes to
>>>>> timeouts on the build-oss-fuzz job. Avoid building twice on gitlab, at
>>>>> the remote cost of potentially missing some cases that break oss-fuzz
>>>>> builds.
>>>>>
>>>>> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
>>>>> ---
>>>>>
>>>>> From a couple test runs it looks like this can shave off 15-20 minutes.
>>>>>
>>>>>  scripts/oss-fuzz/build.sh | 24 +++++++++++++-----------
>>>>>  1 file changed, 13 insertions(+), 11 deletions(-)
>>>>
>>>> I tried a test run with this, but it still hit the 1 hour timeout:
>>>>
>>>> https://gitlab.com/qemu-project/qemu/-/pipelines/350387482
>>>
>>> It also timed out for me with a 120 minute timeout:
>>> https://gitlab.com/a1xndr/qemu/-/jobs/1488160601
>>>
>>> The log has almost exactly the same number of lines as yours, so I'm
>>> guessing one of the qtests is timing out with --enable-sanitizers .
> 
>>
>> Building locally:
>> $ CC=clang-11 CXX=clang++-11 ../configure --enable-fuzzing \
>>     --enable-debug --enable-sanitizers
>> $ make check-qtest-i386 check-unit
>>
>> Same as on gitlab, this times out shortly after outputting
>> "sh: 1: exec: ./storage-daemon/qemu-storage-daemon: not found"
>>
>> Manually running qos-test, the same way check-qtest-i386 invokes it:
>>
>> $ QTEST_QEMU_BINARY=./qemu-system-i386 QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon tests/qtest/qos-test --tap -k -m quick < /dev/null
>>
>> # starting vhost-user backend: exec ./storage-daemon/qemu-storage-daemon --blockdev driver=file,node-name=disk0,filename=qtest.XRAzzu --export type=vhost-user-blk,id=disk0,addr.type=unix,addr.path=/tmp/qtest-94561-sock.NdKWpt,node-name=disk0,writable=on,num-queues=1
>> sh: 1: exec: ./storage-daemon/qemu-storage-daemon: not found
>> # starting QEMU: exec ./qemu-system-i386 -qtest unix:/tmp/qtest-94561.sock -qtest-log /dev/null -chardev socket,path=/tmp/qtest-94561.qmp,id=char0 -mon chardev=char0,mode=control -display none -M pc  -device vhost-user-blk-pci,id=drv0,chardev=char1,addr=4.0 -object memory-backend-memfd,id=mem,size=256M,share=on  -M memory-backend=mem -m 256M -chardev socket id=char1,path=/tmp/qtest-94561-sock.NdKWpt  -accel qtest
>>
>> *timeout*
> 
> vhost-user timing out in realize I suspect. I see that as
> an intermittent hang in non-sanitizer configs.
> 
> vhost-user folk: Can we either look at fixing this or else disable
> the test ? (Stack backtraces available in the other email thread.)
> 
> thanks
> -- PMM
> 


