Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 457BE307D15
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 18:55:49 +0100 (CET)
Received: from localhost ([::1]:52380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5BWF-0001b0-Tb
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 12:55:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l5BNp-0003Sr-Oh
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 12:47:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l5BNe-0001EM-W3
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 12:47:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611856013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=isSAFS+v7sExV3N+0nlUCmMIaibmFR/wXYLd+oxw3CQ=;
 b=AEtM8F5RAMiPgcPsn+ugfV9HoIjj5rUHufeGO16J6pqdjzV8C/OATQK9Ln0W/8Oj/rsrav
 0a0Lg0Tr+mJnVYWNU5MiDjh37dzuZmce5tDwFKv1XKBq/6Nh5XvLz/UaU4m77dGA1XqKMM
 gbU9R56wXF4N4d7vInaFws1kPG/AXDQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-q98sVp5BM82e0zE-jMpByg-1; Thu, 28 Jan 2021 12:46:37 -0500
X-MC-Unique: q98sVp5BM82e0zE-jMpByg-1
Received: by mail-wr1-f70.google.com with SMTP id l10so3499784wry.16
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 09:46:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=isSAFS+v7sExV3N+0nlUCmMIaibmFR/wXYLd+oxw3CQ=;
 b=fBlx1dsGYDG7eybw/EOrvRMJNibPgmb0ktnInHbEj7+M1hfIPRbri0eTEi9ZGn3nV6
 kdxZ5NQACc0iPUUw893/s5z7d9C2f714szkEDXWpjKF38sdD+tR+0IhgiERtiON5DSQh
 jwpBzMelTWLA27i3bhmagsv7lzH680xzzOWjmlbfRrMLFDlBWOYZqmgtNoq0ymdB6KVc
 C3MWsapooz+CLSrFQ5t7derCWdJQelq9ogq990sdNanW8wHAOljcnfgIgm2+CNt/yppY
 ycHKOZJXXD+s02EbSSqeiOE/yH4IEyuo+6b0qPK/YPwI0Lbtg2A9bvFLgK6n1iuUKwe/
 4VpQ==
X-Gm-Message-State: AOAM532vbUtM8PloAOvPdRxG3JnzTvdBYYmpR1cJfgTHTtkafHCV37O3
 eGDSHEAc/JT6brFTdoqUCDaJI5u27aCj/xSX3/oQYaz9jLiBALMh71ltC/nn81vNZm6jE2rWL7a
 hq4THUK3xaax+wNg=
X-Received: by 2002:a5d:4e4c:: with SMTP id r12mr239853wrt.354.1611855996468; 
 Thu, 28 Jan 2021 09:46:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzcSjQdgGuIt2rsmY0cSd0HQ9GheYfgGwTznWn+dXd0giHG9QKATSygsV9gGH6WmdW+Wi+QAQ==
X-Received: by 2002:a5d:4e4c:: with SMTP id r12mr239826wrt.354.1611855996278; 
 Thu, 28 Jan 2021 09:46:36 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id b11sm7838650wrp.60.2021.01.28.09.46.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 09:46:35 -0800 (PST)
Subject: Re: [PATCH] hw/intc/arm_gic: Allow to use QTest without crashing
To: Alexander Bulekov <alxndr@bu.edu>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210128161417.3726358-1-philmd@redhat.com>
 <20210128171811.jlnevikw4wgywjks@mozz.bu.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <82de6c97-d13b-01b9-e9ad-3b20f00adc5e@redhat.com>
Date: Thu, 28 Jan 2021 18:46:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210128171811.jlnevikw4wgywjks@mozz.bu.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Darren Kenny <darren.kenny@oracle.com>, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/21 6:18 PM, Alexander Bulekov wrote:
> On 210128 1714, Philippe Mathieu-Daudé wrote:
>> Alexander reported an issue in gic_get_current_cpu() using the
>> fuzzer. Yet another "deref current_cpu with QTest" bug, reproducible
>> doing:
>>
>>   $ echo readb 0xf03ff000 | qemu-system-arm -M npcm750-evb,accel=qtest -qtest stdio
>>   [I 1611849440.651452] OPENED
>>   [R +0.242498] readb 0xf03ff000
>>   hw/intc/arm_gic.c:63:29: runtime error: member access within null pointer of type 'CPUState' (aka 'struct CPUState')
>>   SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior hw/intc/arm_gic.c:63:29 in
>>   AddressSanitizer:DEADLYSIGNAL
>>   =================================================================
>>   ==3719691==ERROR: AddressSanitizer: SEGV on unknown address 0x0000000082a0 (pc 0x5618790ac882 bp 0x7ffca946f4f0 sp 0x7ffca946f4a0 T0)
>>   ==3719691==The signal is caused by a READ memory access.
>>       #0 0x5618790ac882 in gic_get_current_cpu hw/intc/arm_gic.c:63:29
>>       #1 0x5618790a8901 in gic_dist_readb hw/intc/arm_gic.c:955:11
>>       #2 0x5618790a7489 in gic_dist_read hw/intc/arm_gic.c:1158:17
>>       #3 0x56187adc573b in memory_region_read_with_attrs_accessor softmmu/memory.c:464:9
>>       #4 0x56187ad7903a in access_with_adjusted_size softmmu/memory.c:552:18
>>       #5 0x56187ad766d6 in memory_region_dispatch_read1 softmmu/memory.c:1426:16
>>       #6 0x56187ad758a8 in memory_region_dispatch_read softmmu/memory.c:1449:9
>>       #7 0x56187b09e84c in flatview_read_continue softmmu/physmem.c:2822:23
>>       #8 0x56187b0a0115 in flatview_read softmmu/physmem.c:2862:12
>>       #9 0x56187b09fc9e in address_space_read_full softmmu/physmem.c:2875:18
>>       #10 0x56187aa88633 in address_space_read include/exec/memory.h:2489:18
>>       #11 0x56187aa88633 in qtest_process_command softmmu/qtest.c:558:13
>>       #12 0x56187aa81881 in qtest_process_inbuf softmmu/qtest.c:797:9
>>       #13 0x56187aa80e02 in qtest_read softmmu/qtest.c:809:5
>>
>> current_cpu is NULL because QTest accelerator does not use CPU.
>>
>> Fix by skipping the check and returning the first CPU index when
>> QTest accelerator is used, similarly to commit c781a2cc423
>> ("hw/i386/vmport: Allow QTest use without crashing").
>>
>> Reported-by: Alexander Bulekov <alxndr@bu.edu>
> 
> Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
> 
> For reference, some older threads about similar issues in the GDB stub
> and monitor:
> https://bugs.launchpad.net/qemu/+bug/1602247

This one is different. I thought this issue was fixed by
the series around commit 7cf48f6752e ("gdbstub: add multiprocess
support to (f|s)ThreadInfo and ThreadExtraInfo").

When using physical addresses with gdbstub, we should be able to
select a particular address space.

Maybe this fixes pmemsave accessing MMIO here:
https://bugs.launchpad.net/qemu/+bug/1751674

> https://bugs.launchpad.net/qemu/+bug/1878645
> https://patchew.org/QEMU/20200701182100.26930-1-philmd@redhat.com/

I'm still procrastinating this thread :>

> 
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  hw/intc/arm_gic.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
>> index af41e2fb448..c33b1c8c4bc 100644
>> --- a/hw/intc/arm_gic.c
>> +++ b/hw/intc/arm_gic.c
>> @@ -28,6 +28,7 @@
>>  #include "qemu/module.h"
>>  #include "trace.h"
>>  #include "sysemu/kvm.h"
>> +#include "sysemu/qtest.h"
>>  
>>  /* #define DEBUG_GIC */
>>  
>> @@ -57,7 +58,7 @@ static const uint8_t gic_id_gicv2[] = {
>>  
>>  static inline int gic_get_current_cpu(GICState *s)
>>  {
>> -    if (s->num_cpu > 1) {
>> +    if (!qtest_enabled() && s->num_cpu > 1) {
>>          return current_cpu->cpu_index;
>>      }
>>      return 0;
>> -- 
>> 2.26.2
>>
>>
> 


