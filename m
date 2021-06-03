Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37633399D3C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 10:55:18 +0200 (CEST)
Received: from localhost ([::1]:44502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loj8H-0008KP-BH
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 04:55:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1loizB-0006UK-8x
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 04:45:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1loiz9-0005rs-EI
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 04:45:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622709950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rsIrqOylEA4TXgHkwdm9Q9btGTKDmHBsUJC+um8PyV0=;
 b=WeAVoRouBD7HYaD6HIRcfWbKrrZp900M0FkThKVurVbI9IpC9kcruoAcM0WV0CK0zQ8/1B
 DGw8ferT5mbzG5V3kixqwjcyYqde29MYkIZ4UZJvsrxc1zWSVX6Opb/1kNpaVAcK09cJm7
 geV7MtT8JF6F7qCfl2mB78fqIv6n46A=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-qOMK1F96OAqkGijLqT7KNA-1; Thu, 03 Jun 2021 04:45:49 -0400
X-MC-Unique: qOMK1F96OAqkGijLqT7KNA-1
Received: by mail-ed1-f70.google.com with SMTP id
 x8-20020aa7d3880000b029038fe468f5f4so2896575edq.10
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 01:45:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=rsIrqOylEA4TXgHkwdm9Q9btGTKDmHBsUJC+um8PyV0=;
 b=IK968a1YYkKZ/q0u4P/EgEFtnv+ZkBxGPinTMTp3gjmwwwcxpLe7sg6MQBmi8plwr4
 eV8Rw8IlvQnFp5InXu5BaNLeOgxqobRQT2xT61bcU+W+XsOt6JBBR5zUkMSdQ8Wowvuf
 68+rBTSfOyySRq5bxXxpG8bVlVFRcg42agOTlT0eWqBBi/OStbZQXUL1fPxW/HZnRanM
 mKvmVijM2QWK+g1EvCcFwfN+gaudlfc8za6SgenYsnrAdCq+QldyPc+vL0ocRSHCEJL0
 QIX2cY2dwk476FBmLDx6kQIfhhPfzpox/fBccAyOEY4T8woGhF9i0jW/0skWu4nd/MIA
 LPrQ==
X-Gm-Message-State: AOAM530GYZ6+f33nRcVeSEd2Evdl1/e9+PWSFacxSuIG8JNIvfogoe2D
 MzOanBJdLjNE5WNF9AWp3AnScV3I8hDqshD4qXcReQ7BlcShknI/fgk6T+cxzHIXieA6uCDKTCZ
 f7EHb1AWL/OQaBcKDWBrBcno/2bzDOH8s1rQAak2MmqvrvhMDDaRLhMSGgFTqmH41aLI=
X-Received: by 2002:aa7:de8b:: with SMTP id j11mr43173910edv.363.1622709948247; 
 Thu, 03 Jun 2021 01:45:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtl3t6xoNuHDquuwwnUekQkranRmTDb8RVJaJaPeFXmqJ+LF35yJOGAC0j7s3n6gmctl6VfA==
X-Received: by 2002:aa7:de8b:: with SMTP id j11mr43173883edv.363.1622709947975; 
 Thu, 03 Jun 2021 01:45:47 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id w11sm1496921ede.54.2021.06.03.01.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 01:45:47 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH 1/2] i386: reorder call to cpu_exec_realizefn in
 x86_cpu_realizefn
In-Reply-To: <20210601184832.teij5fkz6dvyctrp@habkost.net>
References: <20210529091313.16708-1-cfontana@suse.de>
 <20210529091313.16708-2-cfontana@suse.de>
 <20210601184832.teij5fkz6dvyctrp@habkost.net>
Date: Thu, 03 Jun 2021 10:45:45 +0200
Message-ID: <87o8cn1gli.fsf@vitty.brq.redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org,
 Siddharth Chandrasekaran <sidcha@amazon.de>, "Michael S .
 Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost <ehabkost@redhat.com> writes:

>> 
>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>> index 9e211ac2ce..6bcb7dbc2c 100644
>> --- a/target/i386/cpu.c
>> +++ b/target/i386/cpu.c
>> @@ -6133,34 +6133,6 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
>>      Error *local_err = NULL;
>>      static bool ht_warned;
>>  
>> -    /* Process Hyper-V enlightenments */
>> -    x86_cpu_hyperv_realize(cpu);
>
> Vitaly, is this reordering going to affect the Hyper-V cleanup
> work you are doing?  It seems harmless and it makes sense to keep
> the "realize" functions close together, but I'd like to confirm.
>

Currently, x86_cpu_hyperv_realize() is designed to run before
kvm_hyperv_expand_features() (and thus x86_cpu_expand_features()):
x86_cpu_hyperv_realize() sets some default values to
cpu->hyperv_vendor/hyperv_interface_id/hyperv_version_id... but in
'hv-passthrough' mode these are going to be overwritten by KVM's values.

By changing the ordering, this patch changes the logic so QEMU's default
values will always be used, even in 'hv-passthrough' mode. This is
undesireable. I'd suggest we keep x86_cpu_hyperv_realize() call where it
is now, I'll think about possible cleanup later (when both this patch
and the rest of my cleanup lands).

-- 
Vitaly


