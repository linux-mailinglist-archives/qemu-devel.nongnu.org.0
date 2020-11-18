Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B932B7EFE
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 15:06:57 +0100 (CET)
Received: from localhost ([::1]:37368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfO6q-0004DA-07
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 09:06:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kfO5q-0003kQ-8B
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 09:05:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kfO5m-0007dv-Ob
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 09:05:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605708349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CKB2Fe5yWt6KK0xilpevqLc80x1B6olj4/dS/gqdSy0=;
 b=CJU8iH2EDef4Jj+fLYJoll2yRU/MuoDUGF5tGHM8WIlLaZ27vfRZJ9EDG/L5qPoXeoh6Et
 r7NdAVRjXhicwxMJYUyi0FLJWpO+4WATIFnjuiHIjNQ15JfCb07Kcpwh4Yi9/soyDtzaQt
 nqqYr2HrtpoxBpdWsUqYTxOH0ijF9LA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-XEFpoTYjPa2DqR3TYNLxJQ-1; Wed, 18 Nov 2020 09:05:46 -0500
X-MC-Unique: XEFpoTYjPa2DqR3TYNLxJQ-1
Received: by mail-ed1-f70.google.com with SMTP id i89so842414edd.15
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 06:05:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CKB2Fe5yWt6KK0xilpevqLc80x1B6olj4/dS/gqdSy0=;
 b=n73uSPSHtvPRAilpxWAWj63b9I8hYJvfdv87B1GxZANg+gCQcIcMB2YZqcpalULAxq
 jOi4P3T4BsP6b15LFU/O8CLWjA3cT7dQM1beGdQCneATaeoJwA+F0JwK7iEptOsRk/bs
 e4jnpf2Vz0k7vss0VHQA5dqk9oS1j7gIUSN9q0T7sCKBIgFy9sbdHufOQR4QbnnEWSiR
 kbmw5Q2YATzWBkz8CUDcKiw2gUjQ+/G47yv8mer8bxGksKIytsscGRBqvToAKeYQiwYZ
 WvrTSI069VITqjgsr3dnEcHx6Q7adJJiNe5X93spYfwWvTvloCHGYNqs27Ql57rgjdJP
 vLQA==
X-Gm-Message-State: AOAM533Gr43LvWPFlpq9tSRqZcNTDe7vz+FmUe7WmbwSnb93c7soLLTy
 I7+5c/nzBzGG0u/V6jgZhqM+hYMHuPxAk3rKKp/xa1dyX2ix4Mp3HbqVA2Kldzcg1M2mLFClfmW
 Bu1c3O9rqKNCMxyg=
X-Received: by 2002:a17:906:b01:: with SMTP id
 u1mr24886728ejg.427.1605708345013; 
 Wed, 18 Nov 2020 06:05:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJygEd4WWiIDNgQON/muZhOLS7xD6Y8HIyzk12Nn0AlHHpPYgSRVwN/uURknSB3qbTvYoRn/Dg==
X-Received: by 2002:a17:906:b01:: with SMTP id
 u1mr24886693ejg.427.1605708344766; 
 Wed, 18 Nov 2020 06:05:44 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id y15sm13556705eds.56.2020.11.18.06.05.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2020 06:05:43 -0800 (PST)
To: Claudio Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>
References: <20201118102936.25569-1-cfontana@suse.de>
 <20201118102936.25569-9-cfontana@suse.de>
 <20201118124845.GC1509407@habkost.net>
 <6093de34-807d-3840-5402-4769385dd894@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC v3 8/9] module: introduce MODULE_INIT_ACCEL_CPU
Message-ID: <8f829e99-c346-00bc-efdd-3e6d69cfba35@redhat.com>
Date: Wed, 18 Nov 2020 15:05:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <6093de34-807d-3840-5402-4769385dd894@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Olaf Hering <ohering@suse.de>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Cameron Esfahani <dirty@apple.com>,
 Colin Xu <colin.xu@intel.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>, haxm-team@intel.com,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Bruce Rogers <brogers@suse.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/11/20 14:48, Claudio Fontana wrote:
> On 11/18/20 1:48 PM, Eduardo Habkost wrote:
>> On Wed, Nov 18, 2020 at 11:29:35AM +0100, Claudio Fontana wrote:
>>> apply this to the registration of the cpus accel interfaces,
>>>
>>> but this will be also in preparation for later use of this
>>> new module init step to also defer the registration of the cpu models,
>>> in order to make them subclasses of a per-accel cpu type.
>>>
>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>> ---
>> [...]
>>> +    /*
>>> +     * accelerator has been chosen and initialized, now it is time to
>>> +     * register the cpu accel interface.
>>> +     */
>>> +    module_call_init(MODULE_INIT_ACCEL_CPU);
>>
>> I don't get why we would use a new module initialization level
> 
> To have a clear point in time after which all accelerator interface initialization is done.
> It avoids to have to hunt down the registration points spread around the code base.
> I'd turn it around, why not?

I see two disadvantages:

1) you have to hunt down accel_cpu_inits instead of looking at 
accelerator classes. :)

2) all callbacks have an "if (*_enabled())" around the actual meat. 
Another related issue is that usually the module_call_init are 
unconditional.

I think the idea of using module_call_init is good however.  What about:

static void kvm_cpu_accel_init(void)
{
     x86_cpu_accel_init(&kvm_cpu_accel);
}

static void kvm_cpu_accel_register(void)
{
     accel_register_call(TYPE_KVM, kvm_cpu_accel_init);
}
accel_cpu_init(kvm_cpu_accel_register);

...

void
accel_register_call(const char *qom_type, void (*fn)(void))
{
     AccelClass *acc = ACCEL_CLASS(object_class_by_name(qom_type));

     acc->setup_calls = g_slist_append(acc->setup_calls, (void *)fn);
}

void
accel_do_call(void *data, void *unused)
{
     void (*fn)(void) = data;

     data();
}

int accel_init_machine(AccelState *accel, MachineState *ms)
{
...
     if (ret < 0) {
         ms->accelerator = NULL;
         *(acc->allowed) = false;
         object_unref(OBJECT(accel));
     } else {
         object_set_accelerator_compat_props(acc->compat_props);
         g_slist_foreach(acc->setup_calls, accel_do_call, NULL);
     }
     return ret;
}

where the module_call_init would be right after MODULE_INIT_QOM

Paolo

>> for this.  If the accelerator object was already created, we can
>> just ask the existing accel object to do whatever initialization
>> step is necessary.
>>
>> e.g. we can add a AccelClass.cpu_accel_ops field, and call:
>>
>>     cpus_register_accel(current_machine->accelerator->cpu_accel_ops);
>>
> 
> _When_ this is done is the question, in my view, where the call to the registration is placed.
> 
> After adding additonal operations that have to be done at "accelerator-chosen" time, it becomes more and more difficult to trace them around the codebase.
> 
> Thanks,
> 
> Claudio
> 
> 
> 
> 


