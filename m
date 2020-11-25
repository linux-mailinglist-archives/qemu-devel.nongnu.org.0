Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CCB2C3C26
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 10:25:18 +0100 (CET)
Received: from localhost ([::1]:47680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khr37-0007bH-WE
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 04:25:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1khr2E-00079a-VO
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 04:24:22 -0500
Received: from mx2.suse.de ([195.135.220.15]:40362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1khr2D-0003f7-EM
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 04:24:22 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 259D0AF4C;
 Wed, 25 Nov 2020 09:24:20 +0000 (UTC)
Subject: Re: [RFC v5 11/12] i386: centralize initialization of cpu accel
 interfaces
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Emilio G . Cota" <cota@braap.org>
References: <20201124162210.8796-1-cfontana@suse.de>
 <20201124162210.8796-12-cfontana@suse.de>
 <7dc27df6-1c81-f8fb-3e56-aa6ffe9e8475@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <61d2e854-5d60-9b1e-25fb-6f37e82e29f8@suse.de>
Date: Wed, 25 Nov 2020 10:24:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <7dc27df6-1c81-f8fb-3e56-aa6ffe9e8475@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 haxm-team@intel.com, Cameron Esfahani <dirty@apple.com>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/20 9:13 PM, Paolo Bonzini wrote:
> On 24/11/20 17:22, Claudio Fontana wrote:
>> +static void x86_cpu_accel_init(void)
>>  {
>> -    X86CPUAccelClass *acc;
>> +    const char *ac_name;
>> +    ObjectClass *ac;
>> +    char *xac_name;
>> +    ObjectClass *xac;
>>  
>> -    acc = X86_CPU_ACCEL_CLASS(object_class_by_name(accel_name));
>> -    g_assert(acc != NULL);
>> +    ac = object_get_class(OBJECT(current_accel()));
>> +    g_assert(ac != NULL);
>> +    ac_name = object_class_get_name(ac);
>> +    g_assert(ac_name != NULL);
>>  
>> -    object_class_foreach(x86_cpu_accel_init_aux, TYPE_X86_CPU, false, &acc);
>> +    xac_name = g_strdup_printf("%s-%s", ac_name, TYPE_X86_CPU);
>> +    xac = object_class_by_name(xac_name);
>> +    g_free(xac_name);
>> +
>> +    if (xac) {
>> +        object_class_foreach(x86_cpu_accel_init_aux, TYPE_X86_CPU, false, xac);
>> +    }
>>  }
>> +
>> +accel_cpu_init(x86_cpu_accel_init);
> 
> If this and cpus_accel_ops_init are the only call to accel_cpu_init, I'd 
> rather make them functions in CPUClass (which you find and call via 
> CPU_RESOLVING_TYPE) and AccelClass respectively.
> 
> Paolo
> 
> 

I don't expect others (actually I do, but it's going to be one additional call per target).
So based on RFCv5, I would see additional calls to accel_cpu_init for target/arm/cpu.c, target/s390x/cpu.c in patches to come.

I'll look into this.

Thanks,

Claudio

