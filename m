Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 440B439887C
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 13:43:10 +0200 (CEST)
Received: from localhost ([::1]:36036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loPHB-0003bz-Bt
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 07:43:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1loPFy-0002rV-Ez
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 07:41:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1loPFw-00062I-Nv
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 07:41:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622634111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nGVw3y1tFlwkaYhGlvAJzCghjoy5zEx/xuEP/98sV1I=;
 b=aUoLibXHnrrdyHP+Yo+dH3uJ8awS14JVjNxamv04uCAQAVUSDQb2NdOGX2qd/TnizrdeU+
 CQBvM+VRXz9J5w6Y+tAZSL9H+WWME8J3mZUOCUnkYRHpamK/KMbxliUPBgcDwiJAt/EVm3
 vy3rQi1RVRJXZiPpGXDgdRS7hrlisKY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-8Hj-YEcTP2ChN2wyYrzEVQ-1; Wed, 02 Jun 2021 07:41:50 -0400
X-MC-Unique: 8Hj-YEcTP2ChN2wyYrzEVQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 h18-20020a1709063992b02903d59b32b039so530970eje.12
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 04:41:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=nGVw3y1tFlwkaYhGlvAJzCghjoy5zEx/xuEP/98sV1I=;
 b=HQ/9qGzn4JrvE1R9d1XsrBZn3IIv0YVdT9tl0Q3Ig/LOXBeXM/yG0oPDbB8t4hZFKJ
 Ew/DDTGhMS3WyYhK66h5A6TgHC/HBza4fNmBntugDv09nuxOut2lUhqY0E6BHYTiq489
 oQKlxUMi9efOUx/bIR16rBkZ2xla0JrJ3DVbL+xy47lxK6dnS+TFWiBESPHD74QVTQZu
 8E2S3N2ZOTapYfXBfiR/Vr4jVGK18T+fYljTDlD6nTQkQV2oKeBhi/E/9NPd23dZGo9C
 mQQj7GBeE5Of3Bmr5HlZ2oaxn6cMSLIKvqPeTdFYiKL51npgWpG4gPrkN3q/1NUhgw07
 Qr9g==
X-Gm-Message-State: AOAM532ZeK/BxAxuXIaIvtqMpNyqjNZtYvvxnoP8dghxKHldx/T4HAn+
 jus6guL3X/gZgq6LAh8Eu8mg/3sLN5YmHk84a3BDzofM2BRMjMX9qyGP7fHqhoi6XmC5TOJht8a
 zCOPpPYoh/U8Uvyo=
X-Received: by 2002:a17:906:bcd5:: with SMTP id
 lw21mr17975304ejb.346.1622634108906; 
 Wed, 02 Jun 2021 04:41:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAyCEp9/avgNeyhKoqMSeX3b/LAdFB9LvQ82hcge/oFYGdUN5+3gpimpTrlar09fcoN07nKw==
X-Received: by 2002:a17:906:bcd5:: with SMTP id
 lw21mr17975293ejb.346.1622634108704; 
 Wed, 02 Jun 2021 04:41:48 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id c19sm1210613edv.36.2021.06.02.04.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 04:41:48 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v6 01/19] i386: keep hyperv_vendor string up-to-date
In-Reply-To: <20210430230705.pdxvufj73haq5hno@habkost.net>
References: <20210422161130.652779-1-vkuznets@redhat.com>
 <20210422161130.652779-2-vkuznets@redhat.com>
 <20210430230705.pdxvufj73haq5hno@habkost.net>
Date: Wed, 02 Jun 2021 13:41:46 +0200
Message-ID: <87tumg1ojp.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost <ehabkost@redhat.com> writes:

