Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 197F5316541
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 12:32:36 +0100 (CET)
Received: from localhost ([::1]:35474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9njT-0003Du-3m
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 06:32:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l9nhJ-0002gi-Ms
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 06:30:17 -0500
Received: from mx2.suse.de ([195.135.220.15]:48140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l9nhH-0002zx-Gc
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 06:30:17 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BE6A9ACB7;
 Wed, 10 Feb 2021 11:30:12 +0000 (UTC)
Subject: Re: [PATCH v16 19/23] i386: split cpu accelerators from cpu.c, using
 AccelCPUClass
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210204163931.7358-1-cfontana@suse.de>
 <20210204163931.7358-20-cfontana@suse.de>
 <8586d6a7-7b68-754c-11c3-39e30c27e28d@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <4c6b2706-c9e9-bf9c-400f-c897783b3cf9@suse.de>
Date: Wed, 10 Feb 2021 12:30:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <8586d6a7-7b68-754c-11c3-39e30c27e28d@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.265,
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

Ciao Paolo,

On 2/5/21 9:04 PM, Richard Henderson wrote:
> On 2/4/21 6:39 AM, Claudio Fontana wrote:
>> +static void hvf_cpu_accel_class_init(ObjectClass *oc, void *data)
>> +{
>> +    AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
>> +
>> +    acc->cpu_realizefn = host_cpu_realizefn;
>> +    acc->cpu_instance_init = hvf_cpu_instance_init;
>> +};
> 
> Watch the stray ; after functions.

Thanks Richard, removed.

> Make sure there's a blank line in between functions and file-scope structure
> definitions.

I'll keep an eye on it, let me know if you see an example in this or other patches.

> 
>> +static const TypeInfo hvf_cpu_accel_type_info = {
>> +    .name = ACCEL_CPU_NAME("hvf"),
>> +
>> +    .parent = TYPE_ACCEL_CPU,
>> +    .class_init = hvf_cpu_accel_class_init,
>> +    .abstract = true,
>> +};
>> +static void hvf_cpu_accel_register_types(void)
>> +{
>> +    type_register_static(&hvf_cpu_accel_type_info);
>> +}
> 
> The rest looks ok, but I would like to see other i386 review.

Thanks, maybe Paolo could help? It's just code shuffling, but of course a mistake is always possible.

Claudio

