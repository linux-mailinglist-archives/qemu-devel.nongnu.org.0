Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D19412D5D77
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 15:24:29 +0100 (CET)
Received: from localhost ([::1]:37902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knMrs-0006dY-RX
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 09:24:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1knMnh-00020S-QH; Thu, 10 Dec 2020 09:20:10 -0500
Received: from mail-qv1-xf44.google.com ([2607:f8b0:4864:20::f44]:41184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1knMne-0004tY-F7; Thu, 10 Dec 2020 09:20:09 -0500
Received: by mail-qv1-xf44.google.com with SMTP id j13so2410830qvi.8;
 Thu, 10 Dec 2020 06:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xPCbWi/dI859bA0OZWLVKNPciEqc/130e5euJ+0SCqk=;
 b=qYtAmjkKhcT6O1R/spjYXru8l7HWk/R3llrwcBV7WJ0Es7mSico2m/+96PTWM0U+J3
 5ASDNLkRGxjbjHBMTaEg7zro9we/sxZTs43heK65FujpiPyDlw0v6Qbb2ZpCXDs1N7oF
 jf1/4p/yM2i/smmiAJzEt+Pj8XFWGTBpfeOD4+xnnWVWwkMWVvbX7aF6BWq4jjb2h+N+
 9s9BbiY3iqJnFs0HzFtPhBdFA1+zcxElihVww7z462uErLtPpCMkOxFa7OX78VGtKOuD
 BEECGV3Mgv2QJoDRTITCputIaU6z2pqW1UptwPHG9709rbue89dnz0S7mmbs800cf7GQ
 9YVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xPCbWi/dI859bA0OZWLVKNPciEqc/130e5euJ+0SCqk=;
 b=SuMTmqolhCDspTx4PPxnXuIHS/ujZGKKxh2sijEz9A+S/j6akY/aS9eHN+5e1M/Ph5
 4eMxIdmVl3KLvYKyQ/9lSZ9vqRGiE9G27TuezSlwzHpfTlVcFwK7xyro2etX2b2Y2ugd
 1U2PsDDqD89YDw+wdVoTQoln8hMY/p6R87L0ilaV150JeGVGx0Iyc2QsdjbIqN48nj19
 3uXLZhBX5+pTb6LmoVotx1nQl9+y3mcWpQuyTxqz4YgHiXe12Qa4f0+zsJ/g6tQBUwBO
 ro4NJMH+l2GRTi8CrfdNnhCtYiNoNAQ6WlHvEO7QT2cBjMDLgQHV8+CEiLs3fPw4uQr+
 MuHw==
X-Gm-Message-State: AOAM532HxwDFzPzezAGF8E+9gav/FY4VOplOuRF4JfuvDM30anrcHmd7
 8WcO/fT948kwgsbw5Af82OWVBo2DdfI=
X-Google-Smtp-Source: ABdhPJwLLvw9UrAH6CCH8UBlrjVrFqUfsE5gteaV2ujXJa1xesj5necyNxeFwjQh+mjBkIRkuaNO8g==
X-Received: by 2002:a0c:8c87:: with SMTP id p7mr3497659qvb.46.1607610004985;
 Thu, 10 Dec 2020 06:20:04 -0800 (PST)
Received: from ?IPv6:2804:431:c7c7:c1a:69c1:2b22:e880:fc49?
 ([2804:431:c7c7:c1a:69c1:2b22:e880:fc49])
 by smtp.gmail.com with ESMTPSA id u20sm3485464qtb.9.2020.12.10.06.20.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Dec 2020 06:20:04 -0800 (PST)
Subject: Re: [PATCH v2 1/1] spapr.c: set a 'kvm-type' default value instead of
 relying on NULL
To: Greg Kurz <groug@kaod.org>
References: <20201210130721.1521487-1-danielhb413@gmail.com>
 <20201210130721.1521487-2-danielhb413@gmail.com>
 <20201210150120.128ab5a2@bahia.lan> <20201210151458.24d89899@bahia.lan>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <fac18454-b387-03a0-edf7-559109dcc7ec@gmail.com>
Date: Thu, 10 Dec 2020 11:19:59 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201210151458.24d89899@bahia.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f44;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf44.google.com
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
Cc: pbonzini@redhat.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/10/20 11:14 AM, Greg Kurz wrote:
> On Thu, 10 Dec 2020 15:01:20 +0100
> Greg Kurz <groug@kaod.org> wrote:
> 
>> On Thu, 10 Dec 2020 10:07:21 -0300
>> Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
>>
>>> spapr_kvm_type() is considering 'vm_type=NULL' as a valid input, where
>>> the function returns 0. This is relying on the current QEMU machine
>>> options handling logic, where the absence of the 'kvm-type' option
>>> will be reflected as 'vm_type=NULL' in this function.
>>>
>>> This is not robust, and will break if QEMU options code decides to propagate
>>> something else in the case mentioned above (e.g. an empty string instead
>>> of NULL).
>>>
>>> Let's avoid this entirely by setting a non-NULL default value in case of
>>> no user input for 'kvm-type'. spapr_kvm_type() was changed to handle 3 fixed
>>> values of kvm-type: "auto", "hv", and "pr", with "auto" being the default
>>> if no kvm-type was set by the user. This allows us to always be predictable
>>> regardless of any enhancements/changes made in QEMU options mechanics.
>>>
>>> While we're at it, let's also document in 'kvm-type' description the
>>> already existing default mode, now named 'auto'. The information provided
>>> about it is based on how the pseries kernel handles the KVM_CREATE_VM
>>> ioctl(), where the default value '0' makes the kernel choose an available
>>> KVM module to use, giving precedence to kvm_hv. This logic is described in
>>> the kernel source file arch/powerpc/kvm/powerpc.c, function kvm_arch_init_vm().
>>>
>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>> ---
>>>   hw/ppc/spapr.c | 15 ++++++++++-----
>>>   1 file changed, 10 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>>> index b7e0894019..f097f4ea30 100644
>>> --- a/hw/ppc/spapr.c
>>> +++ b/hw/ppc/spapr.c
>>> @@ -3021,17 +3021,18 @@ static void spapr_machine_init(MachineState *machine)
>>>       qemu_cond_init(&spapr->fwnmi_machine_check_interlock_cond);
>>>   }
>>>   
>>> +#define DEFAULT_KVM_TYPE "auto"
>>>   static int spapr_kvm_type(MachineState *machine, const char *vm_type)
>>>   {
>>> -    if (!vm_type) {
>>> +    if (!g_ascii_strcasecmp(vm_type, DEFAULT_KVM_TYPE)) {
>>
>> strcmp() would be better here : we don't want to support an
>> already existing "AUTO" value like for the other ones.
>>
> 
> And you should also keep the check on vm_type since it is NULL
> if the kvm-type wasn't passed to the command line:
> 
> qemu-system-ppc64: GLib: g_ascii_strcasecmp: assertion 's1 != NULL' failed


Hm, I tested this case and didn't hit that. Perhaphs because I am testing this
on top of Paolo's patches instead of master.

I'll keep the NULL check as a fallback to 'auto' just to be safe then.


DHB

> 
>> And, of course, add a comment to explain why the two other
>> ones are handled differently.
>>
>>>           return 0;
>>>       }
>>>   
>>> -    if (!strcmp(vm_type, "HV")) {
>>> +    if (!g_ascii_strcasecmp(vm_type, "hv")) {
>>>           return 1;
>>>       }
>>>   
>>> -    if (!strcmp(vm_type, "PR")) {
>>> +    if (!g_ascii_strcasecmp(vm_type, "pr")) {
>>>           return 2;
>>>       }
>>>   
>>> @@ -3131,7 +3132,7 @@ static char *spapr_get_kvm_type(Object *obj, Error **errp)
>>>   {
>>>       SpaprMachineState *spapr = SPAPR_MACHINE(obj);
>>>   
>>> -    return g_strdup(spapr->kvm_type);
>>> +    return g_strdup(spapr->kvm_type ? spapr->kvm_type : DEFAULT_KVM_TYPE);
>>
>> As in Paolo's diff, it seems better to simply initialize spapr->kvm_type ...
>>
>>>   }
>>>   
>>>   static void spapr_set_kvm_type(Object *obj, const char *value, Error **errp)
>>> @@ -3273,7 +3274,11 @@ static void spapr_instance_init(Object *obj)
>>
>> ... here.
>>
>>      spapr->kvm_type = g_strdup(DEFAULT_KVM_TYPE);
>>
>>>       object_property_add_str(obj, "kvm-type",
>>>                               spapr_get_kvm_type, spapr_set_kvm_type);
>>>       object_property_set_description(obj, "kvm-type",
>>> -                                    "Specifies the KVM virtualization mode (HV, PR)");
>>> +                                    "Specifies the KVM virtualization mode (auto,"
>>> +                                    " hv, pr). Defaults to 'auto'. This mode will use"
>>> +                                    " any available KVM module loaded in the host,"
>>> +                                    " where kvm_hv takes precedence if both kvm_hv and"
>>> +                                    " kvm_pr are loaded.");
>>>       object_property_add_bool(obj, "modern-hotplug-events",
>>>                               spapr_get_modern_hotplug_events,
>>>                               spapr_set_modern_hotplug_events);
>>
>>
> 

