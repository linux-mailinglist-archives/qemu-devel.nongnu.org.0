Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFBE6B394F
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 09:54:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paYUl-0001ub-Bz; Fri, 10 Mar 2023 03:52:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paYUj-0001u9-Me
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 03:52:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paYUh-0007IM-R7
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 03:52:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678438373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DSLc52Dj2kioh1+Us2XK6sk8UneNxd0qnrBXgy8M33A=;
 b=YzgLLxUKoTyaKkAxK4wVUaNtekJTECQfIGoLIrWTa3wBygLfkDGFDFVKG94JwEoq5InzKS
 n1f4127HL8I+BaEvHJOE9ZRPpE64tEuKVMxO6dyhSiTy9/ki7ASNiK4OOV09VtrFmRXViZ
 aA1Qwe1Mv+etcaA8VQUhgQzhDQRYq1A=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-204-TTNyTrdCOyatGeAl7I5VoA-1; Fri, 10 Mar 2023 03:52:52 -0500
X-MC-Unique: TTNyTrdCOyatGeAl7I5VoA-1
Received: by mail-ed1-f70.google.com with SMTP id
 da22-20020a056402177600b004c60694083eso6706249edb.5
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 00:52:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678438370;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DSLc52Dj2kioh1+Us2XK6sk8UneNxd0qnrBXgy8M33A=;
 b=tT+3fSggC2Ez1HkMFE8y18g6FcAYJetXJWgyM6D5W9d9B0Om3UO8TAxLVcKY6wQza8
 3/b+x8tN4VHHvWhR4clE5gwE2tS9/HayGMOfFDIxZe97MqiOwUBcQYGuGJeos1Omnjj6
 AXJdigfjos+EPQA4kGWJsa5INWZQYlbg2sV7naQpng4iolFcBAsncnr/xTqNt6GdQe4D
 T7M+Aq8Jvx/qfy+7X2FtD2kplOA+jAs1zvcWMy8SlGAI0ZIFGT9fCTRiQ+B2UuFFgAdj
 2ptaDep0k5RclU1WsM1kyTyMUwiUlQQxMysILFbplKcJYYevTskYp9ZVS1HKQpi6e4lY
 XVFw==
X-Gm-Message-State: AO0yUKXvk8dTeu6eQWXX+BZHOVlXmob4xpMkOGmex5Ll4QAKS7iDIw8w
 SoHZEWR0bgGMNN1uIWMc3gPLOPvEwhfsyCRg43yI+4m9n2I5EoAxCygXkJhShqEdFU3xbtiRgE0
 BGig6wfX3Ph/qQjA=
X-Received: by 2002:a17:907:9948:b0:8aa:a9fe:a3fc with SMTP id
 kl8-20020a170907994800b008aaa9fea3fcmr26761254ejc.8.1678438370823; 
 Fri, 10 Mar 2023 00:52:50 -0800 (PST)
X-Google-Smtp-Source: AK7set/hQ2tEYQJz6OvdmBjmVCLd/lvoNTzRm/gudnrqg4gMV3GKMnPxMO3SgHEXQ0Y3bXG8rreoqg==
X-Received: by 2002:a17:907:9948:b0:8aa:a9fe:a3fc with SMTP id
 kl8-20020a170907994800b008aaa9fea3fcmr26761213ejc.8.1678438370337; 
 Fri, 10 Mar 2023 00:52:50 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 cb26-20020a170906a45a00b008f767c69421sm698162ejb.44.2023.03.10.00.52.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 00:52:49 -0800 (PST)
Message-ID: <7d6e4ef2-1f27-f210-0378-879852a70024@redhat.com>
Date: Fri, 10 Mar 2023 09:52:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v15 15/60] i386/xen: add pc_machine_kvm_type to initialize
 XEN_EMULATE mode
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com
References: <20230301135223.988336-1-dwmw2@infradead.org>
 <20230301135223.988336-16-dwmw2@infradead.org>
 <96e49428-0c2a-2a50-42e0-31c8e553a34b@intel.com>
 <ae5ce529ef1e492e4f8b06eece6528990ca965e6.camel@infradead.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <ae5ce529ef1e492e4f8b06eece6528990ca965e6.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 3/10/23 09:28, David Woodhouse wrote:
> On Fri, 2023-03-10 at 11:15 +0800, Xiaoyao Li wrote:
>> On 3/1/2023 9:51 PM, David Woodhouse wrote:
>>> From: David Woodhouse <dwmw@amazon.co.uk>
>>>
>>> The xen_overlay device (and later similar devices for event channels and
>>> grant tables) need to be instantiated. Do this from a kvm_type method on
>>> the PC machine derivatives, since KVM is only way to support Xen emulation
>>> for now.
>>
>> Just curious, isn't there any more reasonable place to add machine
>> specific initialization?
>>
>> abusing the mc->kvm_type() looks bad to me.
> 
> Hm, good question. Off the top of my head I have no better answer than
> "Paolo made me do it":
> 
> https://lore.kernel.org/qemu-devel/8495140d-3301-7693-b804-0554166802da@redhat.com/
> 
> But I have gained a bit more clue since December, and reading that
> message again I'll put a lot more focus on the fact that he said
> "during mc->kvm_type OR AFTERWARDS".

I don't think this is abusing mc->kvm_type; that is the point where 
startup code tells the machine "now you have your accelerator 
configuration, do what you want with that info".  In fact I find using 
xen_enabled() in mc->kvm_type to be less ugly than having a MachineClass 
entry just for KVM. :)

But, if you want to move it to pc_basic_device_init() that is certainly 
okay too.  It's not like people are going to add TCG/Xen support 
tomorrow but it is a tiny step in the direction of less 
accelerator-specific code for Xen emulation.

Paolo


