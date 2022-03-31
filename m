Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E60C4ED3CC
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 08:15:29 +0200 (CEST)
Received: from localhost ([::1]:37628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZo5f-0007GK-UP
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 02:15:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nZo0g-0005rZ-RR
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 02:10:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nZo0c-0000TD-Rw
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 02:10:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648707012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wn6HskuFrhCygDeWRbeufMENF8pBY9KitVNCP0MpNuE=;
 b=fsaisKm44stQYNiEu76G+6Y5lmXLCxOzv9W8zUfVAUYai3pCx9m4ZyblGv5Ou3DAHypAma
 2Yt+VJW/FDbRT3iOtU/+PmqqTQoDC5r0WXTtrsjNUyyLjAZT9O4RcWkzan/hxXaF+nKDLz
 IWcg95PkbxuOatS/25DKLFj64rnKLQM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-LWoc3rvnOceol0lPNN6rpg-1; Thu, 31 Mar 2022 02:10:10 -0400
X-MC-Unique: LWoc3rvnOceol0lPNN6rpg-1
Received: by mail-ed1-f71.google.com with SMTP id
 f2-20020a50d542000000b00418ed3d95d8so14301732edj.11
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 23:10:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wn6HskuFrhCygDeWRbeufMENF8pBY9KitVNCP0MpNuE=;
 b=kggJ2Awg7g9tLCQ/Yj8Jw0LaGYJxJTgmTUdAXt71IVwves5GR0B2Ls/gaVlRD+MkRm
 Y2khYvSeIQamx/W16lOD2bsa4QxewmsmuKpTMaMd2aBl/AplJuQsKScEsPs/HbvkvWtV
 0MHFBLAJYXcGtb6ivtzT7syW99l0SA+F5nIZyPRVcCzT0GUnb2aJ9QkYXD/aY5mmFKq6
 Ei2mWxg1RD/v3FaLyV8BeAA+ve8oFmK0Dfk6EwRPtSh1byCFTIlCsyc7cMuxBLKKQ4Do
 DpVZxdCl34B3sbdfRIWbcYc6cXqVCv5iL9RNDO7z1pX6BzuPbZBbkWOCeHho/twptXoW
 zgpA==
X-Gm-Message-State: AOAM531Il+h19vlCm/M6wdJZQa2uNzdt28kR3plpSF+51HcsKVaiO9eF
 9/DWhCaZ9U1VnRUem5wKYfAp5eqt0cipckiWYYEK6nAIZ0g7Ik7vY1ZlUd3qpI1YHjq+jpW3jwf
 TIXoDbLWGED4cRdg=
X-Received: by 2002:a17:907:7d93:b0:6da:8f57:68fa with SMTP id
 oz19-20020a1709077d9300b006da8f5768famr3668785ejc.42.1648707009298; 
 Wed, 30 Mar 2022 23:10:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuvxvJY0ru6tjHKiRXVumjj1W4dN6tIiUU/TXTKdTcNR+JIK5qiuNI/F2jLARbkkdYeqG4iQ==
X-Received: by 2002:a17:907:7d93:b0:6da:8f57:68fa with SMTP id
 oz19-20020a1709077d9300b006da8f5768famr3668768ejc.42.1648707009014; 
 Wed, 30 Mar 2022 23:10:09 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 jg39-20020a170907972700b006e047c810dbsm9030781ejc.56.2022.03.30.23.10.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 23:10:08 -0700 (PDT)
Message-ID: <8a898f41-98e1-5a02-4cd8-a697bcb6d9a1@redhat.com>
Date: Thu, 31 Mar 2022 08:10:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: iotest40 problem
To: Li Zhang <lizhang@suse.de>, QEMU Developers <qemu-devel@nongnu.org>,
 kwolf@redhat.com, John Snow <jsnow@redhat.com>
References: <1c4fd757-5d08-0099-b842-4295c430a176@suse.de>
 <32ff3a63-fb50-8038-3f2e-5bfd70b01344@suse.de>
 <37635a04-b717-b7c6-88a0-1b3cecc0c4f5@suse.de>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <37635a04-b717-b7c6-88a0-1b3cecc0c4f5@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 29.03.22 18:49, Li Zhang wrote:
> Update what I observed.
>
> It seems that aqmp is not stable when running test cases.
> So I revert the patches as the following, iotest40/41 test cases work 
> well.

Thanks for bisecting.  I haven’t seen this problem before, so I didn’t 
look into it; CC-ing John, perhaps he figures something.

Hanna

> commit 76cd358671e6b8e7c435ec65b1c44200254514a9
>
> Author: John Snow <jsnow@redhat.com>
>
> Date:   Tue Oct 26 13:56:12 2021 -0400
>
>
>
>     python, iotests: replace qmp with aqmp
>
>
>
>     Swap out the synchronous QEMUMonitorProtocol from qemu.qmp with 
> the sync
>
>     wrapper from qemu.aqmp instead.
>
>
>
>     Add an escape hatch in the form of the environment variable
>
>     QEMU_PYTHON_LEGACY_QMP which allows you to cajole QEMUMachine into 
> using
>
>     the old implementation, proving that both implementations work
>
>     concurrently.
>
>
>
>     Signed-off-by: John Snow <jsnow@redhat.com>
>
>     Reviewed-by: Kevin Wolf <kwolf@redhat.com>
>
>     Reviewed-by: Hanna Reitz <hreitz@redhat.com>
>
>     Message-id: 20211026175612.4127598-9-jsnow@redhat.com
>
>     Signed-off-by: John Snow <jsnow@redhat.com>
>
>
> commit 1611e6cf4e7163f6102b37010a8b7e7120f468b5
>
> Author: John Snow <jsnow@redhat.com>
>
> Date:   Thu Nov 18 15:46:18 2021 -0500
>
>
>
>     python/machine: handle "fast" QEMU terminations
>
>
>
>     In the case that the QEMU process actually launches -- but then 
> dies so
>
>     quickly that we can't establish a QMP connection to it -- QEMUMachine
>
>     currently calls _post_shutdown() assuming that it never launched 
> the VM
>
>     process.
>
>
>
>     This isn't true, though: it "merely" may have failed to establish 
> a QMP
>
>     connection and the process is in the middle of its own exit path.
>
>
>
>     If we don't wait for the subprocess, the caller may get a bogus 
> `None`
>
>     return for .exitcode(). This behavior was observed from
>
>     device-crash-test; after the switch to Async QMP, the timings were
>
>     changed such that it was now seemingly possible to witness the 
> failure
>
>     of "vm.launch()" *prior* to the exitcode becoming available.
>
>
>
>     The semantic of the `_launched` property is changed in this
>
>     patch. Instead of representing the condition "launch() executed
>
>     successfully", it will now represent "has forked a child process
>
>     successfully". This way, wait() when called in the exit path won't
>
>     become a no-op.
>
>
>
>     Signed-off-by: John Snow <jsnow@redhat.com>
>
>     Reviewed-by: Willian Rampazzo <willianr@redhat.com>
>
>     Message-id: 20211118204620.1897674-6-jsnow@redhat.com
>
>     Signed-off-by: John Snow <jsnow@redhat.com>
>
>
>
>
>
> On 3/25/22 11:17, Li Zhang wrote:
>> Hi,
>>
>> I backport some iotests patches to the tree and change timeout.
>> It doesn't work.
>>
>> Sometimes, iotest41 also reports the errors.
>> [ 1347s] 
>> +======================================================================
>> [ 1347s] +ERROR: test_top_node_in_wrong_chain (__main__.TestSingleDrive)
>> [ 1347s] 
>> +----------------------------------------------------------------------
>> [ 1347s] +Traceback (most recent call last):
>> [ 1347s] +  File 
>> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/machine/machine.py", 
>> line 399, in launch
>> [ 1347s] +    self._launch()
>> [ 1347s] +  File 
>> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/machine/machine.py", 
>> line 434, in _launch
>> [ 1347s] +    self._post_launch()
>> [ 1347s] +  File 
>> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/machine/qtest.py", 
>> line 147, in _post_launch
>> [ 1347s] +    super()._post_launch()
>> [ 1347s] +  File 
>> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/machine/machine.py", 
>> line 340, in _post_launch
>> [ 1347s] +    self._qmp.accept(self._qmp_timer)
>> [ 1347s] +  File 
>> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/aqmp/legacy.py", 
>> line 69, in accept
>> [ 1347s] +    timeout
>> [ 1347s] +  File 
>> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/aqmp/legacy.py", 
>> line 42, in _sync
>> [ 1347s] +    asyncio.wait_for(future, timeout=timeout)
>> [ 1347s] +  File "/usr/lib64/python3.6/asyncio/base_events.py", line 
>> 488, in run_until_complete
>> [ 1347s] +    return future.result()
>> [ 1347s] +  File "/usr/lib64/python3.6/asyncio/tasks.py", line 362, 
>> in wait_for
>> [ 1347s] +    raise futures.TimeoutError()
>> [ 1347s] +concurrent.futures._base.TimeoutError
>>
>>
>> I can see other errors like this, it's the problem of the socket.
>>
>> [ 1535s] socket_accept failed: Resource temporarily unavailable
>> [ 1535s] **
>> [ 1535s] 
>> ERROR:../tests/qtest/libqtest.c:321:qtest_init_without_qmp_handshake: 
>> assertion failed: (s->fd >= 0 && s->qmp_fd >= 0)
>>
>>
>> The script is running the command as this:
>> /usr/bin/make -O -j4 check-block V=1
>>
>> I can see the errors on ppc, arm or x86.
>> But I couldn't reproduce it when I run it manually.
>>
>> It will be appreciated if any suggestions. Thanks.
>>
>>
>> On 3/24/22 14:47, Li Zhang wrote:
>>> Hi,
>>>
>>> When I run the testsuit on our buidling system, it reports a timeout 
>>> sometimes not always as the following.
>>> It couldn't connect qmp socket. Any ideas about this problem?
>>>
>>>
>>> [ 1989s] --- 
>>> /home/abuild/rpmbuild/BUILD/qemu-6.2.0/tests/qemu-iotests/040.out
>>> [ 1989s] +++ 040.out.bad
>>> [ 1989s] @@ -1,5 +1,55 @@
>>> [ 1989s] 
>>> -.................................................................
>>> [ 1989s] +....ERROR:qemu.aqmp.qmp_client.qemu-6471:Failed to 
>>> establish connection: asyncio.exceptions.CancelledError
>>> [ 1989s] 
>>> +E..................................ERROR:qemu.aqmp.qmp_client.qemu-6471:Failed 
>>> to establish connection: asyncio.exceptions.CancelledError
>>> [ 1989s] +E.........................
>>> [ 1989s] 
>>> +======================================================================
>>> [ 1989s] +ERROR: test_commit_node (__main__.TestActiveZeroLengthImage)
>>> [ 1989s] 
>>> +----------------------------------------------------------------------
>>> [ 1989s] +Traceback (most recent call last):
>>> [ 1989s] +  File 
>>> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/tests/qemu-iotests/040", 
>>> line 94, in setUp
>>> [ 1989s] +    self.vm.launch()
>>> [ 1989s] +  File 
>>> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/machine/machine.py", 
>>> line 399, in launch
>>> [ 1989s] +    self._launch()
>>> [ 1989s] +  File 
>>> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/machine/machine.py", 
>>> line 434, in _launch
>>> [ 1989s] +    self._post_launch()
>>> [ 1989s] +  File 
>>> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/machine/qtest.py", 
>>> line 147, in _post_launch
>>> [ 1989s] +    super()._post_launch()
>>> [ 1989s] +  File 
>>> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/machine/machine.py", 
>>> line 340, in _post_launch
>>> [ 1989s] +    self._qmp.accept(self._qmp_timer)
>>> [ 1989s] +  File 
>>> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/aqmp/legacy.py", 
>>> line 67, in accept
>>> [ 1989s] +    self._sync(
>>> [ 1989s] +  File 
>>> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/aqmp/legacy.py", 
>>> line 41, in _sync
>>> [ 1989s] +    return self._aloop.run_until_complete(
>>> [ 1989s] +  File "/usr/lib64/python3.8/asyncio/base_events.py", line 
>>> 616, in run_until_complete
>>> [ 1989s] +    return future.result()
>>> [ 1989s] +  File "/usr/lib64/python3.8/asyncio/tasks.py", line 501, 
>>> in wait_for
>>> [ 1989s] +    raise exceptions.TimeoutError()
>>> [ 1989s] +asyncio.exceptions.TimeoutError
>>>
>>
>>
>


