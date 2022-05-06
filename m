Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB1451D397
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 10:43:56 +0200 (CEST)
Received: from localhost ([::1]:36728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmtZ4-0003eC-PO
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 04:43:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nmtXZ-0002x3-Kv
 for qemu-devel@nongnu.org; Fri, 06 May 2022 04:42:21 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:42941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nmtXT-0003GY-EA
 for qemu-devel@nongnu.org; Fri, 06 May 2022 04:42:21 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 n126-20020a1c2784000000b0038e8af3e788so3956478wmn.1
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 01:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ltr8BDfMoXfWQWd0EAkzVEQWNTQ8Vcxe+0FA1E9M2vg=;
 b=GrnEi5suxRaUAAZ/Aa0jpCPlbLLWSSR7uLSWZX4V1DaDpfktLv59yK8FVmoaascQKz
 VoppcYBn36HU8Ow1CeHuTyYMSe5iyjbTFF+FXW1pRr9HlZu6KySZ1ZPYW+meeOG6JLdc
 QO1+HozpkKEFD9qg9/eJqHblYILOzWi3Y/hS9/4NPo/wiM9KxrVI4YKEcnb3O+vihq/a
 rHakNl2YRmvbIn3sQlnp0c5jcA/n2g9zJjZIsAnDmsXW53E3E9OMIw8vl0xKdWwUFQdo
 d/cO7wgfrZMOyn5CXpElNh2ztnc9ngVzJuTjxqQ5eaLoFHIlF/SGvSluvWmmrotENpVL
 2nqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ltr8BDfMoXfWQWd0EAkzVEQWNTQ8Vcxe+0FA1E9M2vg=;
 b=e5QIANdkksmoEk0575qB8saWJzXSyfsd0XwpJiYYsPz1GbNc8BQfQkzm7M5RKOw+8w
 h7LsiiGGNcMCVw1/HNYzMalAS3arS7k1geto+XTA+t9W01VMsnNmNSVNAdSIxlgPsJ30
 ujpxvlUbP6Pc/6Wm+yLodCtMgr6xg3gxER12jzGyDeeCYi5tN60wmxgMwxPagBhTD3Ut
 LbE5JorPbWBN7KoQ7Du9x5/QUWjk02SJIiqfxeOT00c4Z3FiSpBkJNqg+Z/QijC/QQTS
 +cYMBPXpEQSNu69D5Jl1T+H7EwG74SSRHAMos0FJfk/Bvjpb2bo2r1m85qjLMwmgUDR/
 VJcg==
X-Gm-Message-State: AOAM533/6zaIpk560JEBnNcf2ioTnLeyNOBgcW1hHp18WV28lVKHhULE
 1I3fqtoFaCgzM6T5uds5xGg=
X-Google-Smtp-Source: ABdhPJwS9p+orvUtXirJFAzMzx9XLUyWtv2XwRvr0Ktj1Ba665xadToyoRMKOOCf3ZRK+SIEcrONvw==
X-Received: by 2002:a05:600c:35cc:b0:394:7b56:ef38 with SMTP id
 r12-20020a05600c35cc00b003947b56ef38mr1528605wmq.34.1651826533918; 
 Fri, 06 May 2022 01:42:13 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:e3ec:5559:7c5c:1928?
 ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.googlemail.com with ESMTPSA id
 h3-20020a05600016c300b0020c5253d8cesm3035808wrf.26.2022.05.06.01.42.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 01:42:13 -0700 (PDT)
Message-ID: <1c2caac1-1ea3-7dd5-eaee-1a6763e9b672@redhat.com>
Date: Fri, 6 May 2022 10:42:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Fio regression caused by f9fc8932b11f3bcf2a2626f567cb6fdd36a33a94
Content-Language: en-US
To: =?UTF-8?B?THVrw6HFoSBEb2t0b3I=?= <ldoktor@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>
Cc: longpeng2@huawei.com, qemu-devel <qemu-devel@nongnu.org>
References: <35dd4da8-5278-767e-4193-ccf53e836969@redhat.com>
 <YnOiRPrLkfjoPbU+@stefanha-x1.localdomain> <YnPGoOlV0CykrKwm@redhat.com>
 <f8cff216-de53-c789-6aa3-b0a23523fb5f@redhat.com>
 <1f773376-afc7-8117-60cc-760879a740e1@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <1f773376-afc7-8117-60cc-760879a740e1@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 5/6/22 06:30, Lukáš Doktor wrote:
> Also let me briefly share the details about the execution:

Thanks, this is super useful!

I got very similar results to yours:

QEMU 6.2			bw=1132MiB/s
QEMU 7.0			bw=1046MiB/s
QEMU 7.0 + patch		bw=1012MiB/s
QEMU 7.0 + tweaked patch	bw=1077MiB/s

"tweaked patch" is moving qemu_cond_signal after qemu_mutex_unlock.
It's better than QemuSemaphore in QEMU 7.0 but still not as good as
the original.  /me thinks

Paolo

> ---
> 
> mkdir -p /var/lib/runperf/runperf-nbd/
> truncate -s 256M /var/lib/runperf/runperf-nbd//disk.img
> nohup qemu-nbd -t -k /var/lib/runperf/runperf-nbd//socket -f raw /var/lib/runperf/runperf-nbd//disk.img &> $(mktemp /var/lib/runperf/runperf-nbd//qemu_nbd_XXXX.log) & echo $! >> /var/lib/runperf/runperf-nbd//kill_pids
> for PID in $(cat /var/lib/runperf/runperf-nbd//kill_pids); do disown -h $PID; done
> export TERM=xterm-256color
> true
> mkdir -p /var/lib/runperf/runperf-nbd/
> cat > /var/lib/runperf/runperf-nbd/nbd.fio << \Gr1UaS
> # To use fio to test nbdkit:
> #
> # nbdkit -U - memory size=256M --run 'export unixsocket; fio examples/nbd.fio'
> #
> # To use fio to test qemu-nbd:
> #
> # rm -f /tmp/disk.img /tmp/socket
> # truncate -s 256M /tmp/disk.img
> # export target=/tmp/socket
> # qemu-nbd -t -k $target -f raw /tmp/disk.img &
> # fio examples/nbd.fio
> # killall qemu-nbd
> 
> [global]
> bs = $@
> runtime = 30
> ioengine = nbd
> iodepth = 32
> direct = 1
> sync = 0
> time_based = 1
> clocksource = gettimeofday
> ramp_time = 5
> write_bw_log = fio
> write_iops_log = fio
> write_lat_log = fio
> log_avg_msec = 1000
> write_hist_log = fio
> log_hist_msec = 10000
> # log_hist_coarseness = 4 # 76 bins
> 
> rw = $@
> uri=nbd+unix:///?socket=/var/lib/runperf/runperf-nbd/socket
> # Starting from nbdkit 1.14 the following will work:
> #uri=${uri}
> 
> [job0]
> offset=0
> 
> [job1]
> offset=64m
> 
> [job2]
> offset=128m
> 
> [job3]
> offset=192m
> 
> Gr1UaS
> 
> benchmark_bin=/usr/local/bin/fio pbench-fio  --block-sizes=4 --job-file=/var/lib/runperf/runperf-nbd/nbd.fio --numjobs=4 --runtime=60 --samples=5 --test-types=write --clients=$WORKER_IP
> 
> ---
> 
> I am using pbench to run the execution, but you can simply replace the "$@" variables in the produced "/var/lib/runperf/runperf-nbd/nbd.fio" and run it directly using fio.
> 
> Regards,
> Lukáš
> 
> 
> Dne 05. 05. 22 v 15:27 Paolo Bonzini napsal(a):
>> On 5/5/22 14:44, Daniel P. Berrangé wrote:
>>>> util/thread-pool.c uses qemu_sem_*() to notify worker threads when work
>>>> becomes available. It makes sense that this operation is
>>>> performance-critical and that's why the benchmark regressed.
>>>
>>> Doh, I questioned whether the change would have a performance impact,
>>> and it wasn't thought to be used in perf critical places
>>
>> The expectation was that there would be no contention and thus no overhead because of the pool->lock that exists anyway, but that was optimistic.
>>
>> Lukáš, can you run a benchmark with this condvar implementation that was suggested by Stefan:
>>
>> https://lore.kernel.org/qemu-devel/20220505131346.823941-1-pbonzini@redhat.com/raw
>>
>> ?
>>
>> If it still regresses, we can either revert the patch or look at a different implementation (even getting rid of the global queue is an option).
>>
>> Thanks,
>>
>> Paolo


