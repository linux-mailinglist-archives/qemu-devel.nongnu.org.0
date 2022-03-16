Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1274DB3B0
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 15:50:52 +0100 (CET)
Received: from localhost ([::1]:58996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUUzB-0001kr-Uj
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 10:50:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nUUva-0006mW-Fd
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 10:47:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nUUvX-0001yT-CS
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 10:47:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647442022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d1dqBnQik5aV1QoXWFxduujT7KvfAkxZHKgVvp9Hin8=;
 b=M7ZXY3FbpnEmpayQ4jAx2UQayJJL9sHtRSwQ/5rK6BqzqLWLWPbPFCuVDzMhQmqueZ4GdI
 RmjCdCR7FyjkLkVpW0lfcY/pvg7PTcu8CMVO8U8mJH84ePoci6OprIMVXoUFaVOHrbjwwo
 FU3Pd0B6ugubKEhybTmuvLlG4zSOBtY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-zS9RT5IWPveUCxCp-ZFaHA-1; Wed, 16 Mar 2022 10:47:01 -0400
X-MC-Unique: zS9RT5IWPveUCxCp-ZFaHA-1
Received: by mail-qv1-f69.google.com with SMTP id
 z2-20020a056214060200b00440d1bc7815so1664437qvw.1
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 07:47:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d1dqBnQik5aV1QoXWFxduujT7KvfAkxZHKgVvp9Hin8=;
 b=UDcXiFccahaYiHDrdOEXkpnMSiaQiRIHd0s+ZebGZmzUKKeA0aZIEwi63oqWgwjjb5
 4StxPCaxFAiq6U8/+dmrqXT8ykfSwizL+Kt4cSAbtZ1sJKLT1b3dvcskd16QHEFyIS7b
 Q2RzWCJ8UZHego+J12RqZ7EzMVMXu3g19orLMjZWNYqoYYwEjMHdNK55UV+K44NV+JZi
 2EpaEekFZFqXurPSvtzLNhsV6RBxPu5tkSr2tiC15rgKXEiIOmG+TYkqqLSO9nkO7ZGf
 e6ZEnPz/30u0yIRy95yzBDAU5nSBl2Cdw86WnClnuoqknzoVXC0gjuwuSHdqsbSXpu31
 GpOQ==
X-Gm-Message-State: AOAM532wGuqO8llMnUSMnrR2Bvgf1NttzzWze4yBuSTRjh2rD/bMU28l
 0dOOePq2/BUajN27qe4jURqB6zfVV62HLcUE7LqtHe3c0bPMKNqJH7bRw8SxwS/IAZ/Yf3XdmXq
 UxUwubCAy4Dh+oF0=
X-Received: by 2002:a05:622a:43:b0:2e1:4e:a784 with SMTP id
 y3-20020a05622a004300b002e1004ea784mr321684qtw.240.1647442020707; 
 Wed, 16 Mar 2022 07:47:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwZfrWEY5Tvd21/SBmIgpNHqD2VQLgBROTHEMQ5n4v5mAbEnAM2Vtl4mr0AV5F+L6m62Ldww==
X-Received: by 2002:a05:622a:43:b0:2e1:4e:a784 with SMTP id
 y3-20020a05622a004300b002e1004ea784mr321665qtw.240.1647442020471; 
 Wed, 16 Mar 2022 07:47:00 -0700 (PDT)
Received: from [192.168.149.119]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 b20-20020a376714000000b0067b21e5d18asm940418qkc.105.2022.03.16.07.46.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 07:46:59 -0700 (PDT)
Message-ID: <d600ff25-d854-7239-9001-7315b24b9054@redhat.com>
Date: Wed, 16 Mar 2022 15:46:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PULL 21/50] block/block-backend.c: assertions for block-backend
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org
References: <20220304164711.474713-1-kwolf@redhat.com>
 <20220304164711.474713-22-kwolf@redhat.com>
 <c005130e-10f0-b575-4493-2080ba08494b@gmail.com>
 <cecef6bd-951a-aab6-e603-96e3551e3e9e@gmail.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <cecef6bd-951a-aab6-e603-96e3551e3e9e@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 16/03/2022 um 13:53 schrieb Philippe Mathieu-Daudé:
