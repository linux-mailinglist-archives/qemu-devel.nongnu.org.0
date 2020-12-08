Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF4C2D2E5C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 16:36:55 +0100 (CET)
Received: from localhost ([::1]:40132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmf2s-00056F-Ln
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 10:36:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1kmez1-00020N-Hr; Tue, 08 Dec 2020 10:32:56 -0500
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744]:36378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1kmeyx-0005x4-Ln; Tue, 08 Dec 2020 10:32:55 -0500
Received: by mail-qk1-x744.google.com with SMTP id 186so2329309qkj.3;
 Tue, 08 Dec 2020 07:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OSWCbx0UDjfSHSrPGok7MnZBJ27WjhdPKZvieRP8kFo=;
 b=kE3WrHpvtYWoNEePzTyAzT2JX68ESUkEAGn+cr/BGl9vZS+JhjZysY3f8eF6zgZWdY
 LNY6P+xlZO5EZBfIT7ZbCMlEQAJ5XtAL2iqGMaEJU22QgfopfbPWyNOhf+8KIzNTJl/y
 WmfVkkzktJPRYl0mfmU3a7NE5bBIap3O66T6Ub+xFZ6wvucpJkS4dNcjmPrYX252hpVk
 Pz3+9wcyhzjtHuwI1BD9ZG52qnT6TZnW1JK5OG3rrWUZJLAVhiv3oKoDsYRmq66gasmM
 sYqZP8eLOCeLRANAVKJXKYhikGtlB2YpkMiSOyEUWvVWbpsXtcaaLInjDpBMIk8Lh1EM
 EHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OSWCbx0UDjfSHSrPGok7MnZBJ27WjhdPKZvieRP8kFo=;
 b=Wa4q97ZgpAMikBEmxza5EqTvEB+yO4iBbaGj8kUcaPrXWqf1SEOe4PAvEGarWJSWgQ
 S3IdLEyns6iF0j7SYfZktc8Bk6Xmo0PzTGzXHbAufwHp50xfz8+U6inMhWG6cUu7W25F
 p4xlAzbh46IUYNnhwHQ4koISD+Q5NdXTmC2IBMgL5me4bGYUiyuGilI/qIvLEqvuly0h
 Q0AsF9txUK6A1RPjdTSnPN8MMhHtUYMR0RkPp7BZLog/66IPUYkD97PkXFAESt6b2NGe
 cT4r7RfzOcgGhM5sTbr04DcBWkGNMYP/U0vV47lgBHFjrKHyyObAEHng/Pmm3BalFiHq
 gR2w==
X-Gm-Message-State: AOAM533F9Qm/gw0zQNHBEv7Wfsc6qYz44+6TjJVGqYN5ebDEeivZvsZp
 Y71TcvjmTxig2aayI/uvljY=
X-Google-Smtp-Source: ABdhPJxEh/H+mM/y/AMdWKs32pFCav7+Y8ofQyWtTNxmV9JrYILr7BRUfiyD9bOoQOq7H0b8hBBTHg==
X-Received: by 2002:a05:620a:227:: with SMTP id
 u7mr8492621qkm.256.1607441570315; 
 Tue, 08 Dec 2020 07:32:50 -0800 (PST)
Received: from ?IPv6:2804:431:c7c7:c1a:69c1:2b22:e880:fc49?
 ([2804:431:c7c7:c1a:69c1:2b22:e880:fc49])
 by smtp.gmail.com with ESMTPSA id l22sm14840133qke.118.2020.12.08.07.32.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 07:32:49 -0800 (PST)
Subject: Re: [PATCH 1/1] spapr.c: set a 'kvm-type' default value instead of
 relying on NULL
To: Greg Kurz <groug@kaod.org>
References: <20201208134536.1012045-1-danielhb413@gmail.com>
 <20201208153309.78825861@bahia.lan>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <d142b41a-69c2-77de-861e-e68c3c0459b4@gmail.com>
Date: Tue, 8 Dec 2020 12:32:46 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201208153309.78825861@bahia.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::744;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x744.google.com
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



