Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E826C2D1682
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 17:40:40 +0100 (CET)
Received: from localhost ([::1]:39588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmJZ1-0000IY-NU
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 11:40:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kmJXF-0008I9-CQ
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 11:38:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kmJXD-0007yh-Mw
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 11:38:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607359126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RGwfarZXf1O3V8eaGcTsgXNBahGU1+AXh/6eXYFVhQQ=;
 b=LOmw5dR7nCYYlYWsytcZ7vgYf21EKQczAfRjIc65EzPeBMsf/cHHPMGqoELJs+RqfM9v9D
 PqqheVEoIFam84aBEiZ7FVRU0NvZ4hcRkbYOazfAuJg8pVtSgeH9nu3mFYJu0mHUQUlgYb
 YTTzU5f7o85X/SjakPrcvUdTte5ImkM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-LkJOPK_mOCCwladCcNVeQA-1; Mon, 07 Dec 2020 11:38:45 -0500
X-MC-Unique: LkJOPK_mOCCwladCcNVeQA-1
Received: by mail-ej1-f71.google.com with SMTP id 3so3335181ejw.13
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 08:38:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RGwfarZXf1O3V8eaGcTsgXNBahGU1+AXh/6eXYFVhQQ=;
 b=p+GNIGVXQ9VhpIlXyOx47cdr4Cdg4njpI1aF4a1wleZC9U/Wd2b44AyK+EWBCkcjvY
 EiwQ+kMi+27RNwSp5GRF3qH7UPAtvOJ/bnXCug7+h9xx1sD61LegFbKXjdi8mEq52DeE
 NbBDjCriey6cBHNCkZQecq/z7U8Uo6i0WT0WO6Qp7XSyyPdOBX6NlkmRzR6OI715uGkS
 nzF84XW7GA5oQ5WeKAAwkA0nIlfR0exXJm8CZHii3s3V4K3LWSxGkAwsAKpjUo4A0IRI
 +cfn6ILU0HnQqv93lgZEEnkSpbZI0jKjWzxzClL+sSIUJ9LKg4VwMuGake7fo8oT8Z5N
 sogA==
X-Gm-Message-State: AOAM530ODnRPsVof77obOXGAyi4EHCJZQarrb7FsGw+9kT6+gnf782DC
 alyI+mrRKu1Al0G3kzoY6HxGaBSu58XmgkrlCUkn9+E4lC+Ls9ZGtESw0ZdKCNzKVZlA8A85ghg
 49U7q6oi3FyD1V9I=
X-Received: by 2002:a50:d646:: with SMTP id c6mr1361083edj.177.1607359119159; 
 Mon, 07 Dec 2020 08:38:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyat2UGHGOx/sDk8NsX6vR53zBlducZLr6sxytq6kFZ5BeyoNo9BlF/AaYGmXWdv8t/1MU3Ng==
X-Received: by 2002:a50:d646:: with SMTP id c6mr1360833edj.177.1607359113796; 
 Mon, 07 Dec 2020 08:38:33 -0800 (PST)
Received: from [192.168.1.124] ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id ng1sm12085173ejb.112.2020.12.07.08.38.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 08:38:32 -0800 (PST)
Subject: Re: [PATCH 10/15] vl: make qemu_get_machine_opts static
To: Igor Mammedov <imammedo@redhat.com>
References: <20201202081854.4126071-1-pbonzini@redhat.com>
 <20201202081854.4126071-11-pbonzini@redhat.com>
 <20201207170728.0a39f201@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ee3b4442-2108-9a6e-5661-8aafb294fa48@redhat.com>
Date: Mon, 7 Dec 2020 17:38:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201207170728.0a39f201@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: danielhb413@gmail.com, qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/12/20 17:07, Igor Mammedov wrote:
> On Wed,  2 Dec 2020 03:18:49 -0500
> Paolo Bonzini <pbonzini@redhat.com> wrote:
> 
>> Machine options can be retrieved as properties of the machine object.
>> Encourage that by removing the "easy" accessor to machine options.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   accel/kvm/kvm-all.c     | 11 ++++-------
>>   hw/arm/boot.c           |  2 +-
>>   hw/microblaze/boot.c    |  9 ++++-----
>>   hw/nios2/boot.c         |  9 ++++-----
>>   hw/ppc/e500.c           |  5 ++---
>>   hw/ppc/spapr_nvdimm.c   |  4 ++--
>>   hw/ppc/virtex_ml507.c   |  2 +-
>>   hw/riscv/sifive_u.c     |  6 ++----
>>   hw/riscv/virt.c         |  6 ++----
>>   hw/xtensa/xtfpga.c      |  9 ++++-----
>>   include/sysemu/sysemu.h |  2 --
>>   softmmu/device_tree.c   |  2 +-
>>   softmmu/vl.c            |  2 +-
>>   13 files changed, 28 insertions(+), 41 deletions(-)
>>
> [...]
>> diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
>> index a833a63b5e..84715a4d78 100644
>> --- a/hw/ppc/spapr_nvdimm.c
>> +++ b/hw/ppc/spapr_nvdimm.c
>> @@ -38,7 +38,6 @@ bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nvdimm,
>>   {
>>       const MachineClass *mc = MACHINE_GET_CLASS(hotplug_dev);
>>       const MachineState *ms = MACHINE(hotplug_dev);
>> -    const char *nvdimm_opt = qemu_opt_get(qemu_get_machine_opts(), "nvdimm");
>>       g_autofree char *uuidstr = NULL;
>>       QemuUUID uuid;
>>       int ret;
>> @@ -57,10 +56,11 @@ bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nvdimm,
>>        * ensure that, if the user sets nvdimm=off, we error out
>>        * regardless of being 5.1 or newer.
>>        */
>> -    if (!ms->nvdimms_state->is_enabled && nvdimm_opt) {
>> +    if (!ms->nvdimms_state->is_enabled && ms->nvdimms_state->has_is_enabled) {
>>           error_setg(errp, "nvdimm device found but 'nvdimm=off' was set");
>>           return false;
>>       }
>> +    ms->nvdimms_state->is_enabled = true;
> 
> it looks like nvdimm is always enabled since 5.0 and there is no way to disable it
> how about dropping 9/15 and just error out is it's not enabled, something like:
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index b7e0894019..d63f095bff 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -2668,6 +2668,7 @@ static void spapr_machine_init(MachineState *machine)
>       char *filename;
>       Error *resize_hpt_err = NULL;
> +    if (mc->nvdimm_supported) { // by default it is always enabled
> +        ms->nvdimms_state->is_enabled = true;
> +    }
>       msi_nonbroken = true;
>   
>       QLIST_INIT(&spapr->phbs);
> diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
> index a833a63b5e..b11c85dbaa 100644
> --- a/hw/ppc/spapr_nvdimm.c
> +++ b/hw/ppc/spapr_nvdimm.c
> @@ -57,7 +57,7 @@ bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nvdimm,
>        * ensure that, if the user sets nvdimm=off, we error out
>        * regardless of being 5.1 or newer.
>        */
> -    if (!ms->nvdimms_state->is_enabled && nvdimm_opt) {
> +    if (!ms->nvdimms_state->is_enabled) {
>           error_setg(errp, "nvdimm device found but 'nvdimm=off' was set");
>           return false;
>       }
> 
> if I didn't miss something, that way we do not abuse nvdimm_opt and still
> have nvdimm enabled by default and error out if it turns to disabled for whatever reason.

Yes, this looks correct.  I see you have already CCed Daniel and David.

Paolo


