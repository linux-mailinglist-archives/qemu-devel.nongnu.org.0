Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D342F3241
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 14:55:09 +0100 (CET)
Received: from localhost ([::1]:52284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzK8V-0001Fz-92
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 08:55:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kzK6z-0000RF-IW
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 08:53:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kzK6w-0008SF-GW
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 08:53:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610459605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6gOmWsKDttA1stodkfsX3+gjF9DMc+SwWCbYrqvLX4A=;
 b=X1BQW3SUv+eZHpXGvfyZnqYuYxbcvjLj2RoeUYVwVWSnkKXLzK76mq+UTjHjNFOe7HQAni
 11tvJWDdN+1JRVemrPTq/Id21s6UdGEBrDHRbS3VeMxMtFHKcZwRGwZJnirSjPKh+zDSow
 1Kci33IvGfQIEBJbSEG8X4XCeMVvhH4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-jkq_F1b0P5a5Uq2Q09PlUA-1; Tue, 12 Jan 2021 08:53:23 -0500
X-MC-Unique: jkq_F1b0P5a5Uq2Q09PlUA-1
Received: by mail-ej1-f71.google.com with SMTP id k3so1015143ejr.16
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 05:53:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6gOmWsKDttA1stodkfsX3+gjF9DMc+SwWCbYrqvLX4A=;
 b=Rk+xyp/mUdxgS7k7aUSA1UOS8IEKudB++XPP0A27i+wjnBVvkEysGlGrSdPd7rfoob
 SgYaZ9fJCVm9UxDk2FVLrqhJ0gIc8qWkrqXFJ9qQ23iDP3Kv5Y6XpRdZ32U+JWwK2gfu
 wsAWbQdua/5a1eRSujMH/5dsw8IekOiumpq9rujM+vOeSEPUBx7EtylABIBpY37RzgIx
 zVT0091aPTRaa2JcsIHVC+dCLKRAamZaELLSMMQI7Rln8gHI9b2osgJwe+duNbABq49n
 RXoUCYYK8xeFNyDBPar+zgfVUdtG+b38KJHTf9z16JLs9CFh7UrdgXSD/h+ikWoYIaU7
 7jHA==
X-Gm-Message-State: AOAM533NKrEPQT9/HgHCncDWm5wIgBgz3c8E0wNaEzF7IwVJyl4nMnAv
 Na8kyJ1lHBAGDA2UQMGmgcAFYRi5VODMjnG100/4TwSoe9Pcfyw5Becig7CfKce9p4MuxbPWzlm
 50MYNKdxJfal6JMQ=
X-Received: by 2002:aa7:d0c5:: with SMTP id u5mr3403913edo.46.1610459602530;
 Tue, 12 Jan 2021 05:53:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVIPDwIqgoB67qcuH1L4n/a4IVsPtbq8SuF21ftPe+4EW2bc2AgoLXuIl7WlZZVVDcR85XfQ==
X-Received: by 2002:aa7:d0c5:: with SMTP id u5mr3403892edo.46.1610459602307;
 Tue, 12 Jan 2021 05:53:22 -0800 (PST)
Received: from [192.168.1.36] (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id b7sm1245146ejz.4.2021.01.12.05.53.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 05:53:21 -0800 (PST)
Subject: Re: [PATCH] tests/acceptance: Fix race conditions in s390x tests &
 skip fedora on gitlab-CI
To: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>
References: <20210108185645.86351-1-thuth@redhat.com>
 <20210112115305.1cd5b8c5.cohuck@redhat.com> <877doinznw.fsf@linaro.org>
 <20210112132338.4122061b.cohuck@redhat.com>
 <efd30a52-8b5b-1afa-1505-6d6c296fe425@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <350867de-59be-5756-9f12-3eae4c265472@redhat.com>
Date: Tue, 12 Jan 2021 14:53:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <efd30a52-8b5b-1afa-1505-6d6c296fe425@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Willian Rampazzo <wrampazz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Willian

On 1/12/21 2:31 PM, Thomas Huth wrote:
> On 12/01/2021 13.23, Cornelia Huck wrote:
>> On Tue, 12 Jan 2021 11:32:44 +0000
>> Alex Bennée <alex.bennee@linaro.org> wrote:
>>
>>> Cornelia Huck <cohuck@redhat.com> writes:
>>>
>>>> On Fri,  8 Jan 2021 19:56:45 +0100
>>>> Thomas Huth <thuth@redhat.com> wrote:
>>>>  
>>>>> There was a race condition in the first test where there was
>>>>> already the
>>>>> "crw" output in the dmesg, but the "0.0.4711" entry has not been
>>>>> created
>>>>> in the /sys fs yet. Fix it by waiting until it is there.
>>>>>
>>>>> The second test has even more problems on gitlab-CI. Even after
>>>>> adding some
>>>>> more synchronization points (that wait for some messages in the
>>>>> "dmesg"
>>>>> output to make sure that the modules got loaded correctly), there
>>>>> are still
>>>>> occasionally some hangs in this test when it is running in the
>>>>> gitlab-CI.
>>>>> So far I was unable to reproduce these hangs locally on my
>>>>> computer, so
>>>>> this issue might take a while to debug. Thus disable the 2nd test
>>>>> in the
>>>>> gitlab-CI until the problems are better understood and fixed.
>>>>>
>>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>>> ---
>>>>>   tests/acceptance/machine_s390_ccw_virtio.py | 14 ++++++++++++--
>>>>>   1 file changed, 12 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/tests/acceptance/machine_s390_ccw_virtio.py
>>>>> b/tests/acceptance/machine_s390_ccw_virtio.py
>>>>> index eccf26b262..4028c99afc 100644
>>>>> --- a/tests/acceptance/machine_s390_ccw_virtio.py
>>>>> +++ b/tests/acceptance/machine_s390_ccw_virtio.py
>>>>> @@ -12,6 +12,7 @@
>>>>>   import os
>>>>>   import tempfile
>>>>>   +from avocado import skipIf
>>>>>   from avocado_qemu import Test
>>>>>   from avocado_qemu import exec_command_and_wait_for_pattern
>>>>>   from avocado_qemu import wait_for_console_pattern
>>>>> @@ -133,8 +134,10 @@ class S390CCWVirtioMachine(Test):
>>>>>           self.vm.command('device_add', driver='virtio-net-ccw',
>>>>>                           devno='fe.0.4711', id='net_4711')
>>>>>           self.wait_for_crw_reports()
>>>>> -        exec_command_and_wait_for_pattern(self, 'ls
>>>>> /sys/bus/ccw/devices/',
>>>>> -                                          '0.0.4711')
>>>>> +        exec_command_and_wait_for_pattern(self, 'for i in 1 2 3 4
>>>>> 5 6 7 ; do '
>>>>> +                    'if [ -e /sys/bus/ccw/devices/*4711 ]; then
>>>>> break; fi ;'
>>>>> +                    'sleep 1 ; done ; ls /sys/bus/ccw/devices/',
>>>>> +                    '0.0.4711')
>>>>
>>>> I'm wondering whether we should introduce a generic helper function for
>>>> "execute command repeatedly, if the expected result did not yet show
>>>> up", or "wait for a file/directory to exist". It's probably not
>>>> uncommon for a desired outcome to arrive asynchronously, and having a
>>>> function for waiting/retrying could be handy.
>>>
>>> We don't really want to encourage fragile shell scripts in the guest so
>>> something that makes it easy to encode these loops in python. Currently
>>> the _console_interaction helper fails the test if failure_message is
>>> seen so I guess we need a slightly more liberal interaction which
>>> accepts a command can fail so we can write something like:
>>>
>>>    while True:
>>>        if exec_command_and_check(self, "stat -t
>>> /sys/bus/ccw/devices/0.0.4711",
>>>                                  "/sys/bus/ccw/devices/0.0.4711"):
>>>            break
>>>
>>> ?
>>
>> Yes, something like that. The caller can decide whether they want to
>> limit retries.
> 
> Fine for me, but I think we should use a timeout, not an amount of retries.

We explained this feature request to the Avocado project at the
KVM forum 2018 in Lyon. There was an entry filled on their Trello
dashboard. Then the project switched to GitLab and I lost track
of it.

Cleber, if you remember, can you point us at the new ticket please?

Thanks,

Phil.

> I already put my patch into my pull-request yesterday (so that people
> are not running into failures with their gitlab-CI), so if someone wants
> to have a go at creating such a function in python, feel free to do so
> by refactoring that code again.
> 
>  Thomas
> 


