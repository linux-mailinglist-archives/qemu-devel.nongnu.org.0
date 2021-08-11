Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 609163E8718
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 02:17:23 +0200 (CEST)
Received: from localhost ([::1]:41662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDbvu-0001k0-Dg
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 20:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <coiby.xu@gmail.com>)
 id 1mDbun-00011J-O6; Tue, 10 Aug 2021 20:16:13 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:52904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <coiby.xu@gmail.com>)
 id 1mDbum-0004r4-9C; Tue, 10 Aug 2021 20:16:13 -0400
Received: by mail-pj1-x102d.google.com with SMTP id nt11so680244pjb.2;
 Tue, 10 Aug 2021 17:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=pj7mnYzk2TTVYvdznktFLTdNpBDXmzNXHGNkaOp2eFE=;
 b=qIpgP6kLbbCVf0E5DkoHdAYm2e19a1B4k4kD5XWkoCzjEdtM/q10wj5/mTuJVDXPvh
 Sj9I6kG6t1shCZwKIdvXRh4pdMeo8HDrviO5aiEtLzo4j/datcLMhKRzLCf+TllIadNq
 nRKmZ9GDKKiJIkvanfrunpZHJSWmP4Xr6WjLejkNojKchZFIYLOwGZmep7xhpRYrDUtk
 N/a7cyIoyvZ2tUVfWwrawB1ytCOUNz95j1G7N9NpqFPN9CAnydr8MyRRG/4LN0a3+cn4
 2R9FsZ/if8OJ3mKIPdSKGK3Ni17rdD5AIFqsKbbZkryIdQA4MLSKFwjhtoQMj53x7GCa
 VIXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=pj7mnYzk2TTVYvdznktFLTdNpBDXmzNXHGNkaOp2eFE=;
 b=b1VTXW19XPWyVoHQgSWkgxf82aToVGDd/SuYxDUxs9qvac+CAvdZe3I5fjv6NHqvJI
 p9vZ5V93y+/NCM2Q1LTohz3EsOg2neaNIgw3KT8G5vymc2Pfn4cahDO2Ngtn0OotTdkS
 e+/uoGQBnbGhAXgEbwsvo0wka84uNfL6Iqir/Pq7vOF5gjwzHsAKRG/nwcwhUtPD6Zak
 2rQ2C8dn67S5CVSR7JfQ59tvrugf60TotWG6S2cis4rqZXSZV9wtpcRx+PtX2xkBOefQ
 N0ImQ2Afiuy0NsG67gHP8H6jkczcgc1GUTEhVArVCCIt/C1UaJz2bY5vqsaisGeTKRop
 eevw==
X-Gm-Message-State: AOAM5338d3D0TNUKsftEeW6JxvXi0BFeUr0OJ3PAvOWRgR/uHoQsr68E
 S5tyfcSJNIwh14cL3NYiFLw=
X-Google-Smtp-Source: ABdhPJw2oPOA5oOPvMvif5qWnbjxL9gDeV0KTQGuB98Im6rJ9wsP4wX1arW3IOrVmpxp40uQbcv+CA==
X-Received: by 2002:a17:903:1c6:b029:12d:258c:56e9 with SMTP id
 e6-20020a17090301c6b029012d258c56e9mr1918015plh.48.1628640969555; 
 Tue, 10 Aug 2021 17:16:09 -0700 (PDT)
Received: from localhost ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id g14sm4093901pfr.31.2021.08.10.17.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 17:16:08 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Wed, 11 Aug 2021 08:11:06 +0800
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] fuzz: avoid building twice, when running on gitlab
Message-ID: <20210811001106.dnkkolwwzt6pbeto@Rk>
References: <20210809111621.54454-1-alxndr@bu.edu>
 <CAFEAcA8F07vzmOGdTEcQeemGCszDU3nCWH7ehvkBWWQMxm8QgQ@mail.gmail.com>
 <20210809190559.rqo7253wbcrq7r36@mozz.bu.edu>
 <20210809193004.qwdqjbew4oe6jbqy@mozz.bu.edu>
 <CAFEAcA8OdAb65ub9i8tYjtUWUTshBvnaUZ9bqs4UOm4K_0t0Dw@mail.gmail.com>
 <04f05309-4137-b13d-392e-0d5db2992bcb@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <04f05309-4137-b13d-392e-0d5db2992bcb@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=coiby.xu@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 10, 2021 at 07:01:45AM +0200, Philippe Mathieu-Daudé wrote:
