Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4313514E5
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 14:49:40 +0200 (CEST)
Received: from localhost ([::1]:51224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRwlX-0000U2-Qe
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 08:49:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRwki-0008TD-QO
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 08:48:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRwkh-00075v-4K
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 08:48:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617281326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gENHOQIqWm4bFjC3lTVU/0PXAiAza1zIis1kpMR7SxI=;
 b=bd/OVz5lOXxHkbR2VJbDRNy3ZcAsruIxbJg1gU4ZI4Th/kEmFpQrjjiqRB64AmZzaO1yvl
 ABSj9ML01664CGtqiPqSInDYtxt8P3vJP9cix73jgX5sic+jJGwFZ1ETqqRZwrPinVH496
 Ao5GQ8/x0RJd0L0CpR7HmDgBz9ebrFw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-5QMQMbQ7O32dCh2JpBuE7Q-1; Thu, 01 Apr 2021 08:48:43 -0400
X-MC-Unique: 5QMQMbQ7O32dCh2JpBuE7Q-1
Received: by mail-ed1-f70.google.com with SMTP id i19so2786281edy.18
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 05:48:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gENHOQIqWm4bFjC3lTVU/0PXAiAza1zIis1kpMR7SxI=;
 b=k1iJL3/YKp7/v4e2OYv9eoDWOxSgA+fCmO7nfVrnSrfvpLSRmVH28qcu+ol6Uf+i/9
 W9hW+/luKmMqKBj5ixsAFXgjISSt4dudMn7vEMBLCMqrSLq71/hbaoIfZnqhvebAmfgB
 WrG50wXHZDu3IzGrCU4j7qYWlSulfvxdI1ZNR/DazeqQCkLvrvVa1N+9IuomSMUcxFjN
 h9PY1gzgCQIqpxgwn0DJFOmzcq0sgWIjhgnU8KGbK22eMZB2Z1x28MPKFb/6z5/KIwcs
 WVN3FoRjpwXjSQdSjiZSkHSNJHY0yVUVTuAAAdS84ntnEoHcDjOBrRuy3N8RO/FqM4kZ
 Q2Mg==
X-Gm-Message-State: AOAM531gT4tVlglBnPAK2HOdHGCq2FZ5fzKzejjqEaEZEUkEr1+iAOIX
 avlJ2gqIuj7lVprjGGTVnYXQyuyfvyfRgI3CVGfbAlei4LB6GCrkhEIejVOVroIVadvr+gsETCy
 OJjuFhCvKP58GJO0=
X-Received: by 2002:a05:6402:1d33:: with SMTP id
 dh19mr9577987edb.362.1617281321958; 
 Thu, 01 Apr 2021 05:48:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/ji2qFQSy7iFDFYDjKXaMwWOuVgeEJxSTODE4x5UshPdqpQC2xyQUBzhNUcFv0nOsNiKLsQ==
X-Received: by 2002:a05:6402:1d33:: with SMTP id
 dh19mr9577977edb.362.1617281321801; 
 Thu, 01 Apr 2021 05:48:41 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id gn3sm2668522ejc.2.2021.04.01.05.48.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 05:48:41 -0700 (PDT)
Subject: Re: [PATCH v6 2/4] Add NVMM accelerator: x86 CPU support
To: Reinoud Zandijk <reinoud@NetBSD.org>
References: <20210331200800.24168-1-reinoud@NetBSD.org>
 <20210331200800.24168-3-reinoud@NetBSD.org>
 <5afd10b1-bd32-2f06-b311-246815428bfc@redhat.com>
 <YGW9ZSo5RbeqDuVX@diablo.13thmonkey.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1122c14e-1b9f-be29-aba9-b39dd3e78fd5@redhat.com>
Date: Thu, 1 Apr 2021 14:48:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YGW9ZSo5RbeqDuVX@diablo.13thmonkey.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kamil Rytarowski <kamil@NetBSD.org>, Ryo ONODERA <ryoon@netbsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/04/21 14:32, Reinoud Zandijk wrote:
> On Thu, Apr 01, 2021 at 10:35:40AM +0200, Paolo Bonzini wrote:
>> On 31/03/21 22:07, Reinoud Zandijk wrote:
>>> +void nvmm_vcpu_kick(CPUState *cpu);
>>
>> Not defined anywhere.
> 
> Hmmm, indeed. I think its a leftover of the former patch. Good catch.
> 
>>> +{
>>> +#if NVMM_USER_VERSION == 1
>>> +    struct sigaction sigact;
>>> +    sigset_t set;
>>> +
>>> +    /* Install the IPI handler. */
>>> +    memset(&sigact, 0, sizeof(sigact));
>>> +    sigact.sa_handler = nvmm_ipi_signal;
>>> +    sigaction(SIG_IPI, &sigact, NULL);
>>> +
>>> +    /* Allow IPIs on the current thread. */
>>> +    sigprocmask(SIG_BLOCK, NULL, &set);
>>> +    sigdelset(&set, SIG_IPI);
>>> +    pthread_sigmask(SIG_SETMASK, &set, NULL);
>>> +#else
>>> +    /*
>>> +     * We use the nvmm_vcpu_stop() mechanism, and don't use signals.
>>> +     * Nothing to do.
>>> +     */
>>> +#endif
>>
>> Since nvmm_vcpu_stop is very similar to KVM's immediate_exit mechanism, I
>> think you still need to have a dummy signal handler to kick the VM out of
>> the run loop *if it is in the kernel*.  The signal handler however can just
>> do nothing.
> 
> Are you worried the in-kernel thread will somehow get stuck or halt on exit of
> Qemu and left as a zombie?

No, you need all three of these:

- the signal to interrupt a thread that is running the VM

- the exit_request field to interrupt a thread that is running QEMU code

- nvmm_vcpu_stop() to interrupt a thread that is running kernel code but 
has not yet started running the VM.

>> Also, can you just drop support for NVMM_USER_VERSION == 1?
> 
> Now thats a good suggestion. We could add support for it in the pkgsrc
> package. When 9.0 gets retired, we could then retire it there without the need
> to patch Qemu again.

If it's still in use in the wild I have no problem keeping it.  The 
difference is small; I was just asking.

>>> diff --git a/target/i386/nvmm/meson.build b/target/i386/nvmm/meson.build
>>> new file mode 100644
>>> index 0000000000..c154e78014
>>> --- /dev/null
>>> +++ b/target/i386/nvmm/meson.build
>>> @@ -0,0 +1,4 @@
>>> +i386_softmmu_ss.add(when: 'CONFIG_NVMM', if_true: files(
>>> +  'nvmm-all.c',
>>> +  'nvmm-accel-ops.c',
>>> +))
>>
>> The nvmm library should be added here.
> 
> I am not sure what you mean by that. You provided a patch for the meson.build
> file, will that not suffice?

That patch dropped nvmm from meson.build, here is where it should be 
added (so that it is conditional on CONFIG_NVMM and qemu-system-arm does 
not link to libnvmm).

Paolo


