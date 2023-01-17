Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BAC66DC39
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 12:22:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHk1c-0000Ir-3a; Tue, 17 Jan 2023 06:21:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pHk11-0000HT-Jw
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 06:20:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pHk0z-0000z4-CI
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 06:20:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673954428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3vulyTkjmxEw4+otl2PrO2n++aXNCeOoppYusFtOMDM=;
 b=JC5i3vK9R+TIg7EjGLMYmdqEsXVH+ewDoMuohE+gfMh1xhC4Qkmoi28ymKguVH//SPoPiG
 dfrlNXDPbLPcI23fuqSXMTLQZwqSPKysJL/oUGa0P5sL5YsknuqoxNnzIXrvO122JNDU2d
 NBaFYcvkTdzd6wlWUWFGKjfosED99nY=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-325-2kDeTwo5OBiNccaA4xtB-g-1; Tue, 17 Jan 2023 06:20:27 -0500
X-MC-Unique: 2kDeTwo5OBiNccaA4xtB-g-1
Received: by mail-qk1-f197.google.com with SMTP id
 u10-20020a05620a0c4a00b00705e77d6207so12246133qki.5
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 03:20:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3vulyTkjmxEw4+otl2PrO2n++aXNCeOoppYusFtOMDM=;
 b=QRNzDTx2Zq6duD4nTEMsRd+xYg6JXMLmMMhxbif6mV8VBLBm5HJJnrjZ4bmrHR6tlS
 1E0HszSZ5h6cM41hly/X3TnCSh1uUr/p1U9IsvojyR+gk/ooKyyCJMAkk13w0KqL0Ss2
 FPT1bfOoWZ7wAHsLebhZ1w+JpTtGeRshn3bq7FfwWkFtGuubNgNhq87T6VfCC/c6+eQX
 crYTKxR96X7L6ylnQWWNO1JuwNdpZy1nRbt1o4x5MCa3acLSwjb/7puULJpDbRm/MNCh
 zxEV9xWT7J74VxdArSFGmHeFUU1k4vFcJTiBhHUeZZfPvTGTfYlcsESj38JgV9t2rKbE
 3xWQ==
X-Gm-Message-State: AFqh2kpt/WRnH84Yf0VAXI1ZKHzH6d4E44uEeRmR2nPQTuExksMcKXmQ
 AeiAOjo6EFORQTWkV3Xlx87RGpv+/3Bi/G2AATfWiCRTkMGuYkLiz0l3mPTCVXu6ov/liGbeMkS
 /e1SuI9V0z/y0lmw=
X-Received: by 2002:ac8:7341:0:b0:3b6:334b:2cb7 with SMTP id
 q1-20020ac87341000000b003b6334b2cb7mr3550893qtp.19.1673954426750; 
 Tue, 17 Jan 2023 03:20:26 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsMq/hZiYGUwPjjLG6XlRWY3rQ+Io9uV1n2JxhlBh7zQ/uDLOU4KLvpP2DmTghVR1GMDTFv4g==
X-Received: by 2002:ac8:7341:0:b0:3b6:334b:2cb7 with SMTP id
 q1-20020ac87341000000b003b6334b2cb7mr3550867qtp.19.1673954426493; 
 Tue, 17 Jan 2023 03:20:26 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-26.web.vodafone.de.
 [109.43.177.26]) by smtp.gmail.com with ESMTPSA id
 e26-20020ac845da000000b003a527d29a41sm2715630qto.75.2023.01.17.03.20.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 03:20:25 -0800 (PST)
Message-ID: <a4ef07c2-c509-cdac-c0a7-e6467f2ff88c@redhat.com>
Date: Tue, 17 Jan 2023 12:20:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v5] tests/qtest: netdev: test stream and dgram backends
Content-Language: en-US
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
References: <20230105093751.416666-1-lvivier@redhat.com>
 <3d55b710-4601-4f8b-5289-72997ea09e5a@redhat.com>
 <0b29c231-da85-5302-31bc-b2e420c2b394@redhat.com>
 <5a13b5c9-f8d4-6b4f-b55b-4b8a0ac54867@redhat.com>
 <2bfffb52-a462-869c-af58-6a808a56f10f@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <2bfffb52-a462-869c-af58-6a808a56f10f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

On 17/01/2023 11.53, Laurent Vivier wrote:
> On 1/17/23 11:00, Thomas Huth wrote:
>> On 16/01/2023 09.40, Thomas Huth wrote:
>>> On 16/01/2023 09.29, Laurent Vivier wrote:
>>>> ping
>>>>
>>>> On 1/5/23 10:37, Laurent Vivier wrote:
>>>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>>>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>>>>> ---
>>>>>
>>>>> Notes:
>>>>>      v5:
>>>>>        - disable test_stream_fd and  test_dgram_fd on windows as 
>>>>> socketpair()
>>>>>          is not defined.
>>>>>        - enable test_stream_unix_abstract only on linux as "abstract"
>>>>>          unix socket parameter is only defined on linux.
>>>>>      v4:
>>>>>        - rework EXPECT_STATE()
>>>>>        - use g_dir_make_tmp()
>>>>>      v3:
>>>>>      - Add "-M none" to avoid error:
>>>>>        "No machine specified, and there is no default"
>>>>>      v2:
>>>>>      - Fix ipv6 free port allocation
>>>>>      - Check for IPv4, IPv6, AF_UNIX
>>>>>      - Use g_mkdtemp() rather than g_file_open_tmp()
>>>>>      - Use socketpair() in test_stream_fd()
>>>>>      v1: compared to v14 of "qapi: net: add unix socket type support to 
>>>>> netdev backend":
>>>>>      - use IP addresses 127.0.0.1 and ::1 rather than localhost
>>>>>
>>>>>   tests/qtest/meson.build     |   2 +
>>>>>   tests/qtest/netdev-socket.c | 444 ++++++++++++++++++++++++++++++++++++
>>>>>   2 files changed, 446 insertions(+)
>>>>>   create mode 100644 tests/qtest/netdev-socket.c
>>>
>>> Acked-by: Thomas Huth <thuth@redhat.com>
>>>
>>> I'll queue it for my next pull request (unless someone else wants to take 
>>> this first)
>>
>> Sorry, but I have to unqueue it again. I'm still seeing failures
>> in the Windows Cirrus-CI:
> 
> I'm sorry too :(
> 
>>
>>   https://cirrus-ci.com/task/5867407370092544
>>
>> For example:
>>
>> 218/556 qemu:qtest+qtest-aarch64 / qtest-aarch64/netdev-socket 
>> ERROR           0.02s   exit status 3
>> ------------------------------------- 8< 
>> -------------------------------------
>> stderr:
>> socket_check_protocol_support() failed
>>
>> (C:/Users/ContainerAdministrator/AppData/Local/Temp/cirrus-ci-build/build/tests/qtest/netdev-socket.exe:3300): 
>> GLib-CRITICAL **: 09:08:00.984: g_utf8_to_utf16: assertion 'str != NULL' 
>> failed
>>
>> (test program exited with status code 3)
>>
>> No clue where this comes from, though, I don't see a call
>> to g_utf8_to_utf16() in your code?
> 
> Could you give the command line to reproduce the problem?

This was running in the Cirrus-CI via the .cirrus.yml file. You need a git 
repo on github for this and enable the Cirrus-CI for it, then it should 
trigger automatically when you push a new branch to the repository.

  Thomas