> On Thu, Apr 22, 2021 at 06:11:12PM +0200, Vitaly Kuznetsov wrote:
>> When cpu->hyperv_vendor is not set manually we default to "Microsoft Hv"
>> and in 'hv_passthrough' mode we get the information from the host. This
>> information is stored in cpu->hyperv_vendor_id[] array but we don't update
>> cpu->hyperv_vendor string so e.g. QMP's query-cpu-model-expansion output
>> is incorrect.
>
> I was confused for a while because this can't happen until patch
> 15/19 is applied.  Probably worth a note in the commit message
> indicating that hyperv_handle_properties() will be called by
> x86_cpu_expand_features() in the future.
>
>> 
>> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>> ---
>>  target/i386/cpu.c     | 19 +++++++++----------
>>  target/i386/kvm/kvm.c |  5 +++++
>>  2 files changed, 14 insertions(+), 10 deletions(-)
>> 
>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>> index ad99cad0e7ce..2d05df232329 100644
>> --- a/target/i386/cpu.c
>> +++ b/target/i386/cpu.c
>> @@ -6665,17 +6665,16 @@ static void x86_cpu_hyperv_realize(X86CPU *cpu)
>>  
>>      /* Hyper-V vendor id */
>>      if (!cpu->hyperv_vendor) {
>> -        memcpy(cpu->hyperv_vendor_id, "Microsoft Hv", 12);
>> -    } else {
>> -        len = strlen(cpu->hyperv_vendor);
>> -
>> -        if (len > 12) {
>> -            warn_report("hv-vendor-id truncated to 12 characters");
>> -            len = 12;
>> -        }
>> -        memset(cpu->hyperv_vendor_id, 0, 12);
>> -        memcpy(cpu->hyperv_vendor_id, cpu->hyperv_vendor, len);
>> +        object_property_set_str(OBJECT(cpu), "hv-vendor-id", "Microsoft Hv",
>> +                                &error_abort);
>> +    }
>> +    len = strlen(cpu->hyperv_vendor);
>> +    if (len > 12) {
>> +        warn_report("hv-vendor-id truncated to 12 characters");
>> +        len = 12;
>>      }
>> +    memset(cpu->hyperv_vendor_id, 0, 12);
>> +    memcpy(cpu->hyperv_vendor_id, cpu->hyperv_vendor, len);
>
> Existing issue: hardcoded 12 as the size of hyperv_vendor_id here
> (compare with the code you add below using sizeof()).  I don't
> think this should hold the whole series, so it can be fixed in a
> follow up patch if necessary.
>

Agreed, adding a patch to change '12' to sizeof().

>>  
>>      /* 'Hv#1' interface identification*/
>>      cpu->hyperv_interface_id[0] = 0x31237648;
>> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
>> index 7fe9f527103c..ab073a5e9c44 100644
>> --- a/target/i386/kvm/kvm.c
>> +++ b/target/i386/kvm/kvm.c
>> @@ -1215,6 +1215,11 @@ static int hyperv_handle_properties(CPUState *cs,
>>              cpu->hyperv_vendor_id[0] = c->ebx;
>>              cpu->hyperv_vendor_id[1] = c->ecx;
>>              cpu->hyperv_vendor_id[2] = c->edx;
>> +            cpu->hyperv_vendor = g_realloc(cpu->hyperv_vendor,
>> +                                           sizeof(cpu->hyperv_vendor_id) + 1);
>> +            memcpy(cpu->hyperv_vendor, cpu->hyperv_vendor_id,
>> +                   sizeof(cpu->hyperv_vendor_id));
>> +            cpu->hyperv_vendor[sizeof(cpu->hyperv_vendor_id)] = 0;
>
> I don't like having to do manual g_realloc() + memcpy() here
> (calling object_property_set_str() would be simpler), but I
> believe it will be easier to clean this up after this whole
> series is applied.

The problem here is that object_property_set_str() only works with
NULL-terminated strings and 'hyperv_vendor_id' doesn't have it (that's
why I explicitly do 'cpu->hyperv_vendor[sizeof(cpu->hyperv_vendor_id)] =
0'). We could've converted 'hyperv_vendor_id' to a char[13] array to
accomodate for '\0', but 

              cpu->hyperv_vendor_id[0] = c->ebx;
              cpu->hyperv_vendor_id[1] = c->ecx;
              cpu->hyperv_vendor_id[2] = c->edx;

assignments will have to be converted to something and this won't look
natural.

-- 
Vitaly