>+Coiby Xu & qemu-block@

Thanks for adding me to the Cc list.

>
>On 8/9/21 9:36 PM, Peter Maydell wrote:
>> On Mon, 9 Aug 2021 at 20:30, Alexander Bulekov <alxndr@bu.edu> wrote:
>>>
>>> On 210809 1506, Alexander Bulekov wrote:
>>>> On 210809 1925, Peter Maydell wrote:
>>>>> On Mon, 9 Aug 2021 at 12:18, Alexander Bulekov <alxndr@bu.edu> wrote:
>>>>>>
>>>>>> On oss-fuzz, we build twice, to put together a build that is portable to
>>>>>> the runner containers. On gitlab ci, this is wasteful and contributes to
>>>>>> timeouts on the build-oss-fuzz job. Avoid building twice on gitlab, at
>>>>>> the remote cost of potentially missing some cases that break oss-fuzz
>>>>>> builds.
>>>>>>
>>>>>> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
>>>>>> ---
>>>>>>
>>>>>> From a couple test runs it looks like this can shave off 15-20 minutes.
>>>>>>
>>>>>>  scripts/oss-fuzz/build.sh | 24 +++++++++++++-----------
>>>>>>  1 file changed, 13 insertions(+), 11 deletions(-)
>>>>>
>>>>> I tried a test run with this, but it still hit the 1 hour timeout:
>>>>>
>>>>> https://gitlab.com/qemu-project/qemu/-/pipelines/350387482
>>>>
>>>> It also timed out for me with a 120 minute timeout:
>>>> https://gitlab.com/a1xndr/qemu/-/jobs/1488160601
>>>>
>>>> The log has almost exactly the same number of lines as yours, so I'm
>>>> guessing one of the qtests is timing out with --enable-sanitizers .
>>
>>>
>>> Building locally:
>>> $ CC=clang-11 CXX=clang++-11 ../configure --enable-fuzzing \
>>>     --enable-debug --enable-sanitizers
>>> $ make check-qtest-i386 check-unit
>>>
>>> Same as on gitlab, this times out shortly after outputting
>>> "sh: 1: exec: ./storage-daemon/qemu-storage-daemon: not found"
>>>
>>> Manually running qos-test, the same way check-qtest-i386 invokes it:
>>>
>>> $ QTEST_QEMU_BINARY=./qemu-system-i386 QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon tests/qtest/qos-test --tap -k -m quick < /dev/null
>>>
>>> # starting vhost-user backend: exec ./storage-daemon/qemu-storage-daemon --blockdev driver=file,node-name=disk0,filename=qtest.XRAzzu --export type=vhost-user-blk,id=disk0,addr.type=unix,addr.path=/tmp/qtest-94561-sock.NdKWpt,node-name=disk0,writable=on,num-queues=1
>>> sh: 1: exec: ./storage-daemon/qemu-storage-daemon: not found

The error is different from the previous issue of intermittent hang.
This time the hang is caused by missing qemu-storage-daemon and I
guess the hang could happen reliably each time. The reason of missing 
qemu-storage-daemon is the test doesn't add qemu-storage-daemon as
dependency. If we run `make`, qemu-storage-daemon would be built. But if 
`make check-qtest-i386` is run directly, qemu-storage-daemon wouldn't be 
built. I'll send a patch to make vhost-user-blk test depends on
emu-storage-daemon. 

>>> # starting QEMU: exec ./qemu-system-i386 -qtest unix:/tmp/qtest-94561.sock -qtest-log /dev/null -chardev socket,path=/tmp/qtest-94561.qmp,id=char0 -mon chardev=char0,mode=control -display none -M pc  -device vhost-user-blk-pci,id=drv0,chardev=char1,addr=4.0 -object memory-backend-memfd,id=mem,size=256M,share=on  -M memory-backend=mem -m 256M -chardev socket id=char1,path=/tmp/qtest-94561-sock.NdKWpt  -accel qtest
>>>
>>> *timeout*
>>
>> vhost-user timing out in realize I suspect. I see that as
>> an intermittent hang in non-sanitizer configs.
>>
>> vhost-user folk: Can we either look at fixing this or else disable
>> the test ? (Stack backtraces available in the other email thread.)
>>
>> thanks
>> -- PMM
>>
>

-- 
Best regards,
Coiby

