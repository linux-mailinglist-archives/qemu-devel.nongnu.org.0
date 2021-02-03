Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A2830DCB6
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 15:28:18 +0100 (CET)
Received: from localhost ([::1]:54438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7J8j-0008Ip-FS
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 09:28:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l7J5a-0005H4-Nw
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:25:02 -0500
Received: from mx2.suse.de ([195.135.220.15]:48398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l7J5Y-0000AD-Ot
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:25:02 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0482AAC6E;
 Wed,  3 Feb 2021 14:24:59 +0000 (UTC)
Subject: Re: [PATCH v15 22/23] accel: introduce new accessor functions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210201100903.17309-1-cfontana@suse.de>
 <20210201100903.17309-23-cfontana@suse.de>
 <7dd6b937-be9c-5e66-17ce-81414bc26f82@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <38c280a7-3719-054b-bb9a-ceda4e0ca765@suse.de>
Date: Wed, 3 Feb 2021 15:24:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <7dd6b937-be9c-5e66-17ce-81414bc26f82@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.178,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/21 3:23 PM, Philippe Mathieu-Daudé wrote:
> On 2/1/21 11:09 AM, Claudio Fontana wrote:
>> avoid open coding the accesses to cpu->accel_cpu interfaces,
>> and instead introduce:
>>
>> accel_cpu_instance_init,
>> accel_cpu_realizefn
>>
>> to be used by the targets/ initfn code,
>> and by cpu_exec_realizefn respectively.
>>
>> Add warnings about the use of target-specific headers.
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> ---
>>  include/hw/core/accel-cpu.h | 11 +++++++----
>>  include/qemu/accel.h        | 13 +++++++++++++
>>  accel/accel-common.c        | 19 +++++++++++++++++++
>>  cpu.c                       |  6 +-----
>>  target/i386/cpu.c           |  9 ++-------
>>  5 files changed, 42 insertions(+), 16 deletions(-)
>>
>> diff --git a/include/hw/core/accel-cpu.h b/include/hw/core/accel-cpu.h
>> index c7c137dc9a..24a6697412 100644
>> --- a/include/hw/core/accel-cpu.h
>> +++ b/include/hw/core/accel-cpu.h
>> @@ -1,5 +1,6 @@
>>  /*
>>   * Accelerator interface, specializes CPUClass
>> + * This header is used only by target-specific code.
>>   *
>>   * Copyright 2021 SUSE LLC
>>   *
>> @@ -11,10 +12,12 @@
>>  #define ACCEL_CPU_H
>>  
>>  /*
>> - * these defines cannot be in cpu.h, because we are using
>> - * CPU_RESOLVING_TYPE here.
>> - * Use this header to define your accelerator-specific
>> - * cpu-specific accelerator interfaces.
>> + * This header is used to define new accelerator-specific target-specific
>> + * accelerator cpu subclasses.
>> + * It uses CPU_RESOLVING_TYPE, so this is clearly target-specific.
>> + *
>> + * Do not try to use for any other purpose than the implementation of new
>> + * subclasses in target/, or the accel implementation itself in accel/
>>   */
> 
> Squash to patch #18 "accel: introduce AccelCPUClass extending CPUClass"?
> 

Yes, thanks!

Ciao,

Claudio

