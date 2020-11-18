Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6537E2B8482
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 20:17:03 +0100 (CET)
Received: from localhost ([::1]:32920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfSww-0004iA-Au
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 14:17:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kfStU-0003MO-T1
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 14:13:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kfStS-0001Gb-KP
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 14:13:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605726805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=87J+vcO6qyvYbQnUkt6tNwuf2drLnAFSkWK6FLmXjvU=;
 b=EaDCkg9LOonrWihCro658OsaLRi7+OeEcEr9RGLGEA4w8wg/oeipglVOdnK6ZclHvV7IAt
 J5n8FtTL5TSmQ5RYVHjBkL89OaUgXkHeSSKzQCoXVuDdO2z0nEQNVBj1I6OYPjN9tsZ1HE
 7r9qEF1IjPcGAvZCqMufqxK3yoCDc+E=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-N9Btm_RlOdyW0U5EwWtwMw-1; Wed, 18 Nov 2020 14:13:23 -0500
X-MC-Unique: N9Btm_RlOdyW0U5EwWtwMw-1
Received: by mail-ej1-f72.google.com with SMTP id lz20so1246959ejb.13
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 11:13:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=87J+vcO6qyvYbQnUkt6tNwuf2drLnAFSkWK6FLmXjvU=;
 b=qR9Ecxu6qCTioCm27/6NPmNUBkB85Cf9c196zfrrHf+IS1/l8YlL4bYgrxECaYAan6
 1Xvjt+JMxQGn+5xDSsVVXMR74rwtdn/B9ALSsa4WEw6/fkt0CjQ4yyNbYrdlyadgbPev
 JLF+PKdygXpUEB2G1r7+VSr/Cb95gt2XeWSsTYkg40ICWbB9nbpz642IsLWLlGynfMng
 5sMyiY7C6y7+jOAel/uur4Shy6d7TjCuDUn+R1lESRf2f+/1Qwl18pKLCmMFf1IFwUBE
 IA7aQ/PwipuvB4VtmHVz6s/W1uKw+5CJYl89Tj1oVKA23dyk2uc80jbBmOrE5HaVaWp0
 3gqQ==
X-Gm-Message-State: AOAM5327tmC6DqAtMYqT0C/XtTNuB00S7oEqIr7IAY6FGxC7coE9eDy9
 PxIX399BHit4VgiEqaiymJvrAI3aoH21cGN74c4BnbV0E10k08yx16rNq5NjrjRJgbLr3knngO5
 k7B6NJiOvEwIotXk=
X-Received: by 2002:a17:906:1a0c:: with SMTP id
 i12mr24798983ejf.176.1605726802252; 
 Wed, 18 Nov 2020 11:13:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwOGaEda2S/B2yes+g1TqFZVXr9glnaUxaAiyYWWpc2OxtV2kY8RNfrFp3s4rmlJVxaixL8YQ==
X-Received: by 2002:a17:906:1a0c:: with SMTP id
 i12mr24798939ejf.176.1605726802033; 
 Wed, 18 Nov 2020 11:13:22 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f24sm13954949edx.90.2020.11.18.11.13.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2020 11:13:21 -0800 (PST)
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20201118102936.25569-9-cfontana@suse.de>
 <20201118124845.GC1509407@habkost.net>
 <6093de34-807d-3840-5402-4769385dd894@suse.de>
 <8f829e99-c346-00bc-efdd-3e6d69cfba35@redhat.com>
 <20201118143643.GF1509407@habkost.net>
 <a6071cd4-0787-01c8-775a-ede72e740376@redhat.com>
 <20201118152552.GG1509407@habkost.net>
 <CABgObfYL-TNAMmqkUh6cjcytaAFEtXPfw8toO6gXEuyokdyLhA@mail.gmail.com>
 <20201118161119.GJ1509407@habkost.net>
 <CABgObfb2Fim=7j3z7ApTuW=R0dWam2F_JRuOoxhP=XZXdsWe7g@mail.gmail.com>
 <20201118173055.GM1509407@habkost.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC v3 8/9] module: introduce MODULE_INIT_ACCEL_CPU
Message-ID: <e7b70933-acd1-668c-62cd-89f480945f0f@redhat.com>
Date: Wed, 18 Nov 2020 20:13:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201118173055.GM1509407@habkost.net>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Bruce Rogers <brogers@suse.com>,
 Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, Olaf Hering <ohering@suse.de>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Cameron Esfahani <dirty@apple.com>, Colin Xu <colin.xu@intel.com>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>, haxm-team@intel.com,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/11/20 18:30, Eduardo Habkost wrote:
>> Adding a layer of indirect calls is not very different from monkey patching
>> though.
> 
> I'm a little bothered by monkey patching, but I'm more
> bothered by having to:
> 
> (1) register (module_init()) a function (kvm_cpu_accel_register()) that
>    (2) register (accel_register_call()) a function (kvm_cpu_accel_init()) that
>      (3) register (x86_cpu_accel_init()) a data structure (X86CPUAccel kvm_cpu_accel) that
>        (4) will be saved in multiple QOM classes, so that
>          (5) we will call the right X86CPUClass.accel method at the right moment
>              (common_class_init(), instance_init(), realizefn()),
> where:
>    step 4 must be done before any CPU object is created
>      (otherwise X86CPUAccel.instance_init & X86CPUAccel.realizefn
>       will be silently ignored), and
>    step 3 must be done after all QOM types were registered.
> 
>> You also have to consider that accel currently does not exist in usermode
>> emulators, so that's an issue too. I would rather get a simple change in
>> quickly, instead of designing the perfect class hierarchy.
> 
> It doesn't have to be perfect.  I agree that simple is better.
> 
> To me, registering a QOM type and looking it up when necessary is
> simpler than the above.  Even if it's a weird class having no
> object instances.  It probably could be an interface type.

Registering a QOM type still has quite some boilerplate.  Also 
registering a QOM type has a public side effect (shows up in 
qom-list-types).  In general I don't look at QOM unless I want its 
property mechanism, but maybe that's just me.

>> Perhaps another idea would be to allow adding interfaces to classes
>> *separately from the registration of the types*. Then we can use it to add
>> SOFTMMU_ACCEL and I386_ACCEL interfaces to a bare bones accel class, and
>> add the accel object to usermode emulators.
> 
> I'm not sure I follow.  What do you mean by bare bones accel
> class, and when exactly would you add the new interfaces to the
> classes?

A bare bones accel class would not have init_machine and setup_post 
methods; those would be in a TYPE_SOFTMMU_ACCEL interface.  It would 
still have properties (such as tb-size for TCG) and would be able to 
register compat properties.

Where would I add it, I don't know.  It could be a simple public wrapper 
around type_initialize_interface() if we add a new MODULE_INIT_* phase 
after QOM.

Or without adding a new phase, it could be a class_type->array of 
(interface_type, init_fn) hash table.  type_initialize would look up the 
class_type by name, add the interfaces would to the class with 
type_initialize_interface, and then call the init_fn to fill in the vtable.

Paolo