> On 16/3/22 13:44, Philippe Mathieu-Daudé wrote:
>> Hi,
>>
>> On 4/3/22 17:46, Kevin Wolf wrote:
>>> From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>>
>>> All the global state (GS) API functions will check that
>>> qemu_in_main_thread() returns true. If not, it means
>>> that the safety of BQL cannot be guaranteed, and
>>> they need to be moved to I/O.
>>
>> I'm getting this crash:
>>
>> $ qemu-system-i386
>> Assertion failed: (qemu_in_main_thread()), function blk_all_next, file
>> block-backend.c, line 552.
>> Abort trap: 6
>>
>> Assertion failed: (qemu_in_main_thread()), function blk_all_next, file
>> block-backend.c, line 552.
>> qemu-system-i386 was compiled with optimization - stepping may behave
>> oddly; variables may not be available.
>> Process 76914 stopped
>> * thread #1, queue = 'com.apple.main-thread', stop reason = hit
>> program assert
>>      frame #4: 0x000000010057c2d4 qemu-system-i386`blk_all_next.cold.1
>> at block-backend.c:552:5 [opt]
>>     549    */
>>     550   BlockBackend *blk_all_next(BlockBackend *blk)
>>     551   {
>> -> 552       GLOBAL_STATE_CODE();
>>     553       return blk ? QTAILQ_NEXT(blk, link)
>>     554                  : QTAILQ_FIRST(&block_backends);
>>     555   }
>> Target 1: (qemu-system-i386) stopped.
> 
> Forgot to paste the backtrace:
> 
> (lldb) bt
> * thread #1, queue = 'com.apple.main-thread', stop reason = hit program
> assert
>     frame #0: 0x00000001908c99b8 libsystem_kernel.dylib`__pthread_kill + 8
>     frame #1: 0x00000001908fceb0 libsystem_pthread.dylib`pthread_kill + 288
>     frame #2: 0x000000019083a314 libsystem_c.dylib`abort + 164
>     frame #3: 0x000000019083972c libsystem_c.dylib`__assert_rtn + 300
>   * frame #4: 0x000000010057c2d4 qemu-system-i386`blk_all_next.cold.1 at
> block-backend.c:552:5 [opt]
>     frame #5: 0x00000001003c00b4
> qemu-system-i386`blk_all_next(blk=<unavailable>) at
> block-backend.c:552:5 [opt]
>     frame #6: 0x00000001003d8f04
> qemu-system-i386`qmp_query_block(errp=0x0000000000000000) at
> qapi.c:591:16 [opt]
>     frame #7: 0x000000010003ab0c qemu-system-i386`main [inlined]
> addRemovableDevicesMenuItems at cocoa.m:1756:21 [opt]
>     frame #8: 0x000000010003ab04
> qemu-system-i386`main(argc=<unavailable>, argv=<unavailable>) at
> cocoa.m:1980:5 [opt]
>     frame #9: 0x00000001012690f4 dyld`start + 520

I think Paolo and Peter talked about this a couple of days ago on #qemu,
and have already found a solution if I remember correctly.

Maybe it's worth to check with them first.

Emanuele
> 
>> Bisected to this patch:
>>
>> 0439c5a4623d674efa0c72abd62ca6e98bb7cf87 is the first bad commit
>>
>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>> Message-Id: <20220303151616.325444-9-eesposit@redhat.com>
>>> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>>> ---
>>>   block/block-backend.c  | 78 ++++++++++++++++++++++++++++++++++++++++++
>>>   softmmu/qdev-monitor.c |  2 ++
>>>   2 files changed, 80 insertions(+)
> 