On 12/8/20 11:33 AM, Greg Kurz wrote:
> Hi Daniel,
> 
> On Tue,  8 Dec 2020 10:45:36 -0300
> Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
> 
>> spapr_kvm_type() is considering 'vm_type=NULL' as a valid input, where
>> the function returns 0. This is relying on the current QEMU machine
>> options handling logic, where the absence of the 'kvm-type' option
>> will be reflected as 'vm_type=NULL' in this function.
>>
>> This is not robust, and will break if QEMU options code decides to propagate
>> something else in the case mentioned above (e.g. an empty string instead
>> of NULL).
>>
>> Let's avoid this entirely by setting a non-NULL default value in case of
>> no user input for 'kvm-type'. spapr_kvm_type() was changed to handle 3 fixed
>> values of kvm-type: "HV", "PR" and, if no kvm-type was set by the user,
>> DEFAULT_KVM_TYPE. This allows us always be predictable regardless of any
>> enhancements/changes made in QEMU options mechanics.
>>
>> While we're at it, let's also document in 'kvm-type' description what
>> happens if the user does not set this option. This information is based
>> on how the pseries kernel handles the KVM_CREATE_VM ioctl(), where the
>> default value '0' makes the kernel choose an available KVM module to
>> use, giving precedence to kvm_hv. This logic is described in the kernel
>> source file arch/powerpc/kvm/powerpc.c, function kvm_arch_init_vm().
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>
>> The case I mentioned in the second paragraph is happening when we try to
>> execute a pseries guest with '--enable-kvm' using Paolo's patch
>> "vl: make qemu_get_machine_opts static" [1]:
>>
>> $ sudo ./ppc64-softmmu/qemu-system-ppc64 -nographic -nodefaults -machine pseries --enable-kvm
>> qemu-system-ppc64: Unknown kvm-type specified ''
>>
>> This happens due to the differences between how qemu_opt_get() and
>> object_property_get_str() works when there is no 'kvm-type' specified.
>> See [2] for more info about the issue found.
>>
>>
>> [1] https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg00471.html
>> [2] https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg01578.html
>>
>>
>>   hw/ppc/spapr.c | 19 +++++++++++++++++--
>>   1 file changed, 17 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>> index b7e0894019..32d938dc6a 100644
>> --- a/hw/ppc/spapr.c
>> +++ b/hw/ppc/spapr.c
>> @@ -3021,9 +3021,10 @@ static void spapr_machine_init(MachineState *machine)
>>       qemu_cond_init(&spapr->fwnmi_machine_check_interlock_cond);
>>   }
>>   
>> +#define DEFAULT_KVM_TYPE "auto"
>>   static int spapr_kvm_type(MachineState *machine, const char *vm_type)
>>   {
>> -    if (!vm_type) {
>> +    if (!strcmp(vm_type, DEFAULT_KVM_TYPE)) {
>>           return 0;
>>       }
>>   
>> @@ -3131,6 +3132,16 @@ static char *spapr_get_kvm_type(Object *obj, Error **errp)
>>   {
>>       SpaprMachineState *spapr = SPAPR_MACHINE(obj);
>>   
>> +    /*
>> +     * In case the user didn't set 'kvm-type', return DEFAULT_KVM_TYPE
>> +     * instead of NULL. This allows us to be more predictable with what
>> +     * is expected to happen in spapr_kvm_type(), since we can stop relying
>> +     * on receiving a 'NULL' parameter as a valid input there.
>> +     */
> 
> Returning what is obviously a default value is straightforward enough
> that is doesn't need to a comment IMHO.
> 
>> +    if (!spapr->kvm_type) {
>> +        return g_strdup(DEFAULT_KVM_TYPE);
>> +    }
>> +
>>       return g_strdup(spapr->kvm_type);
> 
> Alternatively you could simply do:
> 
>      return g_strdup(spapr->kvm_type ? spapr->kvm_type : DEFAULT_KVM_TYPE);

Got it. I'll update it in v2.

> 
>>   }
>>   
>> @@ -3273,7 +3284,11 @@ static void spapr_instance_init(Object *obj)
>>       object_property_add_str(obj, "kvm-type",
>>                               spapr_get_kvm_type, spapr_set_kvm_type);
>>       object_property_set_description(obj, "kvm-type",
>> -                                    "Specifies the KVM virtualization mode (HV, PR)");
>> +                                    "Specifies the KVM virtualization mode (HV, PR)."
> 
> Why not documenting "auto" as a valid option as well ?


This was my first idea but I got cold feet about it. I got afraid that
exposing the default 'auto' option might misled users into believing that
we're adding a new configuration option, even thought it's just the
same behavior users are dealing with for 7+ years. I chose to use the
'auto' value as an internal default that isn't documented . Granted, this
also means that we have now a hidden 'kvm-type=auto' setting, so yeah.

If there is a consensus that exposing the "auto" default is the right
thing to do in this case I'll just go ahead and expose it.



> 
> While here you could maybe convert HV and PR to lowercase in order to
> have a prettier "hv, pr, auto" set of valid values in the help string.
> You'd need to convert the related checks in spapr_kvm_type() to still
> check for the uppercase versions for compatibility, eg. by using
> g_ascii_strcasecmp().

Roger that.

> 
>> +                                    " If not specified, defaults to any available KVM"
>> +                                    " module loaded in the host. In case both kvm_hv"
>> +                                    " and kvm_pr are loaded, kvm_hv takes precedence.");
>> +
> 
> s/If not specified/If 'auto'/ and mention 'auto' as being the default value.


As I said above, I'll happily mention the 'auto' default if we can agree
that this will not lead to user confusion thinking this is a new option and
so on.


Thanks,


DHB

> 
>>       object_property_add_bool(obj, "modern-hotplug-events",
>>                               spapr_get_modern_hotplug_events,
>>                               spapr_set_modern_hotplug_events);
> 

