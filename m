Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 281A966DBBE
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 12:03:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHjkJ-0001Cr-HS; Tue, 17 Jan 2023 06:03:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pHjkG-0001Bu-Eg
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 06:03:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pHjkC-0000Ix-RJ
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 06:03:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673953387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PvocTkwsOe9V9dcTl+NzZUS3+Is0Q2aqYdbMHiActQ0=;
 b=hIfNwST04hiT37aLa5oN57+GRLGeImK6gcuKw4I0VmHEYFhyx/Q5aMjBwD8qky+Y5fePUe
 nNGgy4GO6JjVZUJAbLAlnbPp75eVLznmTiJp1ob+C0gdOwxt5lLO+XopChuDmFSZUtWu8H
 N6simmENJmVxIlFTEe647uMYeuVqHTY=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-222-83fg9A9YO-OABtDuBZGoHQ-1; Tue, 17 Jan 2023 06:03:06 -0500
X-MC-Unique: 83fg9A9YO-OABtDuBZGoHQ-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-15f262ecab2so1061796fac.18
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 03:03:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PvocTkwsOe9V9dcTl+NzZUS3+Is0Q2aqYdbMHiActQ0=;
 b=dWa0jr3AYKnEs/Tyc/TwIU1VQN5IWNnqRqpD/JzBirvZ1t2gVkokCFmJJsNQ04LyKl
 9eEeenMf0EEjgV/Yo+D4s0CAf3q/80CUugc07VuK5w3Xz6e4okPYisbAJb4VYNoiRCP7
 qWqRQ2XGf80xMzKsZX5sRzJMvBYN2dLbczo4eK+8bMCBmgwcRA6UUeRJl9WA8WzkuOwD
 /CZoNYM5U7jylU/pnLvCk3InhxlajjbsyIXdd25RH18ILVi4mHxdNuvDnXNHKFgmePva
 x7N0bh3wSFPDM8F+jutZZjJcIJIjuU6HriRfKrDNegM26wEVt/t7Kfueuk0m2v0dSP4l
 pdXg==
X-Gm-Message-State: AFqh2kq4XdYpYxWlGQWon0yfTo3LWMuyc+Zr1gzQrRvySgRL//4e8lTh
 mEFE7VP+1WJ5iIHVvWM43gcGk03K0rX+zeN+UquNiXw7GDwI+CpKEN/5gOaeeOomJFZE4S2YeXS
 1I+QdboeWKXCBlIY=
X-Received: by 2002:a05:6870:6b09:b0:15f:18e2:f4d with SMTP id
 mt9-20020a0568706b0900b0015f18e20f4dmr1716649oab.23.1673953385661; 
 Tue, 17 Jan 2023 03:03:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtaWSwwoJrpBuA6r0F8PV1yRVHV/dvFQ3e0YkrOR5kg/8xdh+UHpzrh3r0PkPzSLWkNtqD7yA==
X-Received: by 2002:a05:6870:6b09:b0:15f:18e2:f4d with SMTP id
 mt9-20020a0568706b0900b0015f18e20f4dmr1716628oab.23.1673953385298; 
 Tue, 17 Jan 2023 03:03:05 -0800 (PST)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a05620a40d000b007055fa93060sm20225417qko.79.2023.01.17.03.03.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 03:03:04 -0800 (PST)
Message-ID: <a364fceb-66a9-2055-ca61-ac49cf9a8a12@redhat.com>
Date: Tue, 17 Jan 2023 12:03:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5] tests/qtest: netdev: test stream and dgram backends
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
References: <20230105093751.416666-1-lvivier@redhat.com>
 <3d55b710-4601-4f8b-5289-72997ea09e5a@redhat.com>
 <0b29c231-da85-5302-31bc-b2e420c2b394@redhat.com>
 <5a13b5c9-f8d4-6b4f-b55b-4b8a0ac54867@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <5a13b5c9-f8d4-6b4f-b55b-4b8a0ac54867@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 1/17/23 11:00, Thomas Huth wrote:
> On 16/01/2023 09.40, Thomas Huth wrote:
>> On 16/01/2023 09.29, Laurent Vivier wrote:
>>> ping
>>>
>>> On 1/5/23 10:37, Laurent Vivier wrote:
>>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>>>> ---
>>>>
>>>> Notes:
>>>>      v5:
>>>>        - disable test_stream_fd and  test_dgram_fd on windows as socketpair()
>>>>          is not defined.
>>>>        - enable test_stream_unix_abstract only on linux as "abstract"
>>>>          unix socket parameter is only defined on linux.
>>>>      v4:
>>>>        - rework EXPECT_STATE()
>>>>        - use g_dir_make_tmp()
>>>>      v3:
>>>>      - Add "-M none" to avoid error:
>>>>        "No machine specified, and there is no default"
>>>>      v2:
>>>>      - Fix ipv6 free port allocation
>>>>      - Check for IPv4, IPv6, AF_UNIX
>>>>      - Use g_mkdtemp() rather than g_file_open_tmp()
>>>>      - Use socketpair() in test_stream_fd()
>>>>      v1: compared to v14 of "qapi: net: add unix socket type support to netdev backend":
>>>>      - use IP addresses 127.0.0.1 and ::1 rather than localhost
>>>>
>>>>   tests/qtest/meson.build     |   2 +
>>>>   tests/qtest/netdev-socket.c | 444 ++++++++++++++++++++++++++++++++++++
>>>>   2 files changed, 446 insertions(+)
>>>>   create mode 100644 tests/qtest/netdev-socket.c
>>
>> Acked-by: Thomas Huth <thuth@redhat.com>
>>
>> I'll queue it for my next pull request (unless someone else wants to take this first)
> 
> Sorry, but I have to unqueue it again. I'm still seeing failures
> in the Windows Cirrus-CI:
> 
>   https://cirrus-ci.com/task/5867407370092544
> 
> For example:
> 
> 218/556 qemu:qtest+qtest-aarch64 / qtest-aarch64/netdev-socket                    
> ERROR           0.02s   exit status 3
> ------------------------------------- 8< -------------------------------------
> stderr:
> socket_check_protocol_support() failed
> 
> (C:/Users/ContainerAdministrator/AppData/Local/Temp/cirrus-ci-build/build/tests/qtest/netdev-socket.exe:3300): GLib-CRITICAL **: 09:08:00.984: g_utf8_to_utf16: assertion 'str != NULL' failed
> 
> (test program exited with status code 3)
> 
> No clue where this comes from, though, I don't see a call
> to g_utf8_to_utf16() in your code?

OK, there is an error in the log:

socket_check_protocol_support() failed

So tmpdir is NULL and we try an g_rmdir(tmpdir)

I think this is the problem.

But why socket_check_protocol_support() fails?

test-char, test-io-channel-socket, test-util-sockets and test-yank also use it.

It seems we need to call socket_init() before...

I update my test.

Thanks,
Laurent




