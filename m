Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCEB24DBC4
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 18:48:22 +0200 (CEST)
Received: from localhost ([::1]:56314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k9ADF-0005hf-75
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 12:48:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k9ABL-0004Bh-LI
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 12:46:23 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:51639
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k9ABJ-0002hm-Mo
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 12:46:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598028380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=fJlwfD/09q9fq/135vP+QiPU/EWbBl6uCB/y/sLCkJg=;
 b=V+hhO8sfrn4QOeTWrBYmaMWWJF5liiaBRNboA/aH/wxF6tOsXN/bzbh128eFpFvJrpQvk5
 0LZTJRUroUkbwbvyvM9E9JFny8KbEKgbhJs3gcsYwf7kGKeIvkpJNWlpgsWeosm3TH/eur
 eLhfR35AfjaTRllbt9qn0AU32wN/lWQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-rl9tm_MXME2CgWsk6DeRMw-1; Fri, 21 Aug 2020 12:46:19 -0400
X-MC-Unique: rl9tm_MXME2CgWsk6DeRMw-1
Received: by mail-wm1-f70.google.com with SMTP id z1so976393wmf.9
 for <qemu-devel@nongnu.org>; Fri, 21 Aug 2020 09:46:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=fJlwfD/09q9fq/135vP+QiPU/EWbBl6uCB/y/sLCkJg=;
 b=sl7oM/mXZjEjjRzUUzGIYqlMrafjA3fbb5LTGGmi+zPa4wS6pRenJ32QhdLD8FdhyY
 BtLsisEHFTPzMR0b28yq5MognDf6Dw3bGCgwtnML8kR/22nzwcZl0geEIOYd306sEJKO
 lCqFAfcifgggZ4uL7WwreoHsQp/yq2qPh8kyY0Nd27U5JjZZEhnRTtMsSg2y8hsQskve
 N5iteOTI5gj774LwNepOmx9JnmDsJMIrCPAufNBK/fbwAJDcOhkTvsWxuoIqg3SBCv6C
 eQISP5fwR/Cba9iWEzHn7zK0ytRm1a2Nb/Ev1TRHwbVNeLYHGWIhDYUgtNpsvx82Dict
 5DHw==
X-Gm-Message-State: AOAM532nMmrLlHRuRhswoipC6N6b8HUT31Azg6QnbsbWOsio1Tq4AyVS
 /51UZUqc8Zw9tOF2bP2bj9MXyCVEHBpA5o/Nhi/trs6rMKR9j3eJOTTXbIKXmhHfzJxodUUBhPO
 9G25Cqokf6CxyjU4=
X-Received: by 2002:a5d:4c83:: with SMTP id z3mr3532959wrs.359.1598028377767; 
 Fri, 21 Aug 2020 09:46:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx03MgbqH5SYEf9AOLmG+uwlJcXgF5KpF68r1rJU+Hf71gvGkgab0rpBSdmcD41t+YZqxkIRw==
X-Received: by 2002:a5d:4c83:: with SMTP id z3mr3532939wrs.359.1598028377499; 
 Fri, 21 Aug 2020 09:46:17 -0700 (PDT)
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id b8sm5558280wrv.4.2020.08.21.09.46.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Aug 2020 09:46:16 -0700 (PDT)
Subject: Re: [PATCH] util/meson.build: fix fdmon-io_uring build
To: Stefano Garzarella <sgarzare@redhat.com>
References: <20200821154853.94379-1-sgarzare@redhat.com>
 <b750b7e1-2fca-2662-b575-2883d1073743@redhat.com>
 <20200821162339.33waweneizhzases@steredhat>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <84ba3c37-c00a-d130-c988-51bcb195a29d@redhat.com>
Date: Fri, 21 Aug 2020 18:46:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200821162339.33waweneizhzases@steredhat>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 23:41:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/21/20 6:23 PM, Stefano Garzarella wrote:
> On Fri, Aug 21, 2020 at 06:12:45PM +0200, Philippe Mathieu-DaudÃƒÂ© wrote:
>> Hi Stefano,
>>
>> On 8/21/20 5:48 PM, Stefano Garzarella wrote:
>>> libqemuutil.a build fails with this error:
>>>
>>>   /usr/bin/ld: libqemuutil.a(util_fdmon-io_uring.c.o): in function `get_sqe':
>>>   qemu/build/../util/fdmon-io_uring.c:83: undefined reference to `io_uring_get_sqe'
>>>   /usr/bin/ld: qemu/build/../util/fdmon-io_uring.c:92: undefined reference to `io_uring_submit'
>>>   /usr/bin/ld: qemu/build/../util/fdmon-io_uring.c:96: undefined reference to `io_uring_get_sqe'
>>>   /usr/bin/ld: libqemuutil.a(util_fdmon-io_uring.c.o): in function `fdmon_io_uring_wait':
>>>   qemu/build/../util/fdmon-io_uring.c:289: undefined reference to `io_uring_submit_and_wait'
>>>   /usr/bin/ld: libqemuutil.a(util_fdmon-io_uring.c.o): in function `fdmon_io_uring_setup':
>>>   qemu/build/../util/fdmon-io_uring.c:328: undefined reference to `io_uring_queue_init'
>>>   /usr/bin/ld: libqemuutil.a(util_fdmon-io_uring.c.o): in function `fdmon_io_uring_destroy':
>>>   qemu/build/../util/fdmon-io_uring.c:343: undefined reference to `io_uring_queue_exit'
>>>   collect2: error: ld returned 1 exit status
>>
>> Can you add a gitlab job to reproduce this? (Or at least explain
>> how to reproduce, so we add that job later). Thanks!
> 
> I think the only prerequisite is to install 'liburing-devel' package
> (Fedora 32) on the build system, and then fdmon-io_uring.c will be built.

Oh easy then, simply add it to PACKAGES in
tests/docker/dockerfiles/fedora.docker :)

> 
> I'll try to add a gitlab job ;-)
> 
> Thanks,
> Stefano
> 
>>
>>>
>>> This patch fix the issue adding 'linux_io_uring' dependency for
>>> fdmon-io_uring.c
>>>
>>> Fixes: a81df1b68b ("libqemuutil, qapi, trace: convert to meson")
>>> Cc: pbonzini@redhat.com
>>> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>>> ---
>>>  util/meson.build | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/util/meson.build b/util/meson.build
>>> index 23b8ad459b..e6b207a99e 100644
>>> --- a/util/meson.build
>>> +++ b/util/meson.build
>>> @@ -4,7 +4,7 @@ util_ss.add(when: 'CONFIG_ATOMIC64', if_false: files('atomic64.c'))
>>>  util_ss.add(when: 'CONFIG_POSIX', if_true: files('aio-posix.c'))
>>>  util_ss.add(when: 'CONFIG_POSIX', if_true: files('fdmon-poll.c'))
>>>  util_ss.add(when: 'CONFIG_EPOLL_CREATE1', if_true: files('fdmon-epoll.c'))
>>> -util_ss.add(when: 'CONFIG_LINUX_IO_URING', if_true: files('fdmon-io_uring.c'))
>>> +util_ss.add(when: ['CONFIG_LINUX_IO_URING', linux_io_uring], if_true: files('fdmon-io_uring.c'))
>>>  util_ss.add(when: 'CONFIG_POSIX', if_true: files('compatfd.c'))
>>>  util_ss.add(when: 'CONFIG_POSIX', if_true: files('event_notifier-posix.c'))
>>>  util_ss.add(when: 'CONFIG_POSIX', if_true: files('mmap-alloc.c'))
>>>
>>
> 


