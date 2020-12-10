Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FFC2D5B69
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 14:15:14 +0100 (CET)
Received: from localhost ([::1]:41540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knLmq-0003Mi-9w
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 08:15:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1knLiJ-0001Gk-MC; Thu, 10 Dec 2020 08:10:31 -0500
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844]:44793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1knLiH-00072V-35; Thu, 10 Dec 2020 08:10:31 -0500
Received: by mail-qt1-x844.google.com with SMTP id u21so3514103qtw.11;
 Thu, 10 Dec 2020 05:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dA/9zJe+DFMFkYQFun04Zc4CmguftmVuLpcBEqBsOv4=;
 b=TAmdowlM98iUWSK8LY2JdVN+c5OrO1lV8TJlP5mJ+MMF8d85rupIB+k+yTktYzuDvr
 SCUv3beelbJQgOd6X7HFvFlZORHLq5r0dHzJlpj4VX2hHJ45pChkcnewk/F3bTcAID6O
 mSbXUSZHbRX1fxDoD3CEuMoK5pTwclt0YMHDDiOjKokKTh3jYI0IxWHXChzC1S/haZwo
 4jO1/AQS3WOXvgd24iuhpZ8ZnD7mxmtGITddPoQWT0QTHpGWbLtzCsImFS779R8Ztt5r
 6+dEVSDYQuzmwK0FlGO4qhuQjDVjb3cKcsga1lPIFgFCis0Bo8As+WBbVYj5L3uSpItb
 4r3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dA/9zJe+DFMFkYQFun04Zc4CmguftmVuLpcBEqBsOv4=;
 b=OL1BBNfub6XKHNVoDYfu+aLwhLQbpVkH3HnAVX2pzitLoXJD6u+fz09LejpdGlmRuX
 i/QpZflyr2vw49Y03r1bIcD40GrupP5OutoP6l6qEruEug9qAzC/PpqCAWpPPKJmTNOb
 WYdhVnfeS2kQHeEroW64KmQZTixankbC9cXClMLM52UB7EuhTYNXTIsgnNkAaJM0mQac
 m7gyO3N4dlXebDLRxurpZzRdGoFKi3V/RTPlq871RugJnWDiPRebiqfsJksPTapuR57p
 mUF/zqt0Fgxrf0tgh3ma8enzv3ldvARg65Iu3UVSndjVnSYZlc3CJSBoZ9+JDyYWSJnw
 6yfg==
X-Gm-Message-State: AOAM530XNWq5w1F5zeWhhzKMY2Dqrk8ysooXguypQI9bUqtlUt9fgOcy
 WG9XcASgZHeq8mS4QdlxMZHk19zDZMg=
X-Google-Smtp-Source: ABdhPJwmr5Eur7TUjzzJfBSsMFWtB4mAwHawA0QBr7Saozwo2dFsT3MNS+3Lnuc/SzmOEZPSB6bVrw==
X-Received: by 2002:ac8:1082:: with SMTP id a2mr9077546qtj.189.1607605826800; 
 Thu, 10 Dec 2020 05:10:26 -0800 (PST)
Received: from ?IPv6:2804:431:c7c7:c1a:69c1:2b22:e880:fc49?
 ([2804:431:c7c7:c1a:69c1:2b22:e880:fc49])
 by smtp.gmail.com with ESMTPSA id a13sm3081701qtj.69.2020.12.10.05.10.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Dec 2020 05:10:26 -0800 (PST)
Subject: Re: [PATCH 1/1] spapr.c: set a 'kvm-type' default value instead of
 relying on NULL
To: Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>
References: <20201208134536.1012045-1-danielhb413@gmail.com>
 <20201208153309.78825861@bahia.lan>
 <d142b41a-69c2-77de-861e-e68c3c0459b4@gmail.com>
 <20201210033736.GK2555@yekko.fritz.box>
 <ffee7463-13e9-0bd2-a3c3-c6239a861be8@redhat.com>
 <20201210134705.6adaf940@bahia.lan>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <c1bae366-135d-f240-ff03-2abc8967c908@gmail.com>
Date: Thu, 10 Dec 2020 10:10:21 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201210134705.6adaf940@bahia.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::844;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x844.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/10/20 9:47 AM, Greg Kurz wrote:
> On Thu, 10 Dec 2020 13:34:59 +0100
> Paolo Bonzini <pbonzini@redhat.com> wrote:
> 
>> To sum up everything:
>>
> 
> LGTM

I just sent a v2 with a bit more done (e.g. added ignore case compare
for 'auto'). Feel free to use that version or this one amended by this
diff from Paolo.


Thanks,


DHB

> 
>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>> index 2d5aeeb45a..61f0963916 100644
>> --- a/hw/ppc/spapr.c
>> +++ b/hw/ppc/spapr.c
>> @@ -3028,11 +3028,11 @@ static int spapr_kvm_type(MachineState *machine,
>> const char *vm_type)
>>            return 0;
>>        }
>>
>> -    if (!strcmp(vm_type, "HV")) {
>> +    if (!g_ascii_strcasecmp(vm_type, "hv")) {
>>            return 1;
>>        }
>>
>> -    if (!strcmp(vm_type, "PR")) {
>> +    if (!g_ascii_strcasecmp(vm_type, "pr")) {
>>            return 2;
>>        }
>>
>> @@ -3132,16 +3132,6 @@ static char *spapr_get_kvm_type(Object *obj,
>> Error **errp)
>>    {
>>        SpaprMachineState *spapr = SPAPR_MACHINE(obj);
>>
>> -    /*
>> -     * In case the user didn't set 'kvm-type', return DEFAULT_KVM_TYPE
>> -     * instead of NULL. This allows us to be more predictable with what
>> -     * is expected to happen in spapr_kvm_type(), since we can stop relying
>> -     * on receiving a 'NULL' parameter as a valid input there.
>> -     */
>> -    if (!spapr->kvm_type) {
>> -        return g_strdup(DEFAULT_KVM_TYPE);
>> -    }
>> -
>>        return g_strdup(spapr->kvm_type);
>>    }
>>
>> @@ -3294,11 +3284,13 @@ static void spapr_instance_init(Object *obj)
>>
>>        spapr->htab_fd = -1;
>>        spapr->use_hotplug_event_source = true;
>> +
>> +    spapr->kvm_type = g_strdup(DEFAULT_KVM_TYPE);
>>        object_property_add_str(obj, "kvm-type",
>>                                spapr_get_kvm_type, spapr_set_kvm_type);
>>        object_property_set_description(obj, "kvm-type",
>> -                                    "Specifies the KVM virtualization
>> mode (HV, PR)."
>> -                                    " If not specified, defaults to any
>> available KVM"
>> +                                    "Specifies the KVM virtualization
>> mode (hv, pr, auto)."
>> +                                    " auto is the default and allows
>> any available KVM"
>>                                        " module loaded in the host. In
>> case both kvm_hv"
>>                                        " and kvm_pr are loaded, kvm_hv
>> takes precedence.");
>>
> 

