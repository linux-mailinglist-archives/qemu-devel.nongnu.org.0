Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFC642BC1F
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:50:55 +0200 (CEST)
Received: from localhost ([::1]:48800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maauU-00024f-In
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:50:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1maaIU-0006gC-JS
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:11:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1maaIS-0003TK-Az
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:11:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634116293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W2/9cha2ul3GdQhQe1yCuqgoW6zCRPyi7fWzxsV221c=;
 b=BPc0yZJMdtmDTNX3VcMwUYC5+fzx72iO+bSEd4Ii7WZh97dMQ35XFE3+B0HT+oyf8rRRiK
 Uqd2zpUqt5NZzpVA2hq7sg0NlB8J4y2duw3VT0nWf1/pVXzU4sXQDrU96dJ56w3mAvgjGP
 A6u15kvAgaZsLo5FDXOstxEiPAHgqVo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-ZxH9GD2CNaOWcTuYTUuT9Q-1; Wed, 13 Oct 2021 05:11:32 -0400
X-MC-Unique: ZxH9GD2CNaOWcTuYTUuT9Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 k2-20020adfc702000000b0016006b2da9bso1471504wrg.1
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:11:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W2/9cha2ul3GdQhQe1yCuqgoW6zCRPyi7fWzxsV221c=;
 b=RC2yt+N/Q97/y6QICdXTrd0H9hosAWDwlkYWXQVpH4wbpwUYKxikMwCdp2K8i1x4vz
 NmXtDNpYsSylI8BB36S87J/JnF17nD2PCUP0jZ6pD1dh4PtNeuyTQf3YV9++6cvoKBZ3
 1ZrVnm06Bzf/irAmDRk0AgJ+1S9npKRDm+AxBCTddBAVcvT+Q4gQKMQXapCBAnIDFpmf
 2ZjTEsMQezb1fUHXErwZzpdfNWmbQ0gsUyOEIXB1hZPE1DyOVTvpOKAQ++rq6eezR1fi
 N7NML6UYtZDPJiFh7q89T+2hDacmO0Ztj+LS1GXohv4FF3hvrzVbqKrvCmCL7SJZSy7k
 fl9A==
X-Gm-Message-State: AOAM530fh3uBkEWF538MkgBn36OB2ZB1gVP4WqdoWseiWe1BNLyHrdbS
 J/TiwKkrBD0RdomiVv3JvFFwpdgCot8+4PsfBgwBrtrV+JTTXb9+GPBHyn8Cvp9TteRQJayD1+M
 4a0t+p/3Ek0J5HLk=
X-Received: by 2002:a05:6000:18a1:: with SMTP id
 b1mr39671571wri.338.1634116291728; 
 Wed, 13 Oct 2021 02:11:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwI95we8ABgMmJK26mJ0Q0fvVCu0e2x2Wm7N4znkgGB3A/FuivcWKL65nx5Pmp66MMKy6K06Q==
X-Received: by 2002:a05:6000:18a1:: with SMTP id
 b1mr39671536wri.338.1634116291526; 
 Wed, 13 Oct 2021 02:11:31 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id x21sm4723681wmc.14.2021.10.13.02.11.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 02:11:31 -0700 (PDT)
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
References: <1631800254-25762-1-git-send-email-pmorel@linux.ibm.com>
 <1631800254-25762-3-git-send-email-pmorel@linux.ibm.com>
 <ae0cf5c1-b0b8-0758-7c38-35c1845201ba@redhat.com>
 <80eeffd4-25cf-c2ac-e74b-c8d5301fa98a@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v3 2/4] s390x: kvm: topology: interception of PTF
 instruction
Message-ID: <803cd1be-0b06-694c-82ae-d5015a34879f@redhat.com>
Date: Wed, 13 Oct 2021 11:11:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <80eeffd4-25cf-c2ac-e74b-c8d5301fa98a@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: david@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/10/2021 09.55, Pierre Morel wrote:
> 
> 
> On 10/13/21 09:25, Thomas Huth wrote:
>> On 16/09/2021 15.50, Pierre Morel wrote:
>>> When the host supports the CPU topology facility, the PTF
>>> instruction with function code 2 is interpreted by the SIE,
>>> provided that the userland hypervizor activates the interpretation
>>> by using the KVM_CAP_S390_CPU_TOPOLOGY KVM extension.
>>>
>>> The PTF instructions with function code 0 and 1 are intercepted
>>> and must be emulated by the userland hypervizor.
>>>
>>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>>> ---
...
>>> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
>>> index 5b1fdb55c4..dd036961fe 100644
>>> --- a/target/s390x/kvm/kvm.c
>>> +++ b/target/s390x/kvm/kvm.c
>>> @@ -97,6 +97,7 @@
>>>   #define PRIV_B9_EQBS                    0x9c
>>>   #define PRIV_B9_CLP                     0xa0
>>> +#define PRIV_B9_PTF                     0xa2
>>>   #define PRIV_B9_PCISTG                  0xd0
>>>   #define PRIV_B9_PCILG                   0xd2
>>>   #define PRIV_B9_RPCIT                   0xd3
>>> @@ -362,6 +363,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>>>       kvm_vm_enable_cap(s, KVM_CAP_S390_USER_SIGP, 0);
>>>       kvm_vm_enable_cap(s, KVM_CAP_S390_VECTOR_REGISTERS, 0);
>>>       kvm_vm_enable_cap(s, KVM_CAP_S390_USER_STSI, 0);
>>> +    kvm_vm_enable_cap(s, KVM_CAP_S390_CPU_TOPOLOGY, 0);
>>
>> Should this maybe rather be done in the last patch, to avoid a state where 
>> PTF is available, but STSI 15 is not implemented yet (when bisecting 
>> through these commits later)?
>>
>>   Thomas
>>
> 
> Yes you are right, thanks.

I'm also still a little bit surprised that there is really no migration code 
involved here yet. What if a guest gets started on a system with 
KVM_CAP_S390_CPU_TOPOLOGY support and later migrated to a system without 
KVM_CAP_S390_CPU_TOPOLOGY support? Is there already some magic in place that 
rejects such a migration? If not, the guest might first learn that it could 
use the PTF instruction, but suddenly it is then not available anymore? Does 
Linux cope right with PTF becoming unavailable during runtime? But even if 
it does, I think it's likely not in the sense of the architecture if certain 
instructions might disappear during runtime? Or do I miss something?

  Thomas


