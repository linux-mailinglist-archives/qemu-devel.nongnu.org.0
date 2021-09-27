Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4DE418EEC
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 08:14:10 +0200 (CEST)
Received: from localhost ([::1]:50096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUjtx-0000zH-FJ
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 02:14:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mUjsk-0000Ho-Kb
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 02:12:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mUjsg-0003nE-4J
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 02:12:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632723168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DwfRXYb/YfmuSLO3/Bgpd31xXqpUMarZh+T0BBj/52E=;
 b=DK0tIM6Z/ejGr4X/XIWL4BY0yip8SHJKhv7GbyNenJkX5R/Q7MIud8jG7kzD5NNXddPwbe
 XECcZVsMOiAFiCo9m556PwKGbCm09WjVL+5rRqwtD3Tf/bCTjMaFmJisBI6hn+0hQgmIwD
 h0iV/ujE4k+Q+8x+yE1/MtWlt0b3N+M=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-nGIlBf3LO7yDs7F7zZDo1g-1; Mon, 27 Sep 2021 02:12:46 -0400
X-MC-Unique: nGIlBf3LO7yDs7F7zZDo1g-1
Received: by mail-wr1-f70.google.com with SMTP id
 c15-20020a5d4ccf000000b0015dff622f39so13335488wrt.21
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 23:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DwfRXYb/YfmuSLO3/Bgpd31xXqpUMarZh+T0BBj/52E=;
 b=l8sdLGIVQa81JuK/AmLAD28o0MFApwMY5F9TRgcFR9uzxsk0sEefYEOp1nJgk3Pypm
 5qoEcu1WwNQuZt0vN3FeUuNDsJ+JLhylSFWSgCel5O2gEtzLWmi97EILYfftOh/iKgtB
 t8dOhO1BCUastMaY4wv2q5Ya7SOspQ25b4ogKEPC2nU+p4KUhUHxwbxcfMSE8ZYP/j9h
 nQirDiKm2+7w1bJtMEZBnmEqI0yMBiD635BCElRU3X+39C5K6RoNWBLDWyIoQZb88+nU
 V7m+qlPqA5p9hVNWtY07P+1KTPbvLndqrrYWwR+E14Cb+FCdZ2j54eEXfSle1O1dr/dU
 Itzg==
X-Gm-Message-State: AOAM53073me3D9QFdRokPeMaxpMCf0iUHqRvJ8QgIa4eZl7B/Wiq8fWW
 HktfI5xX62IQMQsULy/j4FS80z0ARC8I7NTkH7axGHLRphGlFNVmBYYxvSbWyjTNSikLrF0ua51
 wzO6e/M6dMRhV2+8=
X-Received: by 2002:adf:d4cb:: with SMTP id w11mr25953786wrk.125.1632723165587; 
 Sun, 26 Sep 2021 23:12:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuj4Mnu1nQV/U1w9Gr+inRwKYqKfjlkkJ50Lp3PGH1kMH+CP9TAz4TTOKmQDoxdL4o47n9jg==
X-Received: by 2002:adf:d4cb:: with SMTP id w11mr25953773wrk.125.1632723165397; 
 Sun, 26 Sep 2021 23:12:45 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.21.142])
 by smtp.gmail.com with ESMTPSA id k10sm3890822wmr.32.2021.09.26.23.12.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 23:12:45 -0700 (PDT)
Message-ID: <664cd2fd-253e-7a9c-15a0-a28a9078607b@redhat.com>
Date: Mon, 27 Sep 2021 08:12:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v7 12/40] accel/qtest: Implement AccelOpsClass::has_work()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20210925145118.1361230-1-f4bug@amsat.org>
 <20210925145118.1361230-13-f4bug@amsat.org>
 <8b882c1d-933a-448b-ec76-010b36d12096@amsat.org>
 <e1c7cb21-459e-15a3-7d99-da30c174ea76@linaro.org>
 <b5f7eccb-7b19-02c2-bef7-c8cf9e544440@amsat.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <b5f7eccb-7b19-02c2-bef7-c8cf9e544440@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.478, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/09/2021 18:01, Philippe Mathieu-Daudé wrote:
> On 9/25/21 17:32, Richard Henderson wrote:
>> On 9/25/21 11:27 AM, Philippe Mathieu-Daudé wrote:
>>>> +static bool qtest_cpu_has_work(CPUState *cpu)
>>>> +{
>>>> +    g_assert_not_reached();
>>>> +}
>>>
>>> Sigh, this triggers:
>>>
>>> Running test qtest-i386/cpu-plug-test
>>> **
>>> ERROR:../accel/qtest/qtest.c:52:qtest_cpu_has_work: code should not be reached
>>> ERROR qtest-i386/cpu-plug-test - Bail out! 
>>> ERROR:../accel/qtest/qtest.c:52:qtest_cpu_has_work: code should not be reached
>>> Broken pipe
>>
>> Ha ha, yes.  You beat me to the reply within minutes.
>>
>>> I suppose it is in my interest to 'return false' here and call it
>>> a day...
>>
>> I *think* that's the right thing, but I could see maybe "true" also makes sense.  I'll 
>> try and have a closer look.
> 
> So first I tested using "-machine pc,accel=qtest" -> no crash.
> 
> Looking closely at how check-qtest calls QEMU, it does:
> "-machine pc -accel qtest". Isn't the sugar property supposed
> to work that way?
> 
> Then the backtrace is:
> 
> Thread 5 "qemu-system-i38" hit Breakpoint 1, qtest_cpu_has_work (cpu=0x555556a08400) at 
> accel/qtest/qtest.c:52
> 52          g_assert_not_reached();
> (gdb) bt
> #0  qtest_cpu_has_work (cpu=0x555556a08400) at accel/qtest/qtest.c:52
> #1  0x0000555555c330ba in cpu_has_work (cpu=0x555556a08400) at softmmu/cpus.c:254
> #2  0x0000555555c32ac8 in cpu_thread_is_idle (cpu=0x555556a08400) at softmmu/cpus.c:91
> #3  0x0000555555c33584 in qemu_wait_io_event (cpu=0x555556a08400) at softmmu/cpus.c:417
> #4  0x0000555555d8a7f4 in dummy_cpu_thread_fn (arg=0x555556a08400) at accel/dummy-cpus.c:53
> #5  0x0000555555f469f6 in qemu_thread_start (args=0x5555574edae0) at 
> util/qemu-thread-posix.c:557
> #6  0x00007ffff4ff3299 in start_thread () at /lib64/libpthread.so.0
> #7  0x00007ffff4f1b353 in clone () at /lib64/libc.so.6
> 
> dummy_cpu_thread_fn() content didn't change since its introduction
> in commit c7f0f3b1c82 ("qtest: add test framework"):
> 
>     "The idea behind qtest is pretty simple.  Instead of executing
>      a CPU via TCG or KVM, rely on an external process to send events
>      to the device model that the CPU would normally generate."
> 
> Based on that description, qtest should provide a command to notify
> whether the CPU has work to do or not.
> 
> Meanwhile, no qtest command = no work = 'return false'.
> 

In fact, with the migration test we have CPU running (it's the purpose of the test), qtest 
allows to have several accelerators, "-accel qtest" adds the qtest control in QEMU and we 
have then a KVM or TCG accel to be able to run some qtest commands with a CPU running.

Thanks,
Laurent


